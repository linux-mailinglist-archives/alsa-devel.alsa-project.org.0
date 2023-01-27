Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEF267E998
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 16:36:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B636851;
	Fri, 27 Jan 2023 16:35:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B636851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674833762;
	bh=lqYHfLAspTue4Gogwm+cjNqIXqdO7zzfk2vC3bjJyww=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DP3d3wD1GBxPR1FLKK+9VNZ0ixHWokoynrZsxLH6ig0cQTO1ug6k2nXfyn2812H7z
	 /PBcm+wYQeQS8KVoHg/F0TV8f+zLD1CX1ghfN00ATkO86qUR5LwgiE1hbLF+xQjOps
	 SSrimMgoMAExliicllt0n6Gmlr2b+qG7MkLX+8HY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C87FF8007C;
	Fri, 27 Jan 2023 16:35:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CE54F80272; Fri, 27 Jan 2023 16:35:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5103F8007C
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 16:34:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5103F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kKwlElqw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674833695; x=1706369695;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lqYHfLAspTue4Gogwm+cjNqIXqdO7zzfk2vC3bjJyww=;
 b=kKwlElqwwsU7TDSX/V7/9fbyIAQBkP3zWvrYixGvNgRCsKYvGekpM2Lk
 BGEDjXl7Sg4T2ZRSNopOstv0VoaZR/Oc218ZR5IpZXTSLYs8MC6a8V7gs
 R25xO592tmifTEKOdh0WL5sYRDuMmNdIgW2YGhZVpm+JjUptLlpAWMj6F
 09fs6L17en69uJg29vfhgYIPEcziVhI5DKphHJodp2fThEsxpyal7IIWk
 ANtoEQpjUfH1rS5VsBo8SXhd9bbmGKoRmMSEaEwmPDZqSvKt+0lw/Id5S
 Y9BKC9wuySjr2WBlS8uYUS1Wr6UDZaZResmStDOT9MzEa7hUPwNy2a4+3 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="306759855"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="306759855"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 07:34:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="640734625"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="640734625"
Received: from vmodi-mobl2.amr.corp.intel.com (HELO [10.212.9.128])
 ([10.212.9.128])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 07:34:51 -0800
Message-ID: <c14e9cec-ff7b-c229-ce28-fd1d7c99ec0d@linux.intel.com>
Date: Fri, 27 Jan 2023 09:34:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 11/11] ASoC: topology: Use unload() op directly
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
 <20230127231111.937721-12-amadeuszx.slawinski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230127231111.937721-12-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/27/23 17:11, Amadeusz Sławiński wrote:
> struct snd_soc_dobj only needs pointer to the unload function, instead
> however, there is pointer to all topology operations. Change code to use
> the function pointer instead of pointer to structure containing all
> operations.

I still don't see what we gain with this change.

what we had was:

	sbe->dobj.ops = tplg->ops;

	if (dobj->ops && dobj->ops->control_unload)
		dobj->ops->control_unload(comp, dobj);

	
and now we have this:

	if (tplg->ops)
		sbe->dobj.unload = tplg->ops->control_unload;
	
	if (dobj->unload)
		dobj->unload(comp, dobj);

The improvement is far from obvious to me.

Not going to lay on the tracks for this though.

