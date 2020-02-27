Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FE4171442
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2020 10:43:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 870CF1699;
	Thu, 27 Feb 2020 10:42:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 870CF1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582796589;
	bh=uXElpAp+4zhjW5lg4Q8yz44/8Du8rbsN2Z7pe/AWAkI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mnuJJdHUBy5yBzTfbwQhE+z8uIul4sZictJcrs9t13//8X4TKTPjarVBqDmjSmEl8
	 LI7Ug9O8EJ4AOtgvjv6WjPSQSp7If5RPCtyBi+mMRjiZUeAQRx7m7QQwiBWQllfIyD
	 kvXLOAeAEXOE3YhdnH7pn9wgSlKXmWtQZuxkOaDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1CCFF80089;
	Thu, 27 Feb 2020 10:41:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0610F80142; Thu, 27 Feb 2020 10:41:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41A22F80089
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 10:41:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A22F80089
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 01:41:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,491,1574150400"; d="scan'208";a="350639338"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2020 01:41:17 -0800
Date: Thu, 27 Feb 2020 11:41:16 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-pcm: Revert "call snd_soc_component_open/close()
 once"
In-Reply-To: <87ftey88wk.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <alpine.DEB.2.21.2002271110010.2957@eliteleevi.tm.intel.com>
References: <20200219182650.1416-1-kai.vehmanen@linux.intel.com>
 <87blput7hh.wl-kuninori.morimoto.gx@renesas.com>
 <alpine.DEB.2.21.2002201103060.2957@eliteleevi.tm.intel.com>
 <87mu9cspyf.wl-kuninori.morimoto.gx@renesas.com>
 <alpine.DEB.2.21.2002211251280.2957@eliteleevi.tm.intel.com>
 <87mu978pob.wl-kuninori.morimoto.gx@renesas.com>
 <87ftey88wk.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, digetx@gmail.com
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

Hello Morimoto-san,

On Wed, 26 Feb 2020, Kuninori Morimoto wrote:

> Maybe this is too late, but I want to tell
> the reason why I wanted to add flag on each component.
[...]
> If each component / rtd / dai have "done" flag or count,
> soc_pcm_open() can call soc_pcm_close() directly
> without thinking about "until", because each flag can handle/indicate it.

thanks for the longer explanation. It's true we have a lot of code with 
for_each_xxx() loops, and loop logic where errors can occur. It seems the 
most common approach is to store the index and use for_each_xxx_rollback() 
macros to clean up in case error happens. This does lead to the problem of 
essentially duplicated logic e.g. for soc_pcm_close() and error handling 
of snd_pcm_open(). And yeah, it's also a bit error prone as the logic is 
not exactly the same. E.g. I'm not convinced this is quite right in 
soc_pcm_open():

»       for_each_rtd_codec_dai(rtd, i, codec_dai) {                                                                                                                                                          
»       »       ret = snd_soc_dai_startup(codec_dai, substream);                                                                                                                                             
»       »       if (ret < 0) {                                                                                                                                                                               
»       »       »       dev_err(codec_dai->dev,                                                                                                                                                              
»       »       »       »       "ASoC: can't open codec %s: %d\n",                                                                                                                                           
»       »       »       »       codec_dai->name, ret);                                                                                                                                                       
»       »       »       goto config_err;                                                                                                                                                                     
»       »       }                                             
...
config_err:                                                                                                                                                                                                  
»       for_each_rtd_codec_dai(rtd, i, codec_dai)                                                                                                                                                            
»       »       snd_soc_dai_shutdown(codec_dai, substream);                                                                                                                                                  
»       i = rtd->num_cpus;
 
... i.e. we should use _rollback() macro here, but we don't so shutdown 
is called on all codec dais if I read this right.

Having a single cleanup path would be easier, but I think in the end it 
comes down to how cleanly you can track the opened state. It seems biggest 
issue is how to cleanly track the component-substream pairs. Ideally we'd 
have a dedicated state object to represent an opened component-substream 
pair, but that's not how the APIs are defined now. But something to that
effect is needed.

Br, Kai
