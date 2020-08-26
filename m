Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F356252968
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 10:43:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2CE21706;
	Wed, 26 Aug 2020 10:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2CE21706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598431432;
	bh=ewd5Qg6DgxJ893/mn2DdjbpHpLYZdoB6GXQ5hSbv320=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N6J9uYJ1h5pDSv/tGo2oL3hjTUee+Qavjnu2TFt5K6fxlCTFWJztW1NruvDNqmRHe
	 A4DOQbiCd6L1JwGc8wi/djVwPeiripAcIhjuv2dyferqPPIZYKT0LPcug/JnwzhpRz
	 306wlD6X7eXd+Bpf49SObUVfvWOxlwzCC9YIkSNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D643BF80257;
	Wed, 26 Aug 2020 10:41:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DAD1F8020C; Wed, 26 Aug 2020 10:41:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E1C3F801D9
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 10:41:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E1C3F801D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="hVm9sLRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1598431287;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=MzchAeja0jhJdsQle33hb0rxs0PfxumQcdXnX+NQdaU=;
 b=hVm9sLRE1k/WCqEWpZAtwQ+RBTKJCFSH3K4yQZz5/YJo2sf0DFjQ41kT0vHYanMXMP
 bKZA4u0W7vaIlu9/S9ugzqLaWtCgYDWCAZqo46cHPChFakCuERMYBaXwkvUEBXP8VM6U
 wfqM6WrB99/g0CajOy3++T9ph++Gi2ja14x7QgWTwAOF2cRFpZLDytUy7cZTQaYM/2Lu
 kP3CPDrdkxAhoKvsjpEZJL2aQhWxjNpYFeulA9vItQit3J/PZM7MwmzvUT0qfz4Wa22s
 NNlpwtsjXDL85IWsinfIwTIFwXbO/3UWhJpHDHm3Ija36WzN+kwqdrMPR/G7Op6FaFyP
 TuBA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7Ic/Fboo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
 with ESMTPSA id g0b6c1w7Q8fJkcs
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 26 Aug 2020 10:41:19 +0200 (CEST)
Date: Wed, 26 Aug 2020 10:41:18 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom: Document "aux-devs" property
Message-ID: <20200826084118.GB869@gerhold.net>
References: <20200819091533.2334-1-stephan@gerhold.net>
 <20200819091533.2334-2-stephan@gerhold.net>
 <20200825215253.GA1397515@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825215253.GA1397515@bogus>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On Tue, Aug 25, 2020 at 03:52:53PM -0600, Rob Herring wrote:
> On Wed, Aug 19, 2020 at 11:15:32AM +0200, Stephan Gerhold wrote:
> > In some cases we need to probe additional audio components that do
> > not appear as part of the DAI links specified in the device tree.
> > Examples for this are auxiliary devices such as analog amplifiers
> > or codecs.
> > 
> > To make them work they need to be added as part of "aux-devs"
> > and connected to some other audio component using the audio routes
> > configurable using "(qcom,)audio-routing".
> > 
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> >  .../devicetree/bindings/sound/qcom,apq8016-sbc.txt        | 7 +++++++
> >  Documentation/devicetree/bindings/sound/qcom,apq8096.txt  | 8 ++++++++
> >  Documentation/devicetree/bindings/sound/qcom,sdm845.txt   | 8 ++++++++
> >  3 files changed, 23 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
> > index 84b28dbe9f15..23998262a0a7 100644
> > --- a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
> > +++ b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
> > @@ -34,6 +34,13 @@ Required properties:
> >  			  * DMIC
> >  			  * Ext Spk
> >  
> > +Optional properties:
> > +
> > +- aux-devs		: A list of phandles for auxiliary devices (e.g. analog
> > +			  amplifiers) that do not appear directly within the DAI
> > +			  links. Should be connected to another audio component
> > +			  using "qcom,audio-routing".
> > +
> >  Dai-link subnode properties and subnodes:
> >  
> >  Required dai-link subnodes:
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt b/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
> > index c814e867850f..248df5056fec 100644
> > --- a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
> > +++ b/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
> > @@ -55,6 +55,14 @@ This binding describes the APQ8096 sound card, which uses qdsp for audio.
> >  	Value type: <stringlist>
> >  	Definition: The user-visible name of this sound card.
> >  
> > +- aux-devs
> > +	Usage: optional
> > +	Value type: <phandles with arguments>
> 
> How do you know how many arguments? It either has to be fixed or needs a 
> #.*cells in the phandles. For the latter, you'd need to come up with a 
> common binding.
> 

Actually the phandle should not have any arguments, seems like I just
copied this from some other entry. Will fix this, thank you!

Stephan
