Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D5541E3A8
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 00:10:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C09216AE;
	Fri,  1 Oct 2021 00:09:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C09216AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633039805;
	bh=xc2hch22I8TxrfN+EYo5PyCj4pr6sOYB4IKHC1BOEOk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s10zdEdYFj6ulDfu0rhXHFy0efrb/ue6262XCEQz/x18xVh4lGIKlH2xeleH11jFq
	 miJPGlL80IdqYQZZUQAq3Unuw1vM9Fpul2XGkreWRggWD0/054PD85fuUXahK045aq
	 DlVosjUg344Tf0i8Vl8cYQ31rk8uyE0cGKfEO/XQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7137EF804D1;
	Fri,  1 Oct 2021 00:08:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E417CF804BC; Fri,  1 Oct 2021 00:08:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,RDNS_NONE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BFAEF800F3
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 00:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BFAEF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="vlZfDKu1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=7NdS6+teQK03rYflLZeIrWr135Yc2zIWK5XSmPMC1G4=; b=vlZfDKu189SubPvbmY8TZfv1FJ
 6vs2aDjYFjP2bi9gxinALr0dLDBk9TvLivAckOfVKc/M1lWoghDf+A4HNDB1ggzThlsSUNcVlVZUm
 T/QmUaTvpPNijeKXbU73GnfEnbxHg6v1PbMrdETxydTE9ste5VV0COwHatO+xGZ1diSquIzBnJ89F
 dDiANb0E4wHK4pbca/VwVtnqRmHv7gpkJyLVdI6JEIcsRPbUndTJV0BQTfNmyOk2uIwlqUZ8SGiSO
 OFvu1OEealYRDKv4Gi8O+DOvJqsFybbVDzARYxArxj2vf2vXWz8Zee8DsOjeunL4qsXNsomRZmx3Q
 VePfNzOw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW4E9-00G5FH-HR; Thu, 30 Sep 2021 22:08:29 +0000
Subject: Re: [PATCH 4/8] ASoC: amd: acp: Add generic machine driver support
 for ACP cards
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
 <20210930132418.14077-5-AjitKumar.Pandey@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e5d067d7-b9de-da47-87ba-47653812907b@infradead.org>
Date: Thu, 30 Sep 2021 15:08:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930132418.14077-5-AjitKumar.Pandey@amd.com>
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
> index a11182861f49..1ad811707a68 100644
> --- a/sound/soc/amd/acp/Kconfig
> +++ b/sound/soc/amd/acp/Kconfig
> @@ -24,3 +24,12 @@ config SND_AMD_ASOC_RENOIR
>   	depends on X86 && PCI
>   	help
>   	 This option enables Renoir I2S support on AMD platform
> +
> +config SND_SOC_AMD_MACH_COMMON
> +	tristate
> +	select SND_SOC_RT5682_I2C
> +	select SND_SOC_DMIC
> +	select SND_SOC_RT1019
> +	depends on X86 && PCI && I2C
> +	help
> +	 This option enables common Machine driver module for ACP

Same comments for patch 4, 5, and 6 as given for patch 2.

thanks.
-- 
~Randy
