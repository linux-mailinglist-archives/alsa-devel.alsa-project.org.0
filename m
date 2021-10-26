Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4204D43AC7E
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 08:56:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C376016D0;
	Tue, 26 Oct 2021 08:55:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C376016D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635231363;
	bh=8Tajw0FW2lef6zXwe4h38HV83IRmuCrpQkNhFqtnI3o=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=flsnoEljDXUcTxYgcwiKXMkobYaPnnPxOdtXYRde0+73w00oiTyc/+wMSSN8F/EhG
	 rpcMx3e9+xNqsEkdBO5jL8c19/l90lXYMLxu0flrNYozFuccjLZofeap61UXKZ6SlM
	 Ya5/3zUHGWvDLY6bOqASvowuMTQEH8ioRaqMsP9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D85FDF802E7;
	Tue, 26 Oct 2021 08:54:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82ECBF802C8; Tue, 26 Oct 2021 08:54:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B32C6F80105
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 08:54:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B32C6F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="bTufQFM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1635231275;
 x=1666767275; h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=XLGJSqZ9EJciYjaTDSLhKJUkFf99BwO301mFgCKmAeU=;
 b=bTufQFM75NA49X7c/8NCpSbJUFEa22+92qVZt1YZsuFmopNSEEsCraTR
 riVgiPvYoh3/AfHkp2jSBwzoY01rG1Lt39UqQ9VtMwWYJ1WXxSXxDnS4X
 /XaqQ4a9bbKNObSKegdLMTbuYZd5TeAHK1yAxjwexbIlYwzYrAt9MH/F7
 EeYjWg/r2ReizBRHzjXNtVz03xgEVcDEi2GCBndI5TOzIsPrXttTyZsrv
 k6AYYQGhzhReO/2mNZ/SGDozIjcccjPquX0lGpWG+xmEEkLnkyWKeQtJ/
 ElV34TUdCOr8cZbCUFqhfqlq3hA7Qu1eL+0KpcM9TNlB3eWGS20gVmkds Q==;
Date: Tue, 26 Oct 2021 08:54:26 +0200
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: codec: tlv320adc3xxx: New codec driver
In-Reply-To: <YXbXO1d1XDFwUXqA@sirena.org.uk>
Message-ID: <alpine.DEB.2.21.2110260852120.26101@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.21.2110041117540.14472@lnxricardw1.se.axis.com>
 <YVsETxqzhZI8Fb6D@sirena.org.uk>
 <alpine.DEB.2.21.2110041716190.14472@lnxricardw1.se.axis.com>
 <YVsu+QMjOQz8pAzY@sirena.org.uk>
 <alpine.DEB.2.21.2110251755410.26101@lnxricardw1.se.axis.com>
 <YXbXO1d1XDFwUXqA@sirena.org.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail04w.axis.com (10.20.40.10) To se-mail07w.axis.com
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


On Mon, 25 Oct 2021, Mark Brown wrote:

> On Mon, Oct 25, 2021 at 06:01:04PM +0200, Ricard Wanderlof wrote:
> 
> > I'll add it to the DT configuration, but I can't really see why the having 
> > an additional runtime control would be a lot of extra work.
> 
> > In a completely embedded system where the microphone is part of the 
> > internal design it makes sense not to have it controllable of course, but 
> > in a system where the microphone is an external component (i.e. plugged 
> > into a microphone connector), the system design might need for it to be 
> > user configurable.
> 
> In any design we really ought to have some explicit confirmation before
> we allow users to go randomly changing voltages, it may cause damage if
> someone gets it wrong.  This means that the feature really ought to be
> an opt in one if it's going to be there.

Good point. 

So like a module parameter, or perhaps governed something in sysfs?

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
