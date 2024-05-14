Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D60DE8C4CF0
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2024 09:28:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E95883E;
	Tue, 14 May 2024 09:27:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E95883E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715671681;
	bh=BOZXDlQW/ALMT/v+vXYr+gzuWqxOzMY84psbe2mKH9g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EzwxMBW4L1NS3RcIwCuuNBIJumdX4GT70fIPni/Vz8nCd7bnN4jI8qYVjQzoDiC3e
	 HEirMCY/vh1bln+uFwLU7C7z/blJfmu4uW71+NKyNpM1qBbgVl5f1fA6xu42BO5Z0e
	 Eqk2fBt5PQTDjxrIAA1lr+H505ujanOOn8TGFfPM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D081BF80588; Tue, 14 May 2024 09:27:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE246F800E9;
	Tue, 14 May 2024 09:27:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BBADF80224; Tue, 14 May 2024 09:24:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A5BEF800E9;
	Tue, 14 May 2024 09:24:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A5BEF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QyluSkyg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715671459; x=1747207459;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BOZXDlQW/ALMT/v+vXYr+gzuWqxOzMY84psbe2mKH9g=;
  b=QyluSkygm5tNLSuFFoqEOIbJAljJtfIBTYiWIZVK9ghkEv4vNTcRcvF3
   m8x4wM/115HPSi25GickQsjJNdFMIOACOL3xVkFMc4wZ+kFARKr+LU557
   L5lhbXvZ++azyx9TOsv9pI8xtQ0zMHKabDbtagUAhmDtiRY0Paxn+0jww
   mMZUQGkHfCyxF7il7/6Arqb3cdG1E9oQWAPy9/Isr/zI6PTmQINtQeAli
   Tr8ywb2KV+h4IvXUZqUmjbDbFYja5b9P8blV+66vOjIoLQgkG7q0j3Y6v
   u7oOBfalOwt7MzfdY7H53/ToMOTQ0omEx2PW7qRh4QTt1OyNHUiGw+j7d
   w==;
X-CSE-ConnectionGUID: varR9yrHSSCRcLjE24+EZg==
X-CSE-MsgGUID: I6czbREvTAOuoxYo1Dhx9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11488948"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000";
   d="scan'208";a="11488948"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 00:24:04 -0700
X-CSE-ConnectionGUID: TKg2A2hNQSW6FXkQNLQQpA==
X-CSE-MsgGUID: NEldkTQUSX6In4azeNWRZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000";
   d="scan'208";a="30638103"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.32.104])
 ([10.94.32.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 00:23:58 -0700
Message-ID: <9a34ea33-1294-4356-b9c4-295709a86cd2@linux.intel.com>
Date: Tue, 14 May 2024 09:23:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: topology: Constify an argument of
 snd_soc_tplg_component_load()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, daniel.baluta@nxp.com
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4YEWCHKCGBRNQLMEUDJTLTTEM4QQSBYP
X-Message-ID-Hash: 4YEWCHKCGBRNQLMEUDJTLTTEM4QQSBYP
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4YEWCHKCGBRNQLMEUDJTLTTEM4QQSBYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/13/2024 7:37 PM, Christophe JAILLET wrote:
> snd_soc_tplg_component_load() does not modify its "*ops" argument. It
> only read some values and stores it in "soc_tplg.ops".
> 
> This argument and the ops field in "struct soc_tplg" can be made const.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   include/sound/soc-topology.h | 2 +-
>   sound/soc/soc-topology.c     | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sound/soc-topology.h b/include/sound/soc-topology.h
> index f055c6917f6c..1eedd203ac29 100644
> --- a/include/sound/soc-topology.h
> +++ b/include/sound/soc-topology.h
> @@ -178,7 +178,7 @@ static inline const void *snd_soc_tplg_get_data(struct snd_soc_tplg_hdr *hdr)
>   
>   /* Dynamic Object loading and removal for component drivers */
>   int snd_soc_tplg_component_load(struct snd_soc_component *comp,
> -	struct snd_soc_tplg_ops *ops, const struct firmware *fw);
> +	const struct snd_soc_tplg_ops *ops, const struct firmware *fw);
>   int snd_soc_tplg_component_remove(struct snd_soc_component *comp);
>   
>   /* Binds event handlers to dynamic widgets */
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 90ca37e008b3..b00ec01361c2 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -73,7 +73,7 @@ struct soc_tplg {
>   	int bytes_ext_ops_count;
>   
>   	/* optional fw loading callbacks to component drivers */
> -	struct snd_soc_tplg_ops *ops;
> +	const struct snd_soc_tplg_ops *ops;
>   };
>   
>   /* check we dont overflow the data for this control chunk */
> @@ -2334,7 +2334,7 @@ static int soc_tplg_load(struct soc_tplg *tplg)
>   
>   /* load audio component topology from "firmware" file */
>   int snd_soc_tplg_component_load(struct snd_soc_component *comp,
> -	struct snd_soc_tplg_ops *ops, const struct firmware *fw)
> +	const struct snd_soc_tplg_ops *ops, const struct firmware *fw)
>   {
>   	struct soc_tplg tplg;
>   	int ret;

Yes, makes sense to me.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
