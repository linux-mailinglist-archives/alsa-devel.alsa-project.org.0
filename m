Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FAA4DBDC2
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 05:19:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A90F116A5;
	Thu, 17 Mar 2022 05:18:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A90F116A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647490739;
	bh=bPY/gAPr1SHsfXHKJfCSWOOPFLqoi3W9ouKsn6zKTE4=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vtpEVfAoGDtZ4CyU6cJrYJ/Y3BnG0GXU+zudnRHvVQ3/plXTGFiE2jKURxzrBGWwg
	 pJvw+3GiLdQGwVbm/wAn5K8qahACju3rSOHtHlmClKbSUi1lCutHbLJS8utWumRWen
	 89OtemprAAM623PVjpqNGp4x8QN3ndB6Lyk7KZVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EABAF8014C;
	Thu, 17 Mar 2022 05:17:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E796F80087; Thu, 17 Mar 2022 05:17:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E299F80087
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 05:17:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E299F80087
X-UUID: a0f16e058f184ebab77a56d51986dac9-20220317
X-UUID: a0f16e058f184ebab77a56d51986dac9-20220317
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 315387681; Thu, 17 Mar 2022 12:17:31 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Mar 2022 12:17:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 12:17:30 +0800
Message-ID: <946a35efc1983c8f941f2350d4f9e0245dcbf95a.camel@mediatek.com>
Subject: Re: [PATCH v2 1/5] ASoC: mediatek: mt8195: merge machine driver
From: Trevor Wu <trevor.wu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Date: Thu, 17 Mar 2022 12:17:30 +0800
In-Reply-To: <YjKby/RYpMtcxeUm@google.com>
References: <20220316060139.6211-1-trevor.wu@mediatek.com>
 <20220316060139.6211-2-trevor.wu@mediatek.com>
 <YjKby/RYpMtcxeUm@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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

On Thu, 2022-03-17 at 10:24 +0800, Tzung-Bi Shih wrote:
> Hi,
> I didn't review too many details because I found the patch is not
> easy to
> review.  Please consider to not reorder symbols if it can.  If it is
> still
> hard to generate reasonable chunks or the reorders are necessary, it
> could
> put some refactor patches prior to the "merge".

Hi Tzung-Bi,

Thanks for your suggestion.
Originally, I try to delete the old machine drivers and create a new
one, so the layout is reordered and some functions are copied from
mt8195-mt6359-rt1011-rt5682.c. But the git patch becomes a diff with
mt8195-mt6359-rt1019-rt5682.c.

I can split the one into two patches in v3, one is "merge" and another
one is "revise".
I hope it can make the review easier.

> 
> On Wed, Mar 16, 2022 at 02:01:35PM +0800, Trevor Wu wrote:
> > diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-
> > rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> 
> [...]
> >  #include <linux/input.h>
> >  #include <linux/module.h>
> > +#include <linux/of_device.h>
> >  #include <linux/pm_runtime.h>
> >  #include <sound/jack.h>
> >  #include <sound/pcm_params.h>
> >  #include <sound/rt5682.h>
> > -#include <sound/sof.h>
> 
> Why does it remove the header?
It seems that the header is redundant, because the driver works on my
platform.
But I will double confirm it.

> 
> > +struct mt8195_mt6359_priv {
> > +	struct snd_soc_jack headset_jack;
> > +	struct snd_soc_jack dp_jack;
> > +	struct snd_soc_jack hdmi_jack;
> > +	struct clk *i2so1_mclk;
> > +};
> > +
> > +struct mt8195_card_data {
> > +	const char *name;
> > +	unsigned long quirk;
> > +};
> > +
> > +struct sof_conn_stream {
> > +	const char *normal_link;
> > +	const char *sof_link;
> > +	const char *sof_dma;
> > +	int stream_dir;
> > +};
> 
> [...]
> > -struct sof_conn_stream {
> > -	const char *normal_link;
> > -	const char *sof_link;
> > -	const char *sof_dma;
> > -	int stream_dir;
> > -};
> > -
> > -struct mt8195_mt6359_rt1019_rt5682_priv {
> > -	struct snd_soc_jack headset_jack;
> > -	struct snd_soc_jack dp_jack;
> > -	struct snd_soc_jack hdmi_jack;
> > -	struct clk *i2so1_mclk;
> > -};
> 
> The effective operation here: rename from
> mt8195_mt6359_rt1019_rt5682_priv
> to mt8195_mt6359_priv.  However, it somehow reorders the code.  As a
> result,
> the change looks like more complicated than just a "merge" operation.
> 
> > -static const struct snd_soc_dapm_route
> > mt8195_mt6359_rt1019_rt5682_routes[] = {
> > -	/* speaker */
> > -	{ "Speakers", NULL, "Speaker" },
> > +static const struct snd_kcontrol_new mt8195_mt6359_controls[] = {
> > +	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
> > +	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> > +};
> > +
> > +static const struct snd_soc_dapm_route mt8195_mt6359_routes[] = {
> >  	/* headset */
> >  	{ "Headphone Jack", NULL, "HPOL" },
> >  	{ "Headphone Jack", NULL, "HPOR" },
> > @@ -80,55 +94,31 @@ static const struct snd_soc_dapm_route
> > mt8195_mt6359_rt1019_rt5682_routes[] = {
> >  	{"I021", NULL, SOF_DMA_DL3},
> >  };
> >  
> > -static const struct snd_kcontrol_new
> > mt8195_mt6359_rt1019_rt5682_controls[] = {
> > -	SOC_DAPM_PIN_SWITCH("Speakers"),
> > -	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
> > -	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> > +static const struct snd_soc_dapm_widget
> > mt8195_dual_speaker_widgets[] = {
> > +	SND_SOC_DAPM_SPK("Left Speaker", NULL),
> > +	SND_SOC_DAPM_SPK("Right Speaker", NULL),
> >  };
> >  
> > -static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream
> > *substream,
> > -					struct snd_pcm_hw_params
> > *params)
> > -{
> 
> [...]
> > +static const struct snd_kcontrol_new
> > mt8195_dual_speaker_controls[] = {
> > +	SOC_DAPM_PIN_SWITCH("Left Speaker"),
> > +	SOC_DAPM_PIN_SWITCH("Right Speaker"),
> > +};
> 
> Ditto.  I would expect it only renames and adds something.  However,
> if you
> look at the block and the following, it looks like changed a lot.
> 
> > @@ -143,20 +133,20 @@ static int
> > mt8195_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
> >  	struct mtk_base_afe *afe =
> > snd_soc_component_get_drvdata(cmpnt_afe);
> >  	struct mt8195_afe_private *afe_priv = afe->platform_priv;
> >  	struct mtkaif_param *param = &afe_priv->mtkaif_params;
> > -	int phase;
> > -	unsigned int monitor;
> > -	int mtkaif_calibration_num_phase;
> > +	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
> > +	int prev_cycle_1, prev_cycle_2, prev_cycle_3;
> >  	int test_done_1, test_done_2, test_done_3;
> >  	int cycle_1, cycle_2, cycle_3;
> > -	int prev_cycle_1, prev_cycle_2, prev_cycle_3;
> > -	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
> > -	int counter;
> > -	bool mtkaif_calibration_ok;
> >  	int mtkaif_chosen_phase[MT8195_MTKAIF_MISO_NUM];
> >  	int mtkaif_phase_cycle[MT8195_MTKAIF_MISO_NUM];
> > +	int mtkaif_calibration_num_phase;
> > +	bool mtkaif_calibration_ok;
> > +	unsigned int monitor;
> > +	int counter;
> > +	int phase;
> >  	int i;
> 
> The reorder of variable declaration is irrelevant to the patch.  Drop
> them.
> If it has good reason to do so, send another patch for the purpose.

This function is copied from mt8195-mt6359-rt1011-rt5682.c, because
this is the latest version of mt8195_mt6359_mtkaif_calibration().
The reordering is suggested by the reviewer.


> 
> > @@ -513,7 +446,7 @@ static int mt8195_playback_startup(struct
> > snd_pcm_substream *substream)
> >  	return 0;
> >  }
> >  
> > -static const struct snd_soc_ops mt8195_playback_ops = {
> > +const struct snd_soc_ops mt8195_playback_ops = {
> >  	.startup = mt8195_playback_startup,
> 
> Why does it remove the `static`?

Sorry, I will add it in v3.

> 
> > +static int mt8195_mt6359_dev_probe(struct platform_device *pdev)
> >  {
> 
> [...]
> > +	match = of_match_device(pdev->dev.driver->of_match_table,
> > &pdev->dev);
> > +	if (!match || !match->data)
> > +		return -EINVAL;
> > +
> > +	card_data = (struct mt8195_card_data *)match->data;
> 
> Use of_device_get_match_data().

OK.

> 
> > -static const struct dev_pm_ops mt8195_mt6359_rt1019_rt5682_pm_ops
> > = {
> > +const struct dev_pm_ops mt8195_mt6359_pm_ops = {
> >  	.poweroff = snd_soc_poweroff,
> >  	.restore = snd_soc_resume,
> >  };
> 
> Why does it remove the `static`?

I will add it in v3.

Thanks,
Trevor

