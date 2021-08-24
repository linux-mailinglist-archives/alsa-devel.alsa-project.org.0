Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2663F5B53
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 11:51:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C8C184C;
	Tue, 24 Aug 2021 11:50:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C8C184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629798671;
	bh=9GwZ0mnoGOTlHyv2qonH8DOi2yUrWuKy441bw5OWFZM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gd0lHgf5sTattJQhf/pTbKgMCMFsyEUFgYjguQkd1ZdPoxWkoPAeXwVySWoe0hEyB
	 PwxXxBv8lubpuIWJGeX0QllD8Z2bBQCS2n0KjCrLmPgs/RHk3r/DhGeja8ueAXRMf9
	 x5ILTsMy7ZpIv9kV55zrEHARvi3kAwPlKrFkDVJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9845F804FF;
	Tue, 24 Aug 2021 11:48:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13BDFF804FD; Tue, 24 Aug 2021 11:48:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_25,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9DCAF80430
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 11:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9DCAF80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="v4Cd9m1u"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="E6aDgWOR"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A3BB1220E6
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629798477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+fg/W80wM02FV81zqY8zIqz3dFIExfCosUOIN3WBP4w=;
 b=v4Cd9m1uyljPnbBBvvP9bX7AaazBoRWqrhggILIRXZHrnSTAA1Lm6ewfuhxWgCpi++JSgx
 hyADhQNHz39NWiqNt6o51kURMrffzIWo9FyzatFq+TAw/AHV036FTcHQ5s2VzSdLZpmg+V
 iz3oSA7cWtFKnOEjFNPtdFKfsjYgX2s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629798477;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+fg/W80wM02FV81zqY8zIqz3dFIExfCosUOIN3WBP4w=;
 b=E6aDgWORjYgkVntZ/+NSqNN9NUjR7oxyoYAXpOQaMdO6HAnfHLLRgHOm0F8kb6JzeWzXk8
 n56wfWuhz+IHGJBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 94307A3BBA;
 Tue, 24 Aug 2021 09:47:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 5/5] aplay: Fix out-of-bound access in stereo VU
 meter drawing
Date: Tue, 24 Aug 2021 11:47:56 +0200
Message-Id: <20210824094756.12540-6-tiwai@suse.de>
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

The left channel drawing of a stereo VU meter has a bug where it may
access a negative array index.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 aplay/aplay.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/aplay/aplay.c b/aplay/aplay.c
index a51a37ba34bd..63a4e3437fd9 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -1758,10 +1758,12 @@ static void print_vu_meter_stereo(int *perc, int *maxperc)
 		if (c)
 			memset(line + bar_length + 6 + 1, '#', p);
 		else
-			memset(line + bar_length - p - 1, '#', p);
-		p = maxperc[c] * bar_length / 100;
-		if (p > bar_length)
-			p = bar_length;
+			memset(line + bar_length - p, '#', p);
+		p = maxperc[c] * bar_length / 100 - 1;
+		if (p < 0)
+			p = 0;
+		else if (p >= bar_length)
+			p = bar_length - 1;
 		if (c)
 			line[bar_length + 6 + 1 + p] = '+';
 		else
-- 
2.26.2

