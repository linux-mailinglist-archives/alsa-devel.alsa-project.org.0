Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E12512B5ED5
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 13:07:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75729174B;
	Tue, 17 Nov 2020 13:06:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75729174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605614834;
	bh=M6PVjc7IKM9+6Z9S16mtjoxRWaitfNtl06Sy0pduB7c=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nxxr4C0r8ngMh20PfdU5vKgvHSsq6dR68QdWIhIaGQU8+jAYm8x5yym75Y2GuUgmr
	 OR7kzN5MnRe8xr50VTagFkXGC+J5LUJY91SEa7ALXbWlxwrAxbESQMegeEXOLQmeD2
	 VspTxwud548htG/Fuovee4ru/9lpF6RrP98HYY6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04113F801F9;
	Tue, 17 Nov 2020 13:05:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46BD6F801F5; Tue, 17 Nov 2020 13:05:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A6BCF800E2
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 13:05:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A6BCF800E2
IronPort-SDR: e1iYLLpjF1nsTOP/08SXKWfc8KX463Rp46ygI46hAvZtOvJmgSsnFz7s2FRjHLrpUBY3bkl7Cj
 /I1tgi6YPapQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="171081486"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="171081486"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 04:05:25 -0800
IronPort-SDR: /f/wha+aSM131OqzMaD1puNVqPV3Kgi2Sh4SKiwFcfYhL8Dym9f+paAxUpGg1U1uQVILnANGBG
 e685as+IgVUg==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="475895877"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 04:05:23 -0800
Date: Tue, 17 Nov 2020 14:03:06 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Bard Liao <yung-chuan.liao@linux.intel.com>, broonie@kernel.org, 
 Takashi Iwai <tiwai@suse.de>
Subject: Re: [RFC] ASoC: max98373: don't access volatile registers in bias
 level off
In-Reply-To: <20201109135543.7862-1-yung-chuan.liao@linux.intel.com>
Message-ID: <alpine.DEB.2.22.394.2011171336080.864696@eliteleevi.tm.intel.com>
References: <20201109135543.7862-1-yung-chuan.liao@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, ryans.lee@maximintegrated.com,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, bard.liao@intel.com
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

On Mon, 9 Nov 2020, Bard Liao wrote:

> Besides, it doesn't make sense to read feedback data when codec is not
> active. To avoid the regmap_read error, this patch try to return a fake
> value when kcontrol _get is called in suspend.
> However, the question is what is the "correct" behavior when we try to
> read a volatile register when cache only is set.
> 1. return an error code to signal codec is not available as what we have
> now.
> 2. return a fake value like what this patch do.
> 3. wake-up the codec and always return a valid value.

any thoughts on this anyone?

This seems like a generic concern w.r.t. ASoC codec drivers and behavior
of volatile registers exposed as kcontrols, and what happens when codec is 
in suspend.

Currently regmap read will return -EBUSY in this case (case 1 above).

I personally think this is still the best option. It's a bit ugly as 
there could be other reasons for -EBUSY as well, but at least user-space 
won't silently read invalid values.

Waking up the codec (3) could work as well, but should this be done in all 
codec drivers that have volatile regs in regmap? Again, user-space would 
get consistent results, with the expense of extra/additional codec 
wakeups.

Br, Kai
