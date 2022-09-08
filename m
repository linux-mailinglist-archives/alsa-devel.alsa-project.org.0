Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A07B5B2262
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 17:34:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03BFB171A;
	Thu,  8 Sep 2022 17:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03BFB171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662651279;
	bh=LLrLZcn0UuUWCJSx/9vcsiiSwses89mBp6UscFdRwJs=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dmdhCJDBzFUn30wybi5A/12wUYWrwlMeVtl7pRTANZEv30ogDstJVIN4xSlaCbZDE
	 WSoRxGk0nYcLDJmZHHb+BL0BnH1XvR9j56N1zR1gXGFQXuKp/by+NMaX2MuMEq1yNF
	 992+jnJg0Cbj7qoZey9AbpXj8OH2/KxMPb9kVwzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67D9BF8023B;
	Thu,  8 Sep 2022 17:33:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D88FBF800CB; Thu,  8 Sep 2022 17:33:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04A51F800CB
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 17:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04A51F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="LSkfEC25"
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0AE112000D;
 Thu,  8 Sep 2022 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1662651208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kdKcGQxR+2v+D+uRgeMyPmOl42z47nLjBaXhbBwGaX4=;
 b=LSkfEC257xBfJ7nk91EuX3eNbR1eWBKmOhi/2jbiRnJWsWWq0x9DNdejtL8mmjyo/JhfSD
 vIa4Onqili2PeIydC+IpO0plkswuunIq6xH5dfe9yWSD1ov7ivzekxg5jH6l18X1JH2bz1
 IrzgpSAEX+6FxT7Z79Mkq4htLlndiPiL7tSFoWCsXjuNFKEiEh3MOCsmHloxNiXI14/sbM
 woCoE1YHHxtyHDYVn43AEJLV0j0pkupNCzYbIi2eaMiIwEjpfptfCOzEyug57Cpnb3rlQy
 nf/vKZ+Gvg3UZDVIbQmLZTbVIIrrW8Oh7gB9iuWPJOaK5BYtDga0EHgV6G6IuA==
Date: Thu, 8 Sep 2022 17:33:23 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 7/8] ASoC: codecs: Add RK3308 internal audio codec driver
Message-ID: <20220908173323.3981a056@booty>
In-Reply-To: <202209082103.F4ICyyHT-lkp@intel.com>
References: <20220907142124.2532620-8-luca.ceresoli@bootlin.com>
 <202209082103.F4ICyyHT-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kbuild-all@lists.01.org, lkp@intel.com, kbuild@lists.01.org,
 Takashi Iwai <tiwai@suse.com>, Chris Morgan <macromorgan@hotmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>
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

Hello Dan,

On Thu, 8 Sep 2022 16:35:19 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Hi,
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/luca-ceresoli-bootlin-com/Add-support-for-the-internal-RK3308-audio-codec/20220907-222555
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> config: arc-randconfig-m031-20220908 (https://download.01.org/0day-ci/archive/20220908/202209082103.F4ICyyHT-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> sound/soc/codecs/rk3308_codec.c:748 rk3308_set_dai_fmt() error: uninitialized symbol 'is_master'.
> sound/soc/codecs/rk3308_codec.c:998 rk3308_codec_digital_fadeout() warn: always true condition '(l_dgain >= (0 << 0)) => (0-u32max >= 0)'
> sound/soc/codecs/rk3308_codec.c:998 rk3308_codec_digital_fadeout() warn: always true condition '(l_dgain >= (0 << 0)) => (0-u32max >= 0)'
> 
> vim +/is_master +748 sound/soc/codecs/rk3308_codec.c
> 
> 786c160ad64ae5 Luca Ceresoli 2022-09-07  680  static int rk3308_set_dai_fmt(struct snd_soc_dai *codec_dai,
> 786c160ad64ae5 Luca Ceresoli 2022-09-07  681  			      unsigned int fmt)
> 786c160ad64ae5 Luca Ceresoli 2022-09-07  682  {
> 786c160ad64ae5 Luca Ceresoli 2022-09-07  683  	struct snd_soc_component *component = codec_dai->component;
> 786c160ad64ae5 Luca Ceresoli 2022-09-07  684  	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
> 786c160ad64ae5 Luca Ceresoli 2022-09-07  685  	const unsigned int inv_bits = fmt & SND_SOC_DAIFMT_INV_MASK;
> 786c160ad64ae5 Luca Ceresoli 2022-09-07  686  	const bool inv_bitclk =
> 786c160ad64ae5 Luca Ceresoli 2022-09-07  687  		(inv_bits & SND_SOC_DAIFMT_IB_IF) ||
> 786c160ad64ae5 Luca Ceresoli 2022-09-07  688  		(inv_bits & SND_SOC_DAIFMT_IB_NF);
> 786c160ad64ae5 Luca Ceresoli 2022-09-07  689  	const bool inv_frmclk =
> 786c160ad64ae5 Luca Ceresoli 2022-09-07  690  		(inv_bits & SND_SOC_DAIFMT_IB_IF) ||
> 786c160ad64ae5 Luca Ceresoli 2022-09-07  691  		(inv_bits & SND_SOC_DAIFMT_NB_IF);
> 786c160ad64ae5 Luca Ceresoli 2022-09-07  692  
> 786c160ad64ae5 Luca Ceresoli 2022-09-07  693  	unsigned int adc_aif1 = 0, adc_aif2 = 0, dac_aif1 = 0, dac_aif2 = 0;
> 786c160ad64ae5 Luca Ceresoli 2022-09-07  694  	int grp, is_master;
> 
> is_master needs to be initialized to false.

Fixed both, and also made is_master a bool for clarity. Changes queued
for v2.

Thank you.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
