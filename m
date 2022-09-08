Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7260A5B21E7
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 17:21:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20ED416B6;
	Thu,  8 Sep 2022 17:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20ED416B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662650491;
	bh=B/jrAwaqTIVAHH/NRTStFlo4nPktzG4m8t2fU/E3MfM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WkisPP2afJDXqSst4vS1QBtHFKjaFaHhi5ZbNvnp2x5xEjnOpdGAHAkmfn+glT0d1
	 FX2UQhTSAKE7iFWPUTG8JHsSOg/ikdqWtkO9Bl4X2kDzX8+apq1QhuDVPCo40e/6Nd
	 4bI6Gr6FmNOg9tkbnfY+xNqDVw+qSEBGRiLmcLmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88C44F800CB;
	Thu,  8 Sep 2022 17:20:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8476FF80217; Thu,  8 Sep 2022 17:20:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 931AFF8011C
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 17:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 931AFF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="VIWvkQc2"
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 49192E0008;
 Thu,  8 Sep 2022 15:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1662650422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OaycjTCUtVL0XC/TXiHrCS9tTq4CU4MjnzsvbA4dKO4=;
 b=VIWvkQc2rLTZkRlB9Caja28dMM3gG2XlRofkwI6AWfSSz/kNwH9bBu5kYOe2dhlaUX6AUr
 i0zh5Hupq8g2tAOoEIgXWAGNC6fNDVOpBHIsqHe3D+pNeF5DYgLbQjZ3fjb5OZKomKIwzH
 o+LLDo2w8HoVJzR2NgTDT3/s7i2PbSm59OayUUbmD6V5YUkwefuyjr8Y0AVtfNDJ1H52il
 2tao+VNyOicFrt3Ina7RBvn3rx62qM8sFk4gczmzLz8HOqDP6AMKVsnTzIJe+R7GCXTl1V
 ckAUtcllF0oofsFKMSXc1eMv2fvadLHH9kzV26ap8xmDhgcd1YSQwdPb95B4tQ==
Date: Thu, 8 Sep 2022 17:20:16 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/8] ASoC: rockchip: rk3308: add audio card bindings
Message-ID: <20220908172016.6e23df8c@booty>
In-Reply-To: <aeabc681-9416-d25d-693a-30ba99f1796d@linaro.org>
References: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
 <20220907142124.2532620-3-luca.ceresoli@bootlin.com>
 <aeabc681-9416-d25d-693a-30ba99f1796d@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Chris Morgan <macromorgan@hotmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Johan Jonker <jbx6244@gmail.com>,
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

Hello Krzysztof,

thank you for reviewing my patches.

On Thu, 8 Sep 2022 13:49:34 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 07/09/2022 16:21, luca.ceresoli@bootlin.com wrote:
> > From: Luca Ceresoli <luca.ceresoli@bootlin.com>

[...]

> > +properties:
> > +  compatible:
> > +    const: rockchip,rk3308-audio-graph-card  
> 
> Is "graph" part of device name or you just put it there because of other
> schema?

Indeed this comes from the "audio-graph-card" compatible string.

> The compatible should reflect the device name, not some other
> pieces in Linux or in bindings.

Would it be OK to rename it to rockchip,rk3308-audio-card (i.e. drop
the "graph-" infix)?

Fixes for the other comments you made to this and the other patches are
already queued for v2.

Best regards,
Luca
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
