Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CB38712C
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 06:58:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18A201663;
	Fri,  9 Aug 2019 06:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18A201663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565326735;
	bh=q13soB8Lf6TH08jFDhxEiZ/xgC1ErcR2nKmVLQp7yjg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rgG6rUY+hxsinb37JAx0E/b9ws0++fweKy7nOUGMuN6RSv8ix8U6jg7Oxhxv77SaT
	 fJODvUXbB7EGdbxL1io5dthGqFlZ51K9yxK+3vV67l0E4aDWBxzLKMNjT8FdY9E2a0
	 v9FnRKqdrl5al8y6daRB1lUozhsQIzdll8pmm32E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D275F804AB;
	Fri,  9 Aug 2019 06:57:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76407F804AB; Fri,  9 Aug 2019 06:57:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E827CF8036B
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 06:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E827CF8036B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rEQXtV1o"
Received: from localhost (unknown [122.167.65.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD7C22173E;
 Fri,  9 Aug 2019 04:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565326669;
 bh=c2r9FC9z+EDj4pfOEGxUvJFcx8xbR4EhmThEzzCOMRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rEQXtV1oQBgjC9+EI0rtsFoOwtAFPNHyZWBA4tRxjGk3V3wHBC8NrVusknkHTFVPJ
 nDnn9FDpvWmdLV+QH266JQjeEfMa2NPt0XWZ7QGP9XXbdGGoD/4dfpjqc4w95G/LkB
 /OLw++KZcT/y1UU5qfggjoF/s2R2qA132VIaUxoY=
Date: Fri, 9 Aug 2019 10:26:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190809045630.GH12733@vkoul-mobl.Dlink>
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, robh+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 0/4] ASoC: codecs: Add WSA881x Smart
 Speaker amplifier support
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

On 08-08-19, 15:45, Srinivas Kandagatla wrote:
> This patchset adds support to WSA8810/WSA8815 Class-D Smart Speaker
> Amplifier which is SoundWire interfaced.
> This also adds support to some missing bits in SoundWire bus layer like
> Device Tree support and module_sdw_driver macro.
                                ^^^^^^^^^^^^^^^
That part we already applied :D

> This patchset along with DB845c machine driver and WCD934x codec driver
> has been tested on SDM845 SoC based DragonBoard DB845c with two
> WSA8810 speakers.
> 
> Most of the code in this driver is rework of Qualcomm downstream drivers
> used in Andriod. Credits to Banajit Goswami and Patrick Lai's Team.
> 
> TODO:
> 	Add thermal sensor support in WSA881x.
> 
> This patchset also depends on the soundwire Kconfig patch
> https://lkml.org/lkml/2019/7/18/834 from Pierre
> 
> Thanks,
> srini
> 
> Changes since v1 RFC:
> - bindings document renamed to slave.txt
> - fix error code from dt slave parsing
> 
> Srinivas Kandagatla (4):
>   dt-bindings: soundwire: add slave bindings
>   soundwire: core: add device tree support for slave devices
>   dt-bindings: ASoC: Add WSA881x bindings
>   ASoC: codecs: add wsa881x amplifier support
> 
>  .../bindings/sound/qcom,wsa881x.txt           |   27 +
>  .../devicetree/bindings/soundwire/slave.txt   |   46 +
>  drivers/soundwire/bus.c                       |    2 +
>  drivers/soundwire/bus.h                       |    1 +
>  drivers/soundwire/slave.c                     |   47 +
>  sound/soc/codecs/Kconfig                      |   10 +
>  sound/soc/codecs/Makefile                     |    2 +
>  sound/soc/codecs/wsa881x.c                    | 1160 +++++++++++++++++
>  8 files changed, 1295 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.txt
>  create mode 100644 Documentation/devicetree/bindings/soundwire/slave.txt
>  create mode 100644 sound/soc/codecs/wsa881x.c
> 
> -- 
> 2.21.0

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
