Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9BF3CD7DA
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jul 2021 17:00:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D38EF167A;
	Mon, 19 Jul 2021 16:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D38EF167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626706849;
	bh=6UruECzLdlNhaln+xO6uKGwwV46VdDEWckZUiiLrMH4=;
	h=From:To:Subject:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aNOSeJHE/x7gu/co3tYQ/4NKCKvKAPs8BiXBocE1ACH+sD9byTFmPPwJG3vJaHuC7
	 KppVSL1mNF+eYmfBDPon7UZawy5Zy0bIdA7WakwC9ARjnhsq/aZJqmVzAZzc9UmiG5
	 9sflvMKOnBx60EzjdKzKCs19z4/eGVFw49UAfxs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE84FF804CB;
	Mon, 19 Jul 2021 16:59:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F674F80254; Fri, 16 Jul 2021 19:37:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C440AF800FE
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 19:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C440AF800FE
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 877D01F4409D
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Vijendar Mukunda <vijendar.mukunda@amd.com>
Subject: Re: [PATCH V2 12/12] ASoC: amd: enable vangogh acp5x driver build
References: <20210716150809.21450-1-vijendar.mukunda@amd.com>
 <20210716150809.21450-13-vijendar.mukunda@amd.com>
Date: Fri, 16 Jul 2021 13:36:51 -0400
In-Reply-To: <20210716150809.21450-13-vijendar.mukunda@amd.com> (Vijendar
 Mukunda's message of "Fri, 16 Jul 2021 20:38:09 +0530")
Message-ID: <87h7guduto.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 19 Jul 2021 16:59:03 +0200
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 broonie@kernel.org, Alexander.Deucher@amd.com
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

Vijendar Mukunda <vijendar.mukunda@amd.com> writes:
> Vangogh ACP5x drivers can be built by selecting necessary
> kernel config option.
> The patch enables build support of the same.
>
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
> v1 -> v2: remove extra line in Make file
> ---
>  sound/soc/amd/Kconfig          |  9 +++++++++
>  sound/soc/amd/Makefile         |  1 +
>  sound/soc/amd/vangogh/Makefile | 11 +++++++++++
>  3 files changed, 21 insertions(+)
>  create mode 100644 sound/soc/amd/vangogh/Makefile
>
> diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
> index ba5a85bf7412..cc48d4e5b080 100644
> --- a/sound/soc/amd/Kconfig
> +++ b/sound/soc/amd/Kconfig
> @@ -52,3 +52,12 @@ config SND_SOC_AMD_RENOIR_MACH
>  	depends on SND_SOC_AMD_RENOIR
>  	help
>  	 This option enables machine driver for DMIC
> +
> +config SND_SOC_AMD_ACP5x
> +	tristate "AMD Audio Coprocessor-v5.x I2S support"
> +	depends on X86 && PCI
> +	help
> +	 This option enables ACP v5.x support on AMD platform
> +
> +	 By enabling this flag build will trigger for ACP PCI driver,
> +	 ACP DMA drvier, CPU DAI driver.
> diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
> index e6df2f72a2a1..07150d26f315 100644
> --- a/sound/soc/amd/Makefile
> +++ b/sound/soc/amd/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_SND_SOC_AMD_CZ_RT5645_MACH) += snd-soc-acp-rt5645-mach.o
>  obj-$(CONFIG_SND_SOC_AMD_ACP3x) += raven/
>  obj-$(CONFIG_SND_SOC_AMD_RV_RT5682_MACH) += snd-soc-acp-rt5682-mach.o
>  obj-$(CONFIG_SND_SOC_AMD_RENOIR) += renoir/
> +obj-$(CONFIG_SND_SOC_AMD_ACP5x) += vangogh/
> diff --git a/sound/soc/amd/vangogh/Makefile b/sound/soc/amd/vangogh/Makefile
> new file mode 100644
> index 000000000000..ae2cda804e2f
> --- /dev/null
> +++ b/sound/soc/amd/vangogh/Makefile
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +# Vangogh platform Support
> +snd-pci-acp5x-objs	:= pci-acp5x.o
> +snd-acp5x-i2s-objs	:= acp5x-i2s.o
> +snd-acp5x-pcm-dma-objs	:= acp5x-pcm-dma.o
> +snd-soc-acp5x-mach-objs := acp5x-nu8821-cs35l41.o
> +
> +obj-$(CONFIG_SND_SOC_AMD_ACP5x) += snd-pci-acp5x.o
> +obj-$(CONFIG_SND_SOC_AMD_ACP5x)	+= snd-acp5x-i2s.o
> +obj-$(CONFIG_SND_SOC_AMD_ACP5x) += snd-acp5x-pcm-dma.o
> +obj-$(CONFIG_SND_SOC_AMD_VANGOGH_MACH)   += snd-soc-acp5x-mach.o

Looks like CONFIG_SND_SOC_AMD_VANGOGH_MACH is not selected by another
symbol and also not configurable in kconfig.

Is it missing a kconfig entry?

-- 
Gabriel Krisman Bertazi
