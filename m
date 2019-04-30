Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4086CF0CA
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 08:59:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C68491660;
	Tue, 30 Apr 2019 08:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C68491660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556607541;
	bh=HWuO2ZDVjVg5ZmM5+CvQY83pnNRPLcL/PbYTj2IQoRE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X2tggizZdCp4NufGlENs88bZeradL+j7s0L30o3E+s8MJM6zWs8JNlo1kQ8IfA+vQ
	 ANA6z6xo8rI5zXzBP+UnjtUiF5qytaPe3ML0NNRoYxKJJesPoFIAhs5zBPfwvnjXlg
	 7fjAHdwy2+N6FJLRXl3xWeSxZwS9kPLosUOh8ZAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6BCDF896AA;
	Tue, 30 Apr 2019 08:57:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94202F896EC; Tue, 30 Apr 2019 08:57:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1B3FF8962C
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 08:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1B3FF8962C
Received: from [125.35.49.90] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hLMhh-0001ek-Ad; Tue, 30 Apr 2019 06:57:26 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Tue, 30 Apr 2019 14:57:11 +0800
Message-Id: <20190430065711.14977-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Subject: [alsa-devel] [PATCH] ALSA: hda/hdmi - Don't report Jack event if no
	need to do that
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On the machines with AMD GPU or Nvidia GPU, we often meet this issues:
after s3, there are 4 HDMI/DP audio devices in the gnome-sound-setting
even there is no any monitors plugged.

When this problem happens, we check the /proc/asound/cardX/eld#N.M, we
will find the monitor_present=1, eld_valid=0.

The root cause is somehow the pin_sense reports the monitor is present
and eld is valid when there is no monitor plugged.

The current driver will read the eld data if the pin_sense reports the
eld is valid, because of no monitor is plugged, there is no valid eld
data, then the eld->valid is set to 0.

If we don't let driver report Jack event when monitor_present=1 while
eld_valid=0, there will be no this issue.

After this change, the driver only reports Jack event with one of the
below 2 conditons:
 eld->monitor_present=1 and eld->eld_valid=1 (a valid monitor detect)
 eld->monitor_present=0 (a monitor is unplugged)

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 8b3ac690efa3..e5a34fa6f358 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1548,7 +1548,7 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	else
 		update_eld(codec, per_pin, eld);
 
-	ret = !repoll || !eld->monitor_present || eld->eld_valid;
+	ret = !eld->monitor_present || eld->eld_valid;
 
 	jack = snd_hda_jack_tbl_get(codec, pin_nid);
 	if (jack)
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
