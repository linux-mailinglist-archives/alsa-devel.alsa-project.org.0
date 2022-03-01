Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 229BE4C8D71
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 15:14:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7D321AD6;
	Tue,  1 Mar 2022 15:13:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7D321AD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646144068;
	bh=pbCpNUxnrXvsVt6vRir4O6olbHWP7FODUFKCT5tCbhM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=adIEm0y6rIw+sGTqI00WQjZ4TUzxBDT5YCtoz6+tCNls0KADr59dSF34BMevpJsOS
	 SEw+EKvHjxFrjJhudvIeU3YkzAa4nmFnOALqIJa7wfpFOhM91FoXQYcX85RxMQvpW8
	 CxG6md2SiYVqhNKCXeyJuItIRvaX1sI1aHdg9iGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AD01F801D8;
	Tue,  1 Mar 2022 15:13:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E249BF80227; Tue,  1 Mar 2022 15:13:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0CDAF80167
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 15:13:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0CDAF80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="MdeVPdXU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646143990;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=EIAmU7dd/0c4jjuJcUL10wWwB+pEyYXtqoEKj5HRR1Q=;
 b=MdeVPdXUfdO0rm53+PvnVrqHXtESrIt9787IJd1LYVRHGP2k9nYridBvIvAqdI9QwO
 DRcn3HcBtOKFzl1S6b0iyNF2d+TwdPVzU1JIYtZ7BMhd7vUbLcMYFlTvvmg91QFb0koU
 0vGu8ECSOViIv9t+k17cxCl+yx7dP3hBSJYFHU4f8MrazyNmNEQ6hEExGi2U7CfThUWy
 5NgHwd5N/q7Dc33GjGV3UioIbUTp0gc9p2J+ZNmJ9Vjqu4DBoLXvM4ZQidegc2nUsoYX
 fUeXv2oFr3nBnbvs/6mjbRdTKIjhN2EW3aX1NNtF8QTgiSN4WcDViX7twe4EmgYAfMVZ
 SO+Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK86+6Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.40.1 AUTH)
 with ESMTPSA id kdc58dy21EDAaj8
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Mar 2022 15:13:10 +0100 (CET)
Date: Tue, 1 Mar 2022 15:13:09 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: codecs: Add Awinic AW8738 audio amplifier driver
Message-ID: <Yh4p9aKVnBfAONxX@gerhold.net>
References: <20220301123742.72146-1-stephan@gerhold.net>
 <20220301123742.72146-3-stephan@gerhold.net>
 <Yh4jXfABBzXQAowc@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yh4jXfABBzXQAowc@sirena.org.uk>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Jonathan Albrieux <jonathan.albrieux@gmail.com>
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

On Tue, Mar 01, 2022 at 01:45:01PM +0000, Mark Brown wrote:
> On Tue, Mar 01, 2022 at 01:37:42PM +0100, Stephan Gerhold wrote:
> 
> > The Awinic AW8738 is a simple audio amplifier using an enable GPIO.
> > The main difference to simple-amplifier is that there is a "one-wire
> > pulse control" that allows configuring the amplifier to one of a few
> > pre-defined modes.
> 
> What exactly are the modes here?  Looking at the web site for the part
> it seems like it's selecting a power limit for the speaker so it makes
> sense that the mode would be fixed in DT but it's not clear from the
> driver.
> 

It seems to be mostly a power limit but not only. E.g. on AW8738 mode
3/4 and 5/6 seem to have the same power limit but select between a
"NCN function" or "Multi-Level AGC function", which seems to control
how the amplifier behaves if the power limit is reached.

The exact effect of the modes varies greatly between different Awinic
parts, but since I don't really see a use case for changing those
options dynamically I think it's best to just load it from DT.

> > +	aw->gpiod_enable = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> > +	if (IS_ERR(aw->gpiod_enable))
> > +		return dev_err_probe(dev, PTR_ERR(aw->gpiod_enable),
> > +				     "Failed to get 'enable' gpio");
> 
> Are we sure that enable is the best name for this pin?  It's more
> complex than just an enable since it's the 1 wire data - according to
> what's on the awinic web site it looks like the actual label is /SHDN
> which is similarly misleading though :/

Yeah, I was considering to call it "shdn" instead but given the negation
that seemed even more confusing. I ended up using "enable" since this is
the name used in the mode table of the datasheet (which will probably be
the main reference when setting up the amplifier in the DT).

Thanks,
Stephan
