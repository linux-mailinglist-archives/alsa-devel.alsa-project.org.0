Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20056400470
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 20:00:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E14E18D3;
	Fri,  3 Sep 2021 19:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E14E18D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630692007;
	bh=ErtwNa/frJs0yBr+aZbsmsBfg5pYbwl7hzB9MOn20n0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JGWqxm/4XkZAf9RDPgdAnVoz044yTfDzuUhoNHUjU1LJY1le5IpkL4YhbbqMj7CMq
	 wbl1q9nV+F40Cph120Yn2IuV8+GcKM9pbXMj0m8x+J6L1D6HQDUf+to871ArlI5yj4
	 haTPGXphEwuBhK1WTkPu80dVmeAa0pN3jkmJFSJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D648F80088;
	Fri,  3 Sep 2021 19:58:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FA6CF80254; Fri,  3 Sep 2021 19:58:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dnyon.com (dnyon.com [82.223.165.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAE74F80088
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 19:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAE74F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dnyon.com header.i=@dnyon.com
 header.b="TPS2lJvy"
Received: from dnyon.com (55.red-81-39-194.dynamicip.rima-tde.net
 [81.39.194.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dnyon.com (Postfix) with ESMTPSA id 3159E3FEB7;
 Fri,  3 Sep 2021 17:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dnyon.com; s=mail;
 t=1630691912; bh=ErtwNa/frJs0yBr+aZbsmsBfg5pYbwl7hzB9MOn20n0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TPS2lJvySiAaJLDIxC8jYRFF1OVe9bIBK1DyVVKTC5CK8YNSR/iciif60ega/XNU3
 odwuWx1FCt0IogCzaoLPaBU16oK5TWH3OCHQX0Zp5TE5KCejm9N4kgE+xnU4XIM5LR
 RlcA4Hvr+mv/CTunhAhZYtb1bPHE7Y1gE4BViItrPrNEY5k5/CAc2HyA3p06GsWiLc
 gelO9JLIFYTC956XumJiLlMnEI1rQyPop+7vcVTGtJJU0oXpVYWunrvjwc238LQNpw
 kO1+i2MArSuL4dXTHZE78b9l6LRpIgO57zXBmuBmvO/5cJklKroTA/1J5rF48p712M
 Gyq6cS/42t+Ww==
From: Alejandro Tafalla <atafalla@dnyon.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: sound: max98927: Add reset-gpios
 optional property
Date: Fri, 03 Sep 2021 19:58:13 +0200
Message-ID: <5749833.lOV4Wx5bFT@alexpc>
In-Reply-To: <YTJeMGMAeRjmI5Mu@robh.at.kernel.org>
References: <cover.1630632805.git.atafalla@dnyon.com>
 <102ae6df3b5398e8c66b954ac5e13a9d565fab6f.1630632805.git.atafalla@dnyon.com>
 <YTJeMGMAeRjmI5Mu@robh.at.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>
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

On 3/9/21 19:41 Rob Herring wrote:
> On Fri, 03 Sep 2021 03:49:51 +0200, Alejandro wrote:
> > From: Alejandro Tafalla <atafalla@dnyon.com>
> > 
> > Add the reset-gpios as an optional property because some devices might
> > not need it to work properly.
> > 
> > Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> > ---
> > 
> >  Documentation/devicetree/bindings/sound/max9892x.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
Okay. I was gonna send another version so I'll add it there.

-- 
Alejandro Tafalla


