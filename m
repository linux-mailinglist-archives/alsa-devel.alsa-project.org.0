Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A63A1145CC8
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 20:58:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C28AC16A4;
	Wed, 22 Jan 2020 20:57:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C28AC16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579723121;
	bh=WDgzSlsW/y4cgZA+JstHKJ6BAmeUkzq6Tl+RI/oKQU4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kdLO5mQXV1AeHU3bbLME8yVX+fETgpb9gApJJ0CNyVbhEuicoG+kX/0iJ1Gv4sdKa
	 Tw6MKnkAr3ZEsPVn9ovtFBg9LRFMRX+e1iwyDXlFe9r6/coWIgwsRFT46VZW7n3q4N
	 nCo+q0yVsDT6tUuUsWJfzl8Nogh3M/UpQ8GdVSGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BAE0F80271;
	Wed, 22 Jan 2020 20:56:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF017F80248; Wed, 22 Jan 2020 20:56:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8346BF8022D
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 20:56:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8346BF8022D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 11:56:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; d="scan'208";a="250734881"
Received: from jovercas-mobl1.amr.corp.intel.com (HELO [10.254.105.26])
 ([10.254.105.26])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jan 2020 11:56:33 -0800
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com
References: <20200122181254.22801-1-cezary.rojewski@intel.com>
 <9246ee43-ffec-2b28-3a56-211f08797342@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a30fffb3-5f6b-eaa4-1684-3f19d973c54f@linux.intel.com>
Date: Wed, 22 Jan 2020 13:52:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <9246ee43-ffec-2b28-3a56-211f08797342@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: skl_hda_dsp_common: Fix
 global-out-of-bounds bug
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



On 1/22/20 12:27 PM, Cezary Rojewski wrote:
> For the last few days we have been playing with "vanilla" 5.5 kernel - 
> one without ton of /skylake patches - to find out how could hda-dsp be 
> enabled on skl/ kbl+ with the least amount of changes pulled from our 
> branch possible.
> 
> Turned out the addition of this single patch AND topology binary update 
> got the job done.
> 
> Now, how can we proceed with such solution. Can share the topology 
> binary/ .conf if needed, so anyone interested can check it out.

I am personally interested for tests but I doubt this option is usable 
by anyone outside of Intel - additional issues with probe race 
conditions with i915, e.g. on Linus' Dell XPS 9350, no DMIC support and 
not selected anyways by Jaroslav's new logic, no UCM, and no plans for 
the use of the HDMI common codec.

In case you didn't see it, the Skylake driver 'HDaudio codec' option is 
suggested as one of the 'unsupported' features here:
https://github.com/thesofproject/linux/pull/1742

-Pierre
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
