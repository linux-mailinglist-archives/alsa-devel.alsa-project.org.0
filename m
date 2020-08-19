Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCB1249374
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 05:36:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2201F17F4;
	Wed, 19 Aug 2020 05:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2201F17F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597808208;
	bh=RgRvYOfdymyiXmitWmYSNkWeivyTv9SR2fGVAi2KP1k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dUCQ2aR2VYR1lYXeSXk7Vo1nyx6Qa8uHD9/auJZ7wf+tXQbMu/r4jCjIrH+bybkBS
	 sPjUE13DFy61GYQrGDnuanEtFcUQNZ7uyQBjhynUBdt3viQL1vMgCcRR2VpEK0qTA1
	 a2QZxycU2n6zboKutp9Xod3WSlnLR9NGqvzkgRq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57603F800D3;
	Wed, 19 Aug 2020 05:35:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F825F80218; Wed, 19 Aug 2020 05:35:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85356F800D3
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 05:34:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85356F800D3
Received: from localhost (unknown [192.168.167.16])
 by regular1.263xmail.com (Postfix) with ESMTP id C5764D3F;
 Wed, 19 Aug 2020 11:34:50 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from localhost.localdomain (250.19.126.124.broad.bjtelecom.net
 [124.126.19.250]) by smtp.263.net (postfix) whith ESMTP id
 P25957T140260100654848S1597808091034256_; 
 Wed, 19 Aug 2020 11:34:51 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a04c9f09ffb779a6d53edaaf716d81cf>
X-RL-SENDER: penghao@uniontech.com
X-SENDER: penghao@uniontech.com
X-LOGIN-NAME: penghao@uniontech.com
X-FST-TO: perex@perex.cz
X-SENDER-IP: 124.126.19.250
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 5
X-System-Flag: 0
From: penghao <penghao@uniontech.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: usb-audio: Add prevent wakeup from s3 state trig by
 Lenovo ThinkCentre TI024Gen3 USB-audio
Date: Wed, 19 Aug 2020 11:34:46 +0800
Message-Id: <20200819033446.7897-1-penghao@uniontech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, penghao@uniontech.com, crwulff@gmail.com,
 gustavoars@kernel.org, linux-kernel@vger.kernel.org, alexander@tsoy.me,
 dan.carpenter@oracle.com
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

TI024Gen3 USB-audio is controlled by TI024Gen3,when TI024Gens
enter sleep mode, USB-audio will disconnect from USB bus port,
wakup form s3 state

Signed-off-by: penghao <penghao@uniontech.com>
---
 sound/usb/card.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 696e788c5d31..6bdbb34009b3 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -658,6 +658,12 @@ static int usb_audio_probe(struct usb_interface *intf,
 	}
 
 	dev_set_drvdata(&dev->dev, chip);
+	/*
+	 *ALSA: usb-audio: Add prevent wakeup from s3 state trig by Lenovo
+	 *ThinkCentre TI024Gen3 usb-audio
+	 */
+	if ((usb_id->idVendor == 0x17ef) && (usb_id->idProduct == 0xa012))
+		device_set_wakeup_enable(＆dev->dev, 0);
 
 	/*
 	 * For devices with more than one control interface, we assume the
-- 
2.11.0



