Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 858B8207A2C
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 19:23:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1264B188D;
	Wed, 24 Jun 2020 19:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1264B188D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593019407;
	bh=6N99XooWYeVVg6NVinvNzNvm7Fc07idPBfxVFgTYiTo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gYdhgbVQ30BcsDcMbUj+Zq4wG6ccyfLF2V3sP/ghIluDde860BLRMWjAQ+a/HTex+
	 fpBlxNyvoebueV5DgK/BWQQkicZfMPhuLDZr2M+s6Z4SvS+53GrFLYJaVPE93DpB2R
	 0cS4QvgJvTqV2R9Da9MzYVGhQ/iywJQIeoXXNlV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FABFF80084;
	Wed, 24 Jun 2020 19:21:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4038BF8015B; Wed, 24 Jun 2020 19:21:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14E4FF800B2
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 19:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14E4FF800B2
IronPort-SDR: fbx2L7KfSh9tKjoZIikVz3QzTA8h0FhUyVql3wnqGArRvjCmLCnud8th5Xy9O4jc5B0Q8mz/11
 V/E1Zofn2iLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="162648705"
X-IronPort-AV: E=Sophos;i="5.75,276,1589266800"; d="scan'208";a="162648705"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2020 10:21:37 -0700
IronPort-SDR: cx6xYAJ3i6EWmJDRn5EUk3oeeyt4qQG3ud9FIVO6cyFPFh1eXbX/0iGNLwjJ8Qz0A362qvL4up
 Mao4v00otWsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,276,1589266800"; d="scan'208";a="479188580"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 24 Jun 2020 10:21:33 -0700
Date: Wed, 24 Jun 2020 20:21:14 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/hdmi: Add Intel silent stream support
In-Reply-To: <s5ho8p8ifcn.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2006242007051.3186@eliteleevi.tm.intel.com>
References: <1592954796-12449-1-git-send-email-harshapriya.n@intel.com>
 <s5hr1u4lxee.wl-tiwai@suse.de>
 <f2da25c0-c740-4d44-ab66-6017622f7dde@perex.cz>
 <7dd38f98-e74a-94c0-6888-523e6189c00b@linux.intel.com>
 <s5ho8p8ifcn.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Harsha Priya <harshapriya.n@intel.com>, kai.vehmanen@intel.com,
 alsa-devel@alsa-project.org, Emmanuel Jillela <emmanuel.jillela@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On Wed, 24 Jun 2020, Takashi Iwai wrote:

> So, rather the question is how we should provide the setup of such
> parameter.  It's supposed to be a part of power management stuff that
> should be touched by either a smart PM tool or a manual override such
> as runtime PM setup?  Or can it be seen as a more casual tuning?

this is fairly similar to "power_save" parameter (which has a default set 
via Kconfig). Enabling silent streaming comes at a power consumption cost 
as you will keep the audio controller powered up whenever a HDMI/DP 
receiver is connected (but you can get rid of the startup delay for audio 
that can be annoying for short audio clips like UI sounds).

So depends mostly on the type of product. I'd expect system integrators 
who are used to modify "power_save", to also modify the default for 
silent_stream enable config. So in that sense using similar interface to 
expose the feature makes sense (so the people most likely to use the 
interface, are already familiar with it).

Br, Kai
