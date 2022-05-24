Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09424532EAB
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 18:12:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BA0D83D;
	Tue, 24 May 2022 18:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BA0D83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653408743;
	bh=i6AJ8TrOMhDOqSU1TYF9IUdBvFi7WRMxTYLCkaAaz4A=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AMb6V9lMAzWD70QQJQXRpdUjWPkfzqnbt3fDv8q9ipObaQnVZdgvWZVQWSPG/EvG/
	 E9WRgIxs5UYtjzeOUVTfoSfAsvOTZgtMNXvrkNcbKnI78SruKehRokJQ9Ij3668KDp
	 XZL/2Epn5VgZoSTq/X3/NVDJCgNORPH4LRsVX2qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17794F800E3;
	Tue, 24 May 2022 18:11:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55A9EF804CC; Tue, 24 May 2022 18:11:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_72,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C345DF8051F
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 18:11:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C345DF8051F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IWpa7f0B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653408672; x=1684944672;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=i6AJ8TrOMhDOqSU1TYF9IUdBvFi7WRMxTYLCkaAaz4A=;
 b=IWpa7f0BpRPFH0St/oAgMCU2rXa6ZL9tJ8GFHXnVZMpzMv5WxOZXg03C
 S/j+6PvDhGq/Bje9D+NnobPGW9YCKALNfYuItvar5JWCRuvVsiT/txQGt
 VpQt1krTKBQTaPYb6eIoD2ndfRJeIi+SMrr3Mu4YRHesUCUlhAWowVwhm
 IVSdwyNPpKY/dlRTKwuLOn5IL7WhmTg/+sI5CRTr8/BtyOhFYjdDYoWfI
 mBZX0YirPSDBf5hr6xUfAdQI0D6uCPMgu/JMzi8yLY2Z3k6dMEyXgwi4t
 LidfTG44WkDi1r9l1kL4seQXAdOcm+ChlXpmT2ZCQRLgBSMbTaH2kM0Nb g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="253447493"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="253447493"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 09:11:04 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="901099395"
Received: from smtricke-mobl1.amr.corp.intel.com (HELO [10.251.3.87])
 ([10.251.3.87])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 09:11:03 -0700
Message-ID: <5a6e4f90-7b61-376e-8f50-35f2a7dcf8c5@linux.intel.com>
Date: Tue, 24 May 2022 11:11:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: About Cleanup ASoC
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
 <YozcfjgvFfQa/HxS@sirena.org.uk>
 <41033b5b-5bde-10a2-70e8-aa7482992235@intel.com>
Content-Language: en-US
In-Reply-To: <41033b5b-5bde-10a2-70e8-aa7482992235@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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



On 5/24/22 10:06, Cezary Rojewski wrote:
> On 2022-05-24 3:24 PM, Mark Brown wrote:
>> On Tue, May 24, 2022 at 04:40:24AM +0000, Kuninori Morimoto wrote:
>>
>>> I have very interesting to clean up ASoC.
>>> I think it is still very complex, thus, non flexible.
>>> I'm thinking that we want to cleanup...
>>>
>>>     - Component with multi Card connection
>>
>> I'm really not certain that we want components in multiple cards at all,
>> I know the Intel AVS people wanted this but I'm concerned that if a
>> single component is in multiple cards we'll inevitably have connections
>> between the cards which each needs to take into consideration, that
>> could be routing or something else like clock configuration.
> 
> Hello,
> 
> It seems explanation of design of the avs-driver had some shortcomings.
> The AVS people (like me) are to blame for this :S
> 
> The exact opposite is true - we do not want 1:N component:card relation.
> Separate set of components and a separate card (machine board) per
> logically separate audio device is the approach of choice here. It has
> its benefits of simplifying PM and allowing for better user experience -
> probe() failure of one device does not prevent other devices from
> enumerating.

The separate card solution works for ACPI devices only because we don't
have any structured information. I don't know how it would work for
Device Tree. There's no mechanism I am aware of by which the platform
driver would be informed of board requirements and would split its DAIs
in different components required by that board. It might be
worked-around by having one component per DAI though, but that
waters-down the notion of component driver quite a bit.

If you have any data connection or loopbacks between cards, or shared
clocks, then you have DAPM events that are interesting to propagate.
Power management is not 'simple' or even 'simpler' to me.

We can also debate forever on probe failures, the user will only see a
problem when they try to use the missing devices. Fail big and fail
early is the best model I've seen so far, much easier to support and report.

I am not saying having multiple cards is a bad idea, just that there are
a number of technical opens with strong implications on the
implementation and scaling.
