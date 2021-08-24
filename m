Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 231BA3F5B4F
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 11:50:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EAF01616;
	Tue, 24 Aug 2021 11:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EAF01616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629798644;
	bh=ge2O+WYs6o2RueQwM8MelClAGGp8etI/DwkI63k+lv4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iXeyv6sSFsDe/iMLUIRyiXcDcc79GfP/R+ObcrxswzT0fh7ZhlyZgBzIMtleqCDus
	 uoKoZA1GnUpFmWkmmPueYHn16myTWtNEEtPGlCxJkoLbVf/sgnhEJidYDmjJ9b2Z/+
	 /vDyYEl8HzhKpvtXpNyxew10euRt78mAy+aqIvKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FC98F80430;
	Tue, 24 Aug 2021 11:48:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9857F804FB; Tue, 24 Aug 2021 11:48:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0C7DF80224
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 11:48:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0C7DF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="DHogabIo"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="9sQrggly"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 95AC5220E1
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629798477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXWJMeOYizQPoO0kl/uU+hPYHai/ibBD3dCVIkmG/QQ=;
 b=DHogabIokRmx2Oi5B8scHhBDOXZj+pqxks4auyHXvDSF9XJccseX6jeP5GPriYy1qyH75I
 mupoQ2RV1J7hGN1NagJvGy6ue0ljb141DdPHY7yBF9iwHb+SZzfa+EkPboUf2m0ZNCUewh
 Zuwhxr0YO4ZwSUnAHjRG14Qsw/l/VCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629798477;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXWJMeOYizQPoO0kl/uU+hPYHai/ibBD3dCVIkmG/QQ=;
 b=9sQrgglyR6JF+7X7Hy/5eNrnOpF0SZsPJRpuFbcgRsCPkOif9/tHyRBYZtl2H7HTocL7Qp
 uLCb3TqWrLxzyoDQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 8695EA3B87;
 Tue, 24 Aug 2021 09:47:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 4/5] aplay: Handle upper bound in peak calculations
Date: Tue, 24 Aug 2021 11:47:55 +0200
Message-Id: <20210824094756.12540-5-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210824094756.12540-1-tiwai@suse.de>
References: <20210824094756.12540-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Make sure that the calculated max_peak[] won't go beyond the sample
max resolution.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 aplay/aplay.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/aplay/aplay.c b/aplay/aplay.c
index 2543de5b6cd8..a51a37ba34bd 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -1898,6 +1898,8 @@ static void compute_max_peak(u_char *data, size_t samples)
 		max = 0x7fffffff;
 
 	for (c = 0; c < ichans; c++) {
+		if (max_peak[c] > max)
+			max_peak[c] = max;
 		if (bits_per_sample > 16)
 			perc[c] = max_peak[c] / (max / 100);
 		else
-- 
2.26.2

