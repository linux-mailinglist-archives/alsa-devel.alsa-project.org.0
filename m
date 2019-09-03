Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A057A6B25
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 16:20:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6A9E1677;
	Tue,  3 Sep 2019 16:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6A9E1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567520409;
	bh=9oIUxpPd7IagYDxxlSxEtSnzq1L30kMrqiV3JWm/Jrc=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MgirhcY6nyHN1qoUkQyZkE1bywuVoFOBH1hU6lUHUB8n7kxfXODurhHdSBF4ac5ay
	 mnFXyLZUakz6J7MbMZ6/fUObM/+5xPDNIqniSVRV4ZtsncozGEy1GggJvE2p5nwWsU
	 MPEcy8ca6dMjhsLmbKVdEMxn5SMrga+54/9NUyyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 393D6F8049B;
	Tue,  3 Sep 2019 16:18:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F28BDF8045F; Tue,  3 Sep 2019 16:18:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5253F8011E
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 16:18:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5253F8011E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 07:18:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,463,1559545200"; d="scan'208";a="173214060"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga007.jf.intel.com with ESMTP; 03 Sep 2019 07:18:12 -0700
Date: Tue, 3 Sep 2019 17:18:11 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <s5h7e6w2h10.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.1909031656490.16459@zeliteleevi>
References: <20190829135348.23569-1-kai.vehmanen@linux.intel.com>
 <s5h7e6w2h10.wl-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: libin.yang@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 0/7] adapt SOF to use snd-hda-codec-hdmi
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

Hi,

On Thu, 29 Aug 2019, Takashi Iwai wrote:

>> here's a RFC patch series that adapts SOF (and one example machine
>> driver) to use snd-hda-codec-hdmi (patch_hdmi.c) codec driver
>> instead of hdac_hdmi (soc/codecs/hdac_hdmi.c). The primary goal
[...]
>> 2) Can we drop hdac_hdmi and its support from machine drivers, or
>>    do we need to make it optional and keep it around?
> 
> IMO, the only and the most important point is whether it works as-is
> without changing the existing user-space, or exactly what scenario
> would be broken.  If the breakage is significant, we may introduce a
> Kconfig, as you suggested.
> 
> I don't think the mixer contents change are problematic.  In the case
> of HDMI/DP, it's mostly read-only for fetching ELD or jack state.

I've been now continuing testing with different combinations of 
kernel/user-space and the two main problematic areas are:

1) systems with UCM defined with hdac-hdmi style controls

-> as the card name will not change, the UCM usage will fail 
when kernel is updated to use different HDMI codec driver

On some systems this is manageable as e.g. pulseaudio will fallback to 
legacy non-UCM path and e.g. HDMI/DP audio keeps working. But, but, this 
may be problematic if UCM is needed for other functionality on these 
systems.

2) machine drivers shared with SST/SOF

Doing the HDMI codec change for old platforms handled with SST driver 
looks difficult to do, so we probably need to keep hdac-hdmi around for 
SST usage. That does mean machine drivers that are shared, need to support 
both options.

Combining 1+2, it would seem safer to have a opt-in/opt-out possibility 
via Kconfig. I'm preparing a patchset for this -- let's see how it will 
look.

Br, Kai

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
