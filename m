Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 558289ABE6A
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2024 08:08:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68F5186E;
	Wed, 23 Oct 2024 08:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68F5186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729663728;
	bh=j4XMlJCKKl/NCp8f3DD3ZgpEl3aj4KSw7rw+sv4iyB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S3aKddEOxzYCRxBKmHLLmeJbEF0WiwGaz+9ZgNfszgZVhLktkqmSde7ahmXb4/a1+
	 H7zztKvlu2iH0spqz85glLhiifXXdUC5IWk6ybNK+qPNi7SCnM4LXmUez9SA7gFMfS
	 YWRfiaqypjlQCcfN4dFo3OjfkEIw1N8VK2McYczo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF753F80588; Wed, 23 Oct 2024 08:08:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E7E1F805AB;
	Wed, 23 Oct 2024 08:08:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5BF1F8016C; Wed, 23 Oct 2024 08:08:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 375DBF8014C
	for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2024 08:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 375DBF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=X82Z5W4g
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9AE665C5609;
	Wed, 23 Oct 2024 06:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29111C4CEC6;
	Wed, 23 Oct 2024 06:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729663695;
	bh=j4XMlJCKKl/NCp8f3DD3ZgpEl3aj4KSw7rw+sv4iyB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X82Z5W4gyo0iAwJOPV2j9Pr7vNlIie3ww7Npft8tTl1O06r02076tsqUUPxILhjpd
	 j4qTPGr2XpszinTEn8nOC2QWiJ1hVJ5IOyYYoa5VOxoMIAJPXrc6NQUeaZ+XC9k4rt
	 aYyGModaYkn6PKKAsg0lTiHEBMGjTwka/l+ggL17d66f8wE9xyR8HagCXjHxvNTvCj
	 KexLmt5m7h8ehk9nIYQGWqOzSWwXHrDEzpdObd374g/uE5nHMCA+2A9GzM22ywY3J7
	 9oznCHM1t8xg898ahtONtwrqq0T0D8Gd0ugZrrDp4dIrlWjgeH5yA6fbuYE4ZwbBX2
	 ttdfRjUa0cVCw==
Date: Wed, 23 Oct 2024 11:38:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: Mesih Kilinc <mesihkilinc@gmail.com>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [RFC PATCH 00/10] Add support for DMA and audio codec of F1C100s
Message-ID: <ZxiSywkxggKboVRF@vaman>
References: <cover.1543782328.git.mesihkilinc@gmail.com>
 <13ab5cec-25e5-4e82-b956-5c154641d7ab@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13ab5cec-25e5-4e82-b956-5c154641d7ab@prolan.hu>
Message-ID-Hash: SBKKNUOQVZDJJMUFW6R6Y7PBLJN7TXYW
X-Message-ID-Hash: SBKKNUOQVZDJJMUFW6R6Y7PBLJN7TXYW
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SBKKNUOQVZDJJMUFW6R6Y7PBLJN7TXYW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23-10-24, 00:52, Csókás Bence wrote:
> Hi,
> I was trying to get audio on the F1C200s, but so far had no luck, and I came
> across this series.
> 
> On 2018. 12. 02. 22:23, Mesih Kilinc wrote:
> > This is RFC patchset for Allwinner suniv F1C100s to support DMA and
> > audio codec.
> > 
> > Allwinner F1C100s has a audio codec that has necessary digital and
> > analog parts. It has r-l headphone output and microphone, line, r-l
> > FM inputs. ADC can capture any inputs and also output channels via mux.
> > Any input channels or DAC samples can feed output channels.
> > 
> > Add support for this audio codec.
> > 
> > F1C100s utilizes DMA channels to send and receive ADC-DAC samples. So
> > DMA support needed. Patch 1~5 adds support for DMA. Suniv F1C100s has
> > very similar DMA to sun4i. But there is some dissimilarities also.
> > Suniv features a DMA reset bit in clock  control unit. It has smaller
> > number of DMA channels. Several registers has different addresses.
> > It's max burst size is 4 instead of 8. Also DMA endpoint numbers are
> > different.
> > 
> > Patch 6 adds DMA max burst option to sun4i-codec.
> > 
> > Patch 7~8 Add support for suniv F1C100s audio codec.
> > 
> > Patch 9 adds audio codec to suniv-f1c100s.dtsi
> > 
> > Patch 10 adds audio codec support to Lichee Pi Nano board.
> > Thanks!
> > 
> > Mesih Kilinc (10):
> >    dma-engine: sun4i: Add a quirk to support different chips
> >    dma-engine: sun4i: Add has_reset option to quirk
> >    dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA
> >    dma-engine: sun4i: Add support for Allwinner suniv F1C100s
> >    ARM: dts: suniv: f1c100s: Add support for DMA
> >    ASoC: sun4i-codec: Add DMA Max Burst field
> >    dt-bindigs: sound: Add Allwinner suniv F1C100s Audio Codec
> >    ASoC: sun4i-codec: Add support for Allwinner suniv F1C100s
> >    ARM: dts: suniv: f1c100s: Add support for Audio Codec
> >    ARM: dts: suniv: f1c100s: Activate Audio Codec for Lichee Pi Nano
> > 
> >   .../devicetree/bindings/dma/sun4i-dma.txt          |   4 +-
> >   .../devicetree/bindings/sound/sun4i-codec.txt      |   5 +
> >   arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts  |   8 +
> >   arch/arm/boot/dts/suniv-f1c100s.dtsi               |  25 ++
> >   drivers/dma/Kconfig                                |   4 +-
> >   drivers/dma/sun4i-dma.c                            | 221 ++++++++++--
> >   sound/soc/sunxi/sun4i-codec.c                      | 371 ++++++++++++++++++++-
> >   7 files changed, 601 insertions(+), 37 deletions(-)
> 
> What's the status of this series? I see that it was not merged, despite
> getting a few ACKs and only a few minor comments. Ripard's comments make me
> believe that the sun4i DMA driver should be able to handle the suniv family
> with minimal adjustments, have those not been added? Or is it that the DMA
> support is ready but the ALSA/ASoC support is missing?

Maybe split the series and post dma and audio parts separately for review

-- 
~Vinod
