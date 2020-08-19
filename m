Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0AF249D0D
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 14:00:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E437C1764;
	Wed, 19 Aug 2020 13:59:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E437C1764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597838406;
	bh=RgRvYOfdymyiXmitWmYSNkWeivyTv9SR2fGVAi2KP1k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dvml5mU2p/qJCpfjZom7yXpi3W5D2IHfjsdoRGz7/kO1BIHpT1ToIREpMriR4wBl2
	 ZOd1f9d7CW3QQAD6yy5rdmFJBXfBcOStN0txs+7ogMv4hM8eWiKBEYjBe+QE31Ft7V
	 rupPXL9HZ+++WPzd9LouR9Q/UZRDPVGocPoIeQX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B3E5F80114;
	Wed, 19 Aug 2020 13:58:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1CD3F80218; Wed, 19 Aug 2020 13:58:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.196])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B383F80114
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 13:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B383F80114
Received: from localhost (unknown [192.168.167.32])
 by regular1.263xmail.com (Postfix) with ESMTP id 6F6EF153C;
 Wed, 19 Aug 2020 19:58:04 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from localhost.localdomain (250.19.126.124.broad.bjtelecom.net
 [124.126.19.250]) by smtp.263.net (postfix) whith ESMTP id
 P9873T140063715358464S1597838284065216_; 
 Wed, 19 Aug 2020 19:58:04 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <e53548ead706dc6b484bfeb14e7bcb0e>
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
Date: Wed, 19 Aug 2020 19:57:57 +0800
Message-Id: <20200819115757.23168-1-penghao@uniontech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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



