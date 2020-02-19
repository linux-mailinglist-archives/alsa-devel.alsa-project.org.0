Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE84164EE4
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 20:29:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BF4916A8;
	Wed, 19 Feb 2020 20:28:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BF4916A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582140578;
	bh=485ZrrtckWWjpby7br51eluuXPCnzNqykffBxaBPluw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DjaUb0G8Hp/URpQ7xrcymplblRCkBtHXMkgkG0IA6SPircRqGfr7ZMRhB1INh06ok
	 TrhPkNQ0/Uznnu9D9gh2mQF23hIqfiSzbbVJ6GTiJnjYeZiTbM40E5YIgJEtey51td
	 qpMpZIA310vOM3l4r5A1FXzNif3+JYkBhTO4ku0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AED2AF801F5;
	Wed, 19 Feb 2020 20:27:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF125F80114; Wed, 19 Feb 2020 20:27:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0E6DF80114
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 20:27:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0E6DF80114
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 11:27:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; d="scan'208";a="436338569"
Received: from aibautis-mobl2.amr.corp.intel.com (HELO [10.251.151.242])
 ([10.251.151.242])
 by fmsmga006.fm.intel.com with ESMTP; 19 Feb 2020 11:27:35 -0800
Subject: Re: [PATCH] ASoC: soc-pcm: Revert "call
 snd_soc_component_open/close() once"
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20200219182650.1416-1-kai.vehmanen@linux.intel.com>
 <alpine.DEB.2.21.2002192046250.2957@eliteleevi.tm.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4b7feeff-3cc7-166e-a3fd-4cfd942166a2@linux.intel.com>
Date: Wed, 19 Feb 2020 13:27:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2002192046250.2957@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: digetx@gmail.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, kuninori.morimoto.gx@renesas.com
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



On 2/19/20 12:53 PM, Kai Vehmanen wrote:
> Hey,
> 
> On Wed, 19 Feb 2020, Kai Vehmanen wrote:
> 
>> ASoC component open/close and snd_soc_component_module_get/put are
>> called independently for each component-substream pair, so the logic
>> in the reverted patch was not sufficient and led to PCM playback and
>> module unload errors.
> 
> I tried to keep part of the original patch at first, but I kept hitting
> new issues either in component load, or in module unload-reload flow.
> Thanks to Pierre and Ranjani for early reviews.
> 
> So in the end I ended up with a full revert. This at least works on all
> SOF device topologies I tested with.
> 
> At the root of the problem is that component open is called with multiple
> substreams and driver open (and close) should be called for each substream
> as well. This also caused problems to the added module refcounting logic..
> so that is reverted as well.

I also tried to find a fix in parallel with Kai's work, but no luck. 
First I am not sure why we need to add a 'module' state in addition to 
the existing module ref-counting, and the 'opened' state management 
looks too simple. revert-and-revisit seems like the best course of 
action indeed.

