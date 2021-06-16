Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B05D73AB624
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 16:38:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 376471729;
	Thu, 17 Jun 2021 16:37:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 376471729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623940728;
	bh=zekCIqBSouQR2zSsW7RYYQbUQED/5DBQBq+/5Hu7uW4=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=V1JK4QFexQG02aDCSVc6fkP+Wt2ZPnckKY5feIk3I97wlyX5/uwrE5MyWeFtR+kMc
	 vqQfCwqX0dJLW+G2YY6lqmGYh1CbXUaIOZPa19WvZ35Q+W0o3EtIcg/vhu7cx7xMTE
	 9uU3fLTnx3dodSE/iNOPaplmmE0An/s/xFZv4Shg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80DCFF804F1;
	Thu, 17 Jun 2021 16:34:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83FAFF80424; Wed, 16 Jun 2021 11:15:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70385F8028B
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 11:15:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70385F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="fgRql6hU"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210616091520epoutp023cf4da82086dba60a7cee40f0defa2bc~JBUG3o5Ya0300503005epoutp02d
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 09:15:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210616091520epoutp023cf4da82086dba60a7cee40f0defa2bc~JBUG3o5Ya0300503005epoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1623834920;
 bh=myOAqeIc6heLE/UNDGthBzZkw4lnE8HqhfmiMgQ+BjI=;
 h=From:To:Cc:Subject:Date:References:From;
 b=fgRql6hUMAmAcCAvvaIqYbXZl3QDwRb6xI/kBE04vUllF7pPJ4EB1xibGjHxArNMQ
 Z0cHm0sC61WxRwSrtEWu8eNBrm9mXlVBVOJCxHHb/TIzd1/WW8jFATjkREYO7YsGE6
 55aAySbJvHP5lmhP89Et8J0fC98T8fSf6greAjVA=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20210616091520epcas2p29bddba3267c4ba31d5a9c2d61018e0e4~JBUGh0aSq1516115161epcas2p2c;
 Wed, 16 Jun 2021 09:15:20 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.188]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4G4ffZ1FxPz4x9Pp; Wed, 16 Jun
 2021 09:15:18 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 1B.8C.09717.421C9C06; Wed, 16 Jun 2021 18:15:16 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20210616091516epcas2p2111c9b941d0e60fb0a6ae9646fb80d26~JBUDNjJbO1490614906epcas2p2M;
 Wed, 16 Jun 2021 09:15:16 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210616091516epsmtrp185a50060f680492726b0b199e1ac86de~JBUDMtjbx2764927649epsmtrp1g;
 Wed, 16 Jun 2021 09:15:16 +0000 (GMT)
X-AuditID: b6c32a48-4fbff700000025f5-36-60c9c1242619
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 68.5A.08163.421C9C06; Wed, 16 Jun 2021 18:15:16 +0900 (KST)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.36.155.120]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210616091516epsmtip23061ebbfcc75ed4703a1829595f1dffb~JBUC8-5RK2448224482epsmtip2u;
 Wed, 16 Jun 2021 09:15:16 +0000 (GMT)
From: Daehwan Jung <dh10.jung@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: ALSA: usb-audio: Fix rate on Ozone Z90 USB headset
Date: Wed, 16 Jun 2021 18:01:01 +0900
Message-Id: <1623834063-108482-1-git-send-email-dh10.jung@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEKsWRmVeSWpSXmKPExsWy7bCmqa7KwZMJBjs3W1tcuXiIyeLOgmlM
 Fs2L17NZNN3oYbW4vGsOm8Wu/3eZLDp39bNabPi+ltGBw2PD5yY2j52z7rJ7bFrVyeaxf+4a
 do99b5exefRtWcXosX7LVRaPz5vkAjiicmwyUhNTUosUUvOS81My89JtlbyD453jTc0MDHUN
 LS3MlRTyEnNTbZVcfAJ03TJzgE5TUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BQY
 GhboFSfmFpfmpesl5+daGRoYGJkCVSbkZOxaf5OlYD17xeYNNxgbGG+wdjFyckgImEhMuPuO
 rYuRi0NIYAejxMEts6GcT4wSGz5+Y4ZwPjNK3N/1iwWmpf/tPXaIxC5GiSW7j7JAOD8YJWbv
 WgnkcHCwCWhJfF/ICNIgImAs0X92FlgDs8AXRon9s2aygSSEBawlbi1qAStiEVCVuL3gNiNI
 L6+Am8TunaIQy+Qkbp7rZIawT7FLnJ7tCWG7SFzd+psJwhaWeHV8CzuELSXxsr+NHWSMhEC5
 xKL5diBrJQQ6GCXWfDrLCFFjLDHrWTvYKmYBTYn1u/QhypUljtwCe5FZgE+i4/BfqCm8Eh1t
 QhCNyhLTL0+ABpykxMHX56AO85A43t8BdoCQQKzEkmnzmCYwys5CmL+AkXEVo1hqQXFuemqx
 UYEJchRtYgQnNi2PHYyz337QO8TIxMF4iFGCg1lJhFe3+ESCEG9KYmVValF+fFFpTmrxIUZT
 YGBNZJYSTc4Hpta8knhDUyMzMwNLUwtTMyMLJXFeDvZDCUIC6YklqdmpqQWpRTB9TBycUg1M
 ixXvSvc//biZu1Fb51MS2ymvxPk33pg5iZ/SfzK9t28io+2VhKZl2qGBRzSK/j2exNrhFMj8
 rjpcQflrVrFRsEly0g6Jd+ULl9k/tH3W6cM7Ndw6buLUJxf2nZYTiedu/+jyX/CwaIqT8BGn
 Sc+X/7W80Gq2a/uByB3bNH8rfdgmJzh37t6YW+bzRCZFePzw8rbsmeSRuvnKkSnV746k6K40
 L7dZMdVWr2T+89lBXZfe+y9pL1B6cCzf/UeVhpV39n3byW6bkr7riD58Utfq87ci0O/cNJdf
 V9pvL3Xa++/H1P4VXL+9jK3b1vBmrtp+6vLz2ytjv2tseSN7W/VdpcMX4YePdghf6I15XMBZ
 osRSnJFoqMVcVJwIAA1BYCv1AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprELMWRmVeSWpSXmKPExsWy7bCSvK7KwZMJBucniVtcuXiIyeLOgmlM
 Fs2L17NZNN3oYbW4vGsOm8Wu/3eZLDp39bNabPi+ltGBw2PD5yY2j52z7rJ7bFrVyeaxf+4a
 do99b5exefRtWcXosX7LVRaPz5vkAjiiuGxSUnMyy1KL9O0SuDJ2rb/JUrCevWLzhhuMDYw3
 WLsYOTkkBEwk+t/eY+9i5OIQEtjBKPG54w1UQlJi6dwb7BC2sMT9liOsEEXfGCXety0Dcjg4
 2AS0JL4vZASpEREwlug/OwtsELPAL0aJddNngDULC1hL3FrUAlbEIqAqcXvBbUaQXl4BN4nd
 O0Uh5stJ3DzXyTyBkWcBI8MqRsnUguLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzgYNPS2sG4
 Z9UHvUOMTByMhxglOJiVRHh1i08kCPGmJFZWpRblxxeV5qQWH2KU5mBREue90HUyXkggPbEk
 NTs1tSC1CCbLxMEp1cAkMLnd/I0ow2WBP6vniPccXpHQqvtSOHrLa8taXb5ZwXlGHH+1y+S2
 BadpsJj3CoSzqc8JO3nxyq8eUYVLQVXnHsYWd8/7VaWS0HVZqHrhXfZ+QW7hgPtOzS8Y9h/K
 9b5euWGZWP23Zq2eegeZoM7NSY/LA19nZO6M0PBS+LQ24rnwo5rP9hqOOXpxb7b3zZ4YdUXw
 zqy8af3CX8sObXgfd+q8wO42hhb53TPTs3as/NP+9fH6J/Zn+5c84nD7bnqv3lC6L/6Hacey
 brYJv56GxJ1ou7yvQj155zSn7s0nPiVIdco21O92vKkazPm/+trnrSeZP//0tBafo/hQrGXf
 LfnZAQZhN2VzL6TJpiqxFGckGmoxFxUnAgC02/pbpQIAAA==
X-CMS-MailID: 20210616091516epcas2p2111c9b941d0e60fb0a6ae9646fb80d26
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210616091516epcas2p2111c9b941d0e60fb0a6ae9646fb80d26
References: <CGME20210616091516epcas2p2111c9b941d0e60fb0a6ae9646fb80d26@epcas2p2.samsung.com>
X-Mailman-Approved-At: Thu, 17 Jun 2021 16:34:46 +0200
Cc: Lukasz Halman <lukasz.halman@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Daehwan Jung <dh10.jung@samsung.com>
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

It mislabels its 96 kHz altsetting and that's why it causes some noise

Signed-off-by: Daehwan Jung <dh10.jung@samsung.com>
---
 sound/usb/format.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 2287f8c..eb216fe 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -223,9 +223,11 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
 				continue;
 			/* C-Media CM6501 mislabels its 96 kHz altsetting */
 			/* Terratec Aureon 7.1 USB C-Media 6206, too */
+			/* Ozone Z90 USB C-Media, too */
 			if (rate == 48000 && nr_rates == 1 &&
 			    (chip->usb_id == USB_ID(0x0d8c, 0x0201) ||
 			     chip->usb_id == USB_ID(0x0d8c, 0x0102) ||
+			     chip->usb_id == USB_ID(0x0d8c, 0x0078) ||
 			     chip->usb_id == USB_ID(0x0ccd, 0x00b1)) &&
 			    fp->altsetting == 5 && fp->maxpacksize == 392)
 				rate = 96000;
-- 
2.7.4

