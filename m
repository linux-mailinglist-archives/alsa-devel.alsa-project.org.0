Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B881F3F4A47
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 14:04:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 423EC1612;
	Mon, 23 Aug 2021 14:04:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 423EC1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629720299;
	bh=terlll4LStq5ZyhhhiXW4QAZbbR6J+dHGQVA0DZstGs=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xdt0ixg+wsvbUs/7Rs/iXEr6NteyfjZh6EbIBQguI1CyJ5PN2MSzZPBesYevZo6UQ
	 IWKq2vFCdhDXDeDbA+ZoKqzA7VylrFrhhDuf1k69LoO1XojCjDcwyA6xEzDri1qelM
	 MM/RpVl/P2jM30mmS+PSOXi9SIrkjmNgVm0iwDLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A86DEF8016E;
	Mon, 23 Aug 2021 14:03:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2620F80217; Mon, 23 Aug 2021 14:03:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40495F800E7
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 14:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40495F800E7
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mI8fm-0002zi-Gm; Mon, 23 Aug 2021 14:03:26 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mI8fl-0007z7-8e; Mon, 23 Aug 2021 14:03:25 +0200
Message-ID: <6bc6330215980f10853a2dac69f0bdfd9c8fb303.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/4] ASoC: rockchip: add support for i2s-tdm controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Heiko Stuebner
 <heiko@sntech.de>
Date: Mon, 23 Aug 2021 14:03:25 +0200
In-Reply-To: <20210820182731.29370-2-frattaroli.nicolas@gmail.com>
References: <20210820182731.29370-1-frattaroli.nicolas@gmail.com>
 <20210820182731.29370-2-frattaroli.nicolas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hi Nicolas,

On Fri, 2021-08-20 at 20:27 +0200, Nicolas Frattaroli wrote:
[...]
> diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/r=
ockchip_i2s_tdm.c
> new file mode 100644
> index 000000000000..c02b66f3c913
> --- /dev/null
> +++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
> @@ -0,0 +1,1737 @@
[...]
> +static void rockchip_snd_xfer_reset_assert(struct rk_i2s_tdm_dev *i2s_td=
m,
> +					   int tx_bank, int tx_offset,
> +					   int rx_bank, int rx_offset)
> +{
> +	void __iomem *cru_reset;
> +	unsigned long flags;
> +
> +	cru_reset =3D i2s_tdm->cru_base + i2s_tdm->soc_data->softrst_offset;
> +
> +	if (tx_bank =3D=3D rx_bank) {
> +		writel(BIT(tx_offset) | BIT(rx_offset) |
> +		       (BIT(tx_offset) << 16) | (BIT(rx_offset) << 16),
> +		       cru_reset + (tx_bank * 4));
> +	} else {
> +		local_irq_save(flags);
> +		writel(BIT(tx_offset) | (BIT(tx_offset) << 16),
> +		       cru_reset + (tx_bank * 4));
> +		writel(BIT(rx_offset) | (BIT(rx_offset) << 16),
> +		       cru_reset + (rx_bank * 4));
> +		local_irq_restore(flags);
> +	}
> +}
> +
> +static void rockchip_snd_xfer_reset_deassert(struct rk_i2s_tdm_dev *i2s_=
tdm,
> +					     int tx_bank, int tx_offset,
> +					     int rx_bank, int rx_offset)
> +{
> +	void __iomem *cru_reset;
> +	unsigned long flags;
> +
> +	cru_reset =3D i2s_tdm->cru_base + i2s_tdm->soc_data->softrst_offset;
> +
> +	if (tx_bank =3D=3D rx_bank) {
> +		writel((BIT(tx_offset) << 16) | (BIT(rx_offset) << 16),
> +		       cru_reset + (tx_bank * 4));
> +	} else {
> +		local_irq_save(flags);
> +		writel((BIT(tx_offset) << 16),
> +		       cru_reset + (tx_bank * 4));
> +		writel((BIT(rx_offset) << 16),
> +		       cru_reset + (rx_bank * 4));
> +		local_irq_restore(flags);
> +	}
> +}
> +
> +/*
> + * Makes sure that both tx and rx are reset at the same time to sync lrc=
k
> + * when clk_trcm > 0.
> + */
> +static void rockchip_snd_xfer_sync_reset(struct rk_i2s_tdm_dev *i2s_tdm)
> +{
> +	int tx_id, rx_id;
> +	int tx_bank, rx_bank, tx_offset, rx_offset;
> +
> +	if (!i2s_tdm->cru_base || !i2s_tdm->soc_data)
> +		return;
> +
> +	tx_id =3D i2s_tdm->tx_reset_id;
> +	rx_id =3D i2s_tdm->rx_reset_id;
> +	if (tx_id < 0 || rx_id < 0)
> +		return;
> +
> +	tx_bank =3D tx_id / 16;
> +	tx_offset =3D tx_id % 16;
> +	rx_bank =3D rx_id / 16;
> +	rx_offset =3D rx_id % 16;
> +	dev_dbg(i2s_tdm->dev,
> +		"tx_bank: %d, rx_bank: %d, tx_offset: %d, rx_offset: %d\n",
> +		tx_bank, rx_bank, tx_offset, rx_offset);
> +
> +	rockchip_snd_xfer_reset_assert(i2s_tdm, tx_bank, tx_offset,
> +				       rx_bank, rx_offset);
> +
> +	udelay(150);
> +
> +	rockchip_snd_xfer_reset_deassert(i2s_tdm, tx_bank, tx_offset,
> +					 rx_bank, rx_offset);
> +}

I'm not too fond of reimplementing half a reset controller in here.
The reset framework does not support synchronized (de)assertion of
multiple reset controls, I wonder if this would be useful to add.
Without having thought about this too hard, I could imagine this as an
extension to the bulk API, or possibly a call to join multiple reset
controls into a reset control array.

> +static void rockchip_snd_reset(struct reset_control *rc)
> +{
> +	if (IS_ERR(rc))
> +		return;

This shouldn't be called with an error code, see the comment about
optional reset controls below.

> +
> +	reset_control_assert(rc);
> +	udelay(1);

What is the reason for the different delays in
rockchip_snd_xfer_sync_reset() and rockchip_snd_reset()?

> +	reset_control_deassert(rc);
> +}
[...]
> +static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node =3D pdev->dev.of_node;
> +	struct device_node *cru_node;
> +	const struct of_device_id *of_id;
> +	struct rk_i2s_tdm_dev *i2s_tdm;
> +	struct resource *res;
> +	void __iomem *regs;
> +	int ret;
> +	int val;
> +
> +	i2s_tdm =3D devm_kzalloc(&pdev->dev, sizeof(*i2s_tdm), GFP_KERNEL);
> +	if (!i2s_tdm)
> +		return -ENOMEM;
> +
> +	i2s_tdm->dev =3D &pdev->dev;
> +
> +	of_id =3D of_match_device(rockchip_i2s_tdm_match, &pdev->dev);
> +	if (!of_id || !of_id->data)
> +		return -EINVAL;
> +
> +	spin_lock_init(&i2s_tdm->lock);
> +	i2s_tdm->soc_data =3D (struct rk_i2s_soc_data *)of_id->data;
> +
> +	i2s_tdm->frame_width =3D 64;
> +	if (!of_property_read_u32(node, "rockchip,frame-width", &val)) {
> +		if (val >=3D 32 && (val % 2 =3D=3D 0) && val <=3D 512) {
> +			i2s_tdm->frame_width =3D val;
> +		} else {
> +			dev_err(i2s_tdm->dev, "unsupported frame width: '%d'\n",
> +				val);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	i2s_tdm->clk_trcm =3D TRCM_TXRX;
> +	if (of_property_read_bool(node, "rockchip,trcm-sync-tx-only"))
> +		i2s_tdm->clk_trcm =3D TRCM_TX;
> +	if (of_property_read_bool(node, "rockchip,trcm-sync-rx-only")) {
> +		if (i2s_tdm->clk_trcm) {
> +			dev_err(i2s_tdm->dev, "invalid trcm-sync configuration\n");
> +			return -EINVAL;
> +		}
> +		i2s_tdm->clk_trcm =3D TRCM_RX;
> +	}
> +	if (i2s_tdm->clk_trcm !=3D TRCM_TXRX)
> +		i2s_tdm_dai.symmetric_rate =3D 1;
> +
> +	i2s_tdm->tdm_fsync_half_frame =3D
> +		of_property_read_bool(node, "rockchip,tdm-fsync-half-frame");
> +
> +	i2s_tdm->grf =3D syscon_regmap_lookup_by_phandle(node, "rockchip,grf");
> +	if (IS_ERR(i2s_tdm->grf))
> +		return dev_err_probe(i2s_tdm->dev, PTR_ERR(i2s_tdm->grf),
> +				     "Error in rockchip,grf\n");
> +
> +	if (i2s_tdm->clk_trcm !=3D TRCM_TXRX) {
> +		cru_node =3D of_parse_phandle(node, "rockchip,cru", 0);
> +		i2s_tdm->cru_base =3D of_iomap(cru_node, 0);

This is a bit ugly if there is another driver sitting on the
rockchip,cru compatible node. Which reset controller driver is backing
the reset controls below?

> +		of_node_put(cru_node);
> +		if (!i2s_tdm->cru_base) {
> +			dev_err(i2s_tdm->dev,
> +				"Missing or unsupported rockchip,cru node\n");
> +			return -ENOENT;
> +		}
> +
> +		i2s_tdm->tx_reset_id =3D of_i2s_resetid_get(node, "tx-m");
> +		i2s_tdm->rx_reset_id =3D of_i2s_resetid_get(node, "rx-m");
> +	}
> +
> +	i2s_tdm->tx_reset =3D devm_reset_control_get(&pdev->dev, "tx-m");

Please use devm_reset_control_get_exclusive() instead.

> +	if (IS_ERR(i2s_tdm->tx_reset)) {
> +		ret =3D PTR_ERR(i2s_tdm->tx_reset);
> +		if (ret !=3D -ENOENT)
> +			return dev_err_probe(i2s_tdm->dev, ret,
> +					     "Error in tx-m reset control\n");
> +	}
> +
> +	i2s_tdm->rx_reset =3D devm_reset_control_get(&pdev->dev, "rx-m");
> +	if (IS_ERR(i2s_tdm->rx_reset)) {
> +		ret =3D PTR_ERR(i2s_tdm->rx_reset);
> +		if (ret !=3D -ENOENT)

Why is -ENOENT acceptable? If you want these to be optional, use
devm_reset_control_get_optional_exclusive() [1] instead. That will
return NULL if the reset is not specified in the device tree, which will
be ignored by reset_control_(de)assert().

[1] https://www.kernel.org/doc/html/latest/driver-api/reset.html#c.devm_res=
et_control_get_optional_exclusive

> +			return dev_err_probe(i2s_tdm->dev, ret,
> +					     "Error in rx-m reset control\n");
> +	}
> +
> +	i2s_tdm->hclk =3D devm_clk_get(&pdev->dev, "hclk");
> +	if (IS_ERR(i2s_tdm->hclk)) {
> +		return dev_err_probe(i2s_tdm->dev, PTR_ERR(i2s_tdm->hclk),
> +				     "Failed to get clock hclk\n");
> +	}
> +
> +	ret =3D clk_prepare_enable(i2s_tdm->hclk);
> +	if (ret) {
> +		return dev_err_probe(i2s_tdm->dev, ret,
> +				     "Failed to enable clock hclk\n");
> +	}

This clock is left enabled in all the error paths below. You could
install a cleanup action with devm_add_action_or_reset(), or better
start enabling the hardware only after acquisition of all required
resources has succeeded.

[...]
> +static int rockchip_i2s_tdm_remove(struct platform_device *pdev)
> +{
> +	struct rk_i2s_tdm_dev *i2s_tdm =3D dev_get_drvdata(&pdev->dev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		i2s_tdm_runtime_suspend(&pdev->dev);
> +
> +	if (!IS_ERR(i2s_tdm->mclk_tx))
> +		clk_prepare_enable(i2s_tdm->mclk_tx);
> +	if (!IS_ERR(i2s_tdm->mclk_rx))
> +		clk_prepare_enable(i2s_tdm->mclk_rx);

Why are we enabling these clocks now?

> +	if (!IS_ERR(i2s_tdm->hclk))
> +		clk_disable_unprepare(i2s_tdm->hclk);
> +
> +	return 0;
> +}

regards
Philipp
