Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C0AA84155
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Apr 2025 13:02:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6C32693D5;
	Thu, 10 Apr 2025 13:02:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6C32693D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744282934;
	bh=3fNFTzKEnMrl6EIbiQ024aWC8YYry1ODrkwg4hR41EY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lv5lmk8dqySYl7ABIlyGzPE2AM248bCHkO9X0uc0BjsDB+A8AsJMPA4Tqt0XUU/v8
	 mIAlMb2fCj16WiMbqz9i1/hlLGul2Gd/JAjksT1LbAdGruaZnwuWRPWU5rkcoQYm7c
	 Md1U3ZRolnJhHL18xYD+be44ih524pkxPAjtVsU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77821F805BA; Thu, 10 Apr 2025 13:01:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A782F8028B;
	Thu, 10 Apr 2025 13:01:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF841F8014C; Thu, 10 Apr 2025 13:01:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0245DF800E5
	for <alsa-devel@alsa-project.org>; Thu, 10 Apr 2025 13:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0245DF800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256
 header.s=key1 header.b=KAgRg/W6;
	dkim=temperror header.d=ew.tq-group.com header.i=@ew.tq-group.com
 header.a=rsa-sha256 header.s=dkim header.b=dAfUQstN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744282889; x=1775818889;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5xJciRVkFermOZKNFd3YERxq92GGDRKO68lcS9PoC/c=;
  b=KAgRg/W6dYTWFaD9Kw/xhT79h+XaM54jqB7adxxK1d/9rGUpmWRsuEBV
   BFf+FZgJfqs4GxmKXhP4yrZLHbcWXZXeaYgR/8rX5FfbB+TlZRrCMeH7P
   lyXmc+b6KGFATpWUXkhp1OAwBgj3we4qG4ZUDTQHg5b5tzREJO4cOkMD8
   HCH2r8465sx3x943oIRqKKgnF9FMWSmIKzxHzNgCta1+0tXGBGPZ9Kw1f
   DCvorOBE9indiaVHxg/1JJIIFD2ZK4vHvV9eR3/1dwWELT6sSoDwJr1gm
   bBaSsIjIIRiacoLHhsXCMPGLs8WnIR5tD173uvcbt5ZBMiCaretx0GNKA
   w==;
X-CSE-ConnectionGUID: PrpyP09yRPueau0OhFGkNw==
X-CSE-MsgGUID: 5ttYdd5cQke11LawDj4I2Q==
X-IronPort-AV: E=Sophos;i="6.15,202,1739833200";
   d="scan'208";a="43453752"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Apr 2025 13:01:26 +0200
X-CheckPoint: {67F7A506-35-F35B2447-E1635CDE}
X-MAIL-CPID: 798A62CDA62BBCAFFD0DD6D8CFC408E5_1
X-Control-Analysis: 
 str=0001.0A006371.67F7A504.0002,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3C6AD16473E;
	Thu, 10 Apr 2025 13:01:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744282882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5xJciRVkFermOZKNFd3YERxq92GGDRKO68lcS9PoC/c=;
	b=dAfUQstNJji17C4b5DROzX2BYLpLyePTNBRGOgd0MSKueQOGauPdsW3bd+PwQNAuuy5PAM
	CKEEhCQa8kLUOM9y10rHCzjdeMl+1vCJuZrZEzY/d4z/ahqgOoCkRNXk15VrD7UQQipdKs
	8UdXBqAktIjuPwQadOLT1GFsTPRA/50ZMyhmW1kMWkNZOTZdx2nn5D46zPbxJnzO3G/Qzf
	lWst8B/CPpFc9Tv029JgvIP7+5exQXka1UoIJmoPZBbOEzKhePywIz26SNzvB2NxjtWRFN
	Ic2EAG7BytgemjTZ2jKMo4CFtJJT1hgcyR795tCCYjKX/Mul4jdZqg0AXsiPzA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/1] bat: Fix buffer time configuration
Date: Thu, 10 Apr 2025 13:01:19 +0200
Message-ID: <20250410110120.1997264-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Message-ID-Hash: WOFA7GSGTFCI4CG2VJ42WMCEP5TWBUWD
X-Message-ID-Hash: WOFA7GSGTFCI4CG2VJ42WMCEP5TWBUWD
X-MailFrom: alexander.stein@ew.tq-group.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WOFA7GSGTFCI4CG2VJ42WMCEP5TWBUWD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

By swapping time configuration some hardware constraints can be supported.
Fixes the error: Set parameter to device error: buffer time: 500000
hw:tqmtlv320aic32: Invalid argument(-22)

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Our common 'alsabat -Dhw:tqmtlv320aic32 -f S16_LE -c 2 -r 44100 -F 997:500'
failed ona i.MX95 based platform, while it worked flawlessly on others,
e.g. i.MX8M Plus. Upon searching I stumbled across [1], which this patch
is inspired/based on.

[1] https://github.com/arkq/bluez-alsa/pull/290/commits/da78b82ff77310093b4b4a914d31e69b8ebb49eb
---
 bat/alsa.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/bat/alsa.c b/bat/alsa.c
index 67489c4..457e79a 100644
--- a/bat/alsa.c
+++ b/bat/alsa.c
@@ -221,23 +221,23 @@ static int set_snd_pcm_params(struct bat *bat, struct pcm_container *sndpcm)
 
 		period_time = buffer_time / DIV_BUFFERTIME;
 
-		/* Set buffer time and period time */
-		err = snd_pcm_hw_params_set_buffer_time_near(sndpcm->handle,
-				params, &buffer_time, 0);
+		/* Set period time and buffer time */
+		err = snd_pcm_hw_params_set_period_time_near(sndpcm->handle,
+			params, &period_time, 0);
 		if (err < 0) {
 			fprintf(bat->err, _("Set parameter to device error: "));
-			fprintf(bat->err, _("buffer time: %d %s: %s(%d)\n"),
-					buffer_time,
+			fprintf(bat->err, _("period time: %d %s: %s(%d)\n"),
+					period_time,
 					device_name, snd_strerror(err), err);
 			return err;
 		}
 
-		err = snd_pcm_hw_params_set_period_time_near(sndpcm->handle,
-				params, &period_time, 0);
+		err = snd_pcm_hw_params_set_buffer_time_near(sndpcm->handle,
+				params, &buffer_time, 0);
 		if (err < 0) {
 			fprintf(bat->err, _("Set parameter to device error: "));
-			fprintf(bat->err, _("period time: %d %s: %s(%d)\n"),
-					period_time,
+			fprintf(bat->err, _("buffer time: %d %s: %s(%d)\n"),
+					buffer_time,
 					device_name, snd_strerror(err), err);
 			return err;
 		}
-- 
2.43.0

