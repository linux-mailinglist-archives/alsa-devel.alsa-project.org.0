Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E60423D72
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 14:06:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D01DF167D;
	Wed,  6 Oct 2021 14:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D01DF167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633521977;
	bh=blvn4wCc4MDRXJvkIMG3Xbk3TERlg//SigMVZBZVzx8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cr1h1e2qAlLXmC28QycOk2Q77+yBS9WW51L1rkC2dD3YLsWY63pRG3mvFSYiiWgbf
	 cyktkso3gg93As8KEyXUb7kcUBzIZQgTOfo0WYAafynLEbgIv0pNixcHkkInF/gX2v
	 igbL5LrEu7YzfYK3BnI6bvOD3fKak9u7TqsmJ36c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4FB1F8010B;
	Wed,  6 Oct 2021 14:05:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79886F80240; Wed,  6 Oct 2021 14:04:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_FAIL,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB5DDF80229
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 14:03:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB5DDF80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="jsMF6fT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1633521810;
 x=1665057810; h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=0f8PMQce6UaT1ls4fFQIxbZcR//ZOXFzkRIIn+7Ayk4=;
 b=jsMF6fT3I6HlK70jETIe0gyvl1lNSMKf8xgm9JXsweICoZvSdc1Xflil
 3eVi7RfuBUMIaAR/mYLM4QbdpD9z6eAI//p4sA2MsKPkbiShz2QLOvRLW
 nA2PXHU1f8D/kZRr0kGLbz3cQ2MA2LqvxAl7V/XYMjemG3DqgzVT+drib
 cxhLcVwq9ucXFOJGlsg3rEZ5Qr9nvUZyt+CkTi7StcrLuQFat82h+Ouv2
 A5aDYSxWHqx3KZDX8WV8D310GnXBqGC4fxcDcCXt6KU8eLN7ZhnFOfdrs
 1hryzHF0IXKjCsbySNTHV30i11qIaFDVJRAFlOjEEXT29wvub84OJ8mCG w==;
Date: Wed, 6 Oct 2021 14:03:18 +0200
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: codec: tlv320adc3xxx: New codec driver
In-Reply-To: <YVsu+QMjOQz8pAzY@sirena.org.uk>
Message-ID: <alpine.DEB.2.21.2110051556250.32437@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.21.2110041117540.14472@lnxricardw1.se.axis.com>
 <YVsETxqzhZI8Fb6D@sirena.org.uk>
 <alpine.DEB.2.21.2110041716190.14472@lnxricardw1.se.axis.com>
 <YVsu+QMjOQz8pAzY@sirena.org.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail07w.axis.com
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

True about validation, however, I would still say that there is a usecase 
for having this user settable, if for instance the microphone is an 
external device and not a fixed part of the design of which the codec is a 
part.

Nevertheless it's not something I have any use for at the moment so I'll 
relegate the function to a DT property. I see there are at least several 
other codecs which do it that way.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
