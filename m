Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A3A4CA9C8
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 17:06:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09BA31F52;
	Wed,  2 Mar 2022 17:05:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09BA31F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646237195;
	bh=mROq2oKbPLLqLkHfwYSfYa/UVZGqxz+JSCJ76WRP+ic=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SKJilVH5QBba9qYdghsXlxTs9jNxETERf311rUhEAQIQgyjRxmemZ9OvMA9vtK6sA
	 1LD77Hxpsu+XOG+X6NH6Ub5PmiMpXNMVbY+L8wP/yyfG9WK6aNR0RsUvsNZBBVSalY
	 PXoo5bhRlRdj34zvn3hHL0fiIhq9mTgPRFr5rEMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61AB5F8027D;
	Wed,  2 Mar 2022 17:05:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A59DF801D5; Wed,  2 Mar 2022 17:05:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70A93F80154
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 17:05:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70A93F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UPqGmSSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646237119; x=1677773119;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mROq2oKbPLLqLkHfwYSfYa/UVZGqxz+JSCJ76WRP+ic=;
 b=UPqGmSSr6WpAn275Leiak/rZfe+qBwTqq125sF9rKkCBJaP/VWGBCNHQ
 uSzoEmR/UbO0GNJq9QH1T6PV0Le5pb3GJQ1yuz+mxyCmTUi0Gv1tsKH9U
 e8NoY9B6PhaMq5iBXY9gPu+HIReU3f1LFZnS5fL+gqP2GYK6abe/rDLeO
 84GrZ9cAYCnCCkkmQU0DB1kRcpOmm9WnlQNuqhQhV0nLkz2mrbVEE4oz7
 tQP40cK8SMx03jdwRub95Cb5f44Yro7su+Ypj/HNTDmzGrJJBMNbtvj9c
 Z9xDJeFIHczhgEd4JrGtZ+bIjNn30lsM74m/TgGrxNWXxfVSGmQYZilLm g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="314155700"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="314155700"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 08:05:14 -0800
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="535440399"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.26])
 ([10.99.241.26])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 08:05:07 -0800
Message-ID: <05ee9a2c-e7dc-1f75-da7c-39b30464bd08@linux.intel.com>
Date: Wed, 2 Mar 2022 17:05:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 7/8] ASoC: Intel: sof_ssp_amp: rename driver and support
 cs35l41 amplifier
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
 <20220301194903.60859-8-pierre-louis.bossart@linux.intel.com>
 <e597f364-96b6-08b1-3c88-436693c65b04@linux.intel.com>
 <33d27810-a023-f2f7-5218-e406fc7c13e5@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <33d27810-a023-f2f7-5218-e406fc7c13e5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>
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

On 3/2/2022 4:50 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 3/2/22 8:56 AM, Amadeusz Sławiński wrote:
>> On 3/1/2022 8:49 PM, Pierre-Louis Bossart wrote:
>>> From: Brent Lu <brent.lu@intel.com>
>>>
>>> Add support of CS35L41 amplifier to the machine driver, as well as
>>> the support of HDMI playback and BT offload DAI Link.
>>>
>>> Rename the driver to a generic name to support different amplifiers
>>> from different vendors.
>>>
>>> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>>> Signed-off-by: Brent Lu <brent.lu@intel.com>
>>> Signed-off-by: Pierre-Louis Bossart 
>>> <pierre-louis.bossart@linux.intel.com>
>>> ---
>>
>> Eh... rename should happen in separate patch, as there seems to be 
>> some changes done to the file and it is quite hard to review it, when 
>> whole file is in diff due to being moved.
> 
> that was a conscious decision on my side to keep the patches as is, 
> first add the initial contribution for the rt1308 amp from our embedded 
> Linux team, and show how it was extended to support another amplifier 
> for Chrome.
> 
> Indeed it leads to a bit of a tick-tock patch with the rename but it's 
> not that bad, is it? The alternative would lead to a much bigger patch 
> if I squash the whole thing.

I think you've misunderstood me, I'm not talking about squashing, but 
splitting patch 7 into two separate patches - one doing rename and 
another adding/changing things.

I was looking at:
+	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
+					sof_ssp_amp_card.num_links, GFP_KERNEL);
+	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component) *
+					sof_ssp_amp_card.num_links, GFP_KERNEL);

and wondered where sof_ssp_amp_card.num_links comes from, and it only 
shows up 4 times in removed file, but 6 times in added one, which tells 
me that things changed, but it is hard to see what, when the diff shows 
whole files being moved instead of things that changed.
