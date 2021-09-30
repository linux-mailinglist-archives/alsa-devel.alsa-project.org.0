Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D463041E3A3
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 00:08:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5611D1677;
	Fri,  1 Oct 2021 00:07:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5611D1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633039701;
	bh=Oc50V/s/DYZGuji0j5rqqEVWsjrTt2ZPxpHltsNP65U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LwixeaOIjSHI7tyJw5ors4pJbw2+BOhomI9EQFn9NW1AAnmn9YguVNw6nnJQOP1Jf
	 lizvcjQjDAtrqtuR7mcg31dTa/FxkI8pHBP/WUHJPT2jpFp/ptKzEx5Yvb2te4so1o
	 G5Fl4H1/xQc4pV2i7zmAvnds4A1NXvJWsF1l+8uk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABD99F804D1;
	Fri,  1 Oct 2021 00:07:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5178FF804AD; Fri,  1 Oct 2021 00:06:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,RDNS_NONE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D35A8F800F3
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 00:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D35A8F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="fl6EocV5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=iBviWjWtcIrXPMzfxdaBL9mBeizH0R3Lv9Hqu58Rx54=; b=fl6EocV5mA63nYT/svWLWFdLlI
 FeqE8K23tl1zSgn5K0ijoRIrOnaa2tZ2BoRGs/zdY17xUKHGcQhDS8x1omuraOAayvaW0JH+ALvqw
 NmRQrov3tf/CqL4eJQJoS4yaU8sFxo985SOHprAn3oIxYJEJOyNjmyGTQ/YBy9KmCj8YOymPrsGsG
 nhyiSJcdWM7wwgxfD1GZLYWlmkk3CFOdjGHje0PELOFNbuScNODHruJk2RHmS0pdWYZPJwY3DX+lo
 xSe667M2Dt5+XE0wDK+KJlOK8eMCks6PJecibvN1Qujosee6ICnZ4f9swXEQwdHlElmzi8+VnFTZJ
 HP8ulJcw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW4CP-00G5CU-Mf; Thu, 30 Sep 2021 22:06:41 +0000
Subject: Re: [PATCH 2/8] ASoC: amd: acp: Add I2S support on Renoir platform
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
 <20210930132418.14077-3-AjitKumar.Pandey@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <81883f80-cc67-d216-f62c-e55d33724f5f@infradead.org>
Date: Thu, 30 Sep 2021 15:06:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930132418.14077-3-AjitKumar.Pandey@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vijendar.Mukunda@amd.com,
 Alexander.Deucher@amd.com
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

On 9/30/21 6:24 AM, Ajit Kumar Pandey wrote:
> diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
> index 1ca815df6f23..a11182861f49 100644
> --- a/sound/soc/amd/acp/Kconfig
> +++ b/sound/soc/amd/acp/Kconfig
> @@ -16,3 +16,11 @@ config SND_SOC_AMD_ACP_I2S
>   
>   config SND_SOC_AMD_ACP_PCM
>   	tristate
> +
> +config SND_AMD_ASOC_RENOIR
> +	tristate "AMD ACP ASOC Renoir Support"
> +	select SND_SOC_AMD_ACP_PCM
> +	select SND_SOC_AMD_ACP_I2S
> +	depends on X86 && PCI
> +	help
> +	 This option enables Renoir I2S support on AMD platform

Please follow coding-style for Kconfig files:

(from Documentation/process/coding-style.rst, section 10):

For all of the Kconfig* configuration files throughout the source tree,
the indentation is somewhat different.  Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.

Also end the help sentence with a period (full stop) ('.').

thanks.

-- 
~Randy
