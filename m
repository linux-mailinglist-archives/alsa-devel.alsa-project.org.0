Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6693F5B4E
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 11:50:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C784084A;
	Tue, 24 Aug 2021 11:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C784084A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629798635;
	bh=4QGBDRNN91aBCaKqAb+M+sVOeGP8GEyGOkt/mSWw/QE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A69WCK4xunA68CSO4TYYpDwS3vceSNcUXnFR39XT0ttYOfvq8nTmAyXkBN7qqbHV0
	 Qil7MvcRa8V4dadL37biR3WIHQglhMRnDBFx4j4gPsBgPo+DJLF+YVZLW3y1aj8olP
	 vtWDsxWq78anN6I7EJcmmD9KjjD6T4JlLrvZu41Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A5B2F804ED;
	Tue, 24 Aug 2021 11:48:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DCDAF804D0; Tue, 24 Aug 2021 11:48:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC6AFF801D8
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 11:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC6AFF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="R5DSvBxM"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="KZmzUslK"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8888120050
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629798477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k40+ME2hFZhc/8Xrg/QR3oc+2hv7ZLPb9gVSAkpyVpo=;
 b=R5DSvBxM3m2Pv8YpUX68vO4dLAuVT9xPnawgxxN69nxxInAZl1DT1nDq3Z6Im4QNfhe0Xw
 hKDqaTS5EQ02B8eG3lEwZe154jHlMOdi8sXihU9gLHpWeasIgVkA7mBeBZazPdjIJe7VOT
 jpLyJXKj3CC5vepP6/PhChYJAhT4ACc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629798477;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k40+ME2hFZhc/8Xrg/QR3oc+2hv7ZLPb9gVSAkpyVpo=;
 b=KZmzUslK4kmIvLhA+0q+OlUgkXI96iIaRoCAI8cDNUKyX/Y3ogunygXzjQzBqf8OR5UM+I
 2P1YfYfHfWWM4dBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 790B9A3BBA;
 Tue, 24 Aug 2021 09:47:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 3/5] aplay: Don't pass most negative integer to
 abs() in peak calculations
Date: Tue, 24 Aug 2021 11:47:54 +0200
Message-Id: <20210824094756.12540-4-tiwai@suse.de>
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

The return value from abs() for the most negative integer is
undefined.  Cap it properly for the 32bit sample handling.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 aplay/aplay.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/aplay/aplay.c b/aplay/aplay.c
index c884346c9f25..2543de5b6cd8 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -1874,7 +1874,10 @@ static void compute_max_peak(u_char *data, size_t samples)
 			else
 				val = be32toh(*valp);
 			val ^= mask;
-			val = abs(val);
+			if (val == 0x80000000U)
+				val = 0x7fffffff;
+			else
+				val = abs(val);
 			if (max_peak[c] < val)
 				max_peak[c] = val;
 			valp++;
-- 
2.26.2

