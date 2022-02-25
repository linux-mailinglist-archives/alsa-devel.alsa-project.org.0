Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 689044C50C8
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 22:36:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2CBD1B33;
	Fri, 25 Feb 2022 22:35:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2CBD1B33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645825006;
	bh=2zc0GVtb2azrFfXd13Gri/txdIzPB104mfg3wRIK6kM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LcH58BqXrggLzAvR9ft0DmZuXxPErYzFGY61Nh/mK4jSCTdOsUkm4TUVF/XYfocLE
	 J2GJUzX0rMtKKq/q7X0i9xjmmTkIdz1fzuMDrDThl1OtdrTIDNlxmopvGhg5R/Vc7Q
	 HrcBMw7Daem3Y556G54m7JdZb93dgqUcr/FlMBzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D2FEF80159;
	Fri, 25 Feb 2022 22:35:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF2CBF80132; Fri, 25 Feb 2022 22:35:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_78,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B3C4F800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 22:35:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B3C4F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SX/HHYJC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645824936; x=1677360936;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2zc0GVtb2azrFfXd13Gri/txdIzPB104mfg3wRIK6kM=;
 b=SX/HHYJC4YUp6mcP4ebR1LPzThWJuVPpXPJVN3esygXBizl5vXn9jDVT
 TL3r76DyPih4nvAdQMe9Q+mRAIvpox4m+hSJoFg/DgGFh3ofsAnzo4uxi
 Rg4UC2zBceYtfAlWZQTm7rx1vAnY1TmtN/Hrgw+GYdDopbsokY0qI/0Q9
 mcx3+5bd1IcA6ECAdDa4/0r2GtEwq5W9AxehOVCZmqTyeIub8v4WZcMDm
 Xe1OG+RsRoyycfbfpA/VrkVrq1ra/IlJl48CCbYL7orXxcqkAGZskGD8D
 Q7O6WUQ9ZLRC9iVB5H+oI1X+zZNskhg99j1sZ3ADGna0qvxmT5qT/giWV w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="250164427"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="250164427"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 13:35:30 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="777528388"
Received: from nnwogbe-mobl1.amr.corp.intel.com (HELO [10.212.101.231])
 ([10.212.101.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 13:35:29 -0800
Message-ID: <e6fad337-59fc-442c-2892-94eabfd0d084@linux.intel.com>
Date: Fri, 25 Feb 2022 15:35:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [RFC 00/13] ASoC: Intel: avs: Topology and path management
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220207132532.3782412-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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


> A continuation of avs-driver initial series [1]. This chapter covers
> path management and topology parsing part which was ealier path of the
> main series. The two patches that represented these two subjects in the
> initial series, have been split into many to allow for easier review and
> discussion.
> 
> AVS topology is split into two major parts: dictionaries - found within
> ASoC topology manifest - and path templates - found within DAPM widget
> private data. Dictionaries job is to reduce the total amount of memory
> occupied by topology elements. Rather than having every pipeline and
> module carry its own information, each refers to specific entry in
> specific dictionary by provided (from topology file) indexes. In
> consequence, most struct avs_tplg_xxx are made out of pointers.
> 
> A 'path' represents a DSP side of audio stream in runtime - is a logical
> container for pipelines which are themselves composed of modules -
> processing units. Due to high range of possible audio format
> combinations, there can be more variants of given path (and thus, its
> pipelines and modules) than total number of pipelines and module
> instances which firmware supports concurrently, all the instance IDs are
> allocated dynamically with help of IDA interface. 'Path templates' come
> from topology file and describe a pattern which is later used to
> actually create runtime 'path'.

This is one of the most 'dense' patchsets I've reviewed in a long time.
While the code looks mostly good, I am afraid the directions and scope
are rather unclear. Now that you've split the basic parts out,
ironically it makes the intent of this patchset really difficult to grasp.

The first order of business is really to clarify the concepts:

What is a 'stream'? what is a 'path'? what is a 'path template'? What is
a 'module template'? What topologies are supported? what is the link
between a path and FE? how does this interoperate or duplicate DPAM? why
does a path rely on a single DMA? What would happen if there is no host
PCM, e.g. for a beep tone generated in firmware? How would this work for
a firmware capture pipeline that only sends notification on acoustic
events and no PCM data?

I have reviewed this set of patches three times already and this set of
concepts are still nebulous to me, please refer to my detailed comments.

You really need to describe in layman's terms what the problem statement
is, what your solution tries to fix, what other options you considered,
what cases you didn't handle, etc. Put yourself if the shoes of someone
that is not part of your team and has no prior exposure to the cAVS
firmware design.

I would recommend that you use the Windows documentation [1] to provide
ascii-art examples with hierarchical mixing, multiple outputs and
loopbacks on what a 'path' really is and how the concept of template helps.

But at a more fundamental level, the main concern I have is with the BE
use: this patchset assumes the BE configuration is fixed, and that's a
very very strong limitation. It's clearly not right for e.g. Bluetooth
offload where multiple profiles need to be supported. It's also not
right when the codec or receiver can adjust to multiple hw_params, which
could lead to simplifications such as removal of unnecessary
SRC/downmixers, etc.

We absolutely want the capability to reconfigure the BE by using
constraint matching between FE hw_params requested by applications and
what the hardware can support. If your solution solved that problem you
would have my full support. But if we're adding a rather complicated
framework on top of a known limitation, then that's really a missed
opportunity to do things better collectively.

[1]
https://docs.microsoft.com/en-us/windows-hardware/drivers/audio/audio-processing-object-architecture
