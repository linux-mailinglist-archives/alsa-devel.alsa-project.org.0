Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2237C2AD190
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 09:45:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E52716DB;
	Tue, 10 Nov 2020 09:44:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E52716DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604997908;
	bh=CusaTiovzL54+JJsjrckmjPS3q+HYSPkhiiraeO9eJo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R6EFX5AlIxwJ6ciW0OxpVAoou1yyvLRql+JxywWllNw8ELTdxSwfZe+2SrwCNkBgn
	 GOeozmHU4CIKjR4vqA5BF+voh5pEYMBbnSB153yeH3jav2UCyNY7UZPPGIEKDzPkLd
	 etDOthi05KvvSpYs8jgKZtJ+Kw7MTAyxvZymt9mU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0E30F8021C;
	Tue, 10 Nov 2020 09:43:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6AABF801D5; Tue, 10 Nov 2020 09:43:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 819DEF800AE
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 09:43:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 819DEF800AE
X-UUID: 9a49a4eb747a4336a1463e66c6adc991-20201110
X-UUID: 9a49a4eb747a4336a1463e66c6adc991-20201110
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <macpaul.lin@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 750161777; Tue, 10 Nov 2020 16:43:11 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 16:43:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 10 Nov 2020 16:43:09 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Alexander Tsoy <alexander@tsoy.me>,
 Nicola
 Lunghi <nick83ola@gmail.com>, Christopher Swenson <swenson@swenson.io>, Nick
 Kossifidis <mickflemm@gmail.com>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2] ALSA: usb-audio: disable 96khz support for HUAWEI USB-C
 HEADSET
Date: Tue, 10 Nov 2020 16:42:54 +0800
Message-ID: <1604997774-13593-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1604995443-30453-1-git-send-email-macpaul.lin@mediatek.com>
References: <1604995443-30453-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: linux-usb@vger.kernel.org,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Macpaul Lin <macpaul@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Ainge Hsu <ainge.hsu@mediatek.com>
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

The HUAWEI USB-C headset (VID:0x12d1, PID:0x3a07) reported it supports
96khz. However there will be some random issue under 96khz.
Not sure if there is any alternate setting could be applied.
Hence 48khz is suggested to be applied at this moment.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Eddie Hung <eddie.hung@mediatek.com>
Cc: stable@vger.kernel.org
---
Changes for v2:
  - Fix build error.
  - Add Cc: stable@vger.kernel.org

 sound/usb/format.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 1b28d01..7a4837b 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -202,6 +202,7 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
 		fp->rate_min = fp->rate_max = 0;
 		for (r = 0, idx = offset + 1; r < nr_rates; r++, idx += 3) {
 			unsigned int rate = combine_triple(&fmt[idx]);
+			struct usb_device *udev = chip->dev;
 			if (!rate)
 				continue;
 			/* C-Media CM6501 mislabels its 96 kHz altsetting */
@@ -217,6 +218,11 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
 			    (chip->usb_id == USB_ID(0x041e, 0x4064) ||
 			     chip->usb_id == USB_ID(0x041e, 0x4068)))
 				rate = 8000;
+			/* Huawei headset can't support 96kHz fully */
+			if (rate == 96000 &&
+			    chip->usb_id == USB_ID(0x12d1, 0x3a07) &&
+			    le16_to_cpu(udev->descriptor.bcdDevice) == 0x49)
+				continue;
 
 			fp->rate_table[fp->nr_rates] = rate;
 			if (!fp->rate_min || rate < fp->rate_min)
-- 
1.7.9.5

