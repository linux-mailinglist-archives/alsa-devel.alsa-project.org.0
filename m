Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C966C870ACA
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 20:35:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFA9D112;
	Mon,  4 Mar 2024 20:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFA9D112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709580912;
	bh=TADBIj/jiKk87U5tou9hMcyNKNqVzZSGuG8xZJPtMNQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BkVnLoSrzA4V898QWT4jo0Gu0Bvb55xgNnmfTypizYMhhKJwuAMkkcQZmgb+NTxkB
	 ebb9iFOhaNvRcdgLQEDE9lLJlCo5osFVRVQKh+Fb9iPab0+2Thckg7C+LBBbS8wyd4
	 XagwFm/wAalaBEe4siwERAX2bGum/7UdLKfpRnQ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0163F805D7; Mon,  4 Mar 2024 20:34:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3914F805CA;
	Mon,  4 Mar 2024 20:34:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 200BCF8024E; Mon,  4 Mar 2024 20:34:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBAF4F80093
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 20:34:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBAF4F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=niQ8+GPd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709580853; x=1741116853;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TADBIj/jiKk87U5tou9hMcyNKNqVzZSGuG8xZJPtMNQ=;
  b=niQ8+GPd+lcDyY/ZKbic5eO4ZlZZ/CQENd70t3xnG3b+d1g6ZMXXNp8h
   7JMmBeScZcydBcZ/mTJ7nPYJG2CAEaCa8H94KuCpQU4kaCdbhAiJTn6YK
   POEUiuSBdD1/hCLvq3NwYjHtOAQSSOpuDTctMdig5TMOF+Wn2luxGqJLd
   sZDhn1iiwnSlONBQaqrbPIXeaPz1s75QYc0N/F+cvYZA810ODZjsIHtMV
   aNjCyKtkrlj9eVtDZJwZj3XfVsymunrtoeNB4T/zguHqkeHGu5Zg93TAX
   gZsnVHStYItD9gd8TXVY91SGCusOIG4U65H/kos9kJ0yOZotE36mrkZUl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15500700"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000";
   d="scan'208";a="15500700"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 11:33:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000";
   d="scan'208";a="13599735"
Received: from cryoung-mobl2.amr.corp.intel.com (HELO [10.212.71.160])
 ([10.212.71.160])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 11:33:57 -0800
Message-ID: <14a2f9b8-7711-47c4-9f57-bd839c700d4e@linux.intel.com>
Date: Mon, 4 Mar 2024 13:32:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ASoC: topology: Do not ignore route checks when
 parsing graphs
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, tiwai@suse.com,
 perex@perex.cz, amadeuszx.slawinski@linux.intel.com, hdegoede@redhat.com
References: <20240304190536.1783332-1-cezary.rojewski@intel.com>
 <20240304190536.1783332-3-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240304190536.1783332-3-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KTAN54KX3G5YJW4BKETTKCTY4PWEGYV6
X-Message-ID-Hash: KTAN54KX3G5YJW4BKETTKCTY4PWEGYV6
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KTAN54KX3G5YJW4BKETTKCTY4PWEGYV6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/4/24 13:05, Cezary Rojewski wrote:
> One of the framework responsibilities is to ensure that the enumerated
> DPCMs are valid i.e.: a valid BE is connected to a valid FE DAI. While
> the are checks in soc-core.c and soc-pcm.c that verify this, a component
> driver may attempt to workaround this by loading an invalid graph
> through the topology file.
> 
> Be strict and fail topology loading when invalid graph is encountered.

This is very invasive, it's perfectly possible that we have a number of
'broken' topologies where one path is 'invalid' but it doesn't impact
functionality.

This should be an opt-in behavior IMHO, not a blanket change.

> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/soc-topology.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index d6d368837235..778f539d9ff5 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -1083,8 +1083,9 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>  			break;
>  		}
>  
> -		/* add route, but keep going if some fail */
> -		snd_soc_dapm_add_routes(dapm, route, 1);
> +		ret = snd_soc_dapm_add_routes(dapm, route, 1);
> +		if (ret && !dapm->card->disable_route_checks)
> +			break;
>  	}
>  
>  	return ret;
