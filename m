Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F0CB35846
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Aug 2025 11:12:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7604E60216;
	Tue, 26 Aug 2025 11:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7604E60216
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756199565;
	bh=eBOr2RpiZufw8xG5QulV/98+dCNxavPMBGdKmW1cQ6A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JHvhk1yemqxKbsb2l+nK+GxGBW52N7zVRvi61tEZr6JJFZV/ygp1qwqtrzy58lJeI
	 0obp9OE3yH5I/by2xWBnb4caXskmth6FkRkKCWXX7qnfxfhOnfJoPmlF7zyfV4pdri
	 3wJDwKGzz7+N+hlu+AQsLsTlsKyl0sxLFWbLNve4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43CD7F805D3; Tue, 26 Aug 2025 11:12:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9FAEF805C8;
	Tue, 26 Aug 2025 11:12:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35C60F8051F; Tue, 26 Aug 2025 11:11:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8ABDFF80154
	for <alsa-devel@alsa-project.org>; Tue, 26 Aug 2025 11:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ABDFF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nzSlXFyk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756199492; x=1787735492;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eBOr2RpiZufw8xG5QulV/98+dCNxavPMBGdKmW1cQ6A=;
  b=nzSlXFyk8pQCShwOmUKtHYQNq+KNKqiLqOSxK56VwPpjacxCECdZzn+Y
   V5PW2d/k6wJNosUxH7lybLjxtH4Eheiq22+sSGKAVpQaygaj3W9h0NmKZ
   ByPjS5iqqb3CMkGESfsLZlzlYB4S0UJ72tUm83yz1zBucPYnEdGg15cUv
   mOj3FDWcv+Dv4GPhT8Iq4WGFm+023cRI87KWMMieEyYr0WkpWPbO5ycrH
   80haFUhAqb4+u1GQo1zz1cllRNQWuevG31Q57Np3iDu2wWXE8ifatrZAg
   aZVzI/Nlr5xRRqtiz1j3gdx5fPGP/XF4lwi+reYYhGFTnEnP/NcCUP9JI
   A==;
X-CSE-ConnectionGUID: n0MnK1jaSDq++q+Zez+q/w==
X-CSE-MsgGUID: Psaurk1vQYWJoqhvPe827g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58346421"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400";
   d="scan'208";a="58346421"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 02:11:28 -0700
X-CSE-ConnectionGUID: yuzWgUc3SJyc4SsHyobBew==
X-CSE-MsgGUID: RujYWHaCRXCZwW48rej0eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800";
   d="scan'208";a="174789996"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.74])
 ([10.245.246.74])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 02:11:24 -0700
Message-ID: <431d4cbf-281a-4f93-bda4-767fa6b96c8c@linux.intel.com>
Date: Tue, 26 Aug 2025 12:11:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: SOF: Intel: WCL: Add the sdw_process_wakeen op
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mac Chiang <mac.chiang@intel.com>,
 alsa-devel@alsa-project.org
References: 
 <20250826090530.2409509-1-ajye_huang@compal.corp-partner.google.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: 
 <20250826090530.2409509-1-ajye_huang@compal.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FX3HAAGQ73OYQL6TNL2P6UFGTCNRYHHR
X-Message-ID-Hash: FX3HAAGQ73OYQL6TNL2P6UFGTCNRYHHR
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FX3HAAGQ73OYQL6TNL2P6UFGTCNRYHHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 26/08/2025 12:05, Ajye Huang wrote:
> Add the missing op in the device description to avoid issues with jack
> detection.
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>

Can you add these tags and send v2?
Fixes: 6b04629ae97a ("ASoC: SOF: Intel: add initial support for WCL")
Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Thank you!

> ---
>  sound/soc/sof/intel/ptl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/sof/intel/ptl.c b/sound/soc/sof/intel/ptl.c
> index 1bc1f54c470d..4633cd01e7dd 100644
> --- a/sound/soc/sof/intel/ptl.c
> +++ b/sound/soc/sof/intel/ptl.c
> @@ -143,6 +143,7 @@ const struct sof_intel_dsp_desc wcl_chip_info = {
>  	.read_sdw_lcount =  hda_sdw_check_lcount_ext,
>  	.check_sdw_irq = lnl_dsp_check_sdw_irq,
>  	.check_sdw_wakeen_irq = lnl_sdw_check_wakeen_irq,
> +	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
>  	.check_ipc_irq = mtl_dsp_check_ipc_irq,
>  	.cl_init = mtl_dsp_cl_init,
>  	.power_down_dsp = mtl_power_down_dsp,

-- 
Péter

