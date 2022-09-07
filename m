Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 293565B0B4A
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 19:16:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7B4B163D;
	Wed,  7 Sep 2022 19:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7B4B163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662570994;
	bh=1NiRoxX2LawnB0nHF/bn/FLKNx4yKqwfUoOzZozJLak=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=spz77iUwDO7NviU1gQKDtwksCludz/p6d/hyRNE21dU7GkWfL6H/vXQ28XpiGukLz
	 wSINMlkzmmW/SoW92MO8dACh/cNlLCVm+ZvQG60N9Tk2MLAiKsAet7z/cioibCNSbD
	 0Ctj9MSPWztGQA4jX+8KsbMxBKWMNpVTn8fgviW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D50BF80423;
	Wed,  7 Sep 2022 19:15:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C4AEF8028D; Wed,  7 Sep 2022 19:15:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27B1CF80118
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 19:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27B1CF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="POTBoVtr"
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C0A7020003;
 Wed,  7 Sep 2022 17:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1662570925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tuNHhg0d7wCXZkWQB2aVNJEW/obWsRINPAZ/CInV8Ek=;
 b=POTBoVtrj3ImsMtFfmWL/bMKfwwXr1NizxFJd5pb/vOiZR9jjG8ArBndIJb0IZ70lj0rf2
 HTKO7fkRwXqfZCv9fzxTGmKVk7avMQNe/ErxQ5/OGneWSDmRd3YM2srqLx3fNJGFQxaFqc
 pekgI6081tOP14+iM8qeMK0I4KvfXB2FiaJA9mMUpw31FfDLDJaKEMtsJmsasyYTFS9j3p
 GPMjfTwmo8Q0sJ3jwWte3RhVBLaDr2c8onzgseLvYV71E8p/OuqiUHkY89JB09SVVFklcS
 s0u5bVCkrLfRc4iqs470lrIUkbHzWFXpYjDsvg570T1yOuQqLajdG6D9ArzMoQ==
Date: Wed, 7 Sep 2022 19:15:21 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/8] Add support for the internal RK3308 audio codec
Message-ID: <20220907191521.1ce081c8@booty>
In-Reply-To: <Yxi7uD6RKeR3uHcF@sirena.org.uk>
References: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
 <Yxi7uD6RKeR3uHcF@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Chris Morgan <macromorgan@hotmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
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

Hello Mark,

thanks for the quick feedback!

On Wed, 7 Sep 2022 16:41:44 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Wed, Sep 07, 2022 at 04:21:16PM +0200, luca.ceresoli@bootlin.com wrote:
> 
> > Luca Ceresoli (8):
> >   ASoC: rockchip: rk3308: add internal audio codec bindings
> >   ASoC: rockchip: rk3308: add audio card bindings
> >   arm64: dts: rockchip: add i2s_8ch_2 and i2s_8ch_3
> >   arm64: dts: rockchip: add the internal audio codec
> >   ASoC: rockchip: i2s-tdm: Fix clk_id usage in .set_sysclk()
> >   ASoC: audio-graph: let dai_link->init be overridable
> >   ASoC: codecs: Add RK3308 internal audio codec driver
> >   ASoC: rockchip: add new RK3308 sound card  
> 
> Please pay attention to the ordering of your serieses when posting:
> generally any bug fixes should come first so that they can be easily
> sent as fixes, and normally DTS updates are at the very end of the
> series rather than mixed in the middle since they go via the platform
> maintainer tree normally rather than with everything else.

Sorry about that. I've reordered the patches in my branch for the next
iteration.

Best regards,
Luca
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
