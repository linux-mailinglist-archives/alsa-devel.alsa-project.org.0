Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE82049482C
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 08:18:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72D41316D;
	Thu, 20 Jan 2022 08:17:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72D41316D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642663121;
	bh=swuuNiOoGgJBUEQYGiWjhIMC2dkjnsqhYlZe0AHANOo=;
	h=In-Reply-To:References:Subject:From:To:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ikzz6rmWc4+tc4umHqHj9etWJTk29rDGWjAZX21SOCsJvOpP0iLdmTb7JuQmXNy4p
	 HJuJtWuSTNUMJTqkateDq6Z41n5/qHAqRZ/BeLvRD94anAwRMZ6bRVajM7xWhrSzwb
	 YE3NvmYp5fAz9VA+p+MdFtJTmhqoL8xN+iJ8YkFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83ABCF8063C;
	Thu, 20 Jan 2022 08:04:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B03EF801F7; Thu, 20 Jan 2022 00:13:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D15AAF80128
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 00:13:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D15AAF80128
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=kernel.org header.i=@kernel.org header.b="cU1tiOf+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6E06CB81911;
 Wed, 19 Jan 2022 23:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243A6C340E4;
 Wed, 19 Jan 2022 23:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642634022;
 bh=swuuNiOoGgJBUEQYGiWjhIMC2dkjnsqhYlZe0AHANOo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=cU1tiOf+BZz+w8PZnmlU8q0GtNxAwmaF01vGGyE3XwZspIbWMHizXrGd8yZkL4Yrt
 h5DQ/18gPqaCbTu8WDaVSQ0/4NPLmvel2ZHxtkChkb0XoqGT/rftCFwhGrQi32p/c6
 9C7hQe8s/oSynIw0Dtw8ntcseUFiRBP84OfPPW2apdBoXkP3saHm9/jOoQq9Dyckgs
 p+dC5gx4vPD6KBbmxd/O6N28Yk1wMg/qwXFHqbLkYDEQA6WTCbzcx2gfj1bcCweWBg
 I7Noku7d69aO2G4UcEkom0pGa1IbOs65n1J9X5KFZPhBMNFGzQE4zCfs1As73p5oRT
 FyqULwQqZE0Xg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220119015038.2433585-1-robh@kernel.org>
References: <20220119015038.2433585-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
From: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Date: Wed, 19 Jan 2022 15:13:40 -0800
User-Agent: alot/0.10
Message-Id: <20220119231342.243A6C340E4@smtp.kernel.org>
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:03:35 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-usb@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 "Rafael J.Wysocki" <rafael@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-phy@lists.infradead.org,
 netdev@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, linux-riscv@lists.infradead.org,
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Marc Zyngier <maz@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, iommu@lists.linux-foundation.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-@alsa-project.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-pm@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 linux-kernel@vger.kernel.org, wireless@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-crypto@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Viresh Kumar <vireshk@kernel.org>, dmaengine@vger.kernel.org,
 Georgi Djakov <djakov@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S.Miller" <davem@davemloft.net>, Joerg Roedel <joro@8bytes.org>
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

Quoting Rob Herring (2022-01-18 17:50:38)
> The 'phandle-array' type is a bit ambiguous. It can be either just an
> array of phandles or an array of phandles plus args. Many schemas for
> phandle-array properties aren't clear in the schema which case applies
> though the description usually describes it.
>=20
> The array of phandles case boils down to needing:
>=20
> items:
>   maxItems: 1
>=20
> The phandle plus args cases should typically take this form:
>=20
> items:
>   - items:
>       - description: A phandle
>       - description: 1st arg cell
>       - description: 2nd arg cell
>=20
> With this change, some examples need updating so that the bracketing of
> property values matches the schema.
[..]
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
