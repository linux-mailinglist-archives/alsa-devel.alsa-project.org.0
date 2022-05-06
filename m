Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BD451D0E2
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 07:46:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ACB717B5;
	Fri,  6 May 2022 07:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ACB717B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651816010;
	bh=CRzv72Q2jp8ydrw8faqbi3bddl/w8Z5sMbmXnkrqS08=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=selztlcq2MvfLBqidW1ccM69vJ78zuSZPDFNAIZhzo4gFX80X5wvtn/GpeFhye9Ny
	 H2CvBtZ/EndO4myHhHQreIwCyF8PqVedkHahq7Mrphmllfz7UhUPy/l4Xr9/sBThjc
	 E0yTx+Xi67Vzx1X3FhlakAL+u9khCzctMxNazQlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F30DF800E3;
	Fri,  6 May 2022 07:45:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95270F8014B; Fri,  6 May 2022 07:45:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF050F800E3
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 07:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF050F800E3
X-UUID: e4f81d8e1d9c4eef92bb575f724971fd-20220506
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:16b711ea-c820-44a0-a1c3-3cd2ab4b618b, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:b5656916-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: e4f81d8e1d9c4eef92bb575f724971fd-20220506
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 62907079; Fri, 06 May 2022 13:45:28 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 6 May 2022 13:45:27 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 13:45:27 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 May 2022 13:45:24 +0800
Message-ID: <559a1e189613484b8528dc4eaf19099e9162fcc6.camel@mediatek.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Fri, 6 May 2022 13:45:24 +0800
In-Reply-To: <20220505162537.byiwfe2ghomxhezl@notapiano>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <20220429203039.2207848-2-nfraprado@collabora.com>
 <4826c824-40ce-5726-ed95-5be069233ca7@collabora.com>
 <cbf2fcbae25408b95875278eb37e829bf4671430.camel@mediatek.com>
 <d1c548bb-8a36-79bf-498d-c909bf7e7679@collabora.com>
 <20220505162537.byiwfe2ghomxhezl@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Shane Chien <shane.chien@mediatek.com>, Rob
 Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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

On Thu, 2022-05-05 at 12:25 -0400, Nícolas F. R. A. Prado wrote:
> > 

> On Thu, May 05, 2022 at 10:52:45AM +0200, AngeloGioacchino Del Regno
> wrote:
> > Il 05/05/22 10:48, Jiaxin Yu ha scritto:
> > > On Thu, 2022-05-05 at 10:08 +0200, AngeloGioacchino Del Regno
> > > wrote:
> > > > Il 29/04/22 22:30, Nícolas F. R. A. Prado ha scritto:
> > > > > The Mediatek AFE PCM controller for MT8192 allows sharing of
> > > > > an I2S
> > > > > bus
> > > > > between two busses. Add a pattern for these properties in the
> > > > > dt-binding.
> > > > > 
> > > > > Signed-off-by: Nícolas F. R. A. Prado <
> > > > > nfraprado@collabora.com>
> > > > > ---
> > > > > 
> > > > >    Documentation/devicetree/bindings/sound/mt8192-afe-
> > > > > pcm.yaml | 5
> > > > > +++++
> > > > >    1 file changed, 5 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/sound/mt8192-
> > > > > afe-
> > > > > pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-
> > > > > afe-
> > > > > pcm.yaml
> > > > > index 7a25bc9b8060..5b03c8dbf318 100644
> > > > > --- a/Documentation/devicetree/bindings/sound/mt8192-afe-
> > > > > pcm.yaml
> > > > > +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-
> > > > > pcm.yaml
> > > > > @@ -54,6 +54,11 @@ properties:
> > > > >          - const: aud_infra_clk
> > > > >          - const: aud_infra_26m_clk
> > > > > +patternProperties:
> > > > > +  "^i2s[0-35-9]-share$":
> > > > > +    description: Name of the I2S bus that is shared with
> > > > > this bus
> > > > > +    pattern: "^I2S[0-35-9]$"
> > > > > +
> > > > >    required:
> > > > >      - compatible
> > > > >      - interrupts
> > > > > 
> > > > 
> > > > The only other way of doing this would be to complicate this in
> > > > the
> > > > driver
> > > > so that we can do something like
> > > > 
> > > > "i2s-share = <0 2>";  instead of  i2s0-share = "I2S2";
> > > > 
> > > > ...and I don't think that this would be any more
> > > > straightforward than
> > > > the
> > > > provided way.
> > > > 
> > > > There's an improvement that we can do to that pattern
> > > > description
> > > > though,
> > > > which would be explaining that declaring 'i2s0-share = "I2S2"'
> > > > means
> > > > that
> > > > I2S2's data pin will be used as DATA-OUT, while i2s0 is DATA-
> > > > IN.
> > > > 
> > > > Another thing that comes to mind here is that this is a
> > > > MediaTek
> > > > specific
> > > > property and *not* a generic one, which means that both the
> > > > driver
> > > > and
> > > > this binding should be fixed to get a "mediatek," prefix, so,
> > > > this
> > > > property
> > > > should - in reality - be "mediatek,i2s[0-35-9]-share" instead.
> > > > 
> > > > I think that everyone agrees about that, but let's see what the
> > > > others say.
> > > > 
> > > > Cheers,
> > > > Angelo
> > > 
> > > Hi Angelo,
> > > 
> > > 'i2s0-share = "I2S2"' means that if we want use I2S0, there need
> > > open
> > > I2S2 to provide clock. Conversely, if we want to use I2S2, we
> > > don't
> > > need to open I2S0. However, MediaTek I2S0 and I2S2 hardware are
> > > generally designed as input. So usually we use 'i2s0-share =
> > > "I2S1"'.
> > > Even numbers represent input, odd numbers represent output.
> > > 
> > > Yes, I think adding the "mediatek," prefix is the right way to
> > > define a
> > > non-generic property.
> > > 
> 
> Hi Jiaxin,
> 
> thank you for the insights.
> 
> > 
> > Hello Jiaxin,
> > 
> > if I get this correctly, i2s0-share = "I2S2" would be *invalid*...
> > as you
> > just explained, i2sX, where:
> > 
> > X = even number -> always DATA IN
> > X = odd number  -> always DATA OUT
> > 
> > ...this means that the dt-binding needs a pattern to specify that
> > only odd
> > can be assigned to only even.
> 
> So, the situation seems different at least on mt8192-asurada-
> spherion.
> Here, I2S8 is used for the headset microphone and I2S9 for the
> headset audio.
> Even for input and odd for output agree with Jiaxin's description.
> However, the
> input bus seems to be the main one, that is, disabling I2S8:
> 
> 	amixer cset name='UL2_CH1 I2S8_CH1' 0
> 	amixer cset name='UL2_CH2 I2S8_CH2' 0
> 
> not only disables the microphone but also the audio on the headset.
> If I add 
> 
> 	i2s9-share = "I2S8";
> 
> on the DT, then everything works, I can disable I2S8 without
> impacting the
> headset audio. So the pattern for the property on this platform is
> the opposite
> that Jiaxin mentioned. This tells me that we should keep the binding
> more
> generic (not assume where odds and evens go). I will still apply the
> other
> suggestions mentioned though.
> 
> Thanks,
> Nícolas
> 
Hi Nícolas,

From software point, I2S8 and I2S9 belong to different hardware, so if
you turn off I2S8 with CMD1, of course it will not affect I2S9.

CMD1:
amixer cset name='UL2_CH1 I2S8_CH1' 0
amixer cset name='UL2_CH2 I2S8_CH2' 0

Frome hardware point, I2S9 will use(share) I2S8's clock. If we don't
want the user to perceive this, the driver need to help do something.
So this property 'i2s9-share = "I2S8";' will be added to inform the
driver.

Best Regards,
Jiaxin Yu

> > Nicolas, take note! :-) :-)
> > 
> > Thanks,
> > Angelo
> > 
> > To unsubscribe, send mail to 
> > kernel-unsubscribe@lists.collabora.co.uk.

