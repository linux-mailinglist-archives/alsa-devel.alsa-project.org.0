Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD364D799D
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 04:18:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 806BB16D3;
	Mon, 14 Mar 2022 04:17:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 806BB16D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647227880;
	bh=pqkDNAeAEYNvG49k/Hx0tByN0ecvsp2DdmQ6if+3LdA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PU0hkSmVKBO+zrnCMk9aISFtW/Vm55Dy5/LXoZemCrDwxgU4uBTvUnxU9slaPvHF3
	 mAb3oQMn9Ozx3qwjN54YAsiAq7aDjm+Rt6/UCE7iyKQT4Ss7gkB1Lc9CgIIN2Y2KJ/
	 1ft/5eHwdlkKtRUem7pR+sQxhvf1W8y7/96QGIPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7FA6F80095;
	Mon, 14 Mar 2022 04:16:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCD33F80139; Mon, 14 Mar 2022 04:16:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A742F8011C
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 04:16:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A742F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K6stHjXB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F62D60F7C;
 Mon, 14 Mar 2022 03:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C70CC340E9;
 Mon, 14 Mar 2022 03:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647227801;
 bh=pqkDNAeAEYNvG49k/Hx0tByN0ecvsp2DdmQ6if+3LdA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K6stHjXByT/LIIEPIIN7gV5+ue1kVhi02UDo/UKc/m29vF0fX3xut4Yg4viAqkjQ6
 1xe5srH6/IkKVbXiIHrX2MrjP8vuOu03F5X+2fbduJUhQ7Fnk1h9me4H3aqfbCngOp
 dxsGOek5ppdJBELp7JOkg0DA8kH+UwxOsJ9fdy27kGaHlG8nEHE8jQIV+W4X8tUxOg
 azJ/56yD5EYylptV+CI2SzgAZhq4poAfP/p1mNf5P3Vk5pqFwi56V3pfdYEm4pX+aN
 Y1vEaMqAca9yOZE7ajA25CxUIDKZDeJH6MVkyab2wvikK3vpXfRqig5ckIY6hTAcJj
 fR4pOtOJOq5Qw==
Date: Mon, 14 Mar 2022 11:16:36 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v4 2/2] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Message-ID: <Yi6zlIvA6t+yEbza@google.com>
References: <20220311162213.6942-1-jiaxin.yu@mediatek.com>
 <20220311162213.6942-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311162213.6942-3-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, linmq006@gmail.com,
 kernel test robot <lkp@intel.com>, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
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

On Sat, Mar 12, 2022 at 12:22:13AM +0800, Jiaxin Yu wrote:
> Supports machines with rt1015p and rt5682s. Uses new proposed compatible
> string "mt8192_mt6359_rt1015p_rt5682s". Using define to simplifies card
> name and compatible name, and uses the snd_soc_of_get_dai_link_codecs()
> to complete the configuration of dai_link's codecs.

Rephrase the paragraph and consider to use imperative mood as [1] suggests.

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

The patch includes multiple changes.  Could you further separate it into:
1. Refactor for I2S3 DAI links for original amps.
2. Refactor for I2S8 and I2S9 DAI links for original headset codec RT5682.
3. Support mt8192_mt6359_rt1015p_rt5682s for RT5682S.

> Reported-by: kernel test robot <lkp@intel.com>

The tag can be dropped as "Supports machines with rt1015p and rt5682s" is not
an idea from the bot.  Put it in change logs if you would like it to be a
record.

> +static int mt8192_mt6359_card_set_be_link(struct snd_soc_card *card,
> +					  struct snd_soc_dai_link *link,
> +					  struct device_node *node,
> +					  char *link_name)
> +{
> +	int ret;
> +
> +	if (node && strcmp(link->name, link_name) == 0) {
> +		ret = snd_soc_of_get_dai_link_codecs(card->dev, node, link);
> +		if (ret < 0) {
> +			dev_err(card->dev, "get dai link codecs fail\n");

How about using dev_err_probe()?  As the callers also report errors if
mt8192_mt6359_card_set_be_link() fails, the log can be dropped.

>  static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
>  {
>  	struct snd_soc_card *card;
> -	struct device_node *platform_node, *hdmi_codec;
> +	struct device_node *platform_node, *hdmi_codec, *headset_codec, *speaker_codec;
>  	int ret, i;
>  	struct snd_soc_dai_link *dai_link;
>  	struct mt8192_mt6359_priv *priv;
> +	struct device *dev;
[...]
> +	dev = &pdev->dev;

I don't think it could help too much unless it was struggling for code
columns.  Please consider to drop the variable or you should s/&pdev->dev/dev/g
for the function.

> +	speaker_codec = of_get_child_by_name(dev->of_node, "mediatek,speaker-codec");
> +	if (!speaker_codec) {
> +		ret = -EINVAL;
> +		dev_err_probe(dev, ret, "Property 'speaker_codec' missing or invalid\n");
> +		goto err_speaker_codec;
> +	}
> +
> +	headset_codec = of_get_child_by_name(dev->of_node, "mediatek,headset-codec");
> +	if (!headset_codec) {
> +		ret = -EINVAL;
> +		dev_err_probe(dev, ret, "Property 'headset_codec' missing or invalid\n");
> +		goto err_headset_codec;
> +	}

Are these new DT bindings?  They are not in
Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml.

> +		ret = mt8192_mt6359_card_set_be_link(card, dai_link, speaker_codec, "I2S3");
> +		if (ret) {
> +			dev_err_probe(&pdev->dev, ret, "%s set speaker_codec fail\n",

As mentioned above, I don't think `dev` could help too much.  However, to be
consistent, either drop the `dev` variable or use `dev` here.

> +		ret = mt8192_mt6359_card_set_be_link(card, dai_link, headset_codec, "I2S8");
> +		if (ret) {
> +			dev_err_probe(&pdev->dev, ret, "%s set headset_codec fail\n",
> +				      dai_link->name);

Ditto.

> +		ret = mt8192_mt6359_card_set_be_link(card, dai_link, headset_codec, "I2S9");
> +		if (ret) {
> +			dev_err_probe(&pdev->dev, ret, "%s set headset_codec fail\n",
> +				      dai_link->name);

Ditto.

>  	ret = mt8192_afe_gpio_init(&pdev->dev);
>  	if (ret) {
> -		dev_err(&pdev->dev, "init gpio error %d\n", ret);
> -		goto put_hdmi_codec;
> +		dev_err_probe(&pdev->dev, ret, "%s init gpio error\n", __func__);

Ditto.

>  	ret = devm_snd_soc_register_card(&pdev->dev, card);
> -
> -put_hdmi_codec:
> +	if (ret)
> +		dev_err_probe(&pdev->dev, ret,

Ditto.

> +err_probe:
> +	of_node_put(headset_codec);
> +err_headset_codec:
> +	of_node_put(speaker_codec);
> +err_speaker_codec:
>  	of_node_put(hdmi_codec);
> -put_platform_node:
> +err_hdmi_codec:
>  	of_node_put(platform_node);
> +err_platform_node:
> +

The new line can be dropped.
