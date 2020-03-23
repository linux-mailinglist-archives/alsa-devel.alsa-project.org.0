Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4522A18F1D7
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 10:32:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBF911657;
	Mon, 23 Mar 2020 10:32:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBF911657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584955977;
	bh=py91zXzeFINeSKDrzGfKS9cRM2mSuWJTwxcCDGesvho=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MMVwvWUyY/d+v5Y7AI+yCXaJr2F35tn0lSFE8d0vqViUB8Sp6uwOVm+kjKWstvt0i
	 oGHMXiE0lmuXzAr2gl/gNV6RsT/WNi6DtmBqWm6zszIMSvpJq8ZtVyhtRmaEdlLRvB
	 HQWrPieCI6WNF7s1/GRAC52gyEbMFs8AayCGEWl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F28E6F80218;
	Mon, 23 Mar 2020 10:31:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DAB2F8015A; Mon, 23 Mar 2020 10:31:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5627F800F6;
 Mon, 23 Mar 2020 10:31:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5627F800F6
IronPort-SDR: dkKXVR3H7ghxJpRFdI491XHWX6miO147123kQ/q/KoSTHEsHst3J0oW6Ag0TpJmheoyZKslAcm
 CszSci+sJcBw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 02:31:03 -0700
IronPort-SDR: HQDxErMloIc4NE+cVzL8yTDYRwl+ME9zCFKRWTsoqZfgVyZpMmT4YyRjdoB4EYirRgDlpq6KQj
 /jg7vT/G9rMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,295,1580803200"; d="scan'208";a="357045390"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.252.46.183])
 by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2020 02:31:04 -0700
Date: Mon, 23 Mar 2020 10:31:02 +0100
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 06/14] ASoC: SOF: add a power status IPC
Message-ID: <20200323093102.GB16757@ubuntu>
References: <20200312144429.17959-1-guennadi.liakhovetski@linux.intel.com>
 <20200312144429.17959-7-guennadi.liakhovetski@linux.intel.com>
 <20200313143956.GJ5528@sirena.org.uk>
 <20200320115203.GA2130@ubuntu>
 <20200320121952.GC3961@sirena.org.uk>
 <20200320132732.GC2130@ubuntu> <20200320150727.GD2130@ubuntu>
 <20200320163948.GD3961@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320163948.GD3961@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org
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

On Fri, Mar 20, 2020 at 04:39:48PM +0000, Mark Brown wrote:
> On Fri, Mar 20, 2020 at 04:07:27PM +0100, Guennadi Liakhovetski wrote:
> > On Fri, Mar 20, 2020 at 02:27:32PM +0100, Guennadi Liakhovetski wrote:
> 
> > > No, this isn't a completion - it's a counter. I've used atomic variables 
> > > before, I cannot remember seeing any difficulties with their correct use 
> > > described. Do you have a pointer?
> 
> > Actually I'd even say this isn't a problem. I think it's safe to say, you 
> > won't suspend and resume your audio interface more often than every 10 
> > seconds. That makes under 3200000 cycles per year. Even with 31 bits for a 
> > signed integer that makes more than 600 years. I think we're safe.
> 
> The problem is that atomics are just incredibly error prone - for
> example they're just a plain number, they're usually counting something
> which is not being locked so you have to be careful any time you do
> anything around them.  Their lack of structure makes them harder to
> reason about than most other locking primitives, often harder than it's
> worth.

Ok, understand, but do you see any problems with this specific use case? 
Thinking about possible replacements - it isn't a case for a ref-count, 
because it isn't a get-put scenario. We really just need to count a 
specific event - DSP reboots. It can be the case that this counter doesn't 
need to be atomic at all. When it is read, the DSP is guaranteed to be up 
and running - I think. So no race would be possible. I can try to think 
about this more carefully and maybe make it a normal unprotected counter. 
But I don't think it has to be protected even better than what these 
patches are doing.

Thanks
Guennadi
