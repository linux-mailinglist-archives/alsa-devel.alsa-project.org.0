Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5278743DBE8
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 09:23:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D73D816A2;
	Thu, 28 Oct 2021 09:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D73D816A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635405819;
	bh=5zz1JsBkkA9G4b9QgPdFVziJjOzJr1shUHIi1HS+VGw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pvGBq1rcdbJs3LnH9rFzg8DOH134VUp+LxTwZ4ochN5/wn+abfyPZStlSmg9VY+li
	 AX1R+88wzhZL2wDfae3c/t9eEWqiGsIzshNsaWhKzo7rSQ/aLfFmVjvsvhgS3vRg9h
	 5tw6wmmdtb2gPbHnKsBr0tzHoept/m9fPCkTQq3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DE79F800D1;
	Thu, 28 Oct 2021 09:22:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A425F802C8; Thu, 28 Oct 2021 09:22:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B773F800D1
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 09:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B773F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="nP3fEgWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1635405727;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=kOBZjRlCxa2iH7iZrnGYd692rY43y4CmP/9XW3tcKfQ=;
 b=nP3fEgWu6xJnfqllIlADlnzTrnju370sDmyroJ3WIqU2bwe4TfndmT2MaBVLK0G0f4
 7R1NS8fhWimfE41KR1/x62xPwzVQSu8fyQhUi3VQXNSnmEyT4n20hqcB+RdEsqz17cH+
 lglEnTbshGHNhlL1etYfpt9DuGlN/t4Gm4k7LRaSwcEF3bnHjsVZEhbWX0YUjbOo1fPG
 suL6JDnR8yKTbXrg9GvyICJwVZGtngqjLA2ON5C8XUN98WPCbFZ7KiAKQwYR0tZHgfoF
 ZuQ0Uzunk2jqg2DmYh3D4UbkStZ+4EVKMwi+caZibCmgUfWuNgRdTqePJAHF2TFFiomR
 XaQw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLUrKw7/aY="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.34.1 AUTH)
 with ESMTPSA id 207811x9S7M79PH
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 28 Oct 2021 09:22:07 +0200 (CEST)
Date: Thu, 28 Oct 2021 09:22:05 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 1/4] ASoC: codecs: tfa989x: Add switch to allow
 disabling amplifier
Message-ID: <YXpPnQ2YTo5ZdQnm@gerhold.net>
References: <20211024085840.1536438-1-vincent.knecht@mailoo.org>
 <20211024085840.1536438-2-vincent.knecht@mailoo.org>
 <YXaMVHo9drCIuD3u@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXaMVHo9drCIuD3u@sirena.org.uk>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Vincent Knecht <vincent.knecht@mailoo.org>
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

On Mon, Oct 25, 2021 at 11:52:04AM +0100, Mark Brown wrote:
> On Sun, Oct 24, 2021 at 10:58:37AM +0200, Vincent Knecht wrote:
> > From: Stephan Gerhold <stephan@gerhold.net>
> > 
> > In some configurations it may be necessary to explicitly disable
> > the amplifier with an ALSA mixer. An example for this is a stereo
> > setup with two TFA989X. If only one of them should be used (e.g.
> > to use it as an earpiece) the other one must be explicitly disabled.
> > 
> > Add a virtual "Amp Switch" to implement that. There is no register
> > for this (SND_SOC_NOPM) so it only prevents DAPM from activating
> > the amplifier. Also it is inverted (= enabled by default) for
> > compatibility with devices that do not need this functionality.
> 
> Why can you not use a standard pin switch on the speaker output for
> this?

Thanks for the suggestion! For some reason I was not aware of the pin
switch mechanism... :) We have tried this and it seems to work fine.
I will submit a separate series to allow setting up the pin switches
for the qcom sound cards instead.

The other patches in this series are independent of this one and still
apply cleanly for me. Can you just ignore PATCH 1/4 or would you prefer
a resend without this patch?

Thanks,
Stephan
