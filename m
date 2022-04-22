Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B85350B1C5
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 09:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C55A7201;
	Fri, 22 Apr 2022 09:38:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C55A7201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650613178;
	bh=Lrj93AlW8D8+ApyQCdOb8mQHaGqWLuuIjtG/ww/bo/k=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IFaAd5iQdhMPe4L+tfTOOxTwR0biAPE7v6JqqDSl+DSgmUjQEP5wiFIGHMDNJY5tD
	 itxton/7QohWyEIQY/jFm1HiDwoceZ++LRxi8Fv9hCcapT8DeRegtUG8RcIh7SBklu
	 2eFiM9FAgfGiOhFPbtWyCKznvmk4IECmDlrxCf1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34CD0F80249;
	Fri, 22 Apr 2022 09:38:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BD39F80134; Fri, 22 Apr 2022 09:38:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5FC3F800D1
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 09:38:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5FC3F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FrYHaKdm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650613112; x=1682149112;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Lrj93AlW8D8+ApyQCdOb8mQHaGqWLuuIjtG/ww/bo/k=;
 b=FrYHaKdmSDMABnuYzEuN9ojxxJe6uvW781IUT5ofN3H3pobclRfJARWc
 Hh1sMLxKWgq8gdQyYpCh1bXoJaNi2LPuKc87udm8230Ic3kr9C4Buf+XR
 jadCyK0QJVj+hFqLDw9k1amUK4XYyjTe1A/txIIcfwn6Y+HfuvcTPU8/b
 ndkZtsGTm9ODC9Q7g/nUfKS6kDJa5jhcGKz/m2XmGnJGcnMhepKGeAaH5
 NWpdbRwp8q550qNoRJ5KhLtHabPwicUA83lvPfpeOHcjoCeJPG+LYjYe1
 CBN0RqgmQuGoliqE3iFKPFJTB654FucNzzcKpwo71o4Sf9yEfbmPjnxJ3 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="327519145"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="327519145"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 00:38:26 -0700
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="577731113"
Received: from pponikox-mobl2.ger.corp.intel.com (HELO [10.99.249.106])
 ([10.99.249.106])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 00:38:25 -0700
Message-ID: <8de8d416-922f-ee62-0a62-513658edf49f@linux.intel.com>
Date: Fri, 22 Apr 2022 09:38:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ASoC: SOF: bump SOF_ABI_MINOR
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20220421162640.302311-1-pierre-louis.bossart@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220421162640.302311-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 4/21/2022 6:26 PM, Pierre-Louis Bossart wrote:
> Commit a0f84dfb3f6d9 ("ASoC: SOF: IPC: dai: Expand DAI_CONFIG IPC flags")
> did not update the SOF_ABI_MINOR, bump to version 20 before new
> changes are added.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>   include/uapi/sound/sof/abi.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
> index e052653a6e4cc..42227d4cb92c5 100644
> --- a/include/uapi/sound/sof/abi.h
> +++ b/include/uapi/sound/sof/abi.h
> @@ -26,7 +26,7 @@
>   
>   /* SOF ABI version major, minor and patch numbers */
>   #define SOF_ABI_MAJOR 3
> -#define SOF_ABI_MINOR 19
> +#define SOF_ABI_MINOR 20
>   #define SOF_ABI_PATCH 1
>   
>   /* SOF ABI version number. Format within 32bit word is MMmmmppp */

Seeing as you include hash id in commit message it should probably have 
Fixes tag, so if someone pulls the other commit they know to also back 
port this one?
