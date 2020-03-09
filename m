Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0524017ECD2
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 00:48:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 853511669;
	Tue, 10 Mar 2020 00:47:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 853511669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583797699;
	bh=b1yxZBgNJx1GV7MQJ6kCRC6K7IYkr8u1CAUrk2eizkQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qcoa9hO1EIn0dQgboGeNW8TbH16afhGaF6iGsIZ1C2XiSdhhQo1X7FOcgRBNNhKgA
	 w5P0kuY3AJlvEm4WOfHxCDZJob6s3GKsEmLBGvA5uVOglvJDF+ydUkNOrgVCZkbKym
	 019hdVoAR4Z7pYy2C9dtdJuBleXjZZIW6AFBRO1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85934F800B5;
	Tue, 10 Mar 2020 00:46:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BE0EF801EB; Tue, 10 Mar 2020 00:46:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A42B3F800B5
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 00:46:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A42B3F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cdnk6m5b"
Received: by mail-pl1-x642.google.com with SMTP id ay11so4658071plb.0
 for <alsa-devel@alsa-project.org>; Mon, 09 Mar 2020 16:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tSkT8n/Z430nm+g00OtvcSfjHhJpGkNA3fExCO40Te8=;
 b=cdnk6m5blgp+J3OCCWG1EwTcX7VfYmlhHPdekIezpQYnw7MyShxIo+/25t7RrD32Q4
 oT9z6/nuIhAgI3gTTN8PWbCYh/7/8cF2iBEfVdUQCtCvAHf1zMWmJYcuQdc7Z8+bcU7a
 6EwKAVirPwfhw3llXme6c+Aa28WKjcugihN3i/iyNs/XGp1ZpzWcVNbo93e3RxK9+n02
 9D7t2C6UZ1SFq8qX1yTzuqHsqLkb2JbMgzWGdOnAkpE6h9uOQsfnG+CNx78qRNNSMOsR
 8HOd5pWydhBGSPcueNfSizyLXkI/yS3BTxydl0nAbUjDAeCetUQE8/g9iPT8bKJH/vIF
 +kLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tSkT8n/Z430nm+g00OtvcSfjHhJpGkNA3fExCO40Te8=;
 b=NPbbOkFm/Wzr2y6reKyBWXLpEN3Md2HUVnY8LkyEnPEmq8GK+JNwNRvaWh94TmMF25
 /PW9xkwXI/6OIDuD5CPyJHCU4pjt/ioG76ZvOrmejzPjD7hZsXVzeEQCmaum8gz6ihou
 r0idHna29FdyVUG9YITV0MZkvefKkGANoeECzs2Htzf+AyInjoKtDPv0083WH+0mJ+Za
 ITGalraAWafCilmIOKpc8bm1uh3XdM8c5szeYmWFL21SvfcqeT7MWZjL03uNy9ZqcpYa
 rFXcYZ0bnfBSJkTAMjpp4V9aXFuJLaNCK3uQZ1e+0AKA5lWnW1yY2Z+TdXaVx8F6Xk65
 7vWA==
X-Gm-Message-State: ANhLgQ33jrNhEifIw+2zvbOTEOAvxo9a4alDrMFp9AFFTUC9ezTXDq3D
 1mMQM3zE2mMr7cZN+yjq5Oo=
X-Google-Smtp-Source: ADFU+vsfl38+Tfau/1SStKLehhrwyQ4BxIJ94XjQFG8sY7tPuku0xQ39POC0QDmboqLCgaw1GJYNEA==
X-Received: by 2002:a17:902:b40f:: with SMTP id
 x15mr18684112plr.82.1583797590271; 
 Mon, 09 Mar 2020 16:46:30 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id i21sm942112pgn.5.2020.03.09.16.46.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Mar 2020 16:46:29 -0700 (PDT)
Date: Mon, 9 Mar 2020 16:46:39 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v5 7/7] ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers
Message-ID: <20200309234638.GD11333@Asurada-Nvidia.nvidia.com>
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
 <2616bfd81df982add337b169b2d424a8d50c6bda.1583725533.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2616bfd81df982add337b169b2d424a8d50c6bda.1583725533.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
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

A few small comments -- trying to improve readability.

On Mon, Mar 09, 2020 at 11:58:34AM +0800, Shengjiu Wang wrote:
> EASRC (Enhanced Asynchronous Sample Rate Converter) is a new IP module
> found on i.MX8MN. It is different with old ASRC module.
> 
> The primary features for the EASRC are as follows:
> - 4 Contexts - groups of channels with an independent time base
> - Fully independent and concurrent context control
> - Simultaneous processing of up to 32 audio channels
> - Programmable filter charachteristics for each context
> - 32, 24, 20, and 16-bit fixed point audio sample support
> - 32-bit floating point audio sample support
> - 8kHz to 384kHz sample rate
> - 1/16 to 8x sample rate conversion ratio
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>
> ---
>  sound/soc/fsl/Kconfig     |   11 +
>  sound/soc/fsl/Makefile    |    2 +
>  sound/soc/fsl/fsl_easrc.c | 2111 +++++++++++++++++++++++++++++++++++++
>  sound/soc/fsl/fsl_easrc.h |  651 ++++++++++++
>  4 files changed, 2775 insertions(+)
>  create mode 100644 sound/soc/fsl/fsl_easrc.c
>  create mode 100644 sound/soc/fsl/fsl_easrc.h

> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c

> +static int fsl_easrc_resampler_config(struct fsl_asrc *easrc)
> +{
> +	struct device *dev = &easrc->pdev->dev;
> +	struct fsl_easrc_priv *easrc_priv = easrc->private;
> +	struct asrc_firmware_hdr *hdr =  easrc_priv->firmware_hdr;
> +	struct interp_params *interp = easrc_priv->interp;
> +	struct interp_params *selected_interp = NULL;
> +	unsigned int num_coeff;
> +	unsigned int i;
> +	u64 *arr;
> +	u32 *r;
> +	int ret;
> +
> +	if (!hdr) {
> +		dev_err(dev, "firmware not loaded!\n");
> +		return -ENODEV;
> +	}
> +
> +	for (i = 0; i < hdr->interp_scen; i++) {
> +		if ((interp[i].num_taps - 1) ==
> +		    bits_taps_to_val(easrc_priv->rs_num_taps)) {

Could fit everything under 80 characters:

+		if ((interp[i].num_taps - 1) !=
+		    bits_taps_to_val(easrc_priv->rs_num_taps))
+			continue;
+
+		arr = interp[i].coeff;
+		selected_interp = &interp[i];
+		dev_dbg(dev, "Selected interp_filter: %u taps - %u phases\n",
+			selected_interp->num_taps,
+			selected_interp->num_phases);
+		break;


> +static int fsl_easrc_normalize_filter(struct fsl_asrc *easrc,
> +				      u64 *infilter,
> +				      u64 *outfilter,
> +				      int shift)
> +{
> +	struct device *dev = &easrc->pdev->dev;
> +	u64 coef = *infilter;

> +	s64 exp  = (coef & 0x7ff0000000000000ll) >> 52;

Hmm...by masking 0x7ff0000000000000ll, MSB (sign bit) is gone.
Would the result still possibly be a negative value?

> +	/*
> +	 * If exponent is zero (value == 0), or 7ff (value == NaNs)
> +	 * dont touch the content
> +	 */
> +	if (((coef & 0x7ff0000000000000ll) == 0) ||
> +	    ((coef & 0x7ff0000000000000ll) == ((u64)0x7ff << 52))) {

You have extracted "exp" already:
+	if (exp == 0 || (u64)exp & 0x7ff == 0x7ff)

> +		*outfilter = coef;

Could simply a bit by returning here:
+		return 0;
+	}
	
Then:

+	/* coef * 2^shift == exp + shift */
+	exp += shift;
+
+	if ((shift > 0 && exp >= 2047) || (shift < 0 && exp <= 0)) {
+		dev_err(dev, "coef out of range\n");
+		return -EINVAL;
+	}
+
+	outcoef = (u64)(coef & 0x800FFFFFFFFFFFFFll) + ((u64)exp << 52);
+	*outfilter = outcoef;


> +static int fsl_easrc_write_pf_coeff_mem(struct fsl_asrc *easrc, int ctx_id,
> +					u64 *arr, int n_taps, int shift)
> +{
> +	if (!arr) {
> +		dev_err(dev, "NULL buffer\n");

Could it be slightly more specific?


> +static int fsl_easrc_prefilter_config(struct fsl_asrc *easrc,
> +				      unsigned int ctx_id)
> +{
> +	ctx_priv->in_filled_sample = bits_taps_to_val(easrc_priv->rs_num_taps) / 2;
> +	ctx_priv->out_missed_sample = ctx_priv->in_filled_sample *
> +					  ctx_priv->out_params.sample_rate /
> +					  ctx_priv->in_params.sample_rate;

There are quite a few references to sample_rate and sample_format
here, so we could use some local variables to cache them:

+       in_s_rate = ctx_priv->in_params.sample_rate;
+       out_s_rate = ctx_priv->out_params.sample_rate;
+       in_s_fmt = ctx_priv->in_params.sample_format;
+       out_s_fmt = ctx_priv->out_params.sample_format;


> +static int fsl_easrc_config_slot(struct fsl_asrc *easrc, unsigned int ctx_id)
> +{
> +	struct fsl_easrc_priv *easrc_priv = easrc->private;
> +	struct fsl_asrc_pair *ctx = easrc->pair[ctx_id];
> +	int req_channels = ctx->channels;
> +	int start_channel = 0, avail_channel;
> +	struct fsl_easrc_slot *slot0, *slot1;
> +	int i, ret;
> +
> +	if (req_channels <= 0)
> +		return -EINVAL;
> +
> +	for (i = 0; i < EASRC_CTX_MAX_NUM; i++) {
> +		slot0 = &easrc_priv->slot[i][0];
> +		slot1 = &easrc_priv->slot[i][1];
> +
> +		if (slot0->busy && slot1->busy)
> +			continue;
> +

Could merge the duplication by doing:
+	struct fsl_easrc_slot *slot = NULL;
...
+		else if ((slot0->busy && slot0->ctx_index == ctx->index) ||
+			 (slot1->busy && slot1->ctx_index == ctx->index))
+			continue;
+		else if (!slot0->busy)
+			slot = slot0;
+		else if (!slot1->busy)
+			slot = slot1;
+
+		if (!slot)
+			continue;
+
+		avail_channel = fsl_easrc_max_ch_for_slot(ctx, slot);
+		if (avail_channel <= 0)
+			continue;
+
+		slot->slot_index = 0;
+
+		ret = fsl_easrc_config_one_slot(ctx, slot, i, &req_channels,
+						&start_channel, &avail_channel);
+		if (ret)
+			return ret;
+
+		if (req_channels > 0)
+			continue;
+		else
+			break;

# Please double check before doing copy-n-paste.


> +int fsl_easrc_config_context(struct fsl_asrc *easrc, unsigned int ctx_id)
> +{
> +	/* Context Input FIFO Watermark */
> +	regmap_update_bits(easrc->regmap, REG_EASRC_CC(ctx_id),
> +			   EASRC_CC_FIFO_WTMK_MASK,
> +			   EASRC_CC_FIFO_WTMK(ctx_priv->in_params.fifo_wtmk));
> +
> +	/* Context Output FIFO Watermark */
> +	regmap_update_bits(easrc->regmap, REG_EASRC_COC(ctx_id),
> +			   EASRC_COC_FIFO_WTMK_MASK,
> +			   EASRC_COC_FIFO_WTMK(ctx_priv->out_params.fifo_wtmk - 1));

Why a "-1" here vs. no "-1" for input FIFO? Could probably put
the reason in the comments?


> +void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
> +{
> +	unsigned long lock_flags;
> +	struct fsl_asrc *easrc;
> +	struct device *dev;
> +	int ret;
> +
> +	if (!ctx)
> +		return;
> +
> +	easrc = ctx->asrc;
> +	dev = &easrc->pdev->dev;
> +
> +	spin_lock_irqsave(&easrc->lock, lock_flags);
> +
> +	ret = fsl_easrc_release_slot(easrc, ctx->index);

Where is this "ret" used?

> +
> +	easrc->channel_avail += ctx->channels;
> +	easrc->pair[ctx->index] = NULL;
> +
> +	spin_unlock_irqrestore(&easrc->lock, lock_flags);
> +}


> +void fsl_easrc_dump_firmware(struct fsl_asrc *easrc)

Hmm..where is this function being used? From outside?

> +int fsl_easrc_get_firmware(struct fsl_asrc *easrc)

static?

If it's being called from an outsider, it might be safer to check
easrc->private pointer too?


> +{
> +	struct fsl_easrc_priv *easrc_priv;

Could probably clean up some wrappings with:
+	struct firmware **fw_p;

> +	u32 pnum, inum, offset;

+	u8 *data;

> +	int ret;
> +
> +	if (!easrc)
> +		return -EINVAL;
> +
> +	easrc_priv = easrc->private;

+	fw_p = &easrc_priv->fw;

> +	ret = request_firmware(&easrc_priv->fw, easrc_priv->fw_name,
> +			       &easrc->pdev->dev);

+	ret = request_firmware(fw_p, easrc_priv->fw_name, &easrc->pdev->dev);

> +	if (ret)
> +		return ret;

+	data = easrc_priv->fw->data;

And replace all data references.


> +static int fsl_easrc_get_fifo_addr(u8 dir, enum asrc_pair_index index)
> +{
> +	return REG_EASRC_FIFO(dir, index);

Maybe an inline type or simply a macro?


> +static int fsl_easrc_probe(struct platform_device *pdev)
> +{
: +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "no irq for node %s\n",
> +			dev_name(&pdev->dev));

Probably could save some wrappings in this function if we have a:
	struct device *dev = &pdev->dev;

And dev_err() prints dev_name() actually, so it'd be better use:
+		dev_err(dev, "no irq for node %pOF\n", np);


> +	ret = of_property_read_string(np,
> +				      "fsl,easrc-ram-script-name",
> +				      &easrc_priv->fw_name);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to get firmware name\n");
> +		return ret;
> +	}

Could we move this to the place where we parse DT bindings?


> +static int fsl_easrc_runtime_resume(struct device *dev)
> +{

> +	for (i = ASRC_PAIR_A; i < EASRC_CTX_MAX_NUM; i++) {
> +		ctx = easrc->pair[i];
> +		if (ctx) {

Could do this to save some indentations from following lines:
+		if (!ctx)
+			continue;

> +			ctx_priv = ctx->private;
> +			fsl_easrc_set_rs_ratio(ctx);
> +			ctx_priv->out_missed_sample = ctx_priv->in_filled_sample *
> +							  ctx_priv->out_params.sample_rate /
> +							  ctx_priv->in_params.sample_rate;
> +			if (ctx_priv->in_filled_sample * ctx_priv->out_params.sample_rate
> +					% ctx_priv->in_params.sample_rate != 0)
> +				ctx_priv->out_missed_sample += 1;
> +
> +			ret = fsl_easrc_write_pf_coeff_mem(easrc, i,
> +							   ctx_priv->st1_coeff,
> +							   ctx_priv->st1_num_taps,
> +							   ctx_priv->st1_addexp);
> +			if (ret)
> +				goto disable_mem_clk;
> +
> +			ret = fsl_easrc_write_pf_coeff_mem(easrc, i,
> +							   ctx_priv->st2_coeff,
> +							   ctx_priv->st2_num_taps,
> +							   ctx_priv->st2_addexp);
> +			if (ret)
> +				goto disable_mem_clk;


> diff --git a/sound/soc/fsl/fsl_easrc.h b/sound/soc/fsl/fsl_easrc.h
> +struct fsl_easrc_slot {
> +	bool busy;
> +	int ctx_index;
> +	int slot_index;
> +	int num_channel;  /*maximum is 8*/
	
Spaces for comments: 	/* maximum is 8 */


> +/**
> + * fsl_easrc_priv: EASRC private data
> + *
> + * @slot: slot setting
> + * @firmware_hdr:  the header of firmware
> + * @interp: pointer to interpolation filter coeff
> + * @prefil: pointer to prefilter coeff
> + * @fw: firmware of coeff table
> + * @fw_name: firmware name
> + * @rs_num_taps:  resample filter taps, 32, 64, or 128
> + * @bps_i2c958: bits per sample of IEC958

i2c or iec?
