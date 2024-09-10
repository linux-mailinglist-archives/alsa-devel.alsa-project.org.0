Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A94A9745C8
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 00:20:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81495846;
	Wed, 11 Sep 2024 00:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81495846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726006850;
	bh=48YI4pbgmYlCiPT43kBVwkkPa58PT2DK2GN26WL06Zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S2/yvCoUWDu8GEAUyQOd4PXpVrKG/l3NO2R0dkNQYFgMxJXzt7xSd4vdE/vHCWL37
	 pxbPPDuaonXgFWjE1qbH3kdyHQyBvvrv1pMNo8hxIaEX0aSk/VT4vkFIbnyVe9KM+U
	 o0oX3K5KOKKMHS0Z2UMJG/uwQvm9+TdJNX9Fjamg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDF5EF8059F; Wed, 11 Sep 2024 00:20:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C6E6F805A9;
	Wed, 11 Sep 2024 00:20:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C858EF801F5; Wed, 11 Sep 2024 00:20:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA43FF80107
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 00:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA43FF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bXvC/AMd
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ABD535C054A;
	Tue, 10 Sep 2024 22:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA255C4CEC3;
	Tue, 10 Sep 2024 22:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726006808;
	bh=48YI4pbgmYlCiPT43kBVwkkPa58PT2DK2GN26WL06Zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXvC/AMdALgzeciEYcNb3c7MPlwl1Ldpk8m3EmiuiaLfyLLWLC4BnWS4SIe+MdZa6
	 6mZMlroCrRgIPDG8EyJyzVb39LE+5OAes1gED325p1M9hGm7e8hNTrWk1oAxCuxmy9
	 iEVZo/7+4ouPBj6jySGz6RzsogWcFaGmQrpjVQchYuIJoCEY5cSdDgGO/udItb1/3t
	 MqPWOsC7+j7ZUEm8A9BmF0Es+nKRaVpzowcRgRqJMhsA0rYSK6BUJoTclK4mXQN8iV
	 dPdtSGzTqhto6BkXQMoVkYE3eQs122rcEq6o1b5I1D5+KbbY3Ry5QIsFY3f/9nVqAJ
	 /zH+eyi3rKtdA==
Date: Tue, 10 Sep 2024 17:20:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Li Zetao <lizetao1@huawei.com>, linux-clk@vger.kernel.org,
	dmaengine@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, alsa-devel@alsa-project.org,
	Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Chancel Liu <chancel.liu@nxp.com>,
	Russell King <linux@armlinux.org.uk>, linux-sound@vger.kernel.org,
	Vladimir Zapolskiy <vz@mleia.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>, Arnd Bergmann <arnd@arndb.de>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [Patch v5 02/12] dt-bindings: dma: Add lpc32xx DMA mux binding
Message-ID: <172600677256.860315.3249804427139743181.robh@kernel.org>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
 <20240627150046.258795-3-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627150046.258795-3-piotr.wojtaszczyk@timesys.com>
Message-ID-Hash: EXQXIZKV6T3TFSLYGYBEIT7ZSUTG5XJ3
X-Message-ID-Hash: EXQXIZKV6T3TFSLYGYBEIT7ZSUTG5XJ3
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EXQXIZKV6T3TFSLYGYBEIT7ZSUTG5XJ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 27 Jun 2024 17:00:20 +0200, Piotr Wojtaszczyk wrote:
> LPC32XX SoCs use pl080 dma controller which have few request signals
> multiplexed between peripherals. This binding describes how devices can
> use the multiplexed request signals.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> ---
> Changes for v5:
> - Corrected property order
> - Added maxItems to properties
> - Fixed example
> - Removed "N:: from the MAINTAINERS entry
> - Added Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com> to LPC32XX maintainers
> 
> Changes for v4:
> - This patch is new in v4
> 
>  .../bindings/dma/nxp,lpc3220-dmamux.yaml      | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  9 ++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
> 

Applied, thanks!
