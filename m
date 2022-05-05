Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AB551BAF7
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 10:49:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA14117B7;
	Thu,  5 May 2022 10:49:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA14117B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651740594;
	bh=98TrZeLOepUOOI2tSqbrwLDdoQCIWH3DU4vGVg4O1gY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gxHILyKm6znLb16gBEdvJtWDtWmuCyaWorGDmBUUzWVYO/6TwSwRfbUZ3l/sFNLTA
	 SN83Cve29tEYpbR/J6/nAyrSUaKS1PWZio1JljIDCL2jJ4z8Yak+JIW1ZKYrMaLVYU
	 Za/nY0LJFBCrtVZhAEfEAvhlB4KXIfyfZNHqZoDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8D9FF8049C;
	Thu,  5 May 2022 10:48:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1325F8016B; Thu,  5 May 2022 10:48:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF70AF800BF
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 10:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF70AF800BF
X-UUID: b6a27cbdd49b4151970748d245fa15a2-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:b0e02674-ab0d-40a7-ad44-6868b5f9cd64, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:6a14acb2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: b6a27cbdd49b4151970748d245fa15a2-20220505
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1325095859; Thu, 05 May 2022 16:48:33 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 5 May 2022 16:48:32 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 5 May 2022 16:48:31 +0800
Message-ID: <cbf2fcbae25408b95875278eb37e829bf4671430.camel@mediatek.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>, "Mark
 Brown" <broonie@kernel.org>
Date: Thu, 5 May 2022 16:48:31 +0800
In-Reply-To: <4826c824-40ce-5726-ed95-5be069233ca7@collabora.com>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <20220429203039.2207848-2-nfraprado@collabora.com>
 <4826c824-40ce-5726-ed95-5be069233ca7@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Shane Chien <shane.chien@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
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

On Thu, 2022-05-05 at 10:08 +0200, AngeloGioacchino Del Regno wrote:
> Il 29/04/22 22:30, Nícolas F. R. A. Prado ha scritto:
> > The Mediatek AFE PCM controller for MT8192 allows sharing of an I2S
> > bus
> > between two busses. Add a pattern for these properties in the
> > dt-binding.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> > 
> >   Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 5
> > +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-
> > pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-
> > pcm.yaml
> > index 7a25bc9b8060..5b03c8dbf318 100644
> > --- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> > +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> > @@ -54,6 +54,11 @@ properties:
> >         - const: aud_infra_clk
> >         - const: aud_infra_26m_clk
> >   
> > +patternProperties:
> > +  "^i2s[0-35-9]-share$":
> > +    description: Name of the I2S bus that is shared with this bus
> > +    pattern: "^I2S[0-35-9]$"
> > +
> >   required:
> >     - compatible
> >     - interrupts
> > 
> 
> The only other way of doing this would be to complicate this in the
> driver
> so that we can do something like
> 
> "i2s-share = <0 2>";  instead of  i2s0-share = "I2S2";
> 
> ...and I don't think that this would be any more straightforward than
> the
> provided way.
> 
> There's an improvement that we can do to that pattern description
> though,
> which would be explaining that declaring 'i2s0-share = "I2S2"' means
> that
> I2S2's data pin will be used as DATA-OUT, while i2s0 is DATA-IN.
> 
> Another thing that comes to mind here is that this is a MediaTek
> specific
> property and *not* a generic one, which means that both the driver
> and
> this binding should be fixed to get a "mediatek," prefix, so, this
> property
> should - in reality - be "mediatek,i2s[0-35-9]-share" instead.
> 
> I think that everyone agrees about that, but let's see what the
> others say.
> 
> Cheers,
> Angelo

Hi Angelo,

'i2s0-share = "I2S2"' means that if we want use I2S0, there need open
I2S2 to provide clock. Conversely, if we want to use I2S2, we don't
need to open I2S0. However, MediaTek I2S0 and I2S2 hardware are
generally designed as input. So usually we use 'i2s0-share = "I2S1"'.
Even numbers represent input, odd numbers represent output.

Yes, I think adding the "mediatek," prefix is the right way to define a
non-generic property.

Best Regards,
Jiaxin Yu

