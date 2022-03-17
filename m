Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F34F4DBCF5
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 03:25:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23445169B;
	Thu, 17 Mar 2022 03:24:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23445169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647483931;
	bh=Ix1jQ+FTzwE7Py6xt22i052YfsEmKH5ZWqPAWdPOfew=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OLcWozzpXmybfcnaH4bqJBdE4SW5RCuOEHZqmHu+2u2ZU0xyRzQ0UCZKmX8astsRd
	 jBia3ISlD3EZFrrzQiJkcw+3tNoyzhOYvo1iSeFmJK0PBtvSZUNX1RHNkzq+XpA1Bj
	 5jrEqfsJEYT+089iuP+UrufR82C0TUFulTK/6J28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74616F80084;
	Thu, 17 Mar 2022 03:24:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D9D3F8019D; Thu, 17 Mar 2022 03:24:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88634F80095
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 03:24:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88634F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rOU9qujV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B11F60FD3;
 Thu, 17 Mar 2022 02:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB34C340E9;
 Thu, 17 Mar 2022 02:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647483856;
 bh=Ix1jQ+FTzwE7Py6xt22i052YfsEmKH5ZWqPAWdPOfew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rOU9qujVX+uI4/9wMBgvpeASYF6Pp7QCCm7v8rFExMAZYljME4XvGhHrvM8+Lem7q
 dreeq5nCd89J0a1oej6Lz3z0E6cLTph6Fa7Gc0Nm8DCa48vEsk3izsQSCWvvUnirVQ
 oYW3k5XYpC9y+mkIaDGQsdG9Pb6gBdS+weljL0jRp7OwM9vD5sfrISLVQjehrQoY2A
 6+RimgJFqSLbg7rKS/Kvrno9QzEDM1kC3Td2OMrG9mzOj+XJ4CSiHI+AcF72nRjQ4e
 0SaPZfS/oGJwWGDgjLVJvMsXjJtFs8eeuKVLfpmo9AadwgL/RqoVOhwsG04c99WOTt
 Fd+wbtdwqIQQw==
Date: Thu, 17 Mar 2022 10:24:11 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH v2 1/5] ASoC: mediatek: mt8195: merge machine driver
Message-ID: <YjKby/RYpMtcxeUm@google.com>
References: <20220316060139.6211-1-trevor.wu@mediatek.com>
 <20220316060139.6211-2-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220316060139.6211-2-trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

Hi,
I didn't review too many details because I found the patch is not easy to
review.  Please consider to not reorder symbols if it can.  If it is still
hard to generate reasonable chunks or the reorders are necessary, it could
put some refactor patches prior to the "merge".

On Wed, Mar 16, 2022 at 02:01:35PM +0800, Trevor Wu wrote:
> diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
[...]
>  #include <linux/input.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/pm_runtime.h>
>  #include <sound/jack.h>
>  #include <sound/pcm_params.h>
>  #include <sound/rt5682.h>
> -#include <sound/sof.h>

Why does it remove the header?

> +struct mt8195_mt6359_priv {
> +	struct snd_soc_jack headset_jack;
> +	struct snd_soc_jack dp_jack;
> +	struct snd_soc_jack hdmi_jack;
> +	struct clk *i2so1_mclk;
> +};
> +
> +struct mt8195_card_data {
> +	const char *name;
> +	unsigned long quirk;
> +};
> +
> +struct sof_conn_stream {
> +	const char *normal_link;
> +	const char *sof_link;
> +	const char *sof_dma;
> +	int stream_dir;
> +};
[...]
> -struct sof_conn_stream {
> -	const char *normal_link;
> -	const char *sof_link;
> -	const char *sof_dma;
> -	int stream_dir;
> -};
> -
> -struct mt8195_mt6359_rt1019_rt5682_priv {
> -	struct snd_soc_jack headset_jack;
> -	struct snd_soc_jack dp_jack;
> -	struct snd_soc_jack hdmi_jack;
> -	struct clk *i2so1_mclk;
> -};

The effective operation here: rename from mt8195_mt6359_rt1019_rt5682_priv
to mt8195_mt6359_priv.  However, it somehow reorders the code.  As a result,
the change looks like more complicated than just a "merge" operation.

> -static const struct snd_soc_dapm_route mt8195_mt6359_rt1019_rt5682_routes[] = {
> -	/* speaker */
> -	{ "Speakers", NULL, "Speaker" },
> +static const struct snd_kcontrol_new mt8195_mt6359_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
> +	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> +};
> +
> +static const struct snd_soc_dapm_route mt8195_mt6359_routes[] = {
>  	/* headset */
>  	{ "Headphone Jack", NULL, "HPOL" },
>  	{ "Headphone Jack", NULL, "HPOR" },
> @@ -80,55 +94,31 @@ static const struct snd_soc_dapm_route mt8195_mt6359_rt1019_rt5682_routes[] = {
>  	{"I021", NULL, SOF_DMA_DL3},
>  };
>  
> -static const struct snd_kcontrol_new mt8195_mt6359_rt1019_rt5682_controls[] = {
> -	SOC_DAPM_PIN_SWITCH("Speakers"),
> -	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
> -	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> +static const struct snd_soc_dapm_widget mt8195_dual_speaker_widgets[] = {
> +	SND_SOC_DAPM_SPK("Left Speaker", NULL),
> +	SND_SOC_DAPM_SPK("Right Speaker", NULL),
>  };
>  
> -static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream *substream,
> -					struct snd_pcm_hw_params *params)
> -{
[...]
> +static const struct snd_kcontrol_new mt8195_dual_speaker_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Left Speaker"),
> +	SOC_DAPM_PIN_SWITCH("Right Speaker"),
> +};

Ditto.  I would expect it only renames and adds something.  However, if you
look at the block and the following, it looks like changed a lot.

> @@ -143,20 +133,20 @@ static int mt8195_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>  	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
>  	struct mt8195_afe_private *afe_priv = afe->platform_priv;
>  	struct mtkaif_param *param = &afe_priv->mtkaif_params;
> -	int phase;
> -	unsigned int monitor;
> -	int mtkaif_calibration_num_phase;
> +	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
> +	int prev_cycle_1, prev_cycle_2, prev_cycle_3;
>  	int test_done_1, test_done_2, test_done_3;
>  	int cycle_1, cycle_2, cycle_3;
> -	int prev_cycle_1, prev_cycle_2, prev_cycle_3;
> -	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
> -	int counter;
> -	bool mtkaif_calibration_ok;
>  	int mtkaif_chosen_phase[MT8195_MTKAIF_MISO_NUM];
>  	int mtkaif_phase_cycle[MT8195_MTKAIF_MISO_NUM];
> +	int mtkaif_calibration_num_phase;
> +	bool mtkaif_calibration_ok;
> +	unsigned int monitor;
> +	int counter;
> +	int phase;
>  	int i;

The reorder of variable declaration is irrelevant to the patch.  Drop them.
If it has good reason to do so, send another patch for the purpose.

> @@ -513,7 +446,7 @@ static int mt8195_playback_startup(struct snd_pcm_substream *substream)
>  	return 0;
>  }
>  
> -static const struct snd_soc_ops mt8195_playback_ops = {
> +const struct snd_soc_ops mt8195_playback_ops = {
>  	.startup = mt8195_playback_startup,

Why does it remove the `static`?

> +static int mt8195_mt6359_dev_probe(struct platform_device *pdev)
>  {
[...]
> +	match = of_match_device(pdev->dev.driver->of_match_table, &pdev->dev);
> +	if (!match || !match->data)
> +		return -EINVAL;
> +
> +	card_data = (struct mt8195_card_data *)match->data;

Use of_device_get_match_data().

> -static const struct dev_pm_ops mt8195_mt6359_rt1019_rt5682_pm_ops = {
> +const struct dev_pm_ops mt8195_mt6359_pm_ops = {
>  	.poweroff = snd_soc_poweroff,
>  	.restore = snd_soc_resume,
>  };

Why does it remove the `static`?
