Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947F4D2FC8
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 14:15:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AF7216EE;
	Wed,  9 Mar 2022 14:15:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AF7216EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646831754;
	bh=yq5kY9b7HtjxBubC8SbzOYmAvf9iDGJaasLgL2h1/f8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JviSKRx77uuqZ4nIpzpiTDBXGxG70qBewg75iHUptNL7EedYvwNQES/h1RIHGne4g
	 67uoMgbynr+diYn7YlJc/VY7a7CZP1acSFgjMu9nP+Vbt60Ue+QrnlqVJot0M6CzXU
	 qoWCx+lMu5glHsacyAssVwzrQZRcJ638Zd487apo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 044C4F8012F;
	Wed,  9 Mar 2022 14:14:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A055F80155; Wed,  9 Mar 2022 14:14:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94A1DF80155
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 14:14:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94A1DF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YQ9jYFKi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646831680; x=1678367680;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=yq5kY9b7HtjxBubC8SbzOYmAvf9iDGJaasLgL2h1/f8=;
 b=YQ9jYFKi7l2UBR4aaO30pzC04UqdSeUS6Zn90Y8ICDSzoAJzYmB8Vb0k
 E8F22j74e18cI/xfXdLamsbM4R4cQ/8gQj3m8TZDXyc9P8B+QKs4O3apo
 YkMEjE/2XGyxCVjLNWU2KrBGaOrIcaQGnDJ/tisdRFBeSolvYHVArQii8
 yOplxttulHXo15Jx2Wl9Z4hRh7dChS5H6hmQBxPm1BUjKV8Y9LE1zXxXh
 /dDpIWh0Atn4AQUAr1YFv5AO1Hr8rOBHYNqVeBQ9Y/HoSVAA2gu81iMu/
 8qywdz6HLfRIl68XVaRWjwCW0A64f0O94UVLGmqkqFhJSEJiN39lBSDfQ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252540721"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="252540721"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 05:14:36 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="554110429"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 05:14:34 -0800
Date: Wed, 9 Mar 2022 15:05:33 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [Intel-gfx] [PATCH v2] ALSA: hda/i915 - avoid hung task timeout
 in i915 wait
In-Reply-To: <s5hy21jih6m.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2203091459470.3088432@eliteleevi.tm.intel.com>
References: <20220308172759.920551-1-kai.vehmanen@linux.intel.com>
 <f9f6f831-a05d-2d20-8ade-ab717f342ba5@linux.intel.com>
 <alpine.DEB.2.22.394.2203091035350.3088432@eliteleevi.tm.intel.com>
 <9dabb68b-f2af-ae97-0fb2-869367c496bf@linux.intel.com>
 <s5h5yonjx7i.wl-tiwai@suse.de>
 <f0c12164-b266-2513-b8e6-323186338181@linux.intel.com>
 <s5hy21jih6m.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 alsa-devel@alsa-project.org, Paul Menzel <pmenzel+alsa-devel@molgen.mpg.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 amadeuszx.slawinski@linux.intel.com
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

On Wed, 9 Mar 2022, Takashi Iwai wrote:

>> Takashi Iwai wrote:
>>> The question is how often this problem hits.  Basically it's a very
>>> corner case, and I even think we may leave as is; that's a matter of
>>> configuration, and lowering such a bar should expect some
>>> side-effect. OTOH, if the problem happens in many cases, it's
>>> beneficial to fix in the core part, indeed.

I'm basicly helping out the intel-gfx folks here. This is now happening 
systematically in the intel-gfx CI. The hung-task timeout is configured to 
30sec (in intel-gfx CI), and there's some new hw configs where this 
happens every time (I have a separate patch in progress [1] that tries 
to detect this case and skip the init, but this will require more time as there is 
risk of breaking existing configurations).

[1] 
https://lists.freedesktop.org/archives/intel-gfx-trybot/2022-February/128278.html

Tvrtko Ursulin wrote:
> Takashi Iwai wrote:
> > Complete behaviour change how? Isn't this something ran on probe so
> > likelihood of anyone sending SIGKILL to the modprobe process is only
> > the init process? And in that case what is the fundamental difference
>
[...]
> The point is that it does change the actual behavior, and changing the
> actual behavior just for working around the corner case like the above
> wouldn't be justified without the proper evaluation.
> 
> That said, if this behavior change is intentional and even desired,
> that's a way to go.

Let me try this out and test on a few configs (with and without the 
timeout occurring) and send a V3 if this seems ok.

Br, Kai
