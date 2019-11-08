Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5235F3EEF
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 05:31:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 228D91685;
	Fri,  8 Nov 2019 05:30:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 228D91685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573187499;
	bh=iSKI9JYgXiSKsUrj9ZqBLT+Ahzsufvk4/0V9c/ati3c=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FfDRY8RAYaVl3c3+EUpUk5BGyrVflwvrMQCHfAOiMEUbelAGPD5MqxQpKX5J8AZtO
	 7XeKPKeJJGzPU/YWhXN/U9JydZi81kEJH2ri00XKyju57aIck+zvLRIHh4ygSsTrVM
	 oaomgJUFmik8um1Al2LpMz92sD0TUjWahGHUi7oY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AE45F800D3;
	Fri,  8 Nov 2019 05:29:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC4D3F803D0; Fri,  8 Nov 2019 05:29:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1149F800D3
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 05:29:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1149F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mUmLjVWF"
Received: from localhost (unknown [106.200.194.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC6EA2178F;
 Fri,  8 Nov 2019 04:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573187384;
 bh=tqpTzta+Se1TB7bsp9vwIxnbM/32x+fpr6Gz4NiCsUo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mUmLjVWFgPkKpVnapidjks07A8JjQPo+B7cRJRcWJQA+U2UqTnSIPDI0awYh5TP3f
 UsyPIyx6v2OuKZkavu3mnXWCLUbKsTEkB0pNgXvMWMuJcpujNfWlE1H9q/D7AdouHC
 0Z2h/h4D4IBXVXPI824hWB0qDQJDtmWs/pQkh6Co=
Date: Fri, 8 Nov 2019 09:59:40 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191108042940.GW952516@vkoul-mobl>
References: <20191023210657.32440-1-pierre-louis.bossart@linux.intel.com>
 <20191023210657.32440-2-pierre-louis.bossart@linux.intel.com>
 <20191103045604.GE2695@vkoul-mobl.Dlink>
 <f53b28bb-1ec7-a400-54ed-51fd55819ecd@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f53b28bb-1ec7-a400-54ed-51fd55819ecd@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/4] soundwire: sdw_slave: add new fields
 to track probe status
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 04-11-19, 08:32, Pierre-Louis Bossart wrote:
> 
> 
> On 11/2/19 11:56 PM, Vinod Koul wrote:
> > On 23-10-19, 16:06, Pierre-Louis Bossart wrote:
> > > Changes to the sdw_slave structure needed to solve race conditions on
> > > driver probe.
> > 
> > Can you please explain the race you have observed, it would be a very
> > useful to document it as well
> 
> the races are explained in the [PATCH 00/18] soundwire: code hardening and
> suspend-resume support series.

It would make sense to explain it here as well to give details to
reviewers, there is nothing wrong with too much detail!

> > > 
> > > The functionality is added in the next patch.
> > 
> > which one..?
> 
> [PATCH 00/18] soundwire: code hardening and suspend-resume support

Yeah great! let me play detective with 18 patch series. I asked for a
patch and got a series!

Again, please help the maintainer to help you. We would love to see this
merged as well, but please step up and give more details in cover
letter and changelogs. I shouldn't need to do guesswork and scan through the
inbox to find the context!

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
