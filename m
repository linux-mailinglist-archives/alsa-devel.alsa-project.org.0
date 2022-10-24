Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D8260AE8F
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 17:08:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D342A4666;
	Mon, 24 Oct 2022 17:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D342A4666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666624080;
	bh=a+0l+LUieWCZmrTxkABAo7G3RJjD6TBzF2qMpoeot0g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IpjRKog8RS5HLD2lFFFLw96f/bFN+chZ7iAWwcdIZ/z2kvz49dAeTOb6zJZU6auKd
	 6hC/QUX38/UVPLKQRqs6fd6CSmlSsXHa9KJ7cxq/Y1LY72Bt5i5hqWMbUO/9TZFkpf
	 IoIFQ+bvWj78n8+iLrg2/Ul9DkZKrB4k9eB0MH0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B32FF80431;
	Mon, 24 Oct 2022 17:07:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E070F80506; Mon, 24 Oct 2022 17:07:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04F54F80506
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 17:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04F54F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="dkAHqwl+"
Received: from notapiano (unknown [194.36.25.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 73C7F6602261;
 Mon, 24 Oct 2022 16:06:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666624016;
 bh=a+0l+LUieWCZmrTxkABAo7G3RJjD6TBzF2qMpoeot0g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dkAHqwl+gmnr1C2LmiLEiW4FWHa5ABtkJd1/j9NX4JV9VKV/5nr1wN5uUH52ZVsbg
 SxS0oNtxTGkUoshk/1bOzBcmbKmG0q8JfP/NQ0UWW14Stz4O5HaLx85nHo5QvJktJP
 JoHX1GUOcT3ukiANEgW45A4pEBGib3CHQHn8U7f/8kj4JP8WiIxgMHqMJ7srbGQHDF
 wh4aQlcgtsjPn3PkAbTJGk40uOP28OriL58RQTcFyrN/6NKIqA5PIjD7rr7DJsZE0e
 cQxQ7uIztL+uY/32qfYDOQg9ID2Ic6Xby/AHaKmOB9Ye6D2yNReQhCiR+J2ahVdSiF
 OPoTmjxte6Ddg==
Date: Mon, 24 Oct 2022 11:06:49 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: realtek,rt5682s: Add AVDD and
 MICVDD supplies
Message-ID: <20221024150649.wbd54lcvgrj4kxgu@notapiano>
References: <20221021190908.1502026-1-nfraprado@collabora.com>
 <20221021190908.1502026-3-nfraprado@collabora.com>
 <ae460461-5c20-9180-456c-8c01a4b1a7f1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae460461-5c20-9180-456c-8c01a4b1a7f1@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com,
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

On Sat, Oct 22, 2022 at 12:39:56PM -0400, Krzysztof Kozlowski wrote:
> On 21/10/2022 15:09, Nícolas F. R. A. Prado wrote:
> > The rt5682s codec can have two supplies: AVDD and MICVDD. Add properties
> > for them.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> > 
> >  Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
> > index ea53a55015c4..ca1037e76f96 100644
> > --- a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
> > +++ b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
> > @@ -90,6 +90,10 @@ properties:
> >    "#sound-dai-cells":
> >      const: 0
> >  
> > +  AVDD-supply: true
> > +
> > +  MICVDD-supply: true
> > +
> 
> How about keeping some order in the list of properties?

The current properties don't seem to follow any particular order and keeping the
supplies grouped together seemed reasonable. What ordering do you suggest?

Thanks,
Nícolas
