Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E40651C518
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 18:26:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF511181C;
	Thu,  5 May 2022 18:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF511181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651768012;
	bh=us6VQcZonVRZDNCqwnPC3/ZUDrCZ5LkU3g8yGafttv4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Otg05nLcBkMTfINaNIxSEZfYewYEMlIHwRRVhUj/LsJKSUz1rn1sbiSMrs/3KFVpO
	 1jRi9ElNGitNj5fC/4A8yKaFdUFVIt+pdU33DV228btbxRECtWSYNsyj2KDQ1BoSaF
	 5jY3Qru9sr+dh+Vp74VDwWBykPA4fTr+15o3A+3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18D9CF8049C;
	Thu,  5 May 2022 18:25:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1AFAF800D3; Thu,  5 May 2022 18:25:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E1F6F800D3
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 18:25:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E1F6F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="DsrqAmPP"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 393751F45ABD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651767943;
 bh=us6VQcZonVRZDNCqwnPC3/ZUDrCZ5LkU3g8yGafttv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DsrqAmPPKwC1WvZxKzkbXTRjRJEiP/WizLShBmIu304hhlhhHNQSz9qLISwTIbG4W
 v+6C9yOSV7c/7M3TEtnFvJe94HChoUgbpjOn6Wq2SqjrQtu0kwsVmCwnUlmEmIBirc
 Po88xEbIChaOX6eNz/QE3ZfTlD8UWv0968oKjyBsx0JJoQrR9SVC1tIhACa4HxuwZG
 WLyeqN2LlBDs+gUf5pcSTlu3ulu/pfIYCtS/nxaM7Dy24gZUCy/W8KtsAuNrOhSj8m
 PA8F2q4XiLyQWx9Yhov61BeZXMt2Dkpy3lcK9Bvw6Uo5MNELIFEBZRKrFFCt+7MaRc
 BmlcLSapwch7g==
Date: Thu, 5 May 2022 12:25:37 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
Message-ID: <20220505162537.byiwfe2ghomxhezl@notapiano>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <20220429203039.2207848-2-nfraprado@collabora.com>
 <4826c824-40ce-5726-ed95-5be069233ca7@collabora.com>
 <cbf2fcbae25408b95875278eb37e829bf4671430.camel@mediatek.com>
 <d1c548bb-8a36-79bf-498d-c909bf7e7679@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1c548bb-8a36-79bf-498d-c909bf7e7679@collabora.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Shane Chien <shane.chien@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
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

On Thu, May 05, 2022 at 10:52:45AM +0200, AngeloGioacchino Del Regno wrote:
> Il 05/05/22 10:48, Jiaxin Yu ha scritto:
> > On Thu, 2022-05-05 at 10:08 +0200, AngeloGioacchino Del Regno wrote:
> > > Il 29/04/22 22:30, Nícolas F. R. A. Prado ha scritto:
> > > > The Mediatek AFE PCM controller for MT8192 allows sharing of an I2S
> > > > bus
> > > > between two busses. Add a pattern for these properties in the
> > > > dt-binding.
> > > > 
> > > > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > > > ---
> > > > 
> > > >    Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 5
> > > > +++++
> > > >    1 file changed, 5 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-
> > > > pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-
> > > > pcm.yaml
> > > > index 7a25bc9b8060..5b03c8dbf318 100644
> > > > --- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> > > > +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> > > > @@ -54,6 +54,11 @@ properties:
> > > >          - const: aud_infra_clk
> > > >          - const: aud_infra_26m_clk
> > > > +patternProperties:
> > > > +  "^i2s[0-35-9]-share$":
> > > > +    description: Name of the I2S bus that is shared with this bus
> > > > +    pattern: "^I2S[0-35-9]$"
> > > > +
> > > >    required:
> > > >      - compatible
> > > >      - interrupts
> > > > 
> > > 
> > > The only other way of doing this would be to complicate this in the
> > > driver
> > > so that we can do something like
> > > 
> > > "i2s-share = <0 2>";  instead of  i2s0-share = "I2S2";
> > > 
> > > ...and I don't think that this would be any more straightforward than
> > > the
> > > provided way.
> > > 
> > > There's an improvement that we can do to that pattern description
> > > though,
> > > which would be explaining that declaring 'i2s0-share = "I2S2"' means
> > > that
> > > I2S2's data pin will be used as DATA-OUT, while i2s0 is DATA-IN.
> > > 
> > > Another thing that comes to mind here is that this is a MediaTek
> > > specific
> > > property and *not* a generic one, which means that both the driver
> > > and
> > > this binding should be fixed to get a "mediatek," prefix, so, this
> > > property
> > > should - in reality - be "mediatek,i2s[0-35-9]-share" instead.
> > > 
> > > I think that everyone agrees about that, but let's see what the
> > > others say.
> > > 
> > > Cheers,
> > > Angelo
> > 
> > Hi Angelo,
> > 
> > 'i2s0-share = "I2S2"' means that if we want use I2S0, there need open
> > I2S2 to provide clock. Conversely, if we want to use I2S2, we don't
> > need to open I2S0. However, MediaTek I2S0 and I2S2 hardware are
> > generally designed as input. So usually we use 'i2s0-share = "I2S1"'.
> > Even numbers represent input, odd numbers represent output.
> > 
> > Yes, I think adding the "mediatek," prefix is the right way to define a
> > non-generic property.
> > 

Hi Jiaxin,

thank you for the insights.

> 
> Hello Jiaxin,
> 
> if I get this correctly, i2s0-share = "I2S2" would be *invalid*... as you
> just explained, i2sX, where:
> 
> X = even number -> always DATA IN
> X = odd number  -> always DATA OUT
> 
> ...this means that the dt-binding needs a pattern to specify that only odd
> can be assigned to only even.

So, the situation seems different at least on mt8192-asurada-spherion.
Here, I2S8 is used for the headset microphone and I2S9 for the headset audio.
Even for input and odd for output agree with Jiaxin's description. However, the
input bus seems to be the main one, that is, disabling I2S8:

	amixer cset name='UL2_CH1 I2S8_CH1' 0
	amixer cset name='UL2_CH2 I2S8_CH2' 0

not only disables the microphone but also the audio on the headset. If I add 

	i2s9-share = "I2S8";

on the DT, then everything works, I can disable I2S8 without impacting the
headset audio. So the pattern for the property on this platform is the opposite
that Jiaxin mentioned. This tells me that we should keep the binding more
generic (not assume where odds and evens go). I will still apply the other
suggestions mentioned though.

Thanks,
Nícolas

> 
> Nicolas, take note! :-) :-)
> 
> Thanks,
> Angelo
> 
> -- 
> To unsubscribe, send mail to kernel-unsubscribe@lists.collabora.co.uk.
