Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E85812D6310
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 18:09:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 824D1166D;
	Thu, 10 Dec 2020 18:08:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 824D1166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607620184;
	bh=PGMrTxDbrK5G2jn6v5xJjfSszsokYxCf1Ninmt/iEgY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QA4v2z9SVg9WqDf9jXCenaws+l7EBZCGpNUiE23V4DNdyRxFk1uEUMP9S62IbTPOH
	 MrS35WHU9BhMNx9uu27rkQJzk/kQ7jNTvyvltp3i5u7CjOMv8qL4FI2VlTXEL7iLmV
	 y7wzTvdusS0kM87Lr1dEk2Pd7zuIOaoEXIqlpqHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8677F80218;
	Thu, 10 Dec 2020 18:08:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A03EF8016E; Thu, 10 Dec 2020 18:08:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9886F800EF
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 18:07:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9886F800EF
IronPort-SDR: 4kZtPdTWK5Z13BnvRBDiQsVYkoD7i6w2skz+QQxStth0x6t75CDtfxdI+3vyBwsVijNGFz8Sr7
 bY2vgqy+UtIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="238397301"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="238397301"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 09:07:55 -0800
IronPort-SDR: NsZRYATgcmY3peID5QGQ2bBkZMZATLqPhV+Dbm5ZsqzEVqVAa/UF2CXfghQDb9ivX6i4wtBzAM
 YXDCZzrW88eg==
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="364774798"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 09:07:53 -0800
Date: Thu, 10 Dec 2020 19:05:09 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/hdmi: fix silent stream for first playback to DP
In-Reply-To: <s5hlfe5r6zx.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2012101858430.864696@eliteleevi.tm.intel.com>
References: <20201210153954.3132552-1-kai.vehmanen@linux.intel.com>
 <s5hlfe5r6zx.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Harsha Priya <harshapriya.n@intel.com>,
 Emmanuel Jillela <emmanuel.jillela@intel.com>, alsa-devel@alsa-project.org,
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

Hey,

thanks Takashi for the quick review!

On Thu, 10 Dec 2020, Takashi Iwai wrote:

> On Thu, 10 Dec 2020 16:39:54 +0100, Kai Vehmanen wrote:
> > +static void silent_stream_disable(struct hda_codec *codec,
> > +				  struct hdmi_spec_per_pin *per_pin)
[..]
> > +
> > +	per_pin->cvt_nid = 0;
> > +	per_pin->silent_stream = false;
> > +}
> 
> Better to protect with per_pin->lock?

oops, yes, definitely yes. I'll spin a v2 of this.

Br, Kai

