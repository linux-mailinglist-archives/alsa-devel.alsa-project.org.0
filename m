Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E81852DA
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 20:19:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D000828;
	Wed,  7 Aug 2019 20:18:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D000828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565201952;
	bh=FJzN7GXAOzQbZsgoSdd/N29OOvPnWsG85m8+BHh30g0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ULvOIfEmJACy+9sOgT5nqsaHXACuBITm9YXk9pr/n0/ksEfbQ665sxKMY9otmaI5s
	 ra/4cjU79NH1ax7QSC7YUL15SFfhrGygzd/nMBf+x+UoTb9Ecn1amyKRK/35/rHhtR
	 QQxEc4SvWJipwXJE0wEsrFbU28nKbUwPHmutUoWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0E88F80227;
	Wed,  7 Aug 2019 20:17:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B1D6F80290; Wed,  7 Aug 2019 20:17:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0758F800F4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 20:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0758F800F4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 11:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,358,1559545200"; d="scan'208";a="165424309"
Received: from mwdryfus-mobl.amr.corp.intel.com (HELO [10.254.191.107])
 ([10.254.191.107])
 by orsmga007.jf.intel.com with ESMTP; 07 Aug 2019 11:17:20 -0700
To: Mark Brown <broonie@kernel.org>
References: <20190718230215.18675-1-pierre-louis.bossart@linux.intel.com>
 <CAJZ5v0g5Hk9JYLvRXfLk5-o=n_RVPKtWD=QONpiimCWyQOFELQ@mail.gmail.com>
 <52a2cb0c-92a6-59d5-72da-832edd6481f3@linux.intel.com>
 <20190807175646.GK4048@sirena.co.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5a7473a2-83c0-1a09-0cab-31fcc5b21302@linux.intel.com>
Date: Wed, 7 Aug 2019 13:17:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807175646.GK4048@sirena.co.uk>
Content-Language: en-US
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, jank@cadence.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH] soundwire: fix regmap dependencies and
 align with other serial links
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

Hi Mark,

> 
>> Vinod, Mark, any feedback?
> 
>> There will be a set of SoundWire codec drivers provided upstream soonish and
>> we'll get a number of kbuild errors without this patch.
> 
> I think I'm missing context here, I've basically been zoning out all the
> soundwire stuff - the patch series are huge and generate a bunch of
> discusion.  Is the patch below the full thing?  I don't see any obvious
> problems.

Here's a bit of context:

This patch is really independent from the 40-odd fixes I pushed about 10 
days ago. I provided an initial version back in April ('[PATCH v2 2/2] 
regmap: soundwire: fix Kconfig select/depend issue') during the first 
batch of updates. At the time, the suggested solution for the 
compilation issues was not agreed on, so the build errors remained - not 
a big deal they only show-up with codec drivers that were not upstreamed 
so far. It took me a while to come back to it but that was the first in 
my TODO list after my Summer break and now that we are almost ready to 
upstream those codec drivers it's a good time to revisit this issue.

Your initial feedback was:

"This now makes _SOUNDWIRE different to all the other bus types; if this
is a good change then surely the same thing should be done for all the
other bus types. "

and

"Alignment is a requirement.  If you want to optimize
this then it'd be better to optimize all the bus types rather than just
having the one weird bus type that does something different for no
documented reason."

I don't have the knowledge or means to test what I suggested initially 
for the other buses, and the optimization was minimal anyways, so this 
patch takes the path of least resistance and aligns with others.

if there are no objections it's probably easier to push this patch 
through the SoundWire tree, with the relevant Acks.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
