Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 770745E7E07
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 17:15:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D988E3E7;
	Fri, 23 Sep 2022 17:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D988E3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663946153;
	bh=TzhTBiel13cK3xX2V64+5BjP7Qotx6HW6Tq/WLMhV4Q=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dqXEBMejK1SiE4oMDaUQcIR0Yiq9oylDakjeTjM8OSVksyxItwU9R1NTOakPijNbM
	 J5kLeacWGRPoGmNodcGf0/dD7OCa6qwnM++mbE3nXti/+wsj17BiRNeDSSWbZqnwby
	 xODS2qxXHOw5NQIodSaeX0jjb8LxQSd9kyCOiSvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3492BF80124;
	Fri, 23 Sep 2022 17:14:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E111BF80269; Fri, 23 Sep 2022 17:14:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC68DF801EC
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 17:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC68DF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="cYpi/4Pi"
Received: (Authenticated sender: gregory.clement@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C71D160007;
 Fri, 23 Sep 2022 15:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1663946087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ob5PFOzdCFY5TAnwDP04gVYnRYdPCIJhW9s//Qw4b6k=;
 b=cYpi/4PiTwtuw/I797QTNFhQ51cU/29JchvcZFKbNsyiZJjXzEqAFmkUn9Ow6xYgDADFPH
 WsgPnhaCB67IWB1mQHJoPiUFd7HVJsx2shvDJ0MUAX5Ak6XWKkaPIvFa1UjTB2C/cVlDE2
 rHr8NblQwkUc26+d0gIZ8Nh7T25s0mdWnHMobHu6sq7d7hPoFjGNiwOXmb8AvVoI/tA/j4
 CfmIC6kQpNNVi//snzKyaFjejjdblF9MYyPA7jO5Nn5KvF1pYetmK7bV6sGqh+nxpVKCwh
 1frZmkuK5Rdm4ldlepQdc8iXm+B8AmWmETm5eZd75WFn2j7NLzDYK5llvtE09A==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Marcin Wojtas
 <mw@semihalf.com>
Subject: Re: [PATCH 0/5] ARM: mvebu: Add audio support for Armada 38x
In-Reply-To: <20220920132648.2008-1-pali@kernel.org>
References: <20220920132648.2008-1-pali@kernel.org>
Date: Fri, 23 Sep 2022 16:14:44 +0100
Message-ID: <87mtaqxguz.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Pali Roh=C3=A1r <pali@kernel.org> writes:

> This patch series add audio support for Armada 38x. It contains commits
> from Marvell linux repository
>
> https://github.com/MarvellEmbeddedProcessors/linux-marvell/commit/a1d7044=
4cb0476a7524273274ca8e6d52ce6f1fe
> https://github.com/MarvellEmbeddedProcessors/linux-marvell/commit/f365c93=
237787c7a64f2617da9425eb01e09e71f
> https://github.com/MarvellEmbeddedProcessors/linux-marvell/commit/b645bfa=
9121214d6456de3df6b8e577f2c01c6b3
> https://github.com/MarvellEmbeddedProcessors/linux-marvell/commit/829c96c=
206f2930e5323064cef57158bd780730d
>
> first two squashed, rebased on top of the current linux master branch
> (at v6.0-rc6) with additional patches which adds S/PDIF support on
> Turris Omnia - A385 board.
>
> Marcin Wojtas (3):
>   ASoC: kirkwood: enable Kirkwood driver for Armada 38x platforms
>   ARM: mvebu: add audio I2S controller to Armada 38x Device Tree
>   ARM: mvebu: add audio support to Armada 385 DB
>
> Pali Roh=C3=A1r (2):
>   ARM: mvebu: Add spdif-pins mpp pins for Armada 38x
>   ARM: dts: turris-omnia: Define S/PDIF audio card
>

Patches 2 to 5 applied on mvebu/dt

The first one has to be applied in sound subsystem.

Thanks,

Gregory


>  .../devicetree/bindings/sound/mvebu-audio.txt |  14 +-
>  arch/arm/boot/dts/armada-385-turris-omnia.dts |  27 ++++
>  arch/arm/boot/dts/armada-388-db.dts           |  69 +++++++++
>  arch/arm/boot/dts/armada-38x.dtsi             |  24 ++++
>  sound/soc/kirkwood/kirkwood-i2s.c             | 136 +++++++++++++++++-
>  sound/soc/kirkwood/kirkwood.h                 |   2 +
>  6 files changed, 269 insertions(+), 3 deletions(-)
>
> --=20
> 2.20.1
>

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
