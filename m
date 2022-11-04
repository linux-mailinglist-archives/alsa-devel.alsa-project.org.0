Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1F16192A8
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 09:20:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBA4A169F;
	Fri,  4 Nov 2022 09:19:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBA4A169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667550018;
	bh=cA7vERfyU/roPQhq82XDugYPEcx7Lg3SzCQW2ptWCLk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f3UpfWl+7QlgDGwzaiUbmbE00BB42bPdduqnMQtBEP72il3ECCPe+xLLbGYx3PCBq
	 zU0VKdnZPkL1V3YVJh5TrDK+rEH7vbVoo6pL7hKpXITWKRarldhpFyTLJYf16BUnda
	 woOXIlxRYM7mg4zcQ10TZO0ejcFx1gFf7kOfwrWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9F42F805B4;
	Fri,  4 Nov 2022 09:16:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94618F8051E; Fri,  4 Nov 2022 02:33:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDD51F801D5
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 02:32:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDD51F801D5
X-UUID: a83640dbf08d42068760d5fb3362947b-20221104
X-CPASD-INFO: c880302e3dc24631910fba284e6cba80@rIhyUGBiYJVfhKV-g3l-a1liYJaSjVK
 Hdp9Wk5CRZFCVhH5xTV5uYFV9fWtVYV9dYVR6eGxQYmBgZFJ4i3-XblBgXoZgUZB3snpyUGNeYg==
X-CLOUD-ID: c880302e3dc24631910fba284e6cba80
X-CPASD-SUMMARY: SIP:-1, APTIP:-2.0, KEY:0.0, FROMBLOCK:1, OB:0.0, URL:-5,
 TVAL:172.
 0, ESV:0.0, ECOM:-5.0, ML:0.0, FD:0.0, CUTS:148.0, IP:-2.0, MAL:-5.0, PHF:-5.0,
 PHC:-5
 .0, SPF:4.0, EDMS:-5, IPLABEL:4480.0, FROMTO:0, AD:0, FFOB:0.0, CFOB:0.0, SPC:0,
 SIG:-
 5, AUF:0, DUF:7445, ACD:130, DCD:130, SL:0, EISP:0, AG:0, CFC:0.221, CFSR:0.16,
 UAT:0, R
 AF:0, IMG:-5.0, DFA:0, DTA:0, IBL:-2.0, ADI:-5, SBL:0, REDM:0, REIP:0, ESB:0,
 ATTNUM:0, EAF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: a83640dbf08d42068760d5fb3362947b-20221104
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: a83640dbf08d42068760d5fb3362947b-20221104
X-User: aichao@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw
 (envelope-from <aichao@kylinos.cn>) (Generic MTA)
 with ESMTP id 781106644; Fri, 04 Nov 2022 09:32:50 +0800
From: aichao <aichao@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: fix usb camero disconnect issue
Date: Fri,  4 Nov 2022 09:32:36 +0800
Message-Id: <20221104013236.3480427-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 04 Nov 2022 09:16:02 +0100
Cc: aichao <aichao@kylinos.cn>, linux-kernel@vger.kernel.org
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

When current rate is different from the runtime rate,
snd_usb_endpoint stop and close endpoint to resetting rate.
if snd_usb_endpoint close the endpoint, sometimes usb will
 disconnect the device.

Signed-off-by: aichao <aichao@kylinos.cn>
---
 sound/usb/pcm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 5dc9266180e3..2ae4a55cbaa8 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -517,7 +517,6 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 		if (snd_usb_endpoint_compatible(chip, subs->data_endpoint,
 						fmt, hw_params))
 			goto unlock;
-		close_endpoints(chip, subs);
 	}
 
 	subs->data_endpoint = snd_usb_endpoint_open(chip, fmt, hw_params, false);
@@ -546,9 +545,6 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 	ret = configure_endpoints(chip, subs);
 
  unlock:
-	if (ret < 0)
-		close_endpoints(chip, subs);
-
 	snd_usb_unlock_shutdown(chip);
  stop_pipeline:
 	if (ret < 0)
@@ -574,7 +570,6 @@ static int snd_usb_hw_free(struct snd_pcm_substream *substream)
 	if (!snd_usb_lock_shutdown(chip)) {
 		if (stop_endpoints(subs))
 			sync_pending_stops(subs);
-		close_endpoints(chip, subs);
 		snd_usb_unlock_shutdown(chip);
 	}
 
-- 
2.25.1

