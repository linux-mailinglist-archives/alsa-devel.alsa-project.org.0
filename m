Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A44F938F8D
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 15:01:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6B42E67;
	Mon, 22 Jul 2024 15:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6B42E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721653299;
	bh=wwGG3+YyY8mIogBdU+KkOQ0+dRIFSZNY44DPqE3xv6k=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kS/ujJetp2mBFR9YtyCIp0zgwx/yxfJlGJdLYeGEcZLdVpxE5TejGTH2R3by5Kt2+
	 MkTF0PGIeu98nDzknEoRvEFLlRr6z+Vox8F7voEoKERjDzuhR5mlEQ+Sh4JIgJP6FK
	 hwhzJVd5WauLZ0iLCLrw7P1O7C09ykyPGffuJ4Co=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94B66F80589; Mon, 22 Jul 2024 15:00:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05FEEF805B4;
	Mon, 22 Jul 2024 15:00:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87E35F80508; Fri, 19 Jul 2024 04:35:52 +0200 (CEST)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by alsa1.perex.cz (Postfix) with ESMTP id 477EAF8013D
	for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2024 04:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 477EAF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=VApZSabf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=/f5De
	nBV8OntvTIl0L+VxVkHwc/+e99DtksAYzxlBJg=; b=VApZSabf1jxvPCTJskWVV
	5ZB+OV7+slVZzwAKOwU//LOmuUeV5zKnJxfc9n84nhZF/skBMYKjnZDCCeJTr/b1
	V5D+5qDBrwWEi2BzI7AdDztbZnin5JdVHld3Py/D/w1CZYHxSJSldabrpLvhQ6QV
	MYjjvtCEJiKyBfnvKfO5Jg=
Received: from localhost.localdomain (unknown [111.48.69.245])
	by gzga-smtp-mta-g1-3 (Coremail) with SMTP id
 _____wCXH5qmz5lmZ9ulDQ--.12874S2;
	Fri, 19 Jul 2024 10:29:58 +0800 (CST)
From: wangdicheng <wangdich9700@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: usb-audio: Add a quirk for Sonix HD USB Camera
Date: Fri, 19 Jul 2024 10:29:56 +0800
Message-Id: <20240719022956.9861-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXH5qmz5lmZ9ulDQ--.12874S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KrykJr1kAw4kXw4fXFyfXrb_yoW8XF45pr
	4xua4ktrn8Wr1UXw18ta1UX3WkXws7A3y5JFyagwsxJr15Kay5JF92y3ySgw42yrW5Caya
	qas0v395KFZ5Gw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYKZXUUUUU=
X-Originating-IP: [111.48.69.245]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1tbiRwchT2V4KXHRAQABs6
X-MailFrom: wangdich9700@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: O7C7NSYENSGHFI4RPELXWDITYMERRCVG
X-Message-ID-Hash: O7C7NSYENSGHFI4RPELXWDITYMERRCVG
X-Mailman-Approved-At: Mon, 22 Jul 2024 13:00:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O7C7NSYENSGHFI4RPELXWDITYMERRCVG/>
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
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 09712e61c606..c1fd690cbac0 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2033,6 +2033,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0499, 0x3108, /* Yamaha YIT-W12TX */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x0c45, 0x6340, /* Sonix HD USB Camera */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x04d8, 0xfeea, /* Benchmark DAC1 Pre */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x04e8, 0xa051, /* Samsung USBC Headset (AKG) */
-- 
2.25.1

