Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DE257CCD1
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 16:03:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6787D17F2;
	Thu, 21 Jul 2022 16:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6787D17F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658412189;
	bh=wLNA76lzkgtktWdfTlNRht9lcDgsPCAXyoZ4csXZ7uI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fLreFg2WT6v4KEatnzzlnqmJJoBD/pyEFKsjZJSVgODvkDv+FTcSAM+T1uFo/Pqdr
	 O3IydqOe4rasIi89OJt0uN5fyOA+k7Y0grbEgcIO9YLvrjBwr3L/OPLCmZBSSUehtm
	 X33Xjcp5pGSCeQINFi+kR+3N9j6iK71Bk2ZA42NQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EAB0F80256;
	Thu, 21 Jul 2022 16:02:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF2FEF8016D; Thu, 21 Jul 2022 16:02:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 314EFF800ED
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 16:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 314EFF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="rf4D7P6L"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=Vg47MT9CYxVlKDfYeFrs6uVhxA2N7iGnYsekPSd9PLU=; b=rf4D7P6LRVg5IFDDhyBor71CZu
 3QAp6A9r7WfoW7/Clpm62SfV7wANE8oBbVcMvxtX8uSdAucHI3Y4Kts21MZHDmCSz8xvcjaRe2nCg
 X2kmJX3pxs75qo14xPEqELLjIJbnNnrOngXsIie+a1/LCclG8nMsBlQlnapHhT93PSPzBh0LJpZPg
 LnzqjMoDxahO5di8SXZ/aAXIxHy+V09bpk0+7lPzOl6tyYdi58i4ryf2HQ+mt7jpC9yH4kTdT0OL1
 64zKWXlwGkTnH6TuwNN4DX4pDaccmQ0XzAx7DOUayAtW5vxurXsudrwbBPAETOOYJN41dxERgVF/B
 op8tohbA==;
Received: from [2601:1c0:6280:3f0::a6b3]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oEWkU-007SAu-Un; Thu, 21 Jul 2022 14:01:55 +0000
Message-ID: <9d2da296-80a8-f632-27a4-42cd91cdff3e@infradead.org>
Date: Thu, 21 Jul 2022 07:01:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/5] ASoC: amd: enable RPL Platform acp drivers build
Content-Language: en-US
To: syed sabakareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220721061035.91139-1-Syed.SabaKareem@amd.com>
 <20220721061035.91139-5-Syed.SabaKareem@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220721061035.91139-5-Syed.SabaKareem@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 vijendar.mukunda@amd.com, Alexander.Deucher@amd.com,
 Julian Braha <julianbraha@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Bard Liao <bard.liao@intel.com>
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

On 7/20/22 23:10, syed sabakareem wrote:
> diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
> index 9c2fef2ce89f..08f5289dac54 100644
> --- a/sound/soc/amd/Kconfig
> +++ b/sound/soc/amd/Kconfig
> @@ -117,3 +117,13 @@ config SND_AMD_ACP_CONFIG
>  	 driver modules to use
>  
>  source "sound/soc/amd/acp/Kconfig"
> +
> +config SND_SOC_AMD_RPL_ACP6x
> +        tristate "AMD Audio Coprocessor-v6.2 RPL support"
> +        depends on X86 && PCI
> +        help
> +          This option enables Audio Coprocessor i.e ACP v6.2 support on

If that "i.e" is supposed to mean "that is", then it should be "i.e.".
Or does it mean something else here?

> +          AMD RPL platform. By enabling this flag build will be
> +          triggered for ACP PCI driver.
> +          Say m if you have such a device.
> +          If unsure select "N".

-- 
~Randy
