Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF5C6EB6FF
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 05:11:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9434ECA;
	Sat, 22 Apr 2023 05:10:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9434ECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682133079;
	bh=MXhJirCJ4DxaE5FhkWqx9AEc7N11uqhBBkSpTlMJiaI=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LPkpTqtNIA1l0Wrhdxsg7K0UO3TX8/MJROIqjtJ6pHwx01itAveD0/Nut5en5KFD2
	 tZ3H6wNsVSwiOq0RbKMkfysg4ELD5h+yslH6JoHhrt6KHcZmqC8Kx/GwVos1H01jhy
	 3jWiVKAxQ+aO65pPz/uj+Ag9+/SRO8iTd8YlCEDU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C15DF80149;
	Sat, 22 Apr 2023 05:10:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3898FF80155; Sat, 22 Apr 2023 05:10:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E15E4F800AC
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 05:10:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E15E4F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mW3QthzA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682133017; x=1713669017;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MXhJirCJ4DxaE5FhkWqx9AEc7N11uqhBBkSpTlMJiaI=;
  b=mW3QthzA64sQUuVqWB7iWddYncAjO80RifsD2F3x3ajcUcuHItR3Ns3B
   +oAXnOuTGdgkBIMUc+opH1uPgMNiYDgcvsTriXDTd49OL0V6kE5QF9U6/
   n6sPKTXjNQfxZrqyJVeL66PRj485UG4rE2xtCKpFkg2R6hhKXGlQq43J4
   X1pTMLXsqxtVES680NJEtJgYDr+XRdCSl5N52dwfC49l9fzHmFipeqB1h
   zK7el7t7FyW9bxPqKOy+DNLL6a+D+aeMfmLqYw73SKWj7Nw0uTIKundpS
   YsAT3xtsWyyv3J0DS5umkWFG08cAd9HkkvG2NpGCuqD3P3ImR3dfyN6gI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="409062979"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200";
   d="scan'208";a="409062979"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 20:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="761780318"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200";
   d="scan'208";a="761780318"
Received: from droble2-mobl1.amr.corp.intel.com (HELO [10.255.33.132])
 ([10.255.33.132])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 20:10:10 -0700
Message-ID: <51ed97ca-1ea5-064d-81c4-a88a3ace6250@linux.intel.com>
Date: Fri, 21 Apr 2023 22:05:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-byt: Fix "WM510205" match no longer
 working
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20230421183714.35186-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230421183714.35186-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: L7OBBEBIUXAG4YQFQSEUGDAEB7BF5WIA
X-Message-ID-Hash: L7OBBEBIUXAG4YQFQSEUGDAEB7BF5WIA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7OBBEBIUXAG4YQFQSEUGDAEB7BF5WIA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/21/23 1:37 PM, Hans de Goede wrote:
> Commit 7e1d728a94ca ("ASoC: Intel: soc-acpi-byt: Add new WM5102 ACPI HID")
> added an extra HID to wm5102_comp_ids.codecs, but it forgot to bump
> wm5102_comp_ids.num_codecs, causing the last codec HID in the codecs list
> to no longer work.
> 
> Bump wm5102_comp_ids.num_codecs to fix this.
> 
> Fixes: 7e1d728a94ca ("ASoC: Intel: soc-acpi-byt: Add new WM5102 ACPI HID")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/intel/common/soc-acpi-intel-byt-match.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-byt-match.c b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
> index db5a92b9875a..87c44f284971 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-byt-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
> @@ -124,7 +124,7 @@ static const struct snd_soc_acpi_codecs rt5640_comp_ids = {
>   };
>   
>   static const struct snd_soc_acpi_codecs wm5102_comp_ids = {
> -	.num_codecs = 2,
> +	.num_codecs = 3,
>   	.codecs = { "10WM5102", "WM510204", "WM510205"},
>   };
>   

