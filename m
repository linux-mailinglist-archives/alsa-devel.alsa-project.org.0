Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D795471F0F6
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 19:40:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3270C207;
	Thu,  1 Jun 2023 19:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3270C207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685641246;
	bh=T10NFGdSOn3kZ70NkVkGG3eMfGwDT3os3Zr2NIy+93g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y+rWBd1ImTguTWX/HYv2bTTZsV7mgiNxZ0J5qx99uGU0pv/+TdJY5U/IkZZP3bG5o
	 tygwRW2Zqlm8LWrbcTqHuKvwYUMox0z4HNlRaoWl9zES5DtiW1SbD29+ADquEgT6Dx
	 FYBALeUqH5lF0n9FAXdI/T1DzlUkpHB+yvTUvhzI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53556F80132; Thu,  1 Jun 2023 19:39:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A984BF80132;
	Thu,  1 Jun 2023 19:39:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63C8AF80149; Thu,  1 Jun 2023 19:39:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E34E5F800C8;
	Thu,  1 Jun 2023 19:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E34E5F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GABwdfvT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685641189; x=1717177189;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=T10NFGdSOn3kZ70NkVkGG3eMfGwDT3os3Zr2NIy+93g=;
  b=GABwdfvTQPs7Lnun+LuwsVOYecg0F0PV5deD+S3SheEALF6WeILU9Wdf
   FItSxgkrd8us3rQqj7smzTFd5QVkZHEGb896iTYQR0gI91JG8HpMMBVay
   H7rikm1rrY5oYGnUFs2rtkppTOb1mBLIhWPIVQnQxgZvG0xUgu6lFYgYn
   hcG2m/F/hkOVNsBpTAX9Vi99lD2RnXBV8bR8OJxkdWgkiO+GisMeISRPh
   zzKDaQ414Y+BZ4OrZVI9yg3TLuygxoQY/Ipjm3CadQtlzoA/vFmHsVRYd
   WDS0jsFSiSegjtG+ld/wKIedSgEJG7iuwF6Cn80cSW7I8Y97krP74l7qu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335253628"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400";
   d="scan'208";a="335253628"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 10:39:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="737197106"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400";
   d="scan'208";a="737197106"
Received: from rcelisco-mobl.amr.corp.intel.com (HELO [10.212.207.82])
 ([10.212.207.82])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 10:39:42 -0700
Message-ID: <2720a80a-4496-0ba9-e545-046ed2529f7d@linux.intel.com>
Date: Thu, 1 Jun 2023 12:39:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Use size_t for variable passed
 to kzalloc()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org
References: 
 <a311e4ae83406f714c9d1f7f2f857284265e581c.1685640591.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <a311e4ae83406f714c9d1f7f2f857284265e581c.1685640591.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZYBIKWPSL7MSBK57DQPM7TJBX6JIXCFP
X-Message-ID-Hash: ZYBIKWPSL7MSBK57DQPM7TJBX6JIXCFP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZYBIKWPSL7MSBK57DQPM7TJBX6JIXCFP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/1/23 12:30, Christophe JAILLET wrote:
> struct_size() checks for overflow, but assigning its result to just a u32
> may still overflow after a successful check.
> 
> Use a size_t instead in order to be cleaner.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Based on analysis from Dan Carpenter on another patch (see [1]).
> 
> [1]: https://lore.kernel.org/all/00e84595-e2c9-48ea-8737-18da34eaafbf@kili.mountain/

looks like there are similar cases of struct_size -> u32 conversions in
other places:

struct snd_sof_control {
    u32 size;	/* cdata size */

ipc3-topology.c:        scontrol->size = struct_size(cdata, chanv,
scontrol->num_channels);
ipc3-topology.c:        scontrol->size = struct_size(cdata, chanv,
scontrol->num_channels);
ipc4-topology.c:        scontrol->size = struct_size(control_data,
chanv, scontrol->num_channels);

not sure how much of an issue this really is though?

> ---
>  sound/soc/sof/ipc4-topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
> index db64e0cb8663..50faa4c88b97 100644
> --- a/sound/soc/sof/ipc4-topology.c
> +++ b/sound/soc/sof/ipc4-topology.c
> @@ -881,7 +881,7 @@ static int sof_ipc4_widget_setup_comp_process(struct snd_sof_widget *swidget)
>  	/* allocate memory for base config extension if needed */
>  	if (process->init_config == SOF_IPC4_MODULE_INIT_CONFIG_TYPE_BASE_CFG_WITH_EXT) {
>  		struct sof_ipc4_base_module_cfg_ext *base_cfg_ext;
> -		u32 ext_size = struct_size(base_cfg_ext, pin_formats,
> +		size_t ext_size = struct_size(base_cfg_ext, pin_formats,
>  						swidget->num_input_pins + swidget->num_output_pins);
>  
>  		base_cfg_ext = kzalloc(ext_size, GFP_KERNEL);
