Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3473A254C4A
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 19:36:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1BAB1830;
	Thu, 27 Aug 2020 19:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1BAB1830
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598549813;
	bh=hXDyegF3OBnlvyi3lCWTfrDRSxC4lYOaCNgAQSkWQ94=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cgqQrPMsC8OcanXEH4b7gBOQkfJBxYYEgPU9N08LaiNhBuIpk8e4CGAEtS8rfTN38
	 RYB4KUf5rmnjgKobBMO8cX3DQ+EfcISPNfU75BPYp8ClOuAAoIyybl7rWwM9YP/GWo
	 223N/r6xB7dD/kf7I96gEf6wWaoWmoz4qQPsXBdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 952D6F80105;
	Thu, 27 Aug 2020 19:34:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4F53F8025A; Thu, 27 Aug 2020 19:34:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87F12F801D9
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 19:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87F12F801D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="PxYfTVtr"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200827173428euoutp02b68a01fb9325d69e34d7bb31004f1894~vMHQdbV9y2598725987euoutp02i
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 17:34:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200827173428euoutp02b68a01fb9325d69e34d7bb31004f1894~vMHQdbV9y2598725987euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598549668;
 bh=wFMLyUMElLYUTG35lzNQlKN/voBWwST2pPYptKilXs4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PxYfTVtrZyGO4DwmsGdluocOPuXdlG5cEJQPcsIrhxgeFBTf1FXNJCOpUB2s1kH66
 GzpZrBfQMiYDGYGeOmvRZuYLgAdPacHSy8MGIrLLO5iM0gsbFu3OpPjO5Mchnf4NJY
 MnB58OJo1oRht5aut9FshSIJbAPa4LuZ+NCZ+xHk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200827173427eucas1p1aabdd7d6624406b2d54e10b9b1cc4770~vMHQQlTUM2355023550eucas1p1T;
 Thu, 27 Aug 2020 17:34:27 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 41.1C.06456.3AEE74F5; Thu, 27
 Aug 2020 18:34:27 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200827173426eucas1p13f9f7d358dfcc440db160de3dc658ddf~vMHPbXoEN2355723557eucas1p1M;
 Thu, 27 Aug 2020 17:34:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200827173426eusmtrp1fd6176141ac3bed27fc1e0a9130388dd~vMHPavXXn1826418264eusmtrp1P;
 Thu, 27 Aug 2020 17:34:26 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-dd-5f47eea36d06
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 58.C6.06314.2AEE74F5; Thu, 27
 Aug 2020 18:34:26 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200827173426eusmtip112b67de1ca4586f3308c4e8bca11ebd5~vMHO7gs0W0514105141eusmtip1O;
 Thu, 27 Aug 2020 17:34:26 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, lgirdwood@gmail.com
Subject: [PATCH 2/2] ASoC: wm8994: Ensure the device is resumed in
 wm89xx_mic_detect functions
Date: Thu, 27 Aug 2020 19:33:57 +0200
Message-Id: <20200827173357.31891-2-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827173357.31891-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduzned3F79zjDT5f07W4cvEQk8XGGetZ
 LaY+fMJmcaV1E6PF+fMb2C2+Xelgsri8aw6bxdojd9ktPr/fz2px+E07qwOXx4bPTWweO2fd
 ZffYtKqTzWP6nP+MHn1bVjF6fN4kF8AWxWWTkpqTWZZapG+XwJXx8QpnwVS+iv2rGhgbGF9w
 dzFycEgImEg8vVTSxcjFISSwglGi9ctTti5GTiDnC6PExLkJEInPjBIfrk5kB0mANMy+f40R
 IrGcUeJ20z0muI5zU0xBbDYBQ4neo32MILaIgLbEnJsdbCANzAKdTBInJ18FmyQskCBx9vFV
 sGYWAVWJazMugzXwClhLfP50lA1im7zE6g0HmEFO5RSwkWj+BXaRhEA/u8TufzeYIWpcJF7f
 bWeBsIUlXh3fAnWpjMTpyT0sEA3NjBI9u2+zQzgTGCXuH1/ACFFlLXHn3C82kA3MApoS63fp
 Q8LFUeJLryiEySdx460gSDEzkDlp23RmiDCvREebEMQMFYnfq6YzQdhSEt1P/kNd4yFx/vhZ
 ZkhY9TNKND7pY5zAKD8LYdcCRsZVjOKppcW56anFhnmp5XrFibnFpXnpesn5uZsYgWnk9L/j
 n3Ywfr2UdIhRgINRiYd3xz73eCHWxLLiytxDjBIczEoivE5nT8cJ8aYkVlalFuXHF5XmpBYf
 YpTmYFES5zVe9DJWSCA9sSQ1OzW1ILUIJsvEwSnVwDgrhKM0Y+Hz7CcRgV4SDSmlAroB1RuE
 +ZJddQ2ybvw8WC04Q3X/NIUJ090V3Q6myxusbFu1gcE9d3tLZ5Of6ccMz+9Mi4M/1k6+mXdf
 8p2GnUlwGr/OCUk77yOh+usyYidMCH4enhcluP3NHLl3cy/duxwoYt2k43SxbP2M8O2pM/8r
 v5ybrcRSnJFoqMVcVJwIAPQ5EdUfAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPLMWRmVeSWpSXmKPExsVy+t/xu7qL3rnHG5z5bWhx5eIhJouNM9az
 Wkx9+ITN4krrJkaL8+c3sFt8u9LBZHF51xw2i7VH7rJbfH6/n9Xi8Jt2Vgcujw2fm9g8ds66
 y+6xaVUnm8f0Of8ZPfq2rGL0+LxJLoAtSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DY
 PNbKyFRJ384mJTUnsyy1SN8uQS/j4xXOgql8FftXNTA2ML7g7mLk5JAQMJGYff8aYxcjF4eQ
 wFJGiclHljJ1MXIAJaQk5rcoQdQIS/y51sUGUfOJUeLA7DssIAk2AUOJ3qN9jCC2iICuxK2l
 x5hBipgFJjJJbHp4nQkkISwQJ/H12CewBhYBVYlrMy6DNfAKWEt8/nSUDWKDvMTqDQeYQRZz
 CthINP9KAAkLAZVceniedQIj3wJGhlWMIqmlxbnpucWGesWJucWleel6yfm5mxiBgb3t2M/N
 OxgvbQw+xCjAwajEw7tjn3u8EGtiWXFl7iFGCQ5mJRFep7On44R4UxIrq1KL8uOLSnNSiw8x
 mgLdNJFZSjQ5Hxh1eSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUa
 GPN0/i7sZbrjYR/2aomZ546ipP64M4evBsTdZso4+GzB0sCq27LGxWK8eqw6Wv82BnJY379h
 6L/DaPVX219T1szulU4SLO1jj38ZGOtgf+BoXE++tffEbgWduylrS0sT2N28V86PXxpZIm/M
 NW3vZZZe4ZN/mzOXSkr/agwTUjQq7pMxDkpVYinOSDTUYi4qTgQAW1DUhoICAAA=
X-CMS-MailID: 20200827173426eucas1p13f9f7d358dfcc440db160de3dc658ddf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200827173426eucas1p13f9f7d358dfcc440db160de3dc658ddf
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200827173426eucas1p13f9f7d358dfcc440db160de3dc658ddf
References: <20200827173357.31891-1-s.nawrocki@samsung.com>
 <CGME20200827173426eucas1p13f9f7d358dfcc440db160de3dc658ddf@eucas1p1.samsung.com>
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 m.szyprowski@samsung.com
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

When the wm8958_mic_detect, wm8994_mic_detect functions get called from
the machine driver, e.g. from the card's late_probe() callback, the CODEC
device may be PM runtime suspended and any regmap writes have no effect.
Add PM runtime calls to these functions to ensure the device registers
are updated as expected.
This suppresses an error during boot
"wm8994-codec: ASoC: error at snd_soc_component_update_bits on wm8994-codec"
caused by the regmap access error due to the cache_only flag being set.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/codecs/wm8994.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index b3ba053..fc9ea19 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -3514,6 +3514,8 @@ int wm8994_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
 		return -EINVAL;
 	}
 
+	pm_runtime_get_sync(component->dev);
+
 	switch (micbias) {
 	case 1:
 		micdet = &wm8994->micdet[0];
@@ -3561,6 +3563,8 @@ int wm8994_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
 
 	snd_soc_dapm_sync(dapm);
 
+	pm_runtime_put(component->dev);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(wm8994_mic_detect);
@@ -3932,6 +3936,8 @@ int wm8958_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
 		return -EINVAL;
 	}
 
+	pm_runtime_get_sync(component->dev);
+
 	if (jack) {
 		snd_soc_dapm_force_enable_pin(dapm, "CLK_SYS");
 		snd_soc_dapm_sync(dapm);
@@ -4000,6 +4006,8 @@ int wm8958_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
 		snd_soc_dapm_sync(dapm);
 	}
 
+	pm_runtime_put(component->dev);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(wm8958_mic_detect);
-- 
2.7.4

