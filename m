Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1910664CBD4
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 15:07:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD4002A1B;
	Wed, 14 Dec 2022 15:06:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD4002A1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671026869;
	bh=kRnzKDaifLMzk91f4ryWfcXJa4yv7M4AXVG0yIWndXw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TpvXVD1eJ9+an2FdEGBrTfhwvJz/mz5bBNUM6fYwhHuh0kWrPda7nbFAYVykAPRAX
	 cmOQhY4rMpgxBytPA1svFnUJjIBhCl8Gq+3dc+KAIsC7MHKThnsQ/hJ8iH8MDtWGJd
	 bzJ4e3V4HDiytwKrLw9AqnxSC/I7xB7F3BG1LC1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A668F804E0;
	Wed, 14 Dec 2022 15:06:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8B37F804E0; Wed, 14 Dec 2022 15:06:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DATE_IN_PAST_12_24,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBF14F80141
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 15:06:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBF14F80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QyDhqFDs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671026810; x=1702562810;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kRnzKDaifLMzk91f4ryWfcXJa4yv7M4AXVG0yIWndXw=;
 b=QyDhqFDsU16Cr8eFZElAVMkD9P/SPo4IlU24o28Nmq9tR0/AlS86XDbn
 ZPqGalkYNaZ7D59Ep2CjuodW/wubDTwvPiTOt9lEtSZUPthtdna2BFNKd
 MCiPzMHNUo6wwX7hGAT5lH9JTm2/aWuOJ3hjQpeCVlWdEij3y2NYE22Gn
 xeNnr05EYIXcubd8iDfO6hn17msDEITtRkcvGuDUM6QKetVG9WzVSm58h
 ZeFsAc5ScB1Zne49Zk9Zr7LyBFVrwdnwNbdUAXWHtbGqzxVqD0C7nBIVr
 inV/NiybKEsPswttLhziYIxtob13rd/UHMb4pJDuEwwokQqt3/Ma96hB5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="318452720"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="318452720"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 06:06:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="681517232"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="681517232"
Received: from gajular-mobl1.amr.corp.intel.com (HELO [10.213.160.14])
 ([10.213.160.14])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 06:06:28 -0800
Message-ID: <08403fff-359b-b5f4-d039-18eeef660637@linux.intel.com>
Date: Tue, 13 Dec 2022 13:04:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH] Add HP Stream 8 to bytcr_rt5640.c
Content-Language: en-US
To: Moises Cardona <moisesmcardona@gmail.com>, cezary.rojewski@intel.com
References: <20221213173550.1567875-1-moisesmcardona@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221213173550.1567875-1-moisesmcardona@gmail.com>
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
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 hdegoede@redhat.com, broonie@kernel.org, akihiko.odaki@gmail.com,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/13/22 11:35, Moises Cardona wrote:
> The HP Stream 8 tablet is identical to the HP Stream 7 in terms of the PCB,
> with the exception of the added SIM Card Slot. 
> Therefore, I'm submitting this patch which properly initializes the audio 
> and enables the headphone jack to work, just like it does in the 
> HP Stream 7.
> 
> Signed-off-by: Moises Cardona <moisesmcardona@gmail.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

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
