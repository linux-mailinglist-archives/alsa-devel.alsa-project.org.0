Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD8F77BB05
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 16:09:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7446184D;
	Mon, 14 Aug 2023 16:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7446184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692022178;
	bh=q1bF0M0Z60l5z0SrmLHcCPMfxrtvXjd7D+J79KEYuOE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AB6bz6jWImOUbpr18wItHSaqrhnQj5B3tRqc9kUeh1NyRY1pmWTnHZRqZ2Qjsjg55
	 PIKIhZg57IZvuMXFMLj7JR0l87/ulXGczbUgaLDYss0f4xdKYcCNEVYe1yQaRRgoFr
	 Up9Uf9OvDQSX3Tb9esKWQbVOb+TAhKWW1G96NXkE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD295F80074; Mon, 14 Aug 2023 16:08:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ADD1F80254;
	Mon, 14 Aug 2023 16:08:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E247F80510; Mon, 14 Aug 2023 16:08:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A97F6F80254;
	Mon, 14 Aug 2023 16:07:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A97F6F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZwWpOzWk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692022052; x=1723558052;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=q1bF0M0Z60l5z0SrmLHcCPMfxrtvXjd7D+J79KEYuOE=;
  b=ZwWpOzWkLRMMLmTJL2DG3eZQEncJQPcZl0dTwuNgJBYj/Ieq+DoRMq8q
   PWNhgFGwDK7UV3SzviRUlWgIO/H/01x28LxsIPvu7Uht+7ttWphiNiGes
   OtEjyXwmvZewLtm2+ZMiOFK2ydJrOd0DsKjZOmeTpt62jv8fn7KKsMLVc
   Jgt/3Nd9bBMcV05W3irhTXBjmdpnrFIR+ZBK+6bFjtxzmj2MHbwlGtoD0
   gZhI+gsX0ERaNQXJ6k/YPMMkKKUQkGIAs5liRN0XO+ZmOAIoMOM2IPCDh
   FK/tBV2eoRPy3q4mYJhD0vORsYpbyy6n9Gj2aVJ5j0sKq00SStB05KmYc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="370943687"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200";
   d="scan'208";a="370943687"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 07:07:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="798825224"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200";
   d="scan'208";a="798825224"
Received: from ryana2x-mobl.amr.corp.intel.com (HELO [10.212.126.76])
 ([10.212.126.76])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 07:07:25 -0700
Message-ID: <4f5d8095-537b-433e-4839-6061beb2b0bb@linux.intel.com>
Date: Mon, 14 Aug 2023 08:55:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: SOF: Intel: fix hda_sdw_check_wakeen_irq()
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rander Wang <rander.wang@intel.com>, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>
References: <20230814074711.1068093-1-arnd@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230814074711.1068093-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OVLIFU4CYNCX5IBSFA4MC2XHPDEFZXXK
X-Message-ID-Hash: OVLIFU4CYNCX5IBSFA4MC2XHPDEFZXXK
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OVLIFU4CYNCX5IBSFA4MC2XHPDEFZXXK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/14/23 02:46, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This function cannot work, as the 'chip' variable is never initialized:
> 
> sound/soc/sof/intel/hda.c:423:6: error: variable 'chip' is uninitialized when used here [-Werror,-Wuninitialized]
>         if (chip && chip->check_sdw_wakeen_irq)
>             ^~~~
> 
> Set it the same way that other functions in this file do.
> 
> Fixes: 9362ab78f175d ("ASoC: SOF: Intel: add abstraction for SoundWire wake-ups")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> There hasn't been a new linux-next in a few days, so there is a good chance
> someone else already fixed this in the meantime. Sending out my fix in case
> that hasn't happened yet.

yes it was found by Nathan Chancelor and corrected already. Thanks for
checking though!


> ---
>  sound/soc/sof/intel/hda.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index 04c748a72b137..6c9c7b390cf53 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -415,7 +415,7 @@ bool hda_sdw_check_wakeen_irq_common(struct snd_sof_dev *sdev)
>  static bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
>  {
>  	u32 interface_mask = hda_get_interface_mask(sdev);
> -	const struct sof_intel_dsp_desc *chip;
> +	const struct sof_intel_dsp_desc *chip = get_chip_info(sdev->pdata);
>  
>  	if (!(interface_mask & BIT(SOF_DAI_INTEL_ALH)))
>  		return false;
