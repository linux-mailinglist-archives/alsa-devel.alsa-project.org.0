Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C321F5345C7
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 23:31:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69BCE16B4;
	Wed, 25 May 2022 23:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69BCE16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653514311;
	bh=8GFcT/M1tk9WnUvUZ/xjIR+P+QUrCNq+NkKDve4Se5o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RoPhdbWRdvANC6Z7i+lE4LNkbZtGLajyMW5ei3Tn9PMMMlN2wDA19rtnFY06gQg7F
	 y+sxdHMi6ee3kwg9Jp0F/r1UULE566JjSHkv2Zlz9azid2fJ/DUVyhxWu/f+Hs6VHQ
	 w+4T1SGnfa55LJfXjyDjuYKNuir3VjhUjNplU39g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1DA7F80224;
	Wed, 25 May 2022 23:30:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1400F801EC; Wed, 25 May 2022 23:30:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC9ECF80116
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 23:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC9ECF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="M/DFByrw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653514246; x=1685050246;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8GFcT/M1tk9WnUvUZ/xjIR+P+QUrCNq+NkKDve4Se5o=;
 b=M/DFByrwTQrp70fCir3rRXrKeSHFfvKuTyUiMiCPfX3puqPsqMQafvVw
 Gjvz2lIXpLDI2Tm0HIUVhgoEJx+OE3XOj0kHG/bU2U4pkGOsOhNoHTzui
 vZoPHF7R1mC6It61zPXw+S8uGz/BHvUyZQ16/xgFXMYkhjmqQ1RiKY6fp
 NyV6W55NqNHMFA4+qHi7mDZKGg0op39Y6HiFK+9kQZVAaBRSoQoDTiFR5
 rqphtIy2mHxeS4qdqo6NjYNubM1InCQxEwtIgBhSaaav4MDlxRk8MyKrx
 krw50AJw2JcxAPxDRc8E8NAsGUne0Od+b42FNcshZCnXhjTeVTmIP6oJq A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="253812008"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="253812008"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 14:30:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="745955652"
Received: from srotter-mobl1.amr.corp.intel.com (HELO [10.212.216.74])
 ([10.212.216.74])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 14:30:36 -0700
Message-ID: <895302ec-f9e5-2b6a-835a-08e73ef8ace3@linux.intel.com>
Date: Wed, 25 May 2022 16:25:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v4 1/2] ASoC: amd: acp: Add support for nau8825 and
 max98360 card
Content-Language: en-US
To: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220525203415.2227914-1-Vsujithkumar.Reddy@amd.com>
 <20220525203415.2227914-2-Vsujithkumar.Reddy@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220525203415.2227914-2-Vsujithkumar.Reddy@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, Geert Uytterhoeven <geert+renesas@glider.be>,
 ajitkumar.pandey@amd.com, Kai Vehmanen <kai.vehmanen@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Vijendar.Mukunda@amd.com,
 Daniel Baluta <daniel.baluta@nxp.com>
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




> +struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_sof_machines[] = {
> +	{
> +		.id = "AMDI1019",
> +		.drv_name = "rmb-dsp",
> +		.pdata = &acp_quirk_data,
> +		.fw_filename = "sof-rmb.ri",
> +		.sof_tplg_filename = "sof-acp-rmb.tplg",
> +	},
> +	{
> +		.id = "10508825",
> +		.drv_name = "nau8825-max",
> +		.pdata = &acp_quirk_data,
> +		.machine_quirk = snd_soc_acpi_codec_list,
> +		.quirk_data = &amp_max,
> +		.fw_filename = "sof-rmb.ri",
> +		.sof_tplg_filename = "sof-acp-rmb.tplg",

this looks rather odd, you have two entries in the table that point to
the exact same pair of firmware and topology files. This is either
intentional and missing a comment, or a copy-paste mistake, or some of
these fields are not required.

> -	clk_disable_unprepare(drvdata->wclk);
> +	if (!drvdata->soc_mclk)
> +		clk_disable_unprepare(drvdata->wclk);
>  }

mclk and wclk are different concepts usually.


>  struct acp_card_drvdata {
> @@ -49,6 +51,7 @@ struct acp_card_drvdata {
>  	unsigned int dai_fmt;
>  	struct clk *wclk;
>  	struct clk *bclk;
> +	bool soc_mclk;

I wonder if soc_mclk means 'soc_clock_provider' ?

it looks like a configuration instead of a real/physical clock?

