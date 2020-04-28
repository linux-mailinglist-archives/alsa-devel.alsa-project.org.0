Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD19E1BC526
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 18:28:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05061168E;
	Tue, 28 Apr 2020 18:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05061168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588091286;
	bh=kMng+AwkDmTDwrnD25h1KdCKDTWUZBj20a01fhB8du0=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ufEywSKn53vh7jGLLi7MzW+ZP1SbSj0L6QQHuzIkmswxL+BQdafZuLTS9cm8TTqyy
	 R+e4mJElgbXG4TGlhzSh2IBMr4bIvSRRLlkCLWf8KeznQqFl5BGHea7pwORJUj91aV
	 /+kJ7uayQlOCnB4D6m1ifidf7osxmY6yanm2olv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29636F801EB;
	Tue, 28 Apr 2020 18:26:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A9E3F801DB; Tue, 28 Apr 2020 18:26:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F5BCF800D2
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 18:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F5BCF800D2
IronPort-SDR: 8pDJd5sloQm6c06V+73L86aWcmyiBMfjV0seObG1pUzR70D2nPtXglXIPiTO4fUhUkq+sPCL15
 quhrrf0En7Wg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 09:26:15 -0700
IronPort-SDR: nbIz+cLa3O2I+M2mK612cHaZx4cpWICdUe4+sDCrInYNGh96jZg6SwzLIxuE+ECCdKQyKKvLxW
 k+yizM4S4WZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; d="scan'208";a="302752501"
Received: from thtang-mobl.amr.corp.intel.com ([10.251.151.171])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Apr 2020 09:26:15 -0700
Message-ID: <71d8350edafd266eb1db63709e8c3ea7075b3566.camel@linux.intel.com>
Subject: Re: [PATCH] ASoC: core: Make sure component driver names are unique
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 28 Apr 2020 09:26:13 -0700
In-Reply-To: <20200428161451.GK5677@sirena.org.uk>
References: <20200427193306.31198-1-ranjani.sridharan@linux.intel.com>
 <20200428114044.GF5677@sirena.org.uk>
 <e5116a2b2be975f07ba29ea438f100bbe93ded76.camel@linux.intel.com>
 <20200428161451.GK5677@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com
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

On Tue, 2020-04-28 at 17:14 +0100, Mark Brown wrote:
> On Tue, Apr 28, 2020 at 09:07:04AM -0700, Ranjani Sridharan wrote:
> > On Tue, 2020-04-28 at 12:40 +0100, Mark Brown wrote:
> > > I would not expect driver names to be unique, you can have
> > > multiple
> > > instances of the same device on a board for example when two mono
> > > speaker drivers are used for stereo playback.
> > Maybe I misunderstood your comment in the previous thread then,
> > Mark.
> > 
https://mailman.alsa-project.org/pipermail/alsa-devel/2020-April/166665.html
> > Did you mean to say that the individual drivers should do this
> > check
> > before registering multiple platform components to make sure they
> > are
> > unique?
> 
> That was in the context of a single DAI link, not the system as a
> whole,
> and only for platform drivers not DAIs.
Ahh, got it. So, maybe I should add this check when adding platform
components to the pcm runtime for the DAI link?

Thanks,
Ranjani

