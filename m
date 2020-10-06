Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D428284D8B
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 16:23:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E19C1716;
	Tue,  6 Oct 2020 16:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E19C1716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601994188;
	bh=wnJ74jkTAJilfg6rEyV32/8+ot91QL4DL7QKqDhaV2I=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NqUqaHQv9sU7wQPs97zg2JZ4kJ9DukZ+Ns7ksddCuyjxfVpnc7QN6aUFlEl52TEnx
	 UPCA3wXrhvCEzF4ngpAOKGPW60whzWEP2YTBtBpZ9ZP0mAj1XRcoraqi8IRIrhw988
	 A3I04G0RX+9xhPRZdFcbkjLiEg7sM0UGzz81d/Lo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BB7AF80053;
	Tue,  6 Oct 2020 16:21:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48D6EF80127; Tue,  6 Oct 2020 16:21:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C548BF80127
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 16:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C548BF80127
IronPort-SDR: dAG/8Rmv1Asn31KA+48Sb8aiyxKbwuotZOojscKW2jCruOOlUEnGXKOhpNqjpbAwd1zLHemRGO
 eT1hJfWjKbgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="249215350"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="249215350"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 07:18:43 -0700
IronPort-SDR: CxxwqlZKxdTSeMPntyuvAfJUt58Anvh1RtW4I21Y2z99dDFwJZKRu3I0hZF2UWoaIKKW96Ps+f
 CIZ22WUBhuqg==
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="527373260"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 07:18:38 -0700
Date: Tue, 6 Oct 2020 17:16:55 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [RFC PATCH 0/2] ALSA: hda - acomp probe fix for i915
In-Reply-To: <s5hh7r75xrh.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2010061704230.3186@eliteleevi.tm.intel.com>
References: <20201006113042.471718-1-kai.vehmanen@linux.intel.com>
 <s5hpn5v5z7v.wl-tiwai@suse.de> <s5hh7r75xrh.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Tue, 6 Oct 2020, Takashi Iwai wrote:

> On Tue, 06 Oct 2020 14:13:40 +0200, Takashi Iwai wrote:
> > Another option would be to move the completion into the common acomp
> > helper from i915-specific one.  That is,
[...]
> So something like below (totally untested).

thanks Takashi for the quick reply. I did a quick test on a system with 
two controllers and seems to work as expected.

Getting rid of i915_master_bind is a nice plus definitely for this
option. And the change in drm headers seems simple enough.

I'll do a bit more testing and send an updated set based on your approach.

Br, Kai
