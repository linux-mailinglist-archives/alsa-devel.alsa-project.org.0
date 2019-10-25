Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AED1E47B3
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 11:47:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79AB9179E;
	Fri, 25 Oct 2019 11:46:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79AB9179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571996834;
	bh=lL2b44xSlryfubHEOptvRdRwQ7MdBV6fM/1kmq4eiDM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X2T7X7iz/M0iZN8dA9E0jIr7zT01gH8IVCYu+F6yWIQfj8UeXmtxjuGiE207QcPR7
	 8I0KE+Z2ajx5mKnfjttC4g8Lxb8xe85ue8vBXBKPGhuiJhuDDobPA8StcdAf1i0TPC
	 vM4AA8aV3CdG4F7yoUxtl5EXQ1UOlf9sXuoNnv2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF2E9F8036F;
	Fri, 25 Oct 2019 11:45:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FC9DF8036F; Fri, 25 Oct 2019 11:45:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79A2AF80112
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 11:45:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79A2AF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dygBEF27"
Received: from localhost (unknown [223.226.103.150])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 117B721D71;
 Fri, 25 Oct 2019 09:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571996721;
 bh=/TD1sn+igrrq/B7aytIIkMKaHVc3Q8uIn3RN28eMZVc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dygBEF27t8OOXXAe3lYfEQKobczBCYNRKJSKWM6fMWlv47OPvHlzmfpkAu9Klay/L
 NitUVUdsW1SAOs4mVM9lkQgclUW1ExS52YCOcuu+3pcHutetvT0HtUDxnwAyzJEBKV
 85/Kx4q5rjZjtqdcVzpuHW9CvxrubSvvws+7epWI=
Date: Fri, 25 Oct 2019 15:15:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191025094516.GG2620@vkoul-mobl>
References: <20191009181356.GO2036@sirena.org.uk>
 <20191022185906.GZ5554@sirena.co.uk>
 <204150f3-2d0f-e2df-e4d0-7324b4788e99@codeaurora.org>
 <36d84c86-50d0-487b-181a-9238e11d7fce@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <36d84c86-50d0-487b-181a-9238e11d7fce@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Daniel Baluta <daniel.baluta@gmail.com>, Takashi Iwai <tiwai@suse.de>,
 Patrick Lai <plai@codeaurora.org>, alsa-devel@alsa-project.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [ANNOUNCE] 2019 Linux Audio miniconference
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 24-10-19, 09:31, Pierre-Louis Bossart wrote:
> On 10/24/19 9:20 AM, Patrick Lai wrote:
> > On 10/22/19 11:59 AM, Mark Brown wrote:
> > > Hi,
> > =

> > > =

> > > As with previous years let's pull together an agenda through a mailing
> > > list discussion - if people could reply to this mail with any topics
> > > they'd like to discuss we can take it from there.=A0 Of course if we =
can
> > > sort things out more quickly via the mailing list that's even better!
> > =

> > 1. Gapless playback handling between two playbacks with different format
> =

> did you mean compressed formats?

Yes this is for compressed formats. So, we do not allow users to set
parameters for gapless playback as the assumption is that we are in
album with same parameters for the subsequent tracks to be played.

But in case of some codecs like wma (and flac iirc) there can be changes
to next track using different wma formats which warrants change in
params.

Question is if this should be allowed and if so we need to propose a
change in API for this

> > 2. Passing timestamp along with buffer for both playback and capture
> > 3. PCM device volume control
> > 4. Unified audio graph building across multiple subsystems
> > =

> > Thanks
> > Patrick
> > =

> =

> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

-- =

~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
