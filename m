Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F75164BAAF
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 18:12:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AA9A1833;
	Tue, 13 Dec 2022 18:12:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AA9A1833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670951572;
	bh=fQP+BjhNFT3BqlDV0nTdGuINJHRhucGEciK68jv0ucY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kuotCkisbrgjcb2EdHMFN2BjKyR/b41uxvMnmJqpG2aOIMif5mpIh2w5sG8UYUPMR
	 IjYCvbnO/nakHR10Dsl6NOoNr85e0owwIjSzA5NI5TnHP5/CeZAu1HisHOnjeVnJKW
	 p84sS9bRVupqHySwpMYBc/6CUY74KAEICpgD+YHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D4DAF80073;
	Tue, 13 Dec 2022 18:11:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F740F804E2; Tue, 13 Dec 2022 18:11:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13069F8047D
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 18:11:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13069F8047D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ddhTyPLJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670951512; x=1702487512;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fQP+BjhNFT3BqlDV0nTdGuINJHRhucGEciK68jv0ucY=;
 b=ddhTyPLJO5LZyBelTVGw8ZV3mhkYPMhXX3u4OJ/FXFAKlD0X++EUSwcb
 bJAj1CDhNVwXbkvXPmm5tonI8B95zN6Q9YVqVxwXuC6WfR1zQNcYND4RU
 HKE2V5AFFRgLW0It/DsISJN4CbVhn/ke7q7bPOpq8fuLg9TGwrIN67hs0
 lvNmElwXR0BzSci3NwGhYmTJCEBtLn1WddR4jKuLQz/AfXDbA8XHsw1X8
 I9oXNw/QBAw81LuhPevmGa+yyvBmRkMQIvBfPYIuFNFv9rrAL4RZln35E
 gZzdilFItGbtdhOgs9tltylX8sBEZxMAT/UibqYw7JCLjMCNeXk77Qs7O g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="316886154"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; d="scan'208";a="316886154"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 09:09:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="648638324"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; d="scan'208";a="648638324"
Received: from lvalluri-mobl.amr.corp.intel.com (HELO [10.212.67.174])
 ([10.212.67.174])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 09:09:20 -0800
Message-ID: <39917bce-3e2b-2768-665e-ddb098c70c81@linux.intel.com>
Date: Tue, 13 Dec 2022 11:09:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH] Add HP Stream 8 to bytcr_rt5640.c
Content-Language: en-US
To: Moises Cardona <moisesmcardona@gmail.com>, cezary.rojewski@intel.com
References: <20221213115950.998113-1-moisesmcardona@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221213115950.998113-1-moisesmcardona@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Takashi Iwai <tiwai@suse.com>, liam.r.girdwood@linux.intel.com,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 peter.ujfalusi@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

You need to resubmit and CC Mark Brown, Takashi Iwai, the alsa-mailing
list and Hans de Goede

On 12/13/22 05:59, Moises Cardona wrote:
> The HP Stream 8 tablet is identical to the HP Stream 7 in terms of the PCB,
> with the exception of the added SIM Card Slot. 
> Therefore, I'm submitting this patch which properly initializes the audio 
> and enables the headphone jack to work, just like it does in the 
> HP Stream 7.
> 
> Signed-off-by: Moises Cardona <moisesmcardona@gmail.com>
> ---
>  sound/soc/intel/boards/bytcr_rt5640.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index fb9d9e271845..1d964b1ceff4 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -796,6 +796,17 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>  					BYT_RT5640_SSP0_AIF1 |
>  					BYT_RT5640_MCLK_EN),
>  	},
> +	{	/* HP Stream 8 */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "HP Stream 8 Tablet"),
> +		},
> +		.driver_data = (void *)(BYTCR_INPUT_DEFAULTS |
> +					BYT_RT5640_MONO_SPEAKER |
> +					BYT_RT5640_JD_NOT_INV |
> +					BYT_RT5640_SSP0_AIF1 |
> +					BYT_RT5640_MCLK_EN),
> +	},
>  	{	/* I.T.Works TW891 */
>  		.matches = {
>  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),
