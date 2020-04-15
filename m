Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7F61A962B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 10:22:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80A4D1614;
	Wed, 15 Apr 2020 10:21:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80A4D1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586938965;
	bh=uI2ULOCE2VPZxBLZr6YHvbQaWx1mcMt+4tFLHV6mA1E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZM8G54zid4BRfam4ADqnxfMpUU7rW4I+BVzX0ycQA+qu0D3Fk882bSrVj7sSSaDlF
	 tScXRz0xBwyLXMtaEedPCOMn9BPVIaK2pGLlX0Od9R0p0ZqG7Ou5pQ4fiao3VZOfCt
	 ks3AANG60IgyZZuBFa+qRJnPsdu+L4Cnm7n51xhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C76C0F80229;
	Wed, 15 Apr 2020 10:21:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE3BFF80245; Wed, 15 Apr 2020 10:21:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E361FF80124
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 10:20:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E361FF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="sABpDcRZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586938854;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=YTTie5J9+VtqDVNQ1XWkbq9G8gBx+DEr3VPTmvjCzG0=;
 b=sABpDcRZ4FMTBOKcmmAwWKTTIXf7z26D5npElkQqLubF2j2FSoX2Z3f1MFSlmVOzhH
 wXeMSWk4yxxqzjPMI+3sRWjqP8VKxsq7uVF873vtwD9DD/K5sQ5sbpt6bo4dGaGHd8BK
 3nYa7d5TCLfMLulV5rEyn3UINavx+i89JchtPQ9Wn/S4dR7m5cZxq0CpHPcLfaNH6qGW
 Hiq4vsKEowa9FjZ7XlkRnN5nHsj5aQar55q3Tn2xP0iO1Tl7icdhH8syOUfdVLTN8rGR
 uomX4RHB7pNffZot752/7EZPOffzo4tWJRfNveV99PoIMmIk14po4/BxQlqStvr18pd4
 G8zQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9Ic/CaIo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
 with ESMTPSA id k074e0w3F8Kj0Hg
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 15 Apr 2020 10:20:45 +0200 (CEST)
Date: Wed, 15 Apr 2020 10:20:39 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: sound: lpass-cpu: Document DAI subnodes
Message-ID: <20200415082039.GA1395@gerhold.net>
References: <20200406135608.126171-1-stephan@gerhold.net>
 <20200415000649.GA28504@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415000649.GA28504@bogus>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Kenneth Westfield <kwestfie@codeaurora.org>
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

Hi Rob,

Thanks a lot for your review!

On Tue, Apr 14, 2020 at 07:06:49PM -0500, Rob Herring wrote:
> On Mon, Apr 06, 2020 at 03:56:07PM +0200, Stephan Gerhold wrote:
> > The lpass-cpu driver now allows configuring the MI2S SD lines
> > by defining subnodes for one of the DAIs.
> > 
> > Document this in the device tree bindings.
> > 
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> >  .../bindings/sound/qcom,lpass-cpu.txt         | 23 +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> > index 21c648328be9..df53a10502f7 100644
> > --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> > +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> > @@ -30,6 +30,8 @@ Required properties:
> >  - reg			: Must contain an address for each entry in reg-names.
> >  - reg-names		: A list which must include the following entries:
> >  				* "lpass-lpaif"
> > +- #address-cells	: Must be 1
> > +- #size-cells		: Must be 0
> >  
> >  
> >  
> > @@ -37,6 +39,18 @@ Optional properties:
> >  
> >  - qcom,adsp		: Phandle for the audio DSP node
> >  
> > +By default, the driver uses up to 4 MI2S SD lines, for a total of 8 channels.
> > +The SD lines to use can be configured by adding subnodes for each of the DAIs.
> > +
> > +Required properties for each DAI (represented by a subnode):
> > +- reg			: Must be one of the DAI IDs
> > +			  (usually part of dt-bindings header)
> > +- qcom,playback-sd-lines: List of serial data lines (0-3) to use for playback
> 
> 0-3 for the values or number of entries?
> 

It's basically a list of bits, e.g. <0 1> or <1 2 3> where the bits are
0-3. Number of entries would be 1-4. I will clarify this a bit in the
next version.

> > +- qcom,capture-sd-lines	: List of serial data lines (0-3) to use for capture
> > +
> > +Note that adding a subnode changes the default to "no lines configured",
> > +so both playback and capture lines should be configured when a subnode is added.
> > +
> >  Example:
> >  
> >  lpass@28100000 {
> > @@ -51,4 +65,13 @@ lpass@28100000 {
> >  	reg = <0x28100000 0x10000>;
> >  	reg-names = "lpass-lpaif";
> >  	qcom,adsp = <&adsp>;
> > +
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	/* Optional to set different MI2S SD lines */
> > +	mi2s-quaternary@3 {
> 
> Normally the node name reflects the class of device. IOW, all the child 
> nodes should have the same name.
> 

Given that I somewhat adapted these node names from existing bindings
at Documentation/devicetree/bindings/sound/qcom,q6afe.txt,
I have sent out two patches to change them there first:

  https://lore.kernel.org/linux-devicetree/20200415081159.1098-1-stephan@gerhold.net/

Maybe you can take a look at the new node names there first,
and if they are fine I will send an updated version of this patch set.

Thanks,
Stephan

> > +		reg = <MI2S_QUATERNARY>;
> > +		qcom,playback-sd-lines = <0 1>;
> > +	};
> >  };
> > -- 
> > 2.26.0
> > 
