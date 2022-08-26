Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 032D65A1F7A
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Aug 2022 05:36:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82B10162F;
	Fri, 26 Aug 2022 05:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82B10162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661485012;
	bh=CaDZy99I3VvxnrqDtLGfE3w/OVO7KOBgz8Z4MKiVCb8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jydD3XZ1AeZfDrhvUX4vBU3NYxYtMq0SIUxA1ZoH1wEZMJRwCDy5By2jhuVvtVWR/
	 qiXSMSYjXgliwfUImZrDVZOxLEzs+OjYiPUD3Lc0Dho6DxGpxMAuGKDjDwY4Pz6RTy
	 d8pDmrxgDScYLsnUwPx7TTZr1h9XhO+3RsPWGyHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF905F8032D;
	Fri, 26 Aug 2022 05:35:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EF19F80134; Fri, 26 Aug 2022 05:35:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_ZEN_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B699EF80134
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 05:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B699EF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="ErudUJeo"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="k7jTPLkA"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 048F53200A5A;
 Thu, 25 Aug 2022 23:35:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 25 Aug 2022 23:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1661484935; x=
 1661571335; bh=ml0QXgJ11ruYlZ5YBTcNNwBdbFxRHL+i328CjCLIyDQ=; b=E
 rudUJeoAWxjsiGudYFg/YqyOI1UcDJYDuAlZvPjSs/8nnR+3qtXp0cqbzV5QjLgY
 6Bn/1zavNXJegVdtEWVuBt5Hhe2DU6xpmkiOmkCynMN/zIr55nh51mANZBC6cxFe
 0MVugqYnZRc4aDAVy1+hiapL4FfN2ShEzvK1tMG3z3ma1ZZSW3HPG8BExmtZ86Ly
 EdAlJpVJrW22Wr9WzFj+XTNNLt7nUzO2FlbpUvxscxdOXDyyHXO3dRHfV3W+ESwf
 v3MVVREIx3lRwbo9KYHTw0rX+bItIR9CLZTqpffcAsACXeXXd4zuPJIHAPM75275
 osI3e2wyd4XuK1yMCqAjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661484935; x=
 1661571335; bh=ml0QXgJ11ruYlZ5YBTcNNwBdbFxRHL+i328CjCLIyDQ=; b=k
 7jTPLkA1GPCOeTF315UggtQcrak/RA7HRfKj+M6s5YwS0fVDo9M9Q33hGbASCCV2
 pWPdtYOabfbGXyzBZ3rNGZWXiRSKpYtOVT8y0Q7IKFBghFlLNb7wYmI0bdudixRZ
 opE4/iC5qfes23b2iSGKs8z6rqND+EVLi7Nk7NGkfWX0M7uGvWdilr/3+/Jtez0z
 Leo0hDndSftiUlEACjaHJpIFjjB6hcheWukJqMK5+MR3E6Dfn8oPOfRFEEZuHq3j
 Ls7af1+rMsfC9s1UX8pBI31ogw7+ZlI7gv4wXNpDYs4wd4bKnqvxxV6esvn/KdPk
 dSbTzH5NEkHeENDstf6DA==
X-ME-Sender: <xms:hj8IYx2jLPdY01J7fBuycr5CoyzUqALP10wfY_IIyLHQTyQguABCqA>
 <xme:hj8IY4GdPyXCaPniZoMYyM8pchTQVUpK69fBuDVKBS8SQpotv1UsNpUCw7q6O_Cn0
 forb8BBejgGwVQexg>
X-ME-Received: <xmr:hj8IYx5O5AutYUSEanpcTm5aA-16d5lnWIBmxVj-kpe4Rwn-5PXIqUUDxC62guVCWOxHwuG-Fgp7_QhduUs7DqEoNishu6bI4fOzhRblWInADF1DXHG6ENV4TA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgedgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfevfhfhkffffgggjggtgfesth
 ekredttdefjeenucfhrhhomhepufgrmhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghl
 sehshhholhhlrghnugdrohhrgheqnecuggftrfgrthhtvghrnhepleeiheeggedtieeugf
 effffhvdelkefgheetheehffevteffheejiefgffehtdehnecuffhomhgrihhnpehlihhn
 uhigqdhsuhhngihirdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:hj8IY-2i73q8zn_wt-Wb1Fo896455wFu9JfcSCTIfmE3uBJX8l-oiw>
 <xmx:hj8IY0ERKZmBwqX01GbY0q0TRKDeBeAlb7Y2J7mbr59ShiDrYa24kA>
 <xmx:hj8IY_9az-L6uVcr5r_l7GXpQ7pn_CysvjFBHD77q7zbA-_TGhfF6Q>
 <xmx:hz8IY_BYl-btqlxHbQ0yed6dZqtz2hFG1a_oIkzCxsnQAc85N_gPgA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 23:35:34 -0400 (EDT)
Subject: Re: [PATCH v8 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
To: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
References: <1660229343-14133-1-git-send-email-fengzheng923@gmail.com>
 <3fb9adb7-96ef-c85e-069d-ef7f7ff09bc3@sholland.org>
 <CAE=m618gz8mzRnvX-w6fpNmTc=5Bd0KTKeR1NvpNZkbj29=ayg@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <b36262df-9324-6cd3-b74c-5b93840dabb0@sholland.org>
Date: Thu, 25 Aug 2022 22:35:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAE=m618gz8mzRnvX-w6fpNmTc=5Bd0KTKeR1NvpNZkbj29=ayg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 jernej.skrabec@gmail.com, lgirdwood@gmail.com, wens@csie.org,
 broonie@kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
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

On 8/23/22 10:08 AM, 班涛 wrote:
> Samuel Holland <samuel@sholland.org> 于2022年8月20 日周六 14:57写道：
>     On 8/11/22 9:49 AM, Ban Tao wrote:
>     > +     switch (params_format(params)) {
>     > +     case SNDRV_PCM_FORMAT_S16_LE:
>     > +             regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
>     > +                                SUN50I_DMIC_RXFIFO_CTL_SAMPLE_MASK,
>     > +                                SUN50I_DMIC_RXFIFO_CTL_SAMPLE_16);
>     > +             break;
>     > +     case SNDRV_PCM_FORMAT_S24_LE:
>     > +             regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
>     > +                                SUN50I_DMIC_RXFIFO_CTL_SAMPLE_MASK,
>     > +                                SUN50I_DMIC_RXFIFO_CTL_SAMPLE_24);
>     > +             break;
>     > +     default:
>     > +             dev_err(cpu_dai->dev, "Invalid format!\n");
>     > +             return -EINVAL;
>     > +     }
>     > +     regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
>     > +                        SUN50I_DMIC_RXFIFO_CTL_MODE_MASK,
>     > +                        SUN50I_DMIC_RXFIFO_CTL_MODE_MSB);
> 
>     I checked the manuals again, and I may have given you bad information. There
>     appear to be two variants of the DMIC hardware.
> 
>     A63, H6, V5 V100, and V5x6 manuals list Mode 1 as "reserved" for a 24-bit sample
>     resolution. The newer SoCs (A50, A133, D1, H616, and R329) describe Mode 1 as
>     extending the 21-bit sample with three zeros at the LSB to make 24 bits, which
>     is what we want.
> 
>     On my D1 board, recording in S24_LE gives me good audio data, with equivalent
>     loudness to S16_LE, as I would expect. If this also works on older SoCs like H6,
>     then the manual is wrong, and the driver is fine.
> 
>  
> I checked the H6 manual, DMIC also supports 24bits. The H6 SoC works fine in
> mode 1. I don't know where your manual came from, mine is provided by SUNXI. 

I am referencing the manual linked from the linux-sunxi wiki, section 7.4.5.7:

https://linux-sunxi.org/images/4/46/Allwinner_H6_V200_User_Manual_V1.1.pdf

    For 24-bit received audio sample:
    Mode 0: RXDATA[31:0] = {FIFO_O[23:0], 8'h0}
    Mode 1: Reserved

Since the manual is wrong, could you please add a comment? Something like "The
hardware supports FIFO mode 1 for 24-bit samples, even though the H6 manual
describes that combination as reserved."

Regards,
Samuel
