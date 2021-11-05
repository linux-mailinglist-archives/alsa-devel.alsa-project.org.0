Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D03D64466EA
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 17:21:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 582251687;
	Fri,  5 Nov 2021 17:20:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 582251687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636129299;
	bh=1y1H+843yifywrm/gWtF7v7ciUXerYd1lWNPYztdsCE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pAcVAEcOQH4UKozyQg5KCDmhWup5g622Wi3mL6/gzjGNU6mUghMlhuAgGDMZCiqmn
	 pBKIPsjXkuqF9eCoK5pz1PNVwNIJFj+3qsaL1l4W8QtS4bPpo1u1OajLY0bo77SoOW
	 oNg0x97+NwXZniref/BV4v/xscMSWGxSQ4gORxWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C424AF80279;
	Fri,  5 Nov 2021 17:20:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F3A0F8026A; Fri,  5 Nov 2021 17:20:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55119F8012A
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 17:20:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55119F8012A
X-IronPort-AV: E=McAfee;i="6200,9189,10159"; a="318133492"
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="318133492"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 09:16:10 -0700
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="502004186"
Received: from yanbiaoc-mobl.amr.corp.intel.com (HELO [10.209.173.63])
 ([10.209.173.63])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 09:16:08 -0700
Subject: Re: [PATCH 3/4] ASoC: mediatek: mt8195: separate the common code from
 machine driver
To: Mark Brown <broonie@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
References: <20211103100040.11933-1-trevor.wu@mediatek.com>
 <20211103100040.11933-4-trevor.wu@mediatek.com>
 <YYP+l7tMofYoB+aC@sirena.org.uk>
 <b4360ea17c3045759e85ee13fa9c001afe73c93c.camel@mediatek.com>
 <YYVQC7KLZx8oxdXT@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e404d241-0685-643b-4b9d-d85bb8783385@linux.intel.com>
Date: Fri, 5 Nov 2021 11:16:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YYVQC7KLZx8oxdXT@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org
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



On 11/5/21 10:38 AM, Mark Brown wrote:
> On Fri, Nov 05, 2021 at 12:11:55PM +0800, Trevor Wu wrote:
>> On Thu, 2021-11-04 at 15:39 +0000, Mark Brown wrote:
> 
>>> I don't follow why the DSP support requires a new driver?  Shouldn't
>>> all
>>> systems with the DSP present be using it?
> 
>> We need to keep the solution without DSP, so we can replace DSP
>> solution with non-DSP when it's required. But when we introduce SOF for
>> DSP control, there will be more routes in machine driver and device
>> tree usage is different from the original. So it's hard to share the
>> same driver for these two solutions.
> 
> We shouldn't be requiring people to load completely different drivers
> based on software configuration, what if a system wants to bypass the
> DSP in some but not all configurations?  Can we not just have controls
> allowing users to route round the DSP where appropriate?

It was my understanding the card relies on separate components

- a SOF-based component to provide support for DSP-managed interfaces
- a 'non-SOF' component for 'regular' interfaces not handled by the DSP.

this was the basis for the changes discussed in
https://github.com/thesofproject/linux/pull/3217 and
https://github.com/thesofproject/linux/pull/3236

But indeed if the same interface can be managed by the DSP or not,
depending on software choices it's a different problem altogether.

We've looked into this recently, if the choice to involve the DSP or not
is at the interface level, it might be better to have both components
expose different DAIs for the same interface, with some sort of run-time
mutual exclusion, so that all possible/allowed permutations are allowed.
