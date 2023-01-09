Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E90661DB7
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 05:18:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9B66C679;
	Mon,  9 Jan 2023 05:17:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9B66C679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673237882;
	bh=2FtVa5TyE/q/J+S/fU+BRQaEv54QifKeLT/4sgo3n2Q=;
	h=From:To:In-Reply-To:Subject:Date:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UgY1J2Hsu09X7M4Doz8IprJgnwY1Yns0PORHiXaw3MTkLjdUwgADl3tubcDa4/zUY
	 tCbJ7C2i4B89Y77uBemnXPkE+tIHeW8moWbZYkaGwudZGcpFaiWOcx3Pplgqj/2V3I
	 wNnxs/rliD9uO2VqOKN82vWRlqK7pCMJfrKkjUtE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7183EF802BE;
	Mon,  9 Jan 2023 05:17:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13B67F8051B; Mon,  9 Jan 2023 05:17:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C157F8026A
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 05:16:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C157F8026A
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=ugXnzC9R
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230109041648epoutp04e4d709b4d458ed7c24f3ffe1bc03cbd1~4iOviDkjm0876708767epoutp045
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 04:16:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230109041648epoutp04e4d709b4d458ed7c24f3ffe1bc03cbd1~4iOviDkjm0876708767epoutp045
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673237808;
 bh=Ax9O8cKXzHuNVBIDg1Fb4s9IzcqY1lRHCGTbSUo03iQ=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=ugXnzC9RCDuhZpIXIRgb0mPEvH0aibXyJIvQ65CPMSq2pMWJJPVtoUy5dIYjjGR/M
 KiCbpnxG/llfcupjTb6CAqyyWX2rF6JglftlLqKcPGleTIH2PAKC9tcTDUJTgweo9D
 GKLQmb1x/nQCryvb5AO+mm3ZKBoiHMN/VdnT+SwM=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20230109041647epcas5p252a7975f102ffce293dec07cfa2ccce8~4iOvLO66Y0284902849epcas5p2f;
 Mon,  9 Jan 2023 04:16:47 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.181]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Nr0y61F8Vz4x9Q0; Mon,  9 Jan
 2023 04:16:46 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 49.ED.62806.E259BB36; Mon,  9 Jan 2023 13:16:46 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20230109040507epcas5p2167a131e17ae5a150a6fe8e05d6423a3~4iEjGBunP3139431394epcas5p2Y;
 Mon,  9 Jan 2023 04:05:07 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230109040507epsmtrp2f84b24366a74b2dd6814e746941db69d~4iEjFO4oc1649316493epsmtrp2d;
 Mon,  9 Jan 2023 04:05:07 +0000 (GMT)
X-AuditID: b6c32a4a-c43ff7000000f556-fb-63bb952edba7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F1.99.02211.3729BB36; Mon,  9 Jan 2023 13:05:07 +0900 (KST)
Received: from FDSFTE070 (unknown [107.116.189.86]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20230109040505epsmtip18b808bb769fcf31e9241ddd28aa07e7f~4iEgx7QHD0550005500epsmtip1L;
 Mon,  9 Jan 2023 04:05:05 +0000 (GMT)
From: "Padmanabhan Rajanbabu" <p.rajanbabu@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <s.nawrocki@samsung.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <pankaj.dubey@samsung.com>,
 <alim.akhtar@samsung.com>, <rcsekar@samsung.com>, <aswani.reddy@samsung.com>
In-Reply-To: <0cb682bd-7f1b-009d-6f1a-1a5a46366fe8@linaro.org>
Subject: RE: [PATCH v2 2/5] ASoC: samsung: i2s: add support for FSD I2S
Date: Mon, 9 Jan 2023 09:34:49 +0530
Message-ID: <050e01d923df$8f487570$add96050$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH5OglsonJNs2LrkABkwml8apZdSgJ8yZQdARjupoEBqi6poa4rQ3pQ
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJJsWRmVeSWpSXmKPExsWy7bCmpq7e1N3JBhc/sls8mLeNzeLKxUNM
 Foc2b2W3mPrwCZvF/CPnWC36Xjxkttj7Gij27UoHk8XlXXPYLGac38dksWjrF3aLzl39rBaz
 LuxgtWjde4Td4vCbdlaLDd/XMjoIeGz43MTmsXPWXXaPTas62TzuXNvD5rHv7TI2j74tqxg9
 1m+5yuLxeZNcAEdUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKL
 T4CuW2YO0AtKCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnAKTAr3ixNzi0rx0vbzU
 EitDAwMjU6DChOyMV7vesxS8VK24vGYeSwPjVbkuRk4OCQETiYYfpxi7GLk4hAR2M0pc2Pue
 HcL5xCgxv/8HE4TzjVFi5ZFWdpiWVwfXQ1XtBWrZ9J0VwnnBKHHyTCsLSBWbgLnEor1LwQaL
 CFxhkvi5up0FxGEWaGOU2HtxLSNIFaeAnUT/zYdsILawgLvEv+lXwLpZBFQkLjRvBavhFbCU
 WHh6JhOELShxcuYTsBpmAXmJ7W/nMEPcpCDx8+kyVhBbRMAN6KRlUDXiEkd/9kDVfOCQ6J2r
 AGG7SOzft5oJwhaWeHV8C9RvUhKf3+1lg7DzJaZ9bIayKyTaPm6AqreXOHBlDtB8DqD5mhLr
 d+lDhGUlpp5axwSxlk+i9/cTqHJeiR3zYGxVifXLNzFC2NIS+67vZZzAqDQLyWezkHw2C8kH
 sxC2LWBkWcUomVpQnJueWmxaYJSXWg6P8uT83E2M4DSu5bWD8eGDD3qHGJk4GA8xSnAwK4nw
 lm7alSzEm5JYWZValB9fVJqTWnyI0RQY3BOZpUST84GZJK8k3tDE0sDEzMzMxNLYzFBJnDd1
 6/xkIYH0xJLU7NTUgtQimD4mDk6pBqYtm6KalL3vnRUPzv9YbXRoo+LmNU+/XWj9+NvsZ5K+
 zYcrtZozmHcv5BDQuSReFZXrUJbld0FVhyv8tornoS0VzrU7HDNF9iVu5ytQ48z/92Jx1b7m
 r1fONH2z/y/8r/DLBJOLEwRFsuY/XH/nRfqViAv/4+K3bn2SvOuSbWexSE6kf7l0RovvdLW/
 WYcFT/p/ZHtgmBJ7/MSK+toDkXXFrRWr0l4trD/KGLN204mzHpH+p7TP96q/zL17N6aN63Pc
 1p1Wj5Z+45yU3z3pwss3FqtsPbbrL1SaunSudLlGws/t72ZmHP7db2kZvd1+5QvrSU0XtS0d
 dbpiL5+8PnttYvtPfeZHgdknKm7JvO5VYinOSDTUYi4qTgQArQaYP2wEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsWy7bCSnG7xpN3JBs8OK1k8mLeNzeLKxUNM
 Foc2b2W3mPrwCZvF/CPnWC36Xjxkttj7Gij27UoHk8XlXXPYLGac38dksWjrF3aLzl39rBaz
 LuxgtWjde4Td4vCbdlaLDd/XMjoIeGz43MTmsXPWXXaPTas62TzuXNvD5rHv7TI2j74tqxg9
 1m+5yuLxeZNcAEcUl01Kak5mWWqRvl0CV8arXe9ZCl6qVlxeM4+lgfGqXBcjJ4eEgInEq4Pr
 2bsYuTiEBHYzSsy63sEEkZCWmN6/hw3CFpZY+e85VNEzRokjx1aygyTYBMwlFu1dygiSEBF4
 xCQxd/4jNhCHWaCLUeL435XMEC2fGSW23T7IDNLCKWAn0X/zIdhcYQF3iX/Tr7CA2CwCKhIX
 mrcygti8ApYSC0/PZIKwBSVOznwCVsMsoC3R+7CVEcKWl9j+dg4zxH0KEj+fLmMFsUUE3CQu
 bFoGVS8ucfRnD/MERuFZSEbNQjJqFpJRs5C0LGBkWcUomVpQnJueW2xYYJiXWq5XnJhbXJqX
 rpecn7uJERzNWpo7GLev+qB3iJGJg/EQowQHs5IIb+mmXclCvCmJlVWpRfnxRaU5qcWHGKU5
 WJTEeS90nYwXEkhPLEnNTk0tSC2CyTJxcEo1MAklzV+k49bq9ufxrpbje7I0Pf5ztFSteekd
 tvXLup3x6keFCy2v9X4+lyJQ/vybQcLPTV+XG0xprq98cNfatStcLrTN9nJ30PoQk3ye7zEu
 BzWf+DpO+r/MVvB6LW/a0rs5+97lTO71eWj73eD7ZSU/6+hdh1v1H0/ou2ayTjXsxP3yA2/0
 eIv3H3+q++cG76vjxqsdd4j1q/w8/Hazc4/ui0/W3g0xn2oXGkft9GarU4r8OilM41mvV+/l
 2lecjFwXLzw+J9368Z76mzL/zQrfxLuT1+RZFJqE7105W6Lq0yunqx0XTyo4OOuEepzR3NVn
 ObFGYB3PBZ+n/65NeTFP7VWDfcTmFVXSJa6inEosxRmJhlrMRcWJALq3VuVVAwAA
X-CMS-MailID: 20230109040507epcas5p2167a131e17ae5a150a6fe8e05d6423a3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230103045655epcas5p1af06a83208190c471e8cd891ef4760f3
References: <20230103045613.100309-1-p.rajanbabu@samsung.com>
 <CGME20230103045655epcas5p1af06a83208190c471e8cd891ef4760f3@epcas5p1.samsung.com>
 <20230103045613.100309-3-p.rajanbabu@samsung.com>
 <0cb682bd-7f1b-009d-6f1a-1a5a46366fe8@linaro.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
> Sent: 03 January 2023 04:39 PM
> To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>;
> lgirdwood@gmail.com; broonie@kernel.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; s.nawrocki@samsung.com;
> perex@perex.cz; tiwai@suse.com; pankaj.dubey@samsung.com;
> alim.akhtar@samsung.com; rcsekar@samsung.com;
> aswani.reddy@samsung.com
> Cc: alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org
> Subject: Re: [PATCH v2 2/5] ASoC: samsung: i2s: add support for FSD I2S
> 
> On 03/01/2023 05:56, Padmanabhan Rajanbabu wrote:
> > Add support for enabling I2S controller on FSD platform.
> >
> > FSD I2S controller is based on Exynos7 I2S controller, supporting 2CH
> > playback/capture in I2S mode and 7.1CH playback/capture in TDM mode.
> >
> > Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> > ---
> >  sound/soc/samsung/i2s-regs.h |  1 +
> >  sound/soc/samsung/i2s.c      | 57
> ++++++++++++++++++++++++++++++++++++
> >  2 files changed, 58 insertions(+)
> >
> > diff --git a/sound/soc/samsung/i2s-regs.h
> > b/sound/soc/samsung/i2s-regs.h index b4b5d6053503..4444c857d0c0
> 100644
> > --- a/sound/soc/samsung/i2s-regs.h
> > +++ b/sound/soc/samsung/i2s-regs.h
> > @@ -132,6 +132,7 @@
> >  #define EXYNOS7_MOD_RCLK_192FS	7
> >
> >  #define PSR_PSREN		(1 << 15)
> > +#define PSR_PSVAL(x)		(((x - 1) << 8) & 0x3f00)
> >
> >  #define FIC_TX2COUNT(x)		(((x) >>  24) & 0xf)
> >  #define FIC_TX1COUNT(x)		(((x) >>  16) & 0xf)
> > diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c index
> > 9505200f3d11..dcb5c438cb2f 100644
> > --- a/sound/soc/samsung/i2s.c
> > +++ b/sound/soc/samsung/i2s.c
> > @@ -50,6 +50,10 @@ struct samsung_i2s_dai_data {
> >  	u32 quirks;
> >  	unsigned int pcm_rates;
> >  	const struct samsung_i2s_variant_regs *i2s_variant_regs;
> > +	void (*fixup_early)(struct snd_pcm_substream *substream,
> > +					struct snd_soc_dai *dai);
> > +	void (*fixup_late)(struct snd_pcm_substream *substream,
> > +					struct snd_soc_dai *dai);
> >  };
> >
> >  struct i2s_dai {
> > @@ -111,6 +115,10 @@ struct samsung_i2s_priv {
> >  	u32 suspend_i2spsr;
> >
> >  	const struct samsung_i2s_variant_regs *variant_regs;
> > +	void (*fixup_early)(struct snd_pcm_substream *substream,
> > +						struct snd_soc_dai *dai);
> > +	void (*fixup_late)(struct snd_pcm_substream *substream,
> > +						struct snd_soc_dai *dai);
> >  	u32 quirks;
> >
> >  	/* The clock provider's data */
> > @@ -940,6 +948,10 @@ static int i2s_trigger(struct snd_pcm_substream
> *substream,
> >  	case SNDRV_PCM_TRIGGER_RESUME:
> >  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> >  		pm_runtime_get_sync(dai->dev);
> > +
> > +		if (priv->fixup_early)
> > +			priv->fixup_early(substream, dai);
> > +
> >  		spin_lock_irqsave(&priv->lock, flags);
> >
> >  		if (config_setup(i2s)) {
> > @@ -947,6 +959,13 @@ static int i2s_trigger(struct snd_pcm_substream
> *substream,
> >  			return -EINVAL;
> >  		}
> >
> 
> Except several warnings this patch generates, this is a bit surprising:
> 
> > +		spin_unlock_irqrestore(&priv->lock, flags);
> 
> You have critical section which you now break into two. You cannot do this
> usually. How the synchronization is now kept?
> 

The actual reason behind breaking the critical section is to allow the use
of already existing functions related to configuration of CDCLK and OPCLK
source.

Based on the review comments from previous patch-set related to the actual
need of custom sound card driver, we did migrate to simple-card, where
Exynos specific configurations like RCLKSRC selection, OPCLK and CDCLK
configuration is not being handled by the simple-card. To overcome this
scenario, fixups has been added during i2s_trigger to let Exynos users to
configure the Exynos I2S specific dividers and mux.

Rather than re-implementing the routines (or) configurations already
Available in the driver, the fixup functions can call the i2s_set_sysclk
and similar functions directly (which also takes the spin lock).

But we noticed that fixup_late implemented for FSD may not require
releasing of spinlock as it involves PSR configuration and will not cause
any harm if it is still kept inside the existing critical section only. I'll
update the patch to keep the fixup_late inside critical section and
will post the same in the next patch set.

> > +
> > +		if (priv->fixup_late)
> > +			priv->fixup_late(substream, dai);
> > +
> > +		spin_lock_irqsave(&priv->lock, flags);
> > +
> >  		if (capture)
> >  			i2s_rxctrl(i2s, 1);
> >  		else
> 
> Best regards,
> Krzysztof

Thanks,
Padmanabhan R.


