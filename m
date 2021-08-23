Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FEB3F4C83
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 16:37:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C75CA851;
	Mon, 23 Aug 2021 16:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C75CA851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629729429;
	bh=raWHcCCaVgf8wG5W8EQqVDYgBpqIKC4btiYxreFOH8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZitSrzeutwzA4QDH4RnZdx+1DSdXjAEmKkATASJcxku21nSXkK9k47M505cp5e4+A
	 5vqZrEKPDiV5c60mQo95Bq+7JQ2yfMccjDznlS5MFQXa9bqXwdwZCT5pC9BVHcqwzj
	 XlRx8bPuNHIqmLqQuwNyRV7e2bzIOgzZHSf2mcrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4012AF80229;
	Mon, 23 Aug 2021 16:35:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91BA6F80217; Mon, 23 Aug 2021 16:35:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C182CF8016E
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 16:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C182CF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G2x4IudV"
Received: by mail-ej1-x635.google.com with SMTP id u3so37550995ejz.1
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 07:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A/qpH7CHD7FrWhnDUzTDDpyv/YS2OHRtYJYQQQB8Bp0=;
 b=G2x4IudVbwj0h29Njt8qBea5uCly45QDU9MDGzl31TzJSEXii6ONJUQ6Nbt7C3ChxQ
 6pEaEHbsMI0pglxcjgqifB//U0wAdinpI54yIYl8juKBX6iP0nX643S6OS5ndcMd9NeC
 tpSyyWHm0j1dw+V1thewBfZpWS/ajS1+CpBwkrfdPPTn8NR4gjUe5DSgMWRRCAsVr0Mt
 lf5r5pqz0vfojJHVevUnO56cFrujMM06WZ0blKYYjTZqnwbg/K5JP3ehtaq8PwIyGFC+
 rS8l1qiaLn6YV5wVSb9wEHjUz+UzqJfoC9X/t3MBlFOP3XcN5wTOsd7NbnypoCrEgdT5
 USnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A/qpH7CHD7FrWhnDUzTDDpyv/YS2OHRtYJYQQQB8Bp0=;
 b=a8VcLIycObhSnblJD8HNep5cLVcZvND8DtYpE5+8LCN/ySChpchTT//lIzvPmynB1Z
 VaGIhik3STn5gA09QRbWEz3R7FQuT6dMHvg51pxHdJHN/LhaKCwKCl1wR9JGdYHACfwE
 wrAZ6Jqai+sL/966B6td5r2Su5z7DC5hX7Maj0jcnMbLdHIy8K7jUhOmZYhzNd5+1n3i
 98daDnNcf/7NLaKkVqqqsdDUA/pOJMUysRW9r/DO0xt8kNAQm1ir03jik0qSv1jwqf6t
 u3JnNwBXAgeTL44DKLozLpsjm+LnWtZHt1s7k+Yi33Tp11/SmwqwWY00nq2j/iVGvOWB
 VK9Q==
X-Gm-Message-State: AOAM530oT8r1UggzdlhMIRPIb3I83kQxBYNXKcH/K2b0l7Ia6okvIKqb
 s4BpSNl1arNNUn9QXdJk7nM=
X-Google-Smtp-Source: ABdhPJwdnaw/EdMkrg8xWrBajtpxxxxkkGbtYreheU70ZtNV+/K1xEPOqF5L5uIjDWko8VGQeXIr/g==
X-Received: by 2002:a17:906:444:: with SMTP id
 e4mr35265682eja.255.1629729344685; 
 Mon, 23 Aug 2021 07:35:44 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id d3sm4901155ejw.18.2021.08.23.07.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 07:35:44 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 1/4] ASoC: rockchip: add support for i2s-tdm controller
Date: Mon, 23 Aug 2021 16:35:42 +0200
Message-ID: <9368735.gdWEK3B62L@archbook>
In-Reply-To: <6bc6330215980f10853a2dac69f0bdfd9c8fb303.camel@pengutronix.de>
References: <20210820182731.29370-1-frattaroli.nicolas@gmail.com>
 <20210820182731.29370-2-frattaroli.nicolas@gmail.com>
 <6bc6330215980f10853a2dac69f0bdfd9c8fb303.camel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi Philipp,

On Montag, 23. August 2021 14:03:25 CEST Philipp Zabel wrote:
> Hi Nicolas,
> 
> On Fri, 2021-08-20 at 20:27 +0200, Nicolas Frattaroli wrote:
> [...]
> 
> > diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c
> > b/sound/soc/rockchip/rockchip_i2s_tdm.c new file mode 100644
> > index 000000000000..c02b66f3c913
> > --- /dev/null
> > +++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
> > @@ -0,0 +1,1737 @@
> 
> [...]
> 
> > +static void rockchip_snd_xfer_reset_assert(struct rk_i2s_tdm_dev
> > *i2s_tdm,
> > +					   int tx_bank, int tx_offset,
> > +					   int rx_bank, int rx_offset)
> > +{
> > +	void __iomem *cru_reset;
> > +	unsigned long flags;
> > +
> > +	cru_reset = i2s_tdm->cru_base + i2s_tdm->soc_data->softrst_offset;
> > +
> > +	if (tx_bank == rx_bank) {
> > +		writel(BIT(tx_offset) | BIT(rx_offset) |
> > +		       (BIT(tx_offset) << 16) | (BIT(rx_offset) << 16),
> > +		       cru_reset + (tx_bank * 4));
> > +	} else {
> > +		local_irq_save(flags);
> > +		writel(BIT(tx_offset) | (BIT(tx_offset) << 16),
> > +		       cru_reset + (tx_bank * 4));
> > +		writel(BIT(rx_offset) | (BIT(rx_offset) << 16),
> > +		       cru_reset + (rx_bank * 4));
> > +		local_irq_restore(flags);
> > +	}
> > +}
> > +
> > +static void rockchip_snd_xfer_reset_deassert(struct rk_i2s_tdm_dev
> > *i2s_tdm, +					     int tx_bank, int 
tx_offset,
> > +					     int rx_bank, int rx_offset)
> > +{
> > +	void __iomem *cru_reset;
> > +	unsigned long flags;
> > +
> > +	cru_reset = i2s_tdm->cru_base + i2s_tdm->soc_data->softrst_offset;
> > +
> > +	if (tx_bank == rx_bank) {
> > +		writel((BIT(tx_offset) << 16) | (BIT(rx_offset) << 16),
> > +		       cru_reset + (tx_bank * 4));
> > +	} else {
> > +		local_irq_save(flags);
> > +		writel((BIT(tx_offset) << 16),
> > +		       cru_reset + (tx_bank * 4));
> > +		writel((BIT(rx_offset) << 16),
> > +		       cru_reset + (rx_bank * 4));
> > +		local_irq_restore(flags);
> > +	}
> > +}
> > +
> > +/*
> > + * Makes sure that both tx and rx are reset at the same time to sync lrck
> > + * when clk_trcm > 0.
> > + */
> > +static void rockchip_snd_xfer_sync_reset(struct rk_i2s_tdm_dev *i2s_tdm)
> > +{
> > +	int tx_id, rx_id;
> > +	int tx_bank, rx_bank, tx_offset, rx_offset;
> > +
> > +	if (!i2s_tdm->cru_base || !i2s_tdm->soc_data)
> > +		return;
> > +
> > +	tx_id = i2s_tdm->tx_reset_id;
> > +	rx_id = i2s_tdm->rx_reset_id;
> > +	if (tx_id < 0 || rx_id < 0)
> > +		return;
> > +
> > +	tx_bank = tx_id / 16;
> > +	tx_offset = tx_id % 16;
> > +	rx_bank = rx_id / 16;
> > +	rx_offset = rx_id % 16;
> > +	dev_dbg(i2s_tdm->dev,
> > +		"tx_bank: %d, rx_bank: %d, tx_offset: %d, rx_offset: %d\n",
> > +		tx_bank, rx_bank, tx_offset, rx_offset);
> > +
> > +	rockchip_snd_xfer_reset_assert(i2s_tdm, tx_bank, tx_offset,
> > +				       rx_bank, rx_offset);
> > +
> > +	udelay(150);
> > +
> > +	rockchip_snd_xfer_reset_deassert(i2s_tdm, tx_bank, tx_offset,
> > +					 rx_bank, rx_offset);
> > +}
> 
> I'm not too fond of reimplementing half a reset controller in here.
> The reset framework does not support synchronized (de)assertion of
> multiple reset controls, I wonder if this would be useful to add.
> Without having thought about this too hard, I could imagine this as an
> extension to the bulk API, or possibly a call to join multiple reset
> controls into a reset control array.

I agree, the code required for synchronised reset seems to be a good
candidate for a generalised solution elsewhere.
However, I'm not sure if I'm the right candidate to design this API
as my first kernel contribution when the board I'm currently testing
this with doesn't even utilise the synchronized reset.

If I come across an opportunity to test synchronised resets, I'll
definitely look into refactoring this. I'd also be happy to hear of
any other driver which is currently implementing its own synchronised
reset.

[...]
 
> > +
> > +	reset_control_assert(rc);
> > +	udelay(1);
> 
> What is the reason for the different delays in
> rockchip_snd_xfer_sync_reset() and rockchip_snd_reset()?
> 

Simply put: I have no idea. This is what downstream does, and it
appears to work for me. The git history of the downstream kernel
also doesn't tell me anything about why the sync reset is 150
and this one is 1.

I've got no device to test the sync reset with at the moment so
I'm wary of playing with the delay value.

> > +	reset_control_deassert(rc);
> > +}
> 
> [...]
> 
> > +static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *node = pdev->dev.of_node;
> > +	struct device_node *cru_node;
> > +	const struct of_device_id *of_id;
> > +	struct rk_i2s_tdm_dev *i2s_tdm;
> > +	struct resource *res;
> > +	void __iomem *regs;
> > +	int ret;
> > +	int val;
> > +
> > +	i2s_tdm = devm_kzalloc(&pdev->dev, sizeof(*i2s_tdm), GFP_KERNEL);
> > +	if (!i2s_tdm)
> > +		return -ENOMEM;
> > +
> > +	i2s_tdm->dev = &pdev->dev;
> > +
> > +	of_id = of_match_device(rockchip_i2s_tdm_match, &pdev->dev);
> > +	if (!of_id || !of_id->data)
> > +		return -EINVAL;
> > +
> > +	spin_lock_init(&i2s_tdm->lock);
> > +	i2s_tdm->soc_data = (struct rk_i2s_soc_data *)of_id->data;
> > +
> > +	i2s_tdm->frame_width = 64;
> > +	if (!of_property_read_u32(node, "rockchip,frame-width", &val)) {
> > +		if (val >= 32 && (val % 2 == 0) && val <= 512) {
> > +			i2s_tdm->frame_width = val;
> > +		} else {
> > +			dev_err(i2s_tdm->dev, "unsupported frame width: 
'%d'\n",
> > +				val);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	i2s_tdm->clk_trcm = TRCM_TXRX;
> > +	if (of_property_read_bool(node, "rockchip,trcm-sync-tx-only"))
> > +		i2s_tdm->clk_trcm = TRCM_TX;
> > +	if (of_property_read_bool(node, "rockchip,trcm-sync-rx-only")) {
> > +		if (i2s_tdm->clk_trcm) {
> > +			dev_err(i2s_tdm->dev, "invalid trcm-sync 
configuration\n");
> > +			return -EINVAL;
> > +		}
> > +		i2s_tdm->clk_trcm = TRCM_RX;
> > +	}
> > +	if (i2s_tdm->clk_trcm != TRCM_TXRX)
> > +		i2s_tdm_dai.symmetric_rate = 1;
> > +
> > +	i2s_tdm->tdm_fsync_half_frame =
> > +		of_property_read_bool(node, "rockchip,tdm-fsync-half-frame");
> > +
> > +	i2s_tdm->grf = syscon_regmap_lookup_by_phandle(node, "rockchip,grf");
> > +	if (IS_ERR(i2s_tdm->grf))
> > +		return dev_err_probe(i2s_tdm->dev, PTR_ERR(i2s_tdm->grf),
> > +				     "Error in rockchip,grf\n");
> > +
> > +	if (i2s_tdm->clk_trcm != TRCM_TXRX) {
> > +		cru_node = of_parse_phandle(node, "rockchip,cru", 0);
> > +		i2s_tdm->cru_base = of_iomap(cru_node, 0);
> 
> This is a bit ugly if there is another driver sitting on the
> rockchip,cru compatible node. Which reset controller driver is backing
> the reset controls below?

I'm not sure if I understand the question (I only just today learned that
reset controls have drivers) but I think the reset it is using in the
Quartz64 dts is backed by rk3568-cru. Let me know if I misunderstood you.

[...]

> > +static int rockchip_i2s_tdm_remove(struct platform_device *pdev)
> > +{
> > +	struct rk_i2s_tdm_dev *i2s_tdm = dev_get_drvdata(&pdev->dev);
> > +
> > +	pm_runtime_disable(&pdev->dev);
> > +	if (!pm_runtime_status_suspended(&pdev->dev))
> > +		i2s_tdm_runtime_suspend(&pdev->dev);
> > +
> > +	if (!IS_ERR(i2s_tdm->mclk_tx))
> > +		clk_prepare_enable(i2s_tdm->mclk_tx);
> > +	if (!IS_ERR(i2s_tdm->mclk_rx))
> > +		clk_prepare_enable(i2s_tdm->mclk_rx);
> 
> Why are we enabling these clocks now?
> 

I wondered that too while I was looking into the pm_runtime stuff,
and decided to just throw these two calls out. They don't seem to
make sense to me, and nothing I tested broke when I removed them.

If left in (and the code works as I hypothesise it works) then
this would simply re-enable clocks we have just disabled, which
would make the number of enable and disable calls unbalanced.
Highly sus, as the kids would say, and completely omits the other
mclk_tx_src etc. clocks. (Though those are forgotten elsewhere in
the code as well, which I have since fixed, along with any of the
review points I don't directly respond to.)

> > +	if (!IS_ERR(i2s_tdm->hclk))
> > +		clk_disable_unprepare(i2s_tdm->hclk);
> > +
> > +	return 0;
> > +}
> 
> regards
> Philipp

Regards,
Nicolas Frattaroli


