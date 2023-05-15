Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE679702B78
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 13:27:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B8AE826;
	Mon, 15 May 2023 13:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B8AE826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684150058;
	bh=MBqNZwSUWIVyUFPu5xzrWq+IS+ipisPvB7leUbn8x7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HoTA7QUptk38Fh398guyzGSkb2YPZRrPcWo3MVUDoxx/XrsqUi5E/cp/rdqjEmg6z
	 L6c056DnXS5d29i0nmdGPL+vSEQ2Zvz9Dbun6S2LwJ5G2MAD9a92oO4P1Lk7t6Obl4
	 mRmJF/UP/FiSqB13Td/OprxKQ7XnbOGoixQ6cKsE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D17DF8055A; Mon, 15 May 2023 13:26:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 798DEF80553;
	Mon, 15 May 2023 13:26:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E8F2F8055A; Mon, 15 May 2023 13:26:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEB45F8053D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 13:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEB45F8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KFbji4AX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4D8661FB0;
	Mon, 15 May 2023 11:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9818CC433D2;
	Mon, 15 May 2023 11:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684149961;
	bh=MBqNZwSUWIVyUFPu5xzrWq+IS+ipisPvB7leUbn8x7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KFbji4AXA3hGRsqTwofLDZiiIfOsCOOHJjiwkI4H4/iGfs82EgkS5b1Xg0tLaoqh/
	 tJ3DPhdMHBOVrCpMIZdlKFsIAa3H18C9ex5U3yjpI6X83AIpfcyksAvxVywqgfkpoW
	 sVVLV0/2LJ5LaVTgNFNS6P+BrBxDDkogc2PQdFDVzskUrXiXZWJVGFGjU36gn8sAPZ
	 t6feA4rv/otyZkO6Cim+P7ICaZ2Myn68JP356IAppwnzC+OuvMgyGYAQrGzLrvmCRv
	 qE0XMb5fBJz9q9qUd785/TUka+DUI4OPC1H6/LMzHlne0JMH0BQC4YeL5q6bP8g4PM
	 lr8KyMx0+2NpQ==
Date: Mon, 15 May 2023 12:25:54 +0100
From: Lee Jones <lee@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, tglx@linutronix.de, linus.walleij@linaro.org,
	vkoul@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/10] irqchip/cs42l43: Add support for the cs42l43 IRQs
Message-ID: <20230515112554.GA10825@google.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-8-ckeepax@opensource.cirrus.com>
 <86o7mpmvqq.wl-maz@kernel.org>
 <20230512153933.GH68926@ediswmail.ad.cirrus.com>
 <86mt29mt2m.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86mt29mt2m.wl-maz@kernel.org>
Message-ID-Hash: 6OJS2Q2B4XNITUI3ZGQRI7DHOXT5LONI
X-Message-ID-Hash: 6OJS2Q2B4XNITUI3ZGQRI7DHOXT5LONI
X-MailFrom: lee@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6OJS2Q2B4XNITUI3ZGQRI7DHOXT5LONI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 May 2023, Marc Zyngier wrote:

> On Fri, 12 May 2023 16:39:33 +0100,
> Charles Keepax <ckeepax@opensource.cirrus.com> wrote:
> > 
> > On Fri, May 12, 2023 at 04:10:05PM +0100, Marc Zyngier wrote:
> > > On Fri, 12 May 2023 13:28:35 +0100,
> > > Charles Keepax <ckeepax@opensource.cirrus.com> wrote:
> > > > 
> > > > The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
> > > > (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
> > > > for portable applications. It provides a high dynamic range, stereo
> > > > DAC for headphone output, two integrated Class D amplifiers for
> > > > loudspeakers, and two ADCs for wired headset microphone input or
> > > > stereo line input. PDM inputs are provided for digital microphones.
> > > > 
> > > > The IRQ chip provides IRQ functionality both to other parts of the
> > > > cs42l43 device and to external devices that wish to use its IRQs.
> > > 
> > > Sorry, but this isn't much of an interrupt controller driver. A modern
> > > interrupt controller driver is firmware-driven (DT or ACPI, pick your
> > > poison), uses irq domains, and uses the irqchip API.
> > > 
> > 
> > Apologies but I really need a little help clarifying the issues
> > here. I am totally happy to fix things up but might need a couple
> > pointers.
> > 
> > 1) uses the irqchip API / uses irq domains
> > 
> > The driver does use both the irqchip API and domains, what
> > part of the IRQ API are we not using that we should be?
> > 
> > The driver registers an irq domain using
> > irq_domain_create_linear.  It requests its parent IRQ using
> > request_threaded_irq. It passes IRQs onto the devices requesting
> > IRQs from it using handle_nested_irq and irq_find_mapping.
> > 
> > Is the objection here that regmap is making these calls for us,
> > rather than them being hard coded into this driver?
> 
> That's one of the reasons. Look at the existing irqchip drivers: they
> have nothing in common with yours. The regmap irqchip abstraction may
> be convenient for what you are doing, but the result isn't really an
> irqchip driver. It is something that is a small bit of a larger device
> and not an interrupt controller driver on its own. The irqchip
> subsystem is there for "first class" interrupt controllers.

I'm not aware of another subsystem that deals with !IRQChip level IRQ
controllers.  Where do simple or "second class" interrupt controllers
go?

-- 
Lee Jones [李琼斯]
