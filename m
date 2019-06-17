Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BDC4879C
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 17:41:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B19F717FE;
	Mon, 17 Jun 2019 17:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B19F717FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560786100;
	bh=+3C7X4tjOOw37RvokL6mJc5Pm9LMmusgZcs/STNg7S8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mq60zXqh41UJJ3MnyUKT6SOJfeG80cntw8ZFsyBhRI27fh/Aflb62qsFOUAx7sb15
	 QaPwIY2A4LRnCQWpIRVaEZuv9E/7kg++7J9/2Pv4OyqkWUdgjNiBoFfAUD0pRmACq2
	 tenDHGlT8J0GRSBqp6iBpFGh8njdtgTrPPPg2gR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61E9BF89730;
	Mon, 17 Jun 2019 17:32:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72985F89729; Mon, 17 Jun 2019 17:31:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD650F896C7
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 17:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD650F896C7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 08:31:52 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 17 Jun 2019 08:31:52 -0700
Received: from rkammarx-mobl3.ger.corp.intel.com (unknown [10.252.61.163])
 by linux.intel.com (Postfix) with ESMTP id 701835801A8;
 Mon, 17 Jun 2019 08:31:51 -0700 (PDT)
To: Mark Brown <broonie@kernel.org>
References: <20190528200255.15923-1-pierre-louis.bossart@linux.intel.com>
 <20190617144727.GR5316@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <29ad7270-9aa4-a002-0f0e-21b7a61fe8a4@linux.intel.com>
Date: Mon, 17 Jun 2019 17:31:53 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190617144727.GR5316@sirena.org.uk>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Randy Dunlap <rdunlap@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH] ASoC: Intel: use common helpers to
 detect CPUs
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

On 6/17/19 4:47 PM, Mark Brown wrote:
> On Tue, May 28, 2019 at 03:02:55PM -0500, Pierre-Louis Bossart wrote:
> 
>> 2. is there a better way to do this for all Intel chips or do we keep
>> this in sound/? Andy?
> 
> ARM has platform detection stuff in the architecture code, something
> similar seems sensible for x86?

Well yes, we already have x86_match_cpu() but that won't work with 
COMPILE_TEST (asm/ headers don't exist) and this leads to duplication of 
code. All we really need here is a yeah/nay answer from a help that 
hides those details away.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
