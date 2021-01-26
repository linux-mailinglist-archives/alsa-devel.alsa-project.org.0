Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30262303C19
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 12:51:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B21EC17AC;
	Tue, 26 Jan 2021 12:50:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B21EC17AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611661894;
	bh=azu48OnuAH6Jk3y13VpDUrbi7CgsGdfBfRJ6EV8bZSg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JjctzfHeT8opvNPC9kwAOSMjQ0a/pCbX9zpspFVNQQ6aHzggvCRHfQHvgRF5iXZl9
	 kVPZA9fIY3YBYbQ+sQAFYFtpQniEuUEJGd3NunAPta54LgEmEAZYnGXRzGTGZ3mcWN
	 z83L/Gz+UjOxdw1pwDnP34aWuZfAW2EKlgqJMogI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7027F80158;
	Tue, 26 Jan 2021 12:50:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0EC5F8015B; Tue, 26 Jan 2021 12:50:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4594F80130
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 12:49:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4594F80130
IronPort-SDR: qqSpS8cuoGMiJHucV6DxAkOh/TC9Ee9t2o9Qa/g5nWEA6qIVjU3f55JT4mx8mz/hJnOlQhnV00
 dGVAQGbaFBLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="241418169"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="241418169"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 03:49:53 -0800
IronPort-SDR: ozJ1grXq6n5H4caTK0odNMV1G805xQGKA1x9DEZGbqTXg/mzEud0jSJgdszyiYUMx98xYlDQzO
 Me75hpFLG+8A==
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="387796917"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 03:49:52 -0800
Date: Tue, 26 Jan 2021 13:46:38 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Hui Wang <hui.wang@canonical.com>
Subject: Re: [PATCH v8 1/1] alsa: jack: implement software jack injection
 via debugfs
In-Reply-To: <20210126074530.4450-2-hui.wang@canonical.com>
Message-ID: <alpine.DEB.2.22.394.2101261338340.864696@eliteleevi.tm.intel.com>
References: <20210126074530.4450-1-hui.wang@canonical.com>
 <20210126074530.4450-2-hui.wang@canonical.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com
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

Hi,

I gave this v8 series another review and did some actual testing with the 
patchset and looking good. Caching the hw status is a nice addition and 
the new underscore-replaced names look better than the early versions.

Only some very minor comments to the code:

On Tue, 26 Jan 2021, Hui Wang wrote:

>  static void snd_jack_kctl_add(struct snd_jack *jack, struct snd_jack_kctl *jack_kctl)
>  {
> +	jack_kctl->jack = jack;
>  	list_add_tail(&jack_kctl->list, &jack->kctl_list);
> +	if (!strstr(jack_kctl->kctl->id.name, "Phantom"))
> +		snd_jack_debugfs_add_inject_node(jack, jack_kctl);
>  }

This comparison is now done even if injection is disabled at build time. 
Maybe better to have this check on injection side? Or even not filter 
Phantom jacks at all and leave this for user-space to tackle?

Br, Kai
