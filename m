Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E6651DA2E
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 16:11:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2023D1843;
	Fri,  6 May 2022 16:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2023D1843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651846273;
	bh=QSTdVIDTGCXlezHmH2+oiqQf0IZ7PXGw1SaggBY6/uM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qn+5+q61X7asloAVC3vRxgV7Wcy/6TYjvayjLxzhVQ63zv5qJXuAMSVJQAm39e5LF
	 QVogRZduokodoCrRV3eWR4XRjALn7/OwWgpVgLqlnrE+qjI0D2O9cPtIfsMMjOTTZr
	 5v0AtOD3/3/p6KeO8f4F3CcHDeVN1+LvO1MHEEis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85AFDF800E3;
	Fri,  6 May 2022 16:10:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55DF8F8014B; Fri,  6 May 2022 16:10:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5264F800E3
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 16:10:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5264F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="fyh+VtUy"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 41D7C1F46710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651846204;
 bh=QSTdVIDTGCXlezHmH2+oiqQf0IZ7PXGw1SaggBY6/uM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fyh+VtUygnb9GB7tGAWE4+/MmdI32xBXFoaASg1PnEtQoRWab9mtk6k+P8QH6cfE1
 MHt6Y246yXFhWyR2aOF13HlK0p2eb75MplA47CCmiD3Hu4zQX0Y24bM4Dalz3rbfQC
 HYI1wi3TbjH/5aQfWcOpqZKMSYgCdwzvGzidOEISocIxo8uASRjmWIVs8XxHQ9djDZ
 tXVhdn+r7znUVnA4CgEqFbN7D8bGaIxJGNsj2AINkxxlF9anY3TqiIu1qb6606ByUt
 rJRsg/FlGHNlS51Njw+KBR3ffLbd+xaBOjVs38VQ6Ng7vsTjCxU+C/7Fzsor2mb6/3
 HYxPGh5huYPJg==
Date: Fri, 6 May 2022 10:09:59 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
Message-ID: <20220506140959.ldy32lyf5jbkkqj2@notapiano>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <20220429203039.2207848-2-nfraprado@collabora.com>
 <4826c824-40ce-5726-ed95-5be069233ca7@collabora.com>
 <cbf2fcbae25408b95875278eb37e829bf4671430.camel@mediatek.com>
 <d1c548bb-8a36-79bf-498d-c909bf7e7679@collabora.com>
 <20220505162537.byiwfe2ghomxhezl@notapiano>
 <559a1e189613484b8528dc4eaf19099e9162fcc6.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <559a1e189613484b8528dc4eaf19099e9162fcc6.camel@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Shane Chien <shane.chien@mediatek.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Fri, May 06, 2022 at 01:45:24PM +0800, Jiaxin Yu wrote:
> On Thu, 2022-05-05 at 12:25 -0400, N�colas F. R. A. Prado wrote:
> > > 
> 
> > On Thu, May 05, 2022 at 10:52:45AM +0200, AngeloGioacchino Del Regno
> > wrote:
> > > Il 05/05/22 10:48, Jiaxin Yu ha scritto:
> > > > On Thu, 2022-05-05 at 10:08 +0200, AngeloGioacchino Del Regno
> > > > wrote:
> > > > > Il 29/04/22 22:30, N�colas F. R. A. Prado ha scritto:
> > > > > > The Mediatek AFE PCM controller for MT8192 allows sharing of
> > > > > > an I2S
> > > > > > bus
> > > > > > between two busses. Add a pattern for these properties in the
> > > > > > dt-binding.
> > > > > > 
> > > > > > Signed-off-by: N�colas F. R. A. Prado <
> > > > > > nfraprado@collabora.com>
> > > > > > ---
> > > > > > 
> > > > > >    Documentation/devicetree/bindings/sound/mt8192-afe-
> > > > > > pcm.yaml | 5
> > > > > > +++++
> > > > > >    1 file changed, 5 insertions(+)
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/sound/mt8192-
> > > > > > afe-
> > > > > > pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-
> > > > > > afe-
> > > > > > pcm.yaml
> > > > > > index 7a25bc9b8060..5b03c8dbf318 100644
> > > > > > --- a/Documentation/devicetree/bindings/sound/mt8192-afe-
> > > > > > pcm.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-
> > > > > > pcm.yaml
> > > > > > @@ -54,6 +54,11 @@ properties:
> > > > > >          - const: aud_infra_clk
> > > > > >          - const: aud_infra_26m_clk
> > > > > > +patternProperties:
> > > > > > +  "^i2s[0-35-9]-share$":
> > > > > > +    description: Name of the I2S bus that is shared with
> > > > > > this bus
> > > > > > +    pattern: "^I2S[0-35-9]$"
> > > > > > +
> > > > > >    required:
> > > > > >      - compatible
> > > > > >      - interrupts
> > > > > > 
> > > > > 
> > > > > The only other way of doing this would be to complicate this in
> > > > > the
> > > > > driver
> > > > > so that we can do something like
> > > > > 
> > > > > "i2s-share = <0 2>";  instead of  i2s0-share = "I2S2";
> > > > > 
> > > > > ...and I don't think that this would be any more
> > > > > straightforward than
> > > > > the
> > > > > provided way.
> > > > > 
> > > > > There's an improvement that we can do to that pattern
> > > > > description
> > > > > though,
> > > > > which would be explaining that declaring 'i2s0-share = "I2S2"'
> > > > > means
> > > > > that
> > > > > I2S2's data pin will be used as DATA-OUT, while i2s0 is DATA-
> > > > > IN.
> > > > > 
> > > > > Another thing that comes to mind here is that this is a
> > > > > MediaTek
> > > > > specific
> > > > > property and *not* a generic one, which means that both the
> > > > > driver
> > > > > and
> > > > > this binding should be fixed to get a "mediatek," prefix, so,
> > > > > this
> > > > > property
> > > > > should - in reality - be "mediatek,i2s[0-35-9]-share" instead.
> > > > > 
> > > > > I think that everyone agrees about that, but let's see what the
> > > > > others say.
> > > > > 
> > > > > Cheers,
> > > > > Angelo
> > > > 
> > > > Hi Angelo,
> > > > 
> > > > 'i2s0-share = "I2S2"' means that if we want use I2S0, there need
> > > > open
> > > > I2S2 to provide clock. Conversely, if we want to use I2S2, we
> > > > don't
> > > > need to open I2S0. However, MediaTek I2S0 and I2S2 hardware are
> > > > generally designed as input. So usually we use 'i2s0-share =
> > > > "I2S1"'.
> > > > Even numbers represent input, odd numbers represent output.
> > > > 
> > > > Yes, I think adding the "mediatek," prefix is the right way to
> > > > define a
> > > > non-generic property.
> > > > 
> > 
> > Hi Jiaxin,
> > 
> > thank you for the insights.
> > 
> > > 
> > > Hello Jiaxin,
> > > 
> > > if I get this correctly, i2s0-share = "I2S2" would be *invalid*...
> > > as you
> > > just explained, i2sX, where:
> > > 
> > > X = even number -> always DATA IN
> > > X = odd number  -> always DATA OUT
> > > 
> > > ...this means that the dt-binding needs a pattern to specify that
> > > only odd
> > > can be assigned to only even.
> > 
> > So, the situation seems different at least on mt8192-asurada-
> > spherion.
> > Here, I2S8 is used for the headset microphone and I2S9 for the
> > headset audio.
> > Even for input and odd for output agree with Jiaxin's description.
> > However, the
> > input bus seems to be the main one, that is, disabling I2S8:
> > 
> > 	amixer cset name='UL2_CH1 I2S8_CH1' 0
> > 	amixer cset name='UL2_CH2 I2S8_CH2' 0
> > 
> > not only disables the microphone but also the audio on the headset.
> > If I add 
> > 
> > 	i2s9-share = "I2S8";
> > 
> > on the DT, then everything works, I can disable I2S8 without
> > impacting the
> > headset audio. So the pattern for the property on this platform is
> > the opposite
> > that Jiaxin mentioned. This tells me that we should keep the binding
> > more
> > generic (not assume where odds and evens go). I will still apply the
> > other
> > suggestions mentioned though.
> > 
> > Thanks,
> > N�colas
> > 
> Hi N�colas,
> 
> From software point, I2S8 and I2S9 belong to different hardware, so if
> you turn off I2S8 with CMD1, of course it will not affect I2S9.
> 
> CMD1:
> amixer cset name='UL2_CH1 I2S8_CH1' 0
> amixer cset name='UL2_CH2 I2S8_CH2' 0
> 
> Frome hardware point, I2S9 will use(share) I2S8's clock. If we don't
> want the user to perceive this, the driver need to help do something.
> So this property 'i2s9-share = "I2S8";' will be added to inform the
> driver.

Hi Jiaxin,

yes, that's what I figured. What I was saying is that for the binding, your
example was

i2s0-share = "I2S1"
   ^ even,input  ^ odd,output

while on mt8192-asurada-spherion the use case is

i2s9-share = "I2S8";
   ^ odd,output  ^ even,input

So Angelo's idea to require in the dt-binding that the left side is always even
(input) and the right side always odd (based on your example), wouldn't work for
my use case.

Basically it's a question of whether the input always shares the clock from an
output (your example), or if output always shares the clock from an input (my
use case), or if both are valid. I'm taking from this that both are valid, so I
won't add any such restriction in the dt-binding in the following version, but
do let me know if this is not the case.

Thanks,
N�colas
