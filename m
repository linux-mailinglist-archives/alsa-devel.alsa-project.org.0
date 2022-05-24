Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FE35328A5
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 13:18:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B75A1742;
	Tue, 24 May 2022 13:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B75A1742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653391117;
	bh=27q7u/uYP+2lxY61bE8sSUAd5bqpMcyvMpvT64smCdU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IwNZpS+GpxhYjv1c8qdXeNWS/he6uFCqH1z0VBVq9A9JMt2C5k4ok/CtOBXpsdzGb
	 HoR2SCIn72Vv4NvgjeKy9C+qqszOvO0q0JzP3iAD3NG6BBwdXLS3RzHhbIrVRhO+wn
	 24odeefADNXRPT6B3e2MbzgFMPvNvuZZ/MAueQ3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D736EF800E3;
	Tue, 24 May 2022 13:17:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4BF0F804D1; Tue, 24 May 2022 13:17:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25D15F80100
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 13:17:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25D15F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZmoLtREq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653391053; x=1684927053;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=27q7u/uYP+2lxY61bE8sSUAd5bqpMcyvMpvT64smCdU=;
 b=ZmoLtREqIFP3th9j/qw0NNuRjquZ/7E7Sl+TGi0IiZmWcD2RNd3MQuXl
 BeUPvvxskRph83ndCXXfohOe/eVb5dFqjjh7C+W8iSosO0ip9G86WfhuA
 WzlgS0b4wqF+7QOHPKHRg4nBCkyq+aAt/yPIwc/BLgyyC5+SlFPdkefsh
 bB/Hv8UYz18gVMTd5ml3JEaKVVSE8Pj9YCOPngeh2sf9v9MZuIVr9gN7p
 4hX3CxF05l8JTQCZc+sITHDH+mVMQd7hR5Ig0PYZl8T7W8tq5IBdAxMv0
 XZzXeuQLyqNXgler30GbzVh3yJX2CvDwLivh+WLJJD97+Sp8K9IX+UcMC Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="271074874"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="271074874"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 04:17:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="548425848"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.212])
 ([10.99.249.212])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 04:17:27 -0700
Message-ID: <db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>
Date: Tue, 24 May 2022 13:17:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: About Cleanup ASoC
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 5/24/2022 6:40 AM, Kuninori Morimoto wrote:
> 
> Hi ASoC
> Cc Mark, Pierre-Louis, Cezary
> 
> I have very interesting to clean up ASoC.
> I think it is still very complex, thus, non flexible.
> I'm thinking that we want to cleanup...
> 
> 	- Component with multi Card connection
> 	- fixed playback vs capture
> 	- fixed CPU vs Codec
> 	- DPCM connection vs normal connection
> 
> About first topic,
> I guess the biggest reason why we have limitation is
> its connections. 

(...)

> This makes the limitation which blocking multiple Card connections, I think.
> 

Hi,

I would like to understand the problem here, before I start to discuss 
potential solutions. You seem to be saying that there is some kind of 
card<->component connection limitation? Is there specific use case you 
have in mind?

Personally I don't see a reason for connecting component to multiple 
cards. Even if it would be possible it soon becomes problematic when you 
for example try to decide which card controls clock on component. As 
I've wrote I would like to first see some use case definition, before 
jumping into a rewrite.

Best regards,
Amadeusz
