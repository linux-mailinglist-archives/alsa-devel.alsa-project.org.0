Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B80B2612DF
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 16:43:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0514E16D6;
	Tue,  8 Sep 2020 16:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0514E16D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599576215;
	bh=IaEDgcjtEiJfjlVSUOawyZq3uPmeo6HyiX7JB1yeUYs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PNv6rTv5yjf3dAkDgYtx4wGXa+G8ZTzNsijzDJi7TvyDQzrdm0clsfBMOnNrkTxOh
	 Zcb5QYlsMOzkKtMg2+QtQloHcRb6naoruw6Bro3mo/oq0MG1DEBguaGmxMbVZxr9/3
	 eYmqbQTSbs0x4oMxMOmrNwVmpUdI6Wm1kb0On0MU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16ADFF801F2;
	Tue,  8 Sep 2020 16:41:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9F9DF80264; Tue,  8 Sep 2020 16:41:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83C18F8010B
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 16:41:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83C18F8010B
IronPort-SDR: q5NBwhKZHuKmgKrViqCq08xq3fOQd9mVJVpfcvj7Nlc8W96khhCfWJxT9/AH4DgoFzpIN/w1rR
 BVOhJWoJ1jPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="155542346"
X-IronPort-AV: E=Sophos;i="5.76,406,1592895600"; d="scan'208";a="155542346"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 07:41:41 -0700
IronPort-SDR: 4I5NhY7+9JXI6nAXoUat6O53GXCOJPCYaQDi/HaLR6AlaamRMFHnn0yCJVFVVDwBWQVGoJofix
 SxeDT1u3n0IA==
X-IronPort-AV: E=Sophos;i="5.76,406,1592895600"; d="scan'208";a="448809442"
Received: from mgarber-mobl1.amr.corp.intel.com (HELO [10.212.179.134])
 ([10.212.179.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 07:41:36 -0700
Subject: Re: [RFC PATCH 1/3] topology: use inclusive language for bclk
To: Mark Brown <broonie@kernel.org>
References: <20200903201024.1109914-1-pierre-louis.bossart@linux.intel.com>
 <20200903201024.1109914-2-pierre-louis.bossart@linux.intel.com>
 <s5hd03152mr.wl-tiwai@suse.de>
 <deaae562-80f2-a934-d551-ac5d9a047bbf@linux.intel.com>
 <20200908143504.GD5551@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <70a2012f-aa8b-52db-7694-592677d7171c@linux.intel.com>
Date: Tue, 8 Sep 2020 09:41:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908143504.GD5551@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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



On 9/8/20 9:35 AM, Mark Brown wrote:
> On Tue, Sep 08, 2020 at 08:39:13AM -0500, Pierre-Louis Bossart wrote:
> 
>>>> -	__u8 bclk_master;	/* SND_SOC_TPLG_BCLK_ value */
>>>> +	__u8 bclk_provider;	/* SND_SOC_TPLG_BCLK_ value */
> 
>>> Is it 100% compatible?  Note that the uapi/* header is a copy from the
>>> kernel header, and it means that we'll change the same for the kernel,
>>> too.
> 
>> It's absolutely 100% compatible by design.
>> I was planning to update the kernel uapi header to align changes, but the
>> volume of code is much lower on the alsa-lib side. Will resubmit with the
>> preferred provider/consumer wording.
> 
> It's binary compatible but it'd break the build for any existing code
> using the UAPI headers.

Sorry, I don't fully get the comment. Aren't the uapi headers copied 
into each software tree that relies on them?
