Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC0A429A59
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 02:20:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A84DA16D2;
	Tue, 12 Oct 2021 02:19:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A84DA16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633998047;
	bh=4J/ixbY+YxvgAI5rmhm6jEZOpSpNe+zJOrtLhDIYzYo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CXRsHhNRadlKOOdLaCqjMQZ/z45MTwAw9YvV2dLgRf1p+/5Pi8hJogbgWBT/1BjH+
	 56cqzNEeekOBKPtBjqlHzHVeI1MKGW0zJHCRpkXTXKuP35KDLB4gIQ1ELCxquzHXJ0
	 wNel3w3C/o7hpx02m41rSl9uhUY7WR67VJ2LvSSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3EE1F800C0;
	Tue, 12 Oct 2021 02:19:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C74DF80269; Tue, 12 Oct 2021 02:19:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59D02F800C0
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 02:19:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59D02F800C0
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="213947923"
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; d="scan'208";a="213947923"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 17:19:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; d="scan'208";a="562404792"
Received: from cpeng4-mobl.amr.corp.intel.com (HELO [10.213.182.8])
 ([10.213.182.8])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 17:19:19 -0700
Subject: Re: [PATCH v2 1/3] ALSA: pcm: introduce INFO_NO_REWINDS flag
To: Takashi Iwai <tiwai@suse.de>
References: <20211004162423.85323-1-pierre-louis.bossart@linux.intel.com>
 <20211004162423.85323-2-pierre-louis.bossart@linux.intel.com>
 <s5h8rz8ez3s.wl-tiwai@suse.de>
 <c62b3749-c5ea-7b1e-2831-272c8a14d3ac@linux.intel.com>
 <s5hbl43egs8.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1ae2012b-d6bd-77ce-0a9e-98aec4d0f868@linux.intel.com>
Date: Mon, 11 Oct 2021 19:19:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5hbl43egs8.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 P9ter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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


> And, what I meant in the previous thread was that the check in the
> given patch wasn't "enough", i.e. it needs more careful checks
> considering the boundary crossing.  That is, you can't simply compare
> appl_ptr vs old_appl_ptr as a single condition for the backward move.

Indeed, that's why I tried to avoid any checks on pointers :-)

> For example, check snd_pcm_playback_avail() and co.  That contains a
> couple of more condition checks and corrections due to the possible
> boundary crossing.  (Here, runtime->boundary may differ depending on
> 32 or 64bit context.)
> 
> The actual implementation of the backward move check would be slightly
> different from those, but I hope you get my idea.

I think I do but not sure how to precisely deal with the boundary
wrap-around.

The only suggestion I have at this point would be to compare the 'avail'
space before and after the appl_ptr changes in pcm_lib_apply_appl_ptr().
If the 'avail' space grows as a result of user-space changes, that
indicates a rewind (both for capture and playback), doesn't it?

A tentative solution is shared here:
https://github.com/thesofproject/linux/pull/3207
