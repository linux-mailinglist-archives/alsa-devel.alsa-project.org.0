Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 613834364A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 15:11:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4F9F1823;
	Thu, 13 Jun 2019 15:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4F9F1823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560431463;
	bh=xy4jIRMRFp35NFPOYA/ANDLpfuCpMi2YBC3TBZWisq0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kKEeXjoc+hQ+oCGb3tqUtD9vaUDZTEx9KokrgmEmc5W2XRKjysfOts/c6MJHpic/g
	 Ru/UDpj2Sh1M+y/7ioHDdnlIDfxDgBB1NfLq3YIMCpJh9cmdmoSDWLyQZif3xhGARo
	 z3IPY+BYK8WoEjQ1wKJZEb3HwwCXBIbbF3MtCYfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3905FF89711;
	Thu, 13 Jun 2019 15:09:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64A98F89703; Thu, 13 Jun 2019 15:09:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B57EAF8076F
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 15:09:12 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B51C2A003F;
 Thu, 13 Jun 2019 15:09:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B51C2A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1560431351; bh=HqrbTL1nKCHD/JJu8qm3kdltwhbwMZ52IxrXE5iidmw=;
 h=From:To:Cc:Subject:Date:From;
 b=WX4+df9QqvfmEoGJfqfnfezLe65974HYVoX0+J4ZVso17P5GkEqb8jz+2R3ds/yih
 gVL/GC+SGaU6+S0/PA7J66tx5bPnIwVA7EfQvcKWrln4swILiocOju7PSyGRH0t+dp
 nAX7h12wf1xORZTifuKdDfQdq1/EvrRR6VQj9fzM=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 13 Jun 2019 15:09:08 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Date: Thu, 13 Jun 2019 15:09:01 +0200
Message-Id: <20190613130901.26558-1-perex@perex.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [alsa-devel] [PATCH] ALSA: hda/hdmi - consider eld_valid also in
	sync_eld_via_acomp()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In the commit 7f641e26a6df9269cb25dd7a4b0a91d6586ed441 (ALSA: hda/hdmi
- Consider eld_valid when reporting jack event) the eld_valid check was
added for the jack event reports. Do the same in sync_eld_via_acomp()
function. Apparently, it is required for the NVIDIA proprietary driver
(monitor presence reported first, but ELD is available later).

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/pci/hda/patch_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 0c61c05503f5..b522314ec5be 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1627,7 +1627,8 @@ static void sync_eld_via_acomp(struct hda_codec *codec,
 	if (jack == NULL)
 		goto unlock;
 	snd_jack_report(jack,
-			eld->monitor_present ? SND_JACK_AVOUT : 0);
+			(eld->monitor_present && eld->eld_valid) ?
+				SND_JACK_AVOUT : 0);
  unlock:
 	mutex_unlock(&per_pin->lock);
 }
-- 
2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
