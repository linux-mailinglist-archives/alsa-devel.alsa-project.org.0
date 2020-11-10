Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E702AD20A
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 10:06:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E3A916E4;
	Tue, 10 Nov 2020 10:05:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E3A916E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604999166;
	bh=k13gWvPLof8EweUAT/HNyBS5+PQvXElKMhJ1Mt/CXOg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oXnYsN87x0EKE6+I+BjU1XPEKRFf6O66PSbuAGqaSZdu9o92V9+IZMkBEMk2zVlP9
	 Qua0oAJQI1eY23MQy/t0SEK/yClt8sB6n0GsjvGptJbndNm6wTDiMjHGemkkSZ8n9B
	 eMriVEgsPWSYOeP467QVYOrSXeHNAI6p6Q/4liJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A69A0F801EB;
	Tue, 10 Nov 2020 10:04:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89422F801D5; Tue, 10 Nov 2020 10:04:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id DFCE0F800EB
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 10:04:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFCE0F800EB
X-UUID: 0d8bb3a431fb404e9bb9c1b01b7e6eb6-20201110
X-UUID: 0d8bb3a431fb404e9bb9c1b01b7e6eb6-20201110
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1250319375; Tue, 10 Nov 2020 17:04:17 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 17:04:14 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 10 Nov 2020 17:04:15 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Alexander Tsoy <alexander@tsoy.me>,
 Nicola
 Lunghi <nick83ola@gmail.com>, Christopher Swenson <swenson@swenson.io>, Nick
 Kossifidis <mickflemm@gmail.com>, <alsa-devel@alsa-project.org>
Subject: [PATCH v3] ALSA: usb-audio: disable 96khz support for HUAWEI USB-C
 HEADSET
Date: Tue, 10 Nov 2020 17:04:08 +0800
Message-ID: <1604999048-20294-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1604996266.2817.1.camel@mtkswgap22>
References: <1604996266.2817.1.camel@mtkswgap22>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 3B1BA5211D1AEA1F9D389FD0B8F95556B1905E286E655FC53C5BEFF736FBB5782000:8
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
Changes for v3:
  - Replace "udev" with "chip->dev" according to Takashi's suggestion. Thanks.

 sound/usb/format.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 1b28d01..0aff774 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -217,6 +217,11 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
 			    (chip->usb_id == USB_ID(0x041e, 0x4064) ||
 			     chip->usb_id == USB_ID(0x041e, 0x4068)))
 				rate = 8000;
+			/* Huawei headset can't support 96kHz fully */
+			if (rate == 96000 &&
+			    chip->usb_id == USB_ID(0x12d1, 0x3a07) &&
+			    le16_to_cpu(chip->dev->descriptor.bcdDevice) == 0x49)
+				continue;
 
 			fp->rate_table[fp->nr_rates] = rate;
 			if (!fp->rate_min || rate < fp->rate_min)
-- 
1.7.9.5

