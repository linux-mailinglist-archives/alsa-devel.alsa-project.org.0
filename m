Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBFE127F2B
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 16:20:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9A48165D;
	Fri, 20 Dec 2019 16:19:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9A48165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576855218;
	bh=Re54smGaUhVdNRyEPh/oqWAmCZu86z6bOhgTVc1KxAI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uAVaeMsD+RmVoL879Ii4O5BuLCTaY+eV76a/dxXE0mtSZOElAdPhppnCjCUE/bCmr
	 eP1nn4ANO2ztUbl4ZTIFbY1PJyfTy3MIQraE2U+dJUjAwjGsln831mn6G7mkgBU6e9
	 HZjfVNCs0OVpfpa8jxRz1JMnyJZSb5xuZHvAcji4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AFD3F8015A;
	Fri, 20 Dec 2019 16:18:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1CC3F8015A; Fri, 20 Dec 2019 16:18:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E77FBF800B5
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 16:18:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E77FBF800B5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2019 07:18:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,336,1571727600"; d="scan'208";a="267545919"
Received: from pkriegsm-mobl.amr.corp.intel.com (HELO [10.252.132.172])
 ([10.252.132.172])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Dec 2019 07:18:26 -0800
To: Daniel Mack <daniel@zonque.org>, alsa-devel@alsa-project.org
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-12-daniel@zonque.org>
 <0565e5cd-9a6e-db65-0632-0bc1aa1d79db@linux.intel.com>
 <35e7e6e7-7c70-785c-bdf3-79089134699e@zonque.org>
 <ff0e2420-a2c6-17e7-2761-f6544e2c0cb7@linux.intel.com>
 <fedbdec3-1c44-a72f-3810-30bc7f672601@zonque.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1abed0f6-bf27-8683-d2c1-ef58765bc913@linux.intel.com>
Date: Fri, 20 Dec 2019 09:18:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <fedbdec3-1c44-a72f-3810-30bc7f672601@zonque.org>
Content-Language: en-US
Cc: broonie@kernel.org, pascal.huerst@gmail.com, lars@metafoo.de
Subject: Re: [alsa-devel] [PATCH 10/10] ASoC: Add codec component for AD242x
 nodes
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> Yes, the driver currently only models the SOC-facing side, and that
> follows the 'reverse' clocking scheme:
> 
> * The master node always receives the clock on the SOC-facing side, and
> produces the clock on the bus-facing side.
> * The slave node always receives the clock on the bus-facing side, and
> produces the clock on the SOC-facing side.

I thought the SOC would always be connected to a master node since all 
bus allocation/configurations required a bit of intelligence. Does your 
driver model the case when an SOC would run an ALSA/ASoC driver handling 
data produced/consumed by a A2B slave? Who would control the A2B master 
then?

> I currently don't see a reason for modelling the bus-facing side in the
> ASoC topology at all, but of course that could be added.
> 
> But for the SOC-facing side on *slave* nodes, the currently implemented
> logic should be correct, no? Do you think it makes sense to add the
> bus-side as well?
> 
>> Likewise the master has an 'SOC-facing' interface and a bus-facing
>> interface. it *could* be master on both if ASRC was supported. The point
>> is that the bus-facing interface is not clock slave.
> 
> That's right, I need to look into the modes for the master node again.
> Maybe the check needs to be relaxed on that end.

Your questions are interesting, I am not sure I have answers.

the ASoC clock definitions are usually 'codec-centric', but when a slave 
acts as a bridge and has soc- and audio-facing interfaces, and the 
latter one connects to say an amplifier, then what is the reference 
point? Or should all segments be considered independent?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
