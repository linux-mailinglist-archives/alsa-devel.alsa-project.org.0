Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21905416AA7
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Sep 2021 05:56:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75AE34E;
	Fri, 24 Sep 2021 05:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75AE34E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632455790;
	bh=e715FS3cIrhzYqMLX35Zp9kFMXV4B0Y2I47PhJYw8uQ=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ccyap479qKtPLhKUI+aDOIL2EH1WGaMmudYaX7hBvGnuJSPcy2eDypUUdTVGGjY4G
	 ocLF9APSP8cM0foKL2ZZ8RLZG8uflqx6FCjZtZjGYmxGyDrx2xxXSsnP1L2II81+e3
	 LNL3XW5WvQ/4trXDIJljuHTuSIOFO7adZ4Ijvbwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C793BF80246;
	Fri, 24 Sep 2021 05:55:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D27EF80246; Fri, 24 Sep 2021 05:55:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70E9BF80246
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 05:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70E9BF80246
X-UUID: b851e1b912fa409f8efbb1af59898d1b-20210924
X-UUID: b851e1b912fa409f8efbb1af59898d1b-20210924
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 74977654; Fri, 24 Sep 2021 11:54:51 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 11:54:50 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 24 Sep 2021 11:54:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Sep 2021 11:54:49 +0800
Message-ID: <1d7fe7455a054819daf05d41ab3658afdc1caced.camel@mediatek.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8195: add machine driver with
 mt6359, rt1011 and rt5682
From: Trevor Wu <trevor.wu@mediatek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Date: Fri, 24 Sep 2021 11:54:49 +0800
In-Reply-To: <4d703c5f7cf27ddc8b9886b111ffeeba0c4aa08b.camel@mediatek.com>
References: <20210910104405.11420-1-trevor.wu@mediatek.com>
 <20210910104405.11420-2-trevor.wu@mediatek.com>
 <10fc49fa-9791-0225-365d-e3074680596c@linux.intel.com>
 <4d703c5f7cf27ddc8b9886b111ffeeba0c4aa08b.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, aaronyu@google.com,
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

Hi Pierre-Louis,

On Mon, 2021-09-13 at 18:24 +0800, Trevor Wu wrote:
> On Fri, 2021-09-10 at 11:47 -0500, Pierre-Louis Bossart wrote:
> > > 
> 
> > > +
> > > +	param->mtkaif_calibration_ok = false;
> > > +	for (i = 0; i < MT8195_MTKAIF_MISO_NUM; i++) {
> > > +		param->mtkaif_chosen_phase[i] = -1;
> > > +		param->mtkaif_phase_cycle[i] = 0;
> > > +		mtkaif_chosen_phase[i] = -1;
> > > +		mtkaif_phase_cycle[i] = 0;
> > > +	}
> > > +
> > > +	if (IS_ERR(afe_priv->topckgen)) {
> > > +		dev_info(afe->dev, "%s() Cannot find topckgen
> > > controller\n",
> > > +			 __func__);
> > > +		return 0;
> > 
> > is this not an error? Why not dev_err() and return -EINVAL or
> > something?
> > 
> 
> Should I still return an error, even if the caller didn't check it?
> 
> Based on my understanding, the calibration function is used to make
> the
> signal more stable. 
> Most of the time, mtkaif still works, even though the calibration
> fails.
> I guess that's why the caller(I refered to the implementation of
> mt8192.) didn't check the return value of calibration function.
> 
> 
> > > +	}
> > > +
> > > +	pm_runtime_get_sync(afe->dev);
> > 
> > test if this worked?
> > 
> 
> Yes, if I didn't add pm_runtime_get_sync here, the calibration
> failed.
> 
> > > +	mt6359_mtkaif_calibration_enable(cmpnt_codec);
> > > +
> > > 
[...]
> > > +	mt6359_set_mtkaif_calibration_phase(cmpnt_codec,
> > > +					    chosen_phase_1,
> > > +					    chosen_phase_2,
> > > +					    chosen_phase_3);
> > > +
> > > +	mt6359_mtkaif_calibration_disable(cmpnt_codec);
> > > +	pm_runtime_put(afe->dev);
> > > +
> > > +	param->mtkaif_calibration_ok = mtkaif_calibration_ok;
> > > +	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] =
> > > chosen_phase_1;
> > > +	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] =
> > > chosen_phase_2;
> > > +	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] =
> > > chosen_phase_3;
> > > +	for (i = 0; i < MT8195_MTKAIF_MISO_NUM; i++)
> > > +		param->mtkaif_phase_cycle[i] = mtkaif_phase_cycle[i];
> > > +
> > > +	dev_info(afe->dev, "%s(), end, calibration ok %d\n",
> > > +		 __func__, param->mtkaif_calibration_ok);
> > 
> > dev_dbg?
> > 
> 
> Because we don't regard calibration failure as an error, it is a hint
> to show the calibration result.
> I prefer to keep dev_info here.
> Is it OK?
> 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mt8195_hdmitx_dptx_startup(struct snd_pcm_substream
> > > *substream)
> > > +{
> > > +	static const unsigned int rates[] = {
> > > +		48000
> > > +	};
> > > +	static const unsigned int channels[] = {
> > > +		2, 4, 6, 8
> > > +	};
> > > +	static const struct snd_pcm_hw_constraint_list
> > > constraints_rates = {
> > > +		.count = ARRAY_SIZE(rates),
> > > +		.list  = rates,
> > > +		.mask = 0,
> > > +	};
> > > +	static const struct snd_pcm_hw_constraint_list
> > > constraints_channels = {
> > > +		.count = ARRAY_SIZE(channels),
> > > +		.list  = channels,
> > > +		.mask = 0,
> > > +	};
> > 
> > you use the same const tables several times, move to a higher scope
> > and
> > reuse?
> > 
> 
> There is little difference in channels between these startup ops.
> 
> > > +	struct snd_soc_pcm_runtime *rtd =
> > > asoc_substream_to_rtd(substream);
> > > +	struct snd_pcm_runtime *runtime = substream->runtime;
> > > +	int ret;
> > > +
> > > +	ret = snd_pcm_hw_constraint_list(runtime, 0,
> > > +					 SNDRV_PCM_HW_PARAM_RATE,
> > > +					 &constraints_rates);
> > > +	if (ret < 0) {
> > > +		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = snd_pcm_hw_constraint_list(runtime, 0,
> > > +					 SNDRV_PCM_HW_PARAM_CHANNELS,
> > > +					 &constraints_channels);
> > > +	if (ret < 0) {
> > > +		dev_err(rtd->dev, "hw_constraint_list channel
> > > failed\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > 
> > > +
> > > +static struct platform_driver mt8195_mt6359_rt1011_rt5682_driver
> > > =
> > > {
> > > +	.driver = {
> > > +		.name = "mt8195_mt6359_rt1011_rt5682",
> > > +#ifdef CONFIG_OF
> > > +		.of_match_table = mt8195_mt6359_rt1011_rt5682_dt_match,
> > > +#endif
> > > +		.pm = &mt8195_mt6359_rt1011_rt5682_pm_ops,
> > > +	},
> > > +	.probe = mt8195_mt6359_rt1011_rt5682_dev_probe,
> > > +};
> > > +
> > > +module_platform_driver(mt8195_mt6359_rt1011_rt5682_driver);
> > > +
> > > +/* Module information */
> > > +MODULE_DESCRIPTION("MT8195-MT6359-RT1011-RT5682 ALSA SoC machine
> > > driver");
> > > +MODULE_AUTHOR("Trevor Wu <trevor.wu@mediatek.com>");
> > > +MODULE_LICENSE("GPL v2");
> > 
> > "GPL" is enough
> > 
> 
> I see many projects use GPL v2 here, and all mediatek projects use
> GPL
> v2, too.
> I'm not sure which one is better.
> Do I need to modify this?
> 

> 
> > > +MODULE_ALIAS("mt8195_mt6359_rt1011_rt5682 soc card");
> > > 

Gentle ping.

Thanks,
Trevor

