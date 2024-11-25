Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5FF9DFC2C
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 09:41:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB6A4218F;
	Mon,  2 Dec 2024 09:41:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB6A4218F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733128907;
	bh=qwXFiHd5CN6f/s7X+eMBlkD3TFas1Jz69gDTSeCkw0M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e093oGOmHB3BRRJSXYiXdWjji0rtr6RCGWJR5wNg1q/qCvb1/ZeFLV/hIoN5nwbOH
	 GWay4XYz+XzmRx1byvELd83gXAFmRq+SeoyrNpgbSYK7Qx/bUCZcvz3ApY8KQkx5/B
	 LOil7D4y5MiyVMh5xNHt0Vl3sJPdRC39Ej3cvU2I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A213AF805C0; Mon,  2 Dec 2024 09:41:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABF9FF805C0;
	Mon,  2 Dec 2024 09:41:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE385F80496; Mon, 25 Nov 2024 16:40:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1389F80134
	for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2024 16:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1389F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UOlx82X4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5853F5C5B42;
	Mon, 25 Nov 2024 15:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF9CC4CECE;
	Mon, 25 Nov 2024 15:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732549219;
	bh=IsIi8uedJB2d9ynke7rCIfulXuPxooj9TCcL71ClcMc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UOlx82X4RX72arozgLh4e2tPa5MBNgO9Qi33L80gyMCT5HjS3dpmJp3XcrgrLgn3z
	 sLdYwVrnPcuZZK6sYdsz07Uby1Ub0Yq1ymSivQwLuoP+hnYgxZ8ZvLHm2puHpEKFzo
	 Zd4eIt9Z9J4zPlr8vaS8GS+lEpuk3+AxWZSuZJYvVvWw69g8pNKdcnSlqXP0EoarjU
	 DFNpMRE4VMztfKHAdv8F+FMlCsVbwyZF6PpHE2WqVgpqLNqQNCi2NDx69cpoSp4+vl
	 y1l9ocGmPLRxnohePvYVpIx7zPpWzDskSICF3wCmjm0G7d6xyhzlczV4vCrkEMyVYv
	 XCoI3aMIq981w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: <tudor.ambarus@linaro.org>,  <michael@walle.cc>,  <broonie@kernel.org>,
  <pratyush@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <miquel.raynal@bootlin.com>,  <robh@kernel.org>,  <conor+dt@kernel.org>,
  <krzk+dt@kernel.org>,  <venkatesh.abbarapu@amd.com>,
  <linux-spi@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <nicolas.ferre@microchip.com>,
  <alexandre.belloni@bootlin.com>,  <claudiu.beznea@tuxon.dev>,
  <michal.simek@amd.com>,  <linux-arm-kernel@lists.infradead.org>,
  <alsa-devel@alsa-project.org>,  <patches@opensource.cirrus.com>,
  <git@amd.com>,  <amitrkcian2002@gmail.com>,  <beanhuo@micron.com>
Subject: Re: [RFC PATCH 0/2] Add support for stacked and parallel memories
In-Reply-To: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com> (Amit
	Kumar Mahapatra's message of "Sat, 26 Oct 2024 13:23:45 +0530")
References: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com>
Date: Mon, 25 Nov 2024 15:40:15 +0000
Message-ID: <mafs08qt75nkw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: pratyush@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WGE3NVSAPI5VZFQLFAMQGN2QD5M463PH
X-Message-ID-Hash: WGE3NVSAPI5VZFQLFAMQGN2QD5M463PH
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:41:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WGE3NVSAPI5VZFQLFAMQGN2QD5M463PH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Oct 26 2024, Amit Kumar Mahapatra wrote:

Hi Amit,

I've been meaning to look into this proposal for some time now, but one
thing or another kept coming up and I never got around to it. Well, I'll
try to get some of my thoughts out with this reply. I still haven't
looked very deeply into the past discussions, so apologies if I bring up
something that was already discussed.

> Hello Everyone,
>
> Following an email discussion with Miquel regarding the binding changes
> and overall architecture for implementing support for stacked and parallel
> memories, I=E2=80=99m sharing this RFC to initiate a discussion on the pr=
oposed
> updates to current bindings and to finalize the implementation
> architecture.
>
> Before diving into the main topic, here is some background on stacked and
> parallel memories.
>
> The AMD QSPI controller supports two advanced connection modes(Stacked and
> Parallel) which allow the controller to treat two different flashes as one
> storage.
>
> Stacked:
> Flashes share the same SPI bus, but different CS line, controller driver
> asserts the CS of the flash to which it needs to communicate. Stacked mode
> is a software abstraction rather than a controller feature or capability.
> At any given time, the controller communicates with one of the two
> connected flash devices, as determined by the requested address and data
> length. If an operation starts on one flash and ends on the other, the
> core needs to split it into two separate operations and adjust the data
> length accordingly.
>
> Parallel(Multi-CS):
> Both the flashes have their separate SPI bus, CS of both the flashes will
> be asserted/de-asserted at the same time. In this mode data will be split
> across both the flashes by enabling the STRIPE setting in the controller.
> Parallel mode is a controller feature where if the STRIPE bit is set then
> the controller internally handles the data split during data write to the
> flashes and while reading data from the flash the controller internally
> merges data from both the flashes before writing to the controller FIFO.
> If STRIPE is not enabled, then same data will be sent to both the devices.
> In parallel mode both the flashes should be identical.
>
> For more information on the modes please feel free to go through the
> controller flash interface below [1].
>
> Mirochip QSPI controller[2] also supports "Dual Parallel 8-bit IO mode",
> but they call it "Twin Quad Mode".
>
> Initially in [3] [4] [5] Miquel had tried to extend MTD-CONCAT driver to
> support Stacked mode, but the bindings were not accepted. So, the
> MTD-CONCAT approach was dropped and the DT bindings that got accepted
> [6] [7] [8] that describes the two flash devices as being one. SPI core
> changes to support the above bindings were added [9]. While adding the
> support in SPI-NOR  Tudor provided additional feedback, leading to a
> discussion on updating the current stacked and parallel DT bindings.
>
> Proposed Solution:
> The solution has two parts:
>
> 1. Update MTD-CONCAT
>    Update MTD-CONCAT to create virtual concatinated mtd devices as defined
>    in the device tree.

>From a very quick look, it seems mtdconcat should already do most of
what you want with "stacked mode". The tricky bits might be devicetree
design, but from the software perspective, I think mtdconcat makes
perfect sense. You leave all the complexity to the SPI NOR layer since
it already handles them, and just use the higher-level MTD layer to
virtually concatenate devices. Adding a new layer between MTD and SPI
NOR makes little sense because mtdconcat is already that layer. Another
benefit of this would be you can just as easily concatenate any kinds of
flashes you want; they don't have to be the same.

I think this is a much simpler problem to solve compared to parallel
mode. Once you figure out the devicetree stuff, and I think the
mtdconcat changes should be simple and not too controversial. So I think
you should split the parallel and stacked support into two independent
series. This way you make progress without having to wait for
discussions around parallel mode support to settle.

>
> 2. Add a New Layer
>    Add a new layer between the SPI-NOR and MTD layers to support stacked
>    and parallel configurations. This new layer will be part of spi-nor,
>    located in mtd/spi-nor/, can be included/excluded via Kconfig, will be
>    maintained by AMD and will:
>
>    - During probing, store information from all connected flashes in
>      stacked or parallel mode and present them as a single device to the
> 	 MTD layer.

As I mentioned above, I do not think you should do stacked flashes this
way.

>    - Register callbacks and manage MTD device registration within the new
>      layer instead of spi-nor/core.c.
>    - Make minimal changes in spi-nor/core.c, as stacked and parallel
>      handling will be managed by the new layer on top of SPI-NOR.
>    - Handle odd byte count requests from the MTD layer during flash
>      operations in parallel mode.

You'd also probably have to add support in SPI MEM to signal the
controller to use parallel mode. You don't want to use parallel mode all
the time since you'd need to do "normal" operations as well such as
reading/writing status registers, reading flash ID, SFDP, etc. That is
yet another "cost" parallel mode support has -- it adds another thing to
SPI MEM (I'm not saying the cost isn't necessarily worth it -- just
pointing it out).

>From the SPI NOR side, this layer would have to make sure both flashes
get configured with the exact same settings. That would need SPI NOR to
export how it configured a flash, ideally in a stable, well-defined
format. It would also have to ask SPI NOR to construct the SPI MEM ops
for it, and then edit them to set the "parallel mode" bit. Perhaps the
dirmap op templates can come in handy here.

It's hard to say much more without seeing the code. It would be
interesting to see how you can manage to get this layer work without too
much intrusion in the core.

[...]

--=20
Regards,
Pratyush Yadav
