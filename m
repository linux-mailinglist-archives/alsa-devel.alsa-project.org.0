Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3AA74D9F2
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 17:34:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C04CA4B;
	Mon, 10 Jul 2023 17:33:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C04CA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689003253;
	bh=5CM62BWHL8zOH1qrcSFyvnkmKB8XTQfKgi5NKFnPmeg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KlIPaYvYU2yNyg5ISsAJBnp5lc2ssDN3mTWJ+krvelfo+1Em7o3HnCX8LgpGVsgc4
	 4GruCGlThGiJHAe2f25bmZ/sXHeBtFm2BJZ+V98dkSHm8jgV2jBEq3W8EAmIahIz6t
	 eKJ/NUDX1/ROliCtQQ8fZflqLcyqN0vjppFIMtNs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 742D0F8057F; Mon, 10 Jul 2023 17:32:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3928F80578;
	Mon, 10 Jul 2023 17:32:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E01CF80125; Sat,  8 Jul 2023 15:03:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a02:c205:3004:2154::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3CE9F800E4
	for <alsa-devel@alsa-project.org>; Sat,  8 Jul 2023 15:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3CE9F800E4
Received: from p5dc58ef9.dip0.t-ipconnect.de ([93.197.142.249] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1qI7ar-001Dj3-76; Sat, 08 Jul 2023 15:03:21 +0200
Date: Sat, 8 Jul 2023 15:03:19 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Mark Brown <broonie@kernel.org>
Cc: bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 peter.ujfalusi@gmail.com, jarkko.nikula@bitmer.com,
 dmitry.torokhov@gmail.com, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/3] ASoC: tlv320aic3x: use BCLK instead of MCLK if not
 in master mode
Message-ID: <20230708150319.202789c1@aktux>
In-Reply-To: <eeba3297-acdb-45ca-a80d-40d8b3a90231@sirena.org.uk>
References: <20230705190324.355282-1-andreas@kemnade.info>
	<20230705190324.355282-3-andreas@kemnade.info>
	<15d3fc6e-d294-4968-bc7d-66307efc92db@sirena.org.uk>
	<20230705215611.5f96584e@aktux>
	<eeba3297-acdb-45ca-a80d-40d8b3a90231@sirena.org.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MailFrom: andreas@kemnade.info
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: D5C3B2IUDXOEROV2DXEHKLJHKMVL5YXU
X-Message-ID-Hash: D5C3B2IUDXOEROV2DXEHKLJHKMVL5YXU
X-Mailman-Approved-At: Mon, 10 Jul 2023 15:32:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D5C3B2IUDXOEROV2DXEHKLJHKMVL5YXU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Thu, 6 Jul 2023 13:02:36 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Wed, Jul 05, 2023 at 09:56:11PM +0200, Andreas Kemnade wrote:
> > Mark Brown <broonie@kernel.org> wrote:  
> 
> > > It would be nicer to set the clock via the DT bindings, ideally with the
> > > clock bindings...  
> 
> > I found no path from these simple-audio-card things to provide a clk_id 
> > to set_dai_sysclk. I would of course prefer such a thing. Do I have overlooked
> > something?  
> 
> Since we already have clock bindings we should use those to configure
> the clocks, there's several drivers that have added this support already
> - look for clock providers.

ok, looking around:
Just to make sure I am not running in a bad direction: Do you think
tlv320aic32x4{,-clk}.c is a good example? It is ignoring clk_id. 
I was mentally bound to have to use clk_id there, so I did not found a good
solution.

So I guess I have to configure the chip as a master and using mclk and compare
register dumps with the state we have now and the state after the changes,
additionally to check bclk functionality directly.

Regards,
Andreas
