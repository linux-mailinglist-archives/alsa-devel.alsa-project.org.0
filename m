Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8115C938F9B
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 15:03:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9922815FB;
	Mon, 22 Jul 2024 15:03:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9922815FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721653404;
	bh=eKAoRhRBHdoGTQMFIzXbD4i+756bnaT0Wb8pX4ENf/Y=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=W1mpufI11aEhvu/iWc/Q6fspcpn7usjZKnuGDLxvua8WwfMAvvVaDGn528d8JF5ka
	 3vi+oovEolicfItxebSrX80gD8JIByd9OQqp3U1QA+RhxGuZpH1TUYOJMtyOXVP1Yh
	 kON91EdiXjBV+WtyzP2fy28M6UvXEQRhWaY1mGG4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 387BBF80722; Mon, 22 Jul 2024 15:00:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAC56F806D4;
	Mon, 22 Jul 2024 15:00:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F1AEF801F5; Mon, 22 Jul 2024 10:48:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by alsa1.perex.cz (Postfix) with ESMTP id 06193F8013D
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 10:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06193F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=Y+F7Wt7f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=9xWlT
	Jv12XCC0n8wbvF4dnppY+xU0yYtgqnHm9eH5Ls=; b=Y+F7Wt7fEDZK793cd7X4+
	hhrJ2wKTDoHkyw42PmAToO1/gVHN7x9VICvMWJEhFIoHlSqym3BW8JaLVY9joKfN
	cGjFzH742iUV802CDNL7efIrHbnveOniUYinav5o3dyh98AZwBAUWty4k/wSsa6E
	FhpLIqcdFNakSX0jJ+LI7k=
Received: from localhost.localdomain (unknown [111.48.69.245])
	by gzga-smtp-mta-g0-1 (Coremail) with SMTP id
 _____wD3fx_YHJ5mPX+sDw--.22519S2;
	Mon, 22 Jul 2024 16:48:25 +0800 (CST)
From: wangdicheng <wangdich9700@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH v3] ALSA: usb-audio: Add a quirk for Sonix HD USB Camera
Date: Mon, 22 Jul 2024 16:48:22 +0800
Message-Id: <20240722084822.31620-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3fx_YHJ5mPX+sDw--.22519S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KrykJr1kAw4kXw4fXFyfXrb_yoW8Wr1kpr
	s7C3s5KwnYgr1jqr18tF4UX3W8Ww4Ik3y5Ja4aqwnxAr1Yqa1rJF97A3yfK3yUtrs8Gaya
	qwn0v3s8Ka93GaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYKZXUUUUU=
X-Originating-IP: [111.48.69.245]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1tbioxskT2VOEie29QAAsO
X-MailFrom: wangdich9700@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XMS2MHIKSSI4WSGKV7HHGWUSGL6UF2TH
X-Message-ID-Hash: XMS2MHIKSSI4WSGKV7HHGWUSGL6UF2TH
X-Mailman-Approved-At: Mon, 22 Jul 2024 13:00:44 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XMS2MHIKSSI4WSGKV7HHGWUSGL6UF2TH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: wangdicheng <wangdicheng@kylinos.cn>

Sonix HD USB Camera does not support reading the sample rate which leads
to many lines of "cannot get freq at ep 0x84".
This patch adds the USB ID to quirks.c and avoids those error messages.

(snip)
[1.789698] usb 3-3: new high-speed USB device number 2 using xhci_hcd
[1.984121] usb 3-3: New USB device found, idVendor=0c45, idProduct=6340, bcdDevice= 0.00
[1.984124] usb 3-3: New USB device strings: Mfr=2, Product=1, SerialNumber=0
[1.984127] usb 3-3: Product: USB 2.0 Camera
[1.984128] usb 3-3: Manufacturer: Sonix Technology Co., Ltd.
[5.440957] usb 3-3: 3:1: cannot get freq at ep 0x84
[12.130679] usb 3-3: 3:1: cannot get freq at ep 0x84
[12.175065] usb 3-3: 3:1: cannot get freq at ep 0x84

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
v2 -> v3: Update the insertion order of ID 0c45
v1 -> v2: Arrange the ID in order
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 58156fbca02c..b42654033c33 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2125,6 +2125,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x0b0e, 0x0349, /* Jabra 550a */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
+	DEVICE_FLG(0x0c45, 0x6340, /* Sonix HD USB Camera */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x0ecb, 0x205c, /* JBL Quantum610 Wireless */
 		   QUIRK_FLAG_FIXED_RATE),
 	DEVICE_FLG(0x0ecb, 0x2069, /* JBL Quantum810 Wireless */
-- 
2.25.1

