Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF7B60B012
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:01:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAFED6223;
	Mon, 24 Oct 2022 18:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAFED6223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666627301;
	bh=73mRAt4slxg3WQnhUlKVuGJufrCR8Hql2e3IIojI/es=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O+Dm2NhG2jK2kwmSHom7GhxoG1t3sWWRivOHgd34sU92tPnumF6bajfbynwGBrPYV
	 skK1V8ePG4XYuIk+rueySkzXn2mzLe23l2QjfeR/JdmrcbG4SJC5UiEq2dAP9OYm3c
	 cdei1Z+pWNBTOfs+Cowhg7tmcwHk6zRuS0KebyNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4016FF8053D;
	Mon, 24 Oct 2022 18:00:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED129F80506; Mon, 24 Oct 2022 18:00:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C386EF80506
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:00:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C386EF80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="f1hgZPCI"
Received: from notapiano (unknown [194.36.25.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 67746660036C;
 Mon, 24 Oct 2022 17:00:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666627236;
 bh=73mRAt4slxg3WQnhUlKVuGJufrCR8Hql2e3IIojI/es=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f1hgZPCIEOicahFOn1Bq+bo596EyWAUOwjbcMmFgffNFIHWoRoXgvAYkpl+6TtpCL
 f/I85L1Canirg8SShskHM9QFuQZPVOyiZTqkqH2s0xnS4xCTHvs60WY2JfRwBBmYdH
 BTwsHu/T6WIdGR5XaJKFf+/lWDDkc3IXtXKI3NIIZFr7RKr9JeaZUu9yhPo7tYqd3Y
 lHQaFPey+AMIOUZvwhZW6pECAFSfI6p8KjwhjXfwz+UZ+FEj4+X1y3NAKFKJInmtTs
 7m7l/Jh3YhZoi/leAySkQZtWSGmOhzwPOzlb5XTXdz9ZGqOzo3QZzehtG9kl2DPtkT
 Gwfhl9jc065vw==
Date: Mon, 24 Oct 2022 12:00:29 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: rt5682: Add AVDD, MICVDD and VBAT
 supplies
Message-ID: <20221024160029.cfpyp2cptwig27jd@notapiano>
References: <20221021190908.1502026-1-nfraprado@collabora.com>
 <20221021190908.1502026-4-nfraprado@collabora.com>
 <f7007c75-9c99-902d-170f-383b7347922c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7007c75-9c99-902d-170f-383b7347922c@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
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

On Sat, Oct 22, 2022 at 12:41:01PM -0400, Krzysztof Kozlowski wrote:
> On 21/10/2022 15:09, Nícolas F. R. A. Prado wrote:
> > The rt5682 codec can have three supplies: AVDD, MICVDD and VBAT. Add
> > properties for them.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> > 
> >  Documentation/devicetree/bindings/sound/rt5682.txt | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/rt5682.txt b/Documentation/devicetree/bindings/sound/rt5682.txt
> > index c5f2b8febcee..5ccf4eaf12a9 100644
> > --- a/Documentation/devicetree/bindings/sound/rt5682.txt
> > +++ b/Documentation/devicetree/bindings/sound/rt5682.txt
> > @@ -48,6 +48,12 @@ Optional properties:
> >  
> >  - #sound-dai-cells: Should be set to '<0>'.
> >  
> > +- AVDD-supply: phandle to the regulator supplying AVDD
> > +
> > +- MICVDD-supply: phandle to the regulator supplying MICVDD
> > +
> > +- VBAT-supply: phandle to the regulator supplying VBAT
> 
> Lowercase.

Actually looks like there's already a DT using these properties before the
binding was added:

arm64/boot/dts/qcom/sc7180-trogdor.dtsi

In this case should we keep them uppercase for compatibility or carry on with
the name changes and also update the DT? (the driver also uses uppercase names)


Also noticed that dai-cells should actually be 1. Will fix in next version.

Thanks,
Nícolas
