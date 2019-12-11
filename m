Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7B111A97F
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 12:01:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9110E1655;
	Wed, 11 Dec 2019 12:00:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9110E1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576062106;
	bh=hdPvfNo5Qjz0FunPQN4oYDl4k+UwlVykOURoFbVQkfE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gm3oS8sfdfFq8DE2guiDnq9gnf9YyPj+8Utoalh2MhXEyRwOkfY7+TEHouLdlL09n
	 5r7f/RnzSOolrgjxvS6qMC/DknZpLd4WIVRJs2Ke2X4pYchMHZVvzUASpTWv15L8vl
	 1W5ITokHszUsFdmIs2nGsDZJxV7U18Gly8fNZ94o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A9C6F80256;
	Wed, 11 Dec 2019 12:00:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6270DF80256; Wed, 11 Dec 2019 12:00:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC052F8011E
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 12:00:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC052F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="XYF0uUIP"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df0cc260000>; Wed, 11 Dec 2019 02:59:52 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 11 Dec 2019 02:59:59 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 11 Dec 2019 02:59:59 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 10:59:57 +0000
Received: from [10.26.11.206] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 10:59:53 +0000
To: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>
References: <20191210195333.648018-1-arnd@arndb.de>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <d739240f-aaa6-c310-9c68-16c1a08ce759@nvidia.com>
Date: Wed, 11 Dec 2019 10:59:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191210195333.648018-1-arnd@arndb.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576061992; bh=MQK8ZVgrVvXj2CCi28ItwK2/xlFo7vqiSDqFxR2ycEA=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=XYF0uUIPrfVZWGpMaViwy03efYcRVbDgtnOcU0FZmQogsvCRIi7nl5qF7oHsMi1cB
 UR126BMNKqOpTLRdnWGkSTzRk1y76Gg2XyJutGSZDP55Kvi80aBdQ2MWCt2l+Wm0QJ
 EKxVYbjxVxz/Bowr/qYlCXOlVyTcB0405ASX3VXwZJkuLpNzthrWpF8LH4dGkoMbD6
 2ZCio9eSOkANH2ysYs0lWfvl3zyd8Ck/BoCTPNDZSVOBwAcZTUp01vLexN1vtHDq50
 jhnyS/6aeYyuK7icmpNbnibMOIX9aTAM19weFl61QAtNC+aaUb7XGGeOforRV9Wm11
 FJug7rWvb8ObQ==
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-tegra@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Zhang <benzh@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 linux-arm-kernel@lists.infradead.org,
 KaiChieh Chuang <kaichieh.chuang@mediatek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt5677: add SPI_MASTER dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 10/12/2019 19:52, Arnd Bergmann wrote:
> When CONFIG_SPI is disabled, the newly added code for the DSP
> firmware loading fails to link:
> 
> ERROR: "rt5677_spi_hotword_detected" [sound/soc/codecs/snd-soc-rt5677.ko] undefined!
> ERROR: "rt5677_spi_write" [sound/soc/codecs/snd-soc-rt5677.ko] undefined!

Would it be better if the above functions or the functions that call
these are conditional on CONFIG_SND_SOC_RT5677_SPI?

> Add a dependency to prevent this configuration.
> 
> Note: the does not work with the DT probing, as there is no binding

Are you missing 'SPI' or something here?

> for the SPI half of the driver, but nothing seems to be using that
> with the mainline kernel anyway.

From a Tegra perspective, given that we don't use SPI in conjunction
with the rt5677 codec, only I2C so far, I am not sure we should make the
tegra_rt5677 driver dependent upon it. We should be able to operate
without the SPI bits enabled.

Cheers
Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
