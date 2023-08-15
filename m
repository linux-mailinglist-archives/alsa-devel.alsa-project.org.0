Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5391077C75A
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 08:04:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01F7C1CE;
	Tue, 15 Aug 2023 08:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01F7C1CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692079475;
	bh=6Ln8ZKOuCDkHZ6YCTqOa1ergm+ztWDu1ZLcgA0vVQzw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pjKekooJhE5upuKAsD0X2IKBwKURxMS2Lbmbpc1PGUDBLHYSJqa6h9NqC+4y8rEKx
	 hy3vYCgbITzzmU600I1oGLU5o2L5uJShGT/fscJijdapgmSAUxV0zx8XuG0CAi/j+D
	 D1kOLVVvxJn6OtD6sDKf37Z5BQrl6nWwn00PInqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FC9FF80552; Tue, 15 Aug 2023 08:03:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48537F801EB;
	Tue, 15 Aug 2023 08:03:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDED0F80254; Tue, 15 Aug 2023 07:56:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A0B6F800EE
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 07:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A0B6F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YSWnlPSA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692078985; x=1723614985;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6Ln8ZKOuCDkHZ6YCTqOa1ergm+ztWDu1ZLcgA0vVQzw=;
  b=YSWnlPSAF87Ex9xZqRWzbv6pm9BVv1aD8V+OlA5SIlGEYXaL1mEACYAc
   4CGhw7+5BZTI/rPCaWukuY1aZ/hmeCDtq7vP3U8bTieRFD4dcOcH9CeJI
   iPDYf2tbaSvDFg/bT7UklsORhbwn2Wnh5VOn/xqA3mjx+ygjYX5gkqVwn
   pScDyK0HncHiDJqwrMPCEfa9q3bRgNPCW6vonrRCKDXp+F+WbzLgX3WHV
   z5994Of4D0KMVFnj52atKp5pz8OwoOPi2c57oNECx0Lgj+Eq2gOIACyGr
   6s1VKQC6paB12XfvtjcaS23y+Do9Pl/ycmZIhH9wdoXJh9c+4PAbwqLuG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="438548951"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="438548951"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 22:56:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="733727292"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="733727292"
Received: from mpadrex-mobl.ger.corp.intel.com (HELO [10.252.43.57])
 ([10.252.43.57])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 22:56:18 -0700
Message-ID: <f6342afd-9502-43b6-8849-286699ee6143@linux.intel.com>
Date: Tue, 15 Aug 2023 08:57:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: remove duplicate code due to merge
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: tiwai@suse.de, broonie@kernel.org
References: <20230814234235.87268-1-pierre-louis.bossart@linux.intel.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230814234235.87268-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CPGFJ5RK7CVPSEGCPAL4TWD4G3KOA4S6
X-Message-ID-Hash: CPGFJ5RK7CVPSEGCPAL4TWD4G3KOA4S6
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPGFJ5RK7CVPSEGCPAL4TWD4G3KOA4S6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 15/08/2023 02:42, Pierre-Louis Bossart wrote:
> Commit 81113108491e ("ASoC: Merge up fixes") added the same code
> twice, remove the extra call.

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/sof/ipc4-topology.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
> index b43663822613..633f6040d712 100644
> --- a/sound/soc/sof/ipc4-topology.c
> +++ b/sound/soc/sof/ipc4-topology.c
> @@ -1734,9 +1734,6 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
>  	/* update pipeline memory usage */
>  	sof_ipc4_update_resource_usage(sdev, swidget, &copier_data->base_config);
>  
> -	/* update pipeline memory usage */
> -	sof_ipc4_update_resource_usage(sdev, swidget, &copier_data->base_config);
> -
>  	/* copy IPC data */
>  	memcpy(*ipc_config_data, (void *)copier_data, sizeof(*copier_data));
>  	if (gtw_cfg_config_length)

-- 
Péter
