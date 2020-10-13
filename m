Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC0528C69E
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Oct 2020 03:07:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4188B168D;
	Tue, 13 Oct 2020 03:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4188B168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602551260;
	bh=9S1t5D+0lJxQCZsQU2vA6d6qDrGEhYHDV0GADQ3Ju8A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YKXPizhGXWP2RYhkkvo26Zzkbx4deHhFsvGRz1Cko67UdXpGlsrcFhKgqyRvLqgXI
	 CPfz0F1Ep/vj/P1My2WSHUiOM/TNOW/aE3uLRDlc7jlkJ6yjc9GsQ3WH9WMDttBMCA
	 AP2tksc8diE0Jx3Ma/AeGtxxbO1XK8u3FvPEPBS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1BC4F800D8;
	Tue, 13 Oct 2020 03:05:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45477F80217; Tue, 13 Oct 2020 03:05:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E90BEF80141
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 03:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E90BEF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="u94y0GqY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=3/UMvVj1iHurYlGTpET+HgFtFX6/vZ3O3wVdx9j3nWA=; b=u94y0GqYiqP9faYdqaxObjAgwO
 SM4gwA9EdKonSkFRQEfeNDGxRts7FTWDkzDaKXx9p1GP3VCVVb+wHyXVDykSeLv4mYNPRa+Vd1aqT
 ionUIht+s1cw7eDUdqBo3d8PftiGU6Gw3vzk9lBqmalVPTJU6QS1Ii1cQhqJGyv3U0WoSsCzd55bR
 SrI9SdFEqb7furHGOrU6ByBlKjBV3KQyGck+WgWr5zPJZuXcV2wxfFucixEpOgwV9E1aOMR/WpgPL
 7PF7YN+lPKqpu+5PI18UdSV/vaDBybbadQeO6IAEV66oyhBF2at4UBt03hoA35SZgHq+dOjymefuS
 wbQqEAcQ==;
Received: from [2601:1c0:6280:3f0::507c]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kS8kd-0001Q2-0Y; Tue, 13 Oct 2020 01:05:15 +0000
Subject: Re: [PATCH v2 2/6] ASoC: SOF: Introduce descriptors for SOF client
To: Dave Ertman <david.m.ertman@intel.com>, alsa-devel@alsa-project.org
References: <20201005182446.977325-1-david.m.ertman@intel.com>
 <20201005182446.977325-3-david.m.ertman@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <076a0c53-0738-270e-845f-0ac968a4ea78@infradead.org>
Date: Mon, 12 Oct 2020 18:05:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201005182446.977325-3-david.m.ertman@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: parav@mellanox.com, tiwai@suse.de, netdev@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 fred.oh@linux.intel.com, linux-rdma@vger.kernel.org, dledford@redhat.com,
 broonie@kernel.org, jgg@nvidia.com, gregkh@linuxfoundation.org,
 kuba@kernel.org, dan.j.williams@intel.com, shiraz.saleem@intel.com,
 davem@davemloft.net, kiran.patil@intel.com
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

On 10/5/20 11:24 AM, Dave Ertman wrote:
> diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
> index 4dda4b62509f..cea7efedafef 100644
> --- a/sound/soc/sof/Kconfig
> +++ b/sound/soc/sof/Kconfig
> @@ -50,6 +50,24 @@ config SND_SOC_SOF_DEBUG_PROBES
>  	  Say Y if you want to enable probes.
>  	  If unsure, select "N".
>  
> +config SND_SOC_SOF_CLIENT
> +	tristate
> +	select ANCILLARY_BUS
> +	help
> +	  This option is not user-selectable but automagically handled by
> +	  'select' statements at a higher level
> +
> +config SND_SOC_SOF_CLIENT_SUPPORT
> +	bool "SOF enable clients"

Tell users what "SOF" means.

> +	depends on SND_SOC_SOF
> +	help
> +	  This adds support for ancillary client devices to separate out the debug
> +	  functionality for IPC tests, probes etc. into separate devices. This
> +	  option would also allow adding client devices based on DSP FW

spell out firmware

> +	  capabilities and ACPI/OF device information.
> +	  Say Y if you want to enable clients with SOF.
> +	  If unsure select "N".
> +


-- 
~Randy

