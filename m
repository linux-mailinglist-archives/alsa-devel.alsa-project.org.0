Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B61B680E8C
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 14:10:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 159ADDEC;
	Mon, 30 Jan 2023 14:09:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 159ADDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675084209;
	bh=HgXHkcI7jdzDaygojJXPl0kEAzDM1E3og5/Yhjq1+cY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ch6b65o+OfV2JVHFQwy867/Wvm+Iz786p970a0/qf2xeYnJWPKsmzBWqjbSn2OTDq
	 EKdDGwT1xxqTquSPON0wWbG5hNuxH97j2940jiq/fR9eb7QVTLHN2DHzr3hqkfuH+q
	 5D7hYojow1rCXHrDX/UHo2r/64zj+Zra3xpKpYWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81468F8007C;
	Mon, 30 Jan 2023 14:09:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19792F80423; Mon, 30 Jan 2023 14:09:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61CF5F8007C
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 14:08:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61CF5F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J0biottH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675084145; x=1706620145;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HgXHkcI7jdzDaygojJXPl0kEAzDM1E3og5/Yhjq1+cY=;
 b=J0biottH1FVT5XrCvRP7pZqoirRXz8Q/glkoe54xf1svW1bH8bsdLOkF
 oNry3Y5FI9Evqs66rrPoBZn7lcLZb0kShhw1nhKd3SIp01vu5HS0VDPZc
 pB2W1KnkYRYfSmgcA97rnV4+rrHDFdxj6BtfnoBaY5bD0cdvWGZhyOav3
 V25OMcYX0DQariL4zbdmvlHb0Yb9vuAkdL7q/ow+p96IdTLf40/oqeB1P
 ox8AKYoC2hnkUNJFNBQc1G/3NPBBDFprJYL6xIhk4v980h4c2nlQBIiC3
 8s943BUUCmCpdt3oHSMhpU+ZU9tGg/J3mml2yBu5JKJ5PfTnS6duhdNG1 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="315510985"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="315510985"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 05:08:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="641538580"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="641538580"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 05:08:23 -0800
Message-ID: <f98fa3d6-81ae-9427-f494-d185b02afbce@linux.intel.com>
Date: Mon, 30 Jan 2023 14:08:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 00/11] ASoC: topology: Fixes and cleanups
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>
References: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
 <9f98fb6e-ff4b-5cac-9606-fcc0b3f256fe@perex.cz>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <9f98fb6e-ff4b-5cac-9606-fcc0b3f256fe@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 1/27/2023 5:27 PM, Jaroslav Kysela wrote:
> On 28. 01. 23 0:11, Amadeusz Sławiński wrote:
>> Following is series of fixes and cleanups for core topology code. Few
>> patches fixing various problems all around and few fixing function
>> names.
> 
> Just an info - the sent date seems to be in future in your git patch sets.
> 

Eh..., I'm not sure how it got out of sync. Anyway fixed. Thanks!
