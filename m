Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F0069B0BD
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 17:24:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12D35F9C;
	Fri, 17 Feb 2023 17:23:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12D35F9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676651045;
	bh=NTbxXPOXh4DX+pIijoDHV6Y6M/rJerGYinbdZlqug4c=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A+R/zzaFjDiZvwnvPokh2WncSNPhH8DFMwdwpecJV7M4V5Y2OGjSIjmLCJAL8lDeY
	 a3PHxBxU2gTJfENrJ6OPxru5WEb6ttCAHzm1jpWB9//YErRvc5j1+8F+FtY1b19XD/
	 LP3HmElGHzkx+oLnKVJ4nnJNzRZcpglGu3KzNF7c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6148DF800E4;
	Fri, 17 Feb 2023 17:23:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A707BF80171; Fri, 17 Feb 2023 17:23:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12673F80083
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 17:23:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12673F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kWdHgAs2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676650989; x=1708186989;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NTbxXPOXh4DX+pIijoDHV6Y6M/rJerGYinbdZlqug4c=;
  b=kWdHgAs2hiERMSMJENNkH9UjC38b4PM5Y8w1kKLr1hrKuCl1c5mFupe1
   QKowk787GP22dHbSVAfleF6rIiQjg+6ZPdVumnIjZbvsbKROcNkCxqk9I
   Cle8unWu0Sk8r2ijxdFRjo3Fs6NxrLsQdMyCWctTMB/M/lVSPgKyA38Be
   BEdF+Erco9Kcpruij5KIKcsq3EVDlzEk5q60rSntDUrb16AvPbd5ZbJo5
   dedfP8XGm2S71dWbrmr1cYzYfx+AXzmolSL4akKmGRN1qz3S3nrhQBorg
   m2fF1rhyQlqUdUnt2KKWdnz3A3Gh8e3OPzMBv7iDmTc0JhYsH6DRDgO3h
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="396699122"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000";
   d="scan'208";a="396699122"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 08:23:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="844629562"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000";
   d="scan'208";a="844629562"
Received: from krgreen-mobl2.amr.corp.intel.com (HELO [10.213.187.16])
 ([10.213.187.16])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 08:23:04 -0800
Message-ID: <de30f3b9-1c48-fc24-6970-5715f6095c6b@linux.intel.com>
Date: Fri, 17 Feb 2023 09:15:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Add quirk for the Acer Iconia
 One 7 B1-750
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
References: <20230217150229.32203-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230217150229.32203-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IEWSYQCZNUZQJYF7W5IOJJN6IZRG2W6R
X-Message-ID-Hash: IEWSYQCZNUZQJYF7W5IOJJN6IZRG2W6R
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IEWSYQCZNUZQJYF7W5IOJJN6IZRG2W6R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/17/23 09:02, Hans de Goede wrote:
> The Acer Iconia One 7 B1-750 tablet mostly works fine with the defaults
> for an Bay Trail CR tablet. Except for the internal mic, instead of
> an analog mic on IN3 a digital mic on DMIC1 is uses.
> 
> Add a quirk with these settings for this tablet.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/bytcr_rt5640.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index 79e0039c79a3..5a12940ef907 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -533,6 +533,18 @@ static int byt_rt5640_aif1_hw_params(struct snd_pcm_substream *substream,
>  
>  /* Please keep this list alphabetically sorted */
>  static const struct dmi_system_id byt_rt5640_quirk_table[] = {
> +	{	/* Acer Iconia One 7 B1-750 */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Insyde"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "VESPA2"),
> +		},
> +		.driver_data = (void *)(BYT_RT5640_DMIC1_MAP |
> +					BYT_RT5640_JD_SRC_JD1_IN4P |
> +					BYT_RT5640_OVCD_TH_1500UA |
> +					BYT_RT5640_OVCD_SF_0P75 |
> +					BYT_RT5640_SSP0_AIF1 |
> +					BYT_RT5640_MCLK_EN),
> +	},
>  	{	/* Acer Iconia Tab 8 W1-810 */
>  		.matches = {
>  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Acer"),
