Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B1C55A48F
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jun 2022 01:05:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EC74857;
	Sat, 25 Jun 2022 01:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EC74857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656111923;
	bh=lqqOotoDfbmKP21HkUUVPT/VmiiWc4JV7S8prnYryL8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RS0meoDsRC0NfSZoZSoDRwO7exCnvl9Cr3JDnqVGSC08qfJ4i4HLNIkqjmOYclAWK
	 v+i/Ux5NFpNAJkgHrNlp2RWv3EqtMf5Eb/AfpwLj+HejSekIV78GDpzvL4vv8EfD4u
	 G5tXtbsFRms5irNLFEDGG75u9VeHodI/uGPhaSPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E018BF80165;
	Sat, 25 Jun 2022 01:04:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CCF4F80139; Sat, 25 Jun 2022 01:04:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D65CAF800CB
 for <alsa-devel@alsa-project.org>; Sat, 25 Jun 2022 01:04:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D65CAF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="cFlu/UrL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=UgGZSiTann1FsLffy7zbYdwIpMQCZ2jn74pvxu+ZQ/c=; b=cFlu/UrLn0Z4Pv2rVtyWUCAyat
 lZxyI3lABiXr82Vnf+AwvWvvqJ9Hxsan+CfMfb8ldL/6Q5clOShbiBXYlmp5VznI8245Ot3Y7snvR
 sbidiGJnIdyARj8c48QHB9W/MKbBoLbMF3qqoM/UvpEngt4k4a/rhZCKxTpDbgsgY2Cj7m3+eud4y
 HZJtIApT5RrlwjMoQr/00BV2G8v561VHoRzHfrOldTNyDBqXFu+C7OBwhMg+966VCao/7F3aNahIE
 pKISP8ZQRs0CR9Scn01nkwJw0nKTEqFrzaS5DD9/J6xXWhxRV2oS2ugA3VRxbJzPcrp6mgHEKeML1
 ZNwM3ouA==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o4sLL-0044s6-4w; Fri, 24 Jun 2022 23:04:03 +0000
Message-ID: <6a210c39-2a04-2d39-9d5f-51b4e777b81d@infradead.org>
Date: Fri, 24 Jun 2022 16:04:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] ASoC: amd: acp: Add legacy audio driver support for
 Rembrandt platform
Content-Language: en-US
To: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220624194821.287462-1-Vsujithkumar.Reddy@amd.com>
 <20220624194821.287462-4-Vsujithkumar.Reddy@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220624194821.287462-4-Vsujithkumar.Reddy@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, venkataprasad.potturu@amd.com,
 Meng Tang <tangmeng@uniontech.com>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>, Jia-Ju Bai <baijiaju1990@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Vijendar.Mukunda@amd.com,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Dan Carpenter <dan.carpenter@oracle.com>, Syed Saba kareem <ssabakar@amd.com>
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

Hi--

On 6/24/22 12:48, V sujith kumar Reddy wrote:
> diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
> index 7e56d2644105..abc089f38b6c 100644
> --- a/sound/soc/amd/acp/Kconfig
> +++ b/sound/soc/amd/acp/Kconfig
> @@ -40,6 +40,17 @@ config SND_AMD_ASOC_RENOIR
>  	help
>  	  This option enables Renoir I2S support on AMD platform.
>  
> +config SND_AMD_ASOC_REMBRANDT
> +        tristate "AMD ACP ASOC Rembrandt Support"
> +        select SND_SOC_AMD_ACP_PCM
> +        select SND_SOC_AMD_ACP_I2S
> +        select SND_SOC_AMD_ACP_PDM
> +        depends on X86 && PCI
> +        help
> +          This option enables Rembrandt I2S support on AMD platform.
> +	  Say Y if you want to enable AUDIO on Rembrandt
> +	  If unsure select "N".

Documentation/process/coding-style.rst says:

10) Kconfig configuration files
-------------------------------

For all of the Kconfig* configuration files throughout the source tree,
the indentation is somewhat different.  Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.


so please indent as expected, and consistently.

-- 
~Randy
