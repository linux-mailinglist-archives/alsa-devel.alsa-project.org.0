Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9BC439B1F
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 18:02:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEC4E16D0;
	Mon, 25 Oct 2021 18:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEC4E16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635177760;
	bh=SqZN7K957IE61IGNqxyg+fndv9Cfmhw4ribXNeXtdYY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tecz3uG4a/2asMIE7NyXx/jQvyv85tPp5UpSah3BDtsTQeGKpbfz9t3T9ad7/zZXZ
	 /jL3BraB/2LN/RjB/sRIZhh1l6shgHyI6cuLHgMFPdOLLKSaYIbEWk2Eer44yUEhpm
	 SqXT9OjjxlidySz+xTobwE7ivDvAxsMirBdeRywk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E9A2F80153;
	Mon, 25 Oct 2021 18:01:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50D1FF80153; Mon, 25 Oct 2021 18:01:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C91AF80153
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 18:01:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C91AF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="FPXVYCmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1635177676;
 x=1666713676; h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=TSHGC+cb2B4TrK4JFv3IV2tKRZlH3Vpv/zl9zLo0iOg=;
 b=FPXVYCmFy6yBBronf5qpkayPAn3ZZwldI1DaMw/84idOsyF4HTlqyAt0
 OkLyb9N0k1FLS5mHzLiYcgbeQxaLksBncDQXmENyrP/EChVVu1adAcTiZ
 V7u8mE5RJZftGU/ldRlwMHqCsNiuuoM5ANxvJzI0P2xFl3HqA5nFDRTo2
 C/PN/yxahI93Rtlwmf2ydJCEYmQUwG67uYuqv/aUD9z+JIpOZkHamhd7G
 p8d9vpCjwHcfSbXK3ChS+lxw74o1rfL+cIyEC0p05IuKEEHuKqDK21qgk
 PjFTNBU/kBIWrmIsnQaCWSd7Pt4hhsOnO349YvEnV7Pe2Ot+moM/atgOQ w==;
Date: Mon, 25 Oct 2021 18:01:04 +0200
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: codec: tlv320adc3xxx: New codec driver
In-Reply-To: <YVsu+QMjOQz8pAzY@sirena.org.uk>
Message-ID: <alpine.DEB.2.21.2110251755410.26101@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.21.2110041117540.14472@lnxricardw1.se.axis.com>
 <YVsETxqzhZI8Fb6D@sirena.org.uk>
 <alpine.DEB.2.21.2110041716190.14472@lnxricardw1.se.axis.com>
 <YVsu+QMjOQz8pAzY@sirena.org.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail07w.axis.com
 (10.20.40.13)
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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


On Mon, 4 Oct 2021, Mark Brown wrote:

> > > > +static const char * const micbias_voltage[] = { "off", "2V", "2.5V", 
> > > > "AVDD" };
> 
> > > This should be configured in the DT, it's going to be a property of the
> > > electrical design of the system.
> 
> > I can very well imagine that this something that should be runtime 
> > userspace configurable. In fact where I work we have had products where 
> > the bias voltage (for an externally connected microphone) could be 
> > configured by the end user, (although not for this specific driver quite 
> > honestly, we have had the need for hardware engineers to change it runtime 
> > during circuit verification though).
> 
> > Would it be ok to have this configurable both in the DT as well as using a 
> > control? Or should it be implemented in another way, such as a number of 
> > pre set voltages that are selected between using a control?
> 
> It seems like a lot less work to just not have the runtime control and
> let someone who needs it figure out how to represent it to userspace.
> Something that's basically a backdoor for validation doesn't seem
> persuasive, validation often wants to do things we actively wish to
> prevent at runtime.

I'll add it to the DT configuration, but I can't really see why the having 
an additional runtime control would be a lot of extra work.

In a completely embedded system where the microphone is part of the 
internal design it makes sense not to have it controllable of course, but 
in a system where the microphone is an external component (i.e. plugged 
into a microphone connector), the system design might need for it to be 
user configurable.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
