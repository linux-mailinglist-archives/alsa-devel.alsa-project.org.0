Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A269667922
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 16:25:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB0A991E1;
	Thu, 12 Jan 2023 16:24:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB0A991E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673537106;
	bh=1ogKDa+gohWwir6wzjgRx7czWlYG4KY4+uuLFASZ8fs=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tSs499sjm7zrgic8tz1aR6Uhi38H3Y41AdV9HtWFfYYu0SBa2C1B548FyHmIGZ3V8
	 CCRTOQNa8tFzc/KbAfWeWPrX6E2D9GXwkIhp3VQGvmUREnwYk42jDNx2xMfRnfY67I
	 PrynPZNifCmJ/ruboqivgAFjK2b6OHavQtIeV4TA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9B5DF80548;
	Thu, 12 Jan 2023 16:23:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58F43F80542; Thu, 12 Jan 2023 16:23:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9927BF804BD
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 16:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9927BF804BD
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EwEQxPCZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673536995; x=1705072995;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1ogKDa+gohWwir6wzjgRx7czWlYG4KY4+uuLFASZ8fs=;
 b=EwEQxPCZY2phpe+2DLNlf9JWr1K3v6/mZ3xteoLzwOJ0yIV5Ej7y+siN
 A6fBmCDlOlk3uyau0p85zzyN6ArP8uKTY8D0RMvSzVkoHHv2Vu5avi9VP
 wk4V0qrGr4btEqjRLPhhqdyY+8Ke/1TIugcfdJXSa//DfRfUpIou9HkDs
 xi9d6bnlDWK6oQJQ7Qj+QtLsdUKsB3VB6/PKcVIx3zKi5X+RYwdYq3S72
 WU0kkFgR4v5ftqEcN0xc5GtNwM/pDZBdX7fIaqDERmpMwhTjXPzqZyOw5
 cFXmRB0ws8cOHYPay449AuttEQYR9673rVPJ3i02qMMUAAyWzCSPq5mEC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="388212588"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="388212588"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 06:57:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="607816940"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="607816940"
Received: from jbetan3x-mobl1.amr.corp.intel.com (HELO [10.209.143.163])
 ([10.209.143.163])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 06:57:14 -0800
Message-ID: <5a34e6f7-eaf1-8128-81e4-81f65541d9a8@linux.intel.com>
Date: Thu, 12 Jan 2023 08:54:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 19/19] ASoC: amd: ps: increase runtime suspend delay
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-20-Vijendar.Mukunda@amd.com>
 <c7f018e3-c8be-6819-0ece-244bfb943c62@linux.intel.com>
 <0aaf3fa5-bcf1-ec06-8f78-c61e8809398e@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <0aaf3fa5-bcf1-ec06-8f78-c61e8809398e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Mario.Limonciello@amd.com, arungopal.kondaveeti@amd.com,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/12/23 05:02, Mukunda,Vijendar wrote:
> On 11/01/23 21:32, Pierre-Louis Bossart wrote:
>> On 1/11/23 03:02, Vijendar Mukunda wrote:
>>> To avoid ACP entering into D3 state during slave enumeration and
>>> initialization on two soundwire controller instances for multiple codecs,
>>> increase the runtime suspend delay to 3 seconds.
>> You have a parent PCI device and a set of child devices for each
>> manager. The parent PCI device cannot suspend before all its children
>> are also suspended, so shouldn't the delay be modified at the manager level?
>>
>> Not getting what this delay is and how this would deal with a lengthy
>> enumeration/initialization process.
> Yes agreed. Until Child devices are suspended, parent device will
> be in D0 state. We will rephrase the commit message.
> 
> Machine driver node will be created by ACP PCI driver.
> We have added delay in machine driver to make sure
> two manager instances completes codec enumeration and
> peripheral initialization before registering the sound card.
> Without adding delay in machine driver will result early card
> registration before codec initialization is completed. Manager
> will enter in to bad state due to codec read/write failures.
> We are intended to keep the ACP in D0 state, till sound card
> is created and jack controls are initialized. To handle, at manager
> level increased runtime suspend delay.

This doesn't look too good. You should not assume any timing
dependencies in the machine driver probe. I made that mistake in earlier
versions and we had to revisit all this to make sure drivers could be
bound/unbound at any time.
