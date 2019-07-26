Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DE17643B
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 13:16:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEA89202C;
	Fri, 26 Jul 2019 13:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEA89202C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564139778;
	bh=Xvchun493MZSYyleYFS8wrhs05ryJxReoZmpe2TCjis=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nh8ATBYl/t84zz2eAJuhi7qloNzni0m5JamlGrmPTzpkYMpHJzUTS4XRFQJSlf9oa
	 aB2SMZ3l9DqlKqRkhcNwG0RDDLvWqUaOR9MPUvM6LBESEze+UjqtLM4q07YXoKqz6a
	 F+MDMo3KHcwUFKpbl4Hut0uzICuUQdI7Q3ABCgCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BEC2F80393;
	Fri, 26 Jul 2019 13:14:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71BDBF80393; Fri, 26 Jul 2019 13:14:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59463F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 13:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59463F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 04:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,310,1559545200"; d="scan'208";a="175563818"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.89.116])
 ([10.251.89.116])
 by orsmga006.jf.intel.com with ESMTP; 26 Jul 2019 04:14:06 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <6d268dd6-5f1a-e1f4-b0be-c3b978f89cb1@intel.com>
Date: Fri, 26 Jul 2019 13:14:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com
Subject: Re: [alsa-devel] [RFC PATCH 00/40] soundwire: updates for 5.4
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

On 2019-07-26 01:39, Pierre-Louis Bossart wrote:
> The existing upstream code allows for SoundWire devices to be
> enumerated and managed by the bus, but streaming is not currently
> supported.
> 
> Bard Liao, Rander Wang and I did quite a bit of integration/validation
> work to close this gap and we now have SoundWire streaming + basic
> power managemement on Intel CometLake and IceLake reference
> boards. These changes are still preliminary and should not be merged
> as is, but it's time to start reviews. While the number of patches is
> quite large, each of the changes is quite small.
> 
> SOF driver changes will be submitted shortly as well but are still
> being validated.
> 
> ClockStop modes and synchronized playback on
> multiple links are not supported for now and will likely be part of
> the next cycle (dependencies on codec drivers and multi-cpu DAI
> support).
> 
> Acknowledgements: This work would not have been possible without the
> support of Slawomir Blauciak and Tomasz Lauda on the SOF side,
> currently being reviewed, see
> https://github.com/thesofproject/sof/pull/1638
> 
> Comments and feedback welcome!

Hello Pierre,

This patchset is pretty large - I'd suggest dividing next RFC into 
segments: debugfs, info, power-management, basic flow corrections and 
frame shape calculator.
Some commits have no messages and others lack additional info - tried to 
provide feedback wherever I could, though, especially for the last one, 
it would be vital to post additional info so in-depth feedback can be 
provided.

Maybe nothing for calculator will come up, maybe something will. In 
general I remember it being an essential part of SDW and one where many 
bugs where found during the initial verification phase.

Thanks for your contribution and have a good day!
Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
