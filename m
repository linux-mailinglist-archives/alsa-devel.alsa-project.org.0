Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E43B280F4E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 10:53:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20B561EEE;
	Fri,  2 Oct 2020 10:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20B561EEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601628817;
	bh=waJnn41M00lpRqIbVTIzEDQ/uF7/GVtUC4qmN6jOUu0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IPbYvZ0MrLOIAN/6ikyraf2HruhfHLxuMer8AzbXNgIxFXnuS092RhskDMdfx6qCR
	 5Cb8buKkO7wE9tGGoQxVXIf0gubv+WKEZR0IBP4upc1qEbij1k0WdGNwu2tWIVZSF3
	 g5cv471uYyXbM2ooTTAoyrwAgHZMAtqnMbXjA+BI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A02A0F800E5;
	Fri,  2 Oct 2020 10:52:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EACDF800E5; Fri,  2 Oct 2020 10:52:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D726F800E5
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 10:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D726F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Q6JBHgBm"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f76ea050000>; Fri, 02 Oct 2020 01:51:17 -0700
Received: from [10.25.97.216] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 08:52:00 +0000
Subject: Re: [PATCH v3 10/13] ASoC: tegra: Add audio graph based card driver
To: Dmitry Osipenko <digetx@gmail.com>, <broonie@kernel.org>,
 <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <pierre-louis.bossart@linux.intel.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <thierry.reding@gmail.com>,
 <jonathanh@nvidia.com>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
 <1601573587-15288-11-git-send-email-spujar@nvidia.com>
 <98f01f9e-96f8-6867-1af3-475294e81a9d@gmail.com>
 <352b5f57-baa5-8905-4ac9-1281268270a8@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <c2cc4b56-8abb-22b0-13ea-42f1db6dc642@nvidia.com>
Date: Fri, 2 Oct 2020 14:21:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <352b5f57-baa5-8905-4ac9-1281268270a8@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601628677; bh=MKlVcqKLPdDu8OBlYPBwuNP2isTdKIOp/ktFx21aA+U=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=Q6JBHgBmCmScUpfFBsiclVC+L3nHbZj7/FeXu1PPFwxGk4uA9yv+yt3bFjW/dGES1
 cJlgXeXUUNDMGphPJzP+7p9V3Auoa44c+FptQp6W7/63SpbIXcKtY0ZABN/FWkeXWe
 tQOqKQwPWlwqRWzsj3+IcaZvtItU62hWp6JsA8WEzSzaFPa9k6NJPnVcyj12LbkSl0
 3IRENlQzEtLu/zoumUrzNgxIwTuu95U2Ct50qqkzMh57U0AUK/kCRgYISaKNGFguxm
 upKJLJXhDd77WGhbc//ygaVpADM23m4Q9I62+C7xpFcx1ai7V3Tzcs1P+CS8oRlhsJ
 53FivqyFeer+g==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 nicoleotsuka@gmail.com, swarren@nvidia.com, linux-kernel@vger.kernel.org,
 atalambedu@nvidia.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 nwartikar@nvidia.com, linux-tegra@vger.kernel.org, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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


>>> +/* Setup PLL clock as per the given sample rate */
>>> +static int tegra_audio_graph_update_pll(struct snd_pcm_substream *substream,
>>> +                                    struct snd_pcm_hw_params *params)
>>> +{
>>> +    struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
>>> +    struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
>>> +    struct device *dev = rtd->card->dev;
>>> +    struct tegra_audio_graph_data *graph_data =
>>> +            (struct tegra_audio_graph_data *)priv->data;
>>> +    struct tegra_audio_chip_data *chip_data =
>>> +            (struct tegra_audio_chip_data *)of_device_get_match_data(dev);
>> void* doesn't need casting
>>
> There are several similar places in the code. Not a big deal, but this
> makes code less readable than it could be.

I will drop these in next revision.
