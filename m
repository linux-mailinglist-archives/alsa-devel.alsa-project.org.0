Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 803B222D496
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jul 2020 06:09:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A100E1680;
	Sat, 25 Jul 2020 06:08:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A100E1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595650155;
	bh=l1FB+E4ffyOBvGfvMIi0SLzoLcvrOV7u7XQ+AMop7Ss=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hkxn7MpNox+HV8ua/98YNFXe3Ud8R35RQQyUPuZFnX3pu8AU6KnADTWFmtIVqOlEE
	 LOgELw+n0iC89mAHgkpCsxag+COlf24IVO/FVMi0oxfjNtoG8wJSoGDlIBNqaJXqQz
	 x8kuQNIUMjNeS46UPsiA1x3D9L9m7SNmdK6bwXew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBE34F8024A;
	Sat, 25 Jul 2020 06:07:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37E30F80212; Sat, 25 Jul 2020 06:07:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.132])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEF9DF800DE
 for <alsa-devel@alsa-project.org>; Sat, 25 Jul 2020 06:07:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEF9DF800DE
Received: from localhost (unknown [192.168.167.13])
 by lucky1.263xmail.com (Postfix) with ESMTP id 11EEEEC493;
 Sat, 25 Jul 2020 12:01:58 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [111.204.108.116])
 by smtp.263.net (postfix) whith ESMTP id
 P5979T140275804518144S1595649718262681_; 
 Sat, 25 Jul 2020 12:01:58 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <8979ef735d1a662965749e452507493a>
X-RL-SENDER: penghao@uniontech.com
X-SENDER: penghao@uniontech.com
X-LOGIN-NAME: penghao@uniontech.com
X-FST-TO: perex@perex.cz
X-SENDER-IP: 111.204.108.116
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From: penghao <penghao@uniontech.com>
To: perex@perex.cz, tiwai@suse.com, gregkh@linuxfoundation.org,
 alsa-devel@alsa-project.org
Subject: [PATCH 14216/14216] ALSA: usb-audio: This patch for prevent auto
 wakeup from s3 trig by usb disconnect signal from Lenovo Thinkcentre
 TI024Gen3 USB-audio.
Date: Sat, 25 Jul 2020 12:01:55 +0800
Message-Id: <20200725040155.27648-1-penghao@uniontech.com>
X-Mailer: git-send-email 2.11.0
Cc: "penghao@deepin.com" <penghao@deepin.com>, phz0008@163.com,
 linux-kernel@vger.kernel.org, penghao@uniontech.com
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

From: "penghao@deepin.com" <penghao@deepin.com>

 TI024Gen3 USB-audio is controlled by TI024Gen3,when TI024Gens
 enter sleep mode, USB-audio will disconnect from USB bus port,
 so disabled the /sys/bus/usb/*/power/wakeup Fixesimmediately
 wakup form s3 state

Signed-off-by: penghao@uniontech.com <penghao@uniontech.com>
Signed-off-by: penghao@deepin.com <penghao@deepin.com>
---
 sound/usb/card.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 2644a5ae2b75..969c3809e051 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -640,6 +640,12 @@ static int usb_audio_probe(struct usb_interface *intf,
 		}
 	}
 	dev_set_drvdata(&dev->dev, chip);
+	/*
+	 * ALSA: usb-audio: Add prevent wakeup from s3 state trig by lenovo
+	 * ThinkCentre TI024Gen3 USB-audio
+	 */
+	if ((usb_id->idVendor == 0x17ef) && (usb_id->idProduct == 0xa012))
+		device_set_wakeup_enable(&dev->dev, 0);
 
 	/*
 	 * For devices with more than one control interface, we assume the
@@ -914,3 +920,4 @@ static struct usb_driver usb_audio_driver = {
 };
 
 module_usb_driver(usb_audio_driver);
+
-- 
2.11.0



