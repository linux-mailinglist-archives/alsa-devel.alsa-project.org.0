Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B715A26D47B
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 09:19:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 420131671;
	Thu, 17 Sep 2020 09:18:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 420131671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600327186;
	bh=Ttg6gqmoBY/BtZM2f5WWrV6NL6deYD1N4rgwBMOckEU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kc4uUPz+cxJpGdqHnU8aB8uWZGjyM1BvCPBby3p/fNd+2CeFvV2OycD4SlXO90Jos
	 uuD3W9YW/NWDGDZaZ+rtpV2VzFCnMETFgJlnzAYBMbYklDtVHvykN5XgvRjZrg5mEw
	 hbVzF8H3a99TLcHe/OMWI8qi+bWiUEdNHBcPo9yg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 439DBF8013A;
	Thu, 17 Sep 2020 09:18:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 725F4F80212; Thu, 17 Sep 2020 09:18:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5C01F80134
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 09:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5C01F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kfSDwjK/"
Received: by mail-pl1-x643.google.com with SMTP id j7so634980plk.11
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 00:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=elJEb2l35w0tALnlBgQjk/9l2iBwh6a2tE1YVDZoSvk=;
 b=kfSDwjK/583sxlPWBU4K30L6qY5yFOHg4TaP/g2kKTHVrbUMxPsSo3cr0oNyd9kK/I
 n6Vsy1v7d/rgMZQrlIWuK1z3+RZOa/gSSCG7sYeMKhkJT2JQvSzqbc2e3raCr0dOVN39
 XKMDGl9vfQOTodpBHV1eD8EgozdndmaBbqOAdPaW/2wFZ/f37Bo0XjiDqxgvhN8ddvjp
 KfHvl91euVMXY62y1FCqAbvCidWS9MdrG3Y6DHzHbR8EOFMHVg964SXT9ELd/KN5nttG
 mHb47XyEK+kpFNYeCiT/8Q1sRDO+I1EIjMyYurStOuDBW3epttxcwxSpXCDTkUJOH4lp
 mVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=elJEb2l35w0tALnlBgQjk/9l2iBwh6a2tE1YVDZoSvk=;
 b=bM1smbE66eKXxpZHlZrLXvjabTPob56BBwH/uNpRc+HaSdueVLBnGZwsA0hUfXUcv4
 78gF6tbVdI9p7KwS+cHJVAhRUUzxx8Dm4JhZ3v5/5igXk5KgZsUOFBuIGXypD3DZAN6L
 HyyUVieQ2mo30pr/mFnuUr0c9qmuu8lt83c4etglgRgFa9rAkkqVcKIlxX4lo8e2xtla
 ntKNyHK8n6JhstZ2IU1Q0weAcmeAI/5mjbYHCDbOh5SvEyVTJIEpeX/nmK3JhwNfFnZr
 Bzi1vnLqSpwSQtB9ZNbzkmxd3lhF7qb6ieEG4oaOHLF1OFcBszunWp6v4VHnGJE5m+2N
 HXLw==
X-Gm-Message-State: AOAM5333pxgjn+tyL4BHekjdfupusCxO4pNfhvvcCtMNmWw3tCi3cO4O
 ffxBn6g3W9usvglsY+8n7vQ=
X-Google-Smtp-Source: ABdhPJyA7geCwMU1Brnj82CuOczTA8QY77ieRbYd6gK//+zTtaFvTP+ByLJcIbfYjqJna5Bxk8PXBg==
X-Received: by 2002:a17:90a:6a4e:: with SMTP id
 d14mr6885754pjm.63.1600327067650; 
 Thu, 17 Sep 2020 00:17:47 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 72sm18958272pfx.79.2020.09.17.00.17.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Sep 2020 00:17:47 -0700 (PDT)
Date: Thu, 17 Sep 2020 00:14:31 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Message-ID: <20200917071431.GA17970@Asurada-Nvidia>
References: <1600247876-8013-1-git-send-email-viorel.suman@oss.nxp.com>
 <1600247876-8013-2-git-send-email-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600247876-8013-2-git-send-email-viorel.suman@oss.nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Viorel Suman <viorel.suman@nxp.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Viorel Suman <viorel.suman@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
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

Hi Viorel,

It looks pretty clean to me, though some small comments inline.

On Wed, Sep 16, 2020 at 12:17:55PM +0300, Viorel Suman (OSS) wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> XCVR (Audio Transceiver) is a on-chip functional module found
> on i.MX8MP. It support HDMI2.1 eARC, HDMI1.4 ARC and SPDIF.
> 
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>

> +static const u32 fsl_xcvr_earc_channels[] = { 1, 2, 8, 16, 32, }; /* one bit 6, 12 ? */

What's the meaning of the comments?

> +static const int fsl_xcvr_phy_arc_cfg[] = {
> +	FSL_XCVR_PHY_CTRL_ARC_MODE_SE_EN, FSL_XCVR_PHY_CTRL_ARC_MODE_CM_EN,
> +};

Nit: better be u32 vs. int?

> +/** phy: true => phy, false => pll */
> +static int fsl_xcvr_ai_write(struct fsl_xcvr *xcvr, u8 reg, u32 data, bool phy)
> +{
> +	u32 val, idx, tidx;
> +
> +	idx  = BIT(phy ? 26 : 24);
> +	tidx = BIT(phy ? 27 : 25);
> +
> +	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_CLR, 0xFF);
> +	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_SET, reg);
> +	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_WDATA, data);
> +	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_TOG, idx);
> +
> +	do {
> +		regmap_read(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL, &val);
> +	} while ((val & idx) != ((val & tidx) >> 1));

Might regmap_read_poll_timeout() be better? And it seems to poll
intentionally with no sleep nor timeout -- would be nice to have
a line of comments to explain why.

> > +static int fsl_xcvr_runtime_resume(struct device *dev)
> +{
> +	struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(xcvr->ipg_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to start IPG clock.\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(xcvr->pll_ipg_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to start PLL IPG clock.\n");

Should it disable ipg_clk?

> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(xcvr->phy_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to start PHY clock: %d\n", ret);
> +		clk_disable_unprepare(xcvr->ipg_clk);

Should it disable pll_ipg_clk?

> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(xcvr->spba_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to start SPBA clock.\n");
> +		clk_disable_unprepare(xcvr->phy_clk);
> +		clk_disable_unprepare(xcvr->ipg_clk);

Ditto

> +		return ret;
> +	}
> +
> +	regcache_cache_only(xcvr->regmap, false);
> +	regcache_mark_dirty(xcvr->regmap);
> +	ret = regcache_sync(xcvr->regmap);
> +
> +	if (ret) {
> +		dev_err(dev, "failed to sync regcache.\n");
> +		return ret;

What about those clocks? Probably better to have some error-out
labels at the end of the function?

> +	}
> +
> +	reset_control_assert(xcvr->reset);
> +	reset_control_deassert(xcvr->reset);
> +
> +	ret = fsl_xcvr_load_firmware(xcvr);
> +	if (ret) {
> +		dev_err(dev, "failed to load firmware.\n");
> +		return ret;

Ditto

> +	}
> +
> +	/* Release M0+ reset */
> +	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
> +				 FSL_XCVR_EXT_CTRL_CORE_RESET, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "M0+ core release failed: %d\n", ret);
> +		return ret;

Ditto

> +	}
> +	mdelay(50);

Any reason to use mdelay over msleep for a 50ms wait? May add a
line of comments if mdelay is a must?
