Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E006164E25
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 19:54:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC7EB16AE;
	Wed, 19 Feb 2020 19:54:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC7EB16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582138497;
	bh=qVWKmPXLQb1OpzWQpMnkRQWf9oD8AzUHso3Iav+pITE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TDV3ITTEKUsc6Cnz8RRXhhBeo6hum3jj9zAp33W/FvmawFltzgCZEiR6QMbKzzdwC
	 houIHV6y4Hkrzs/Y85tQq97Eczc9+W3I3C6PK0zbSY9TLg3W1ig/RwY9q5suuyZrWN
	 uZwKfF1CxUChK5esNYGv8uW2v8VkXvLWBuae0ED4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF90FF80114;
	Wed, 19 Feb 2020 19:53:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BFB6F80276; Wed, 19 Feb 2020 19:53:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05335F8025F
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 19:53:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05335F8025F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 10:53:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; d="scan'208";a="283184514"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Feb 2020 10:53:07 -0800
Date: Wed, 19 Feb 2020 20:53:06 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-pcm: Revert "call snd_soc_component_open/close()
 once"
In-Reply-To: <20200219182650.1416-1-kai.vehmanen@linux.intel.com>
Message-ID: <alpine.DEB.2.21.2002192046250.2957@eliteleevi.tm.intel.com>
References: <20200219182650.1416-1-kai.vehmanen@linux.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
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

Hey,

On Wed, 19 Feb 2020, Kai Vehmanen wrote:

> ASoC component open/close and snd_soc_component_module_get/put are
> called independently for each component-substream pair, so the logic
> in the reverted patch was not sufficient and led to PCM playback and
> module unload errors.

I tried to keep part of the original patch at first, but I kept hitting 
new issues either in component load, or in module unload-reload flow.
Thanks to Pierre and Ranjani for early reviews.

So in the end I ended up with a full revert. This at least works on all 
SOF device topologies I tested with. 

At the root of the problem is that component open is called with multiple 
substreams and driver open (and close) should be called for each substream 
as well. This also caused problems to the added module refcounting logic.. 
so that is reverted as well.

Br, Kai
