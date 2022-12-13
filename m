Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 109E964B384
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 11:47:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F50D2143;
	Tue, 13 Dec 2022 11:46:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F50D2143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670928463;
	bh=w1yA+xs8yCYHN5qeaHYkgBaLhwgeFIfgr7wKK0PyC9g=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=n86QR9sgx5YC+c+4U7YJ2lhGnLGW1oiz+yIPwlpPV4m9T7VWULdr2+63kzai3joBD
	 NfJUEy7mFF9Grr1vc7WLGsPdwitcDWeTlqI+0RRFutyHhFXZV+Kq1rCSfyZV2MTpxi
	 jMqTkIwSWUCF5X6N7csXa4fBNahY6DJG6Kepoy0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A300F80519;
	Tue, 13 Dec 2022 11:45:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81E40F80537; Tue, 13 Dec 2022 11:45:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B66EF80519
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 11:45:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B66EF80519
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=BBnxouu9
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6BCFC6602AB2;
 Tue, 13 Dec 2022 10:45:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1670928335;
 bh=w1yA+xs8yCYHN5qeaHYkgBaLhwgeFIfgr7wKK0PyC9g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BBnxouu90Jw41QL+9sQ3fE7jPlrtNm0wtOLRX1u1SHrbK8ptogo5MnN6bK2ZDvokw
 //dOdy3sb79D2TwptTYBpkcm403QVTXMxTAlz9+nMbqhV5ipBf5R7JPM2gyfFAVch1
 Pkan9wOs3Pv/c8ssp38ZO1/iH8Lse9++MnyzVqtuT34i0tcDQeEs+Yw6vGbls3VpRj
 BGfQHWMbZ8ahJ8e5Kf22dFJFCdgPw55eG+aLP3FBIU/UUgOgDZ43YPeCzDSBQa+bBi
 GyhteaSB5XtFQCUCkmr5yokeDPJsaU778tetZXPKzdYG9gJUxsLM/DDyuLmh3zOJM+
 ay4McLmBmQPRg==
Message-ID: <869cfa5a-2cfa-e5b7-b8f5-a79b9b364b25@collabora.com>
Date: Tue, 13 Dec 2022 11:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 05/12] ASoC: mediatek: mt8188: support etdm in platform
 driver
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-6-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221208033148.21866-6-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Il 08/12/22 04:31, Trevor Wu ha scritto:
> Add mt8188 etdm dai driver support.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
> I don't add Reviewed-by tag because one new header file is included
> in the patch to resolve compiling issue found by kernel test robot.
> Additionally, I re-layout the code for better understanding of the
> follow-up patch.
> ---
>   sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 2591 +++++++++++++++++++
>   1 file changed, 2591 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
> new file mode 100644
> index 000000000000..c653fa5e3f85
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c

..snip..

> +
> +static void mt8188_dai_etdm_parse_of(struct mtk_base_afe *afe)
> +{
> +	const struct device_node *of_node = afe->dev->of_node;
> +	struct mt8188_afe_private *afe_priv = afe->platform_priv;
> +	struct mtk_dai_etdm_priv *etdm_data;
> +	int i, j;
> +	char prop[48];
> +	u8 disable_chn[MT8188_ETDM_MAX_CHANNELS];
> +	int max_chn = MT8188_ETDM_MAX_CHANNELS;
> +	u32 sel;
> +	int ret;
> +	int dai_id;
> +	unsigned int sync_id;
> +	struct {
> +		const char *name;
> +		const unsigned int sync_id;
> +	} of_afe_etdms[MT8188_AFE_IO_ETDM_NUM] = {
> +		{"etdm-in1", ETDM_SYNC_FROM_IN1},
> +		{"etdm-in2", ETDM_SYNC_FROM_IN2},
> +		{"etdm-out1", ETDM_SYNC_FROM_OUT1},
> +		{"etdm-out2", ETDM_SYNC_FROM_OUT2},
> +		{"etdm-out3", ETDM_SYNC_FROM_OUT3},
> +	};
> +
> +	for (i = 0; i < MT8188_AFE_IO_ETDM_NUM; i++) {
> +		dai_id = ETDM_TO_DAI_ID(i);
> +		etdm_data = afe_priv->dai_priv[dai_id];
> +
> +		ret = snprintf(prop, sizeof(prop),
> +			       "mediatek,%s-mclk-always-on-rate",
> +			       of_afe_etdms[i].name);
> +		if (ret < 0) {
> +			dev_info(afe->dev, "%s snprintf err=%d\n",

Is this property optional? If yes, this dev_info() must be a dev_dbg(),
otherwise, this must be a dev_err().

Please fix all prints to use the right message level.

> +				 __func__, ret);
> +			return;

Also, is it possible to specify this property only on selected eTDMs?

As it is right now, if anyone wants to specify this only on, for example,
etdm-out1 and out2, that won't work.
In that case, you should replace that return with a `continue`.

P.S.: I'm raising this question because you're not forcing "all or nothing"
       in commit [10/12] where you introduce the bindings for this driver,
       so I suppose that returning (hence stopping to parse) is a mistake.

> +		}
> +		ret = of_property_read_u32(of_node, prop, &sel);
> +		if (ret == 0) {
> +			etdm_data->mclk_dir = SND_SOC_CLOCK_OUT;
> +			if (mtk_dai_etdm_cal_mclk(afe, sel, dai_id))
> +				dev_info(afe->dev, "%s unsupported mclk %uHz\n",
> +					 __func__, sel);
> +		}
> +


Regards,
Angelo

