Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2575080711A
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 14:46:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A13F19F6;
	Wed,  6 Dec 2023 14:45:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A13F19F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701870369;
	bh=OOXRFN1r525T5U/njmTicMNcjvpIFxjy3A/HJdvfhfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DxynRK8kIndpB+g72GdBc6qIlGzzr/9QkkqbMXJpc3V1dl4b3eI88GyPgD3srfexW
	 iF77OJbZTbAjGGBcZc5NeplsrdKajNh99SSEr/HhUimaQsczW2SF27BLLnFVtv80VS
	 QUMac4RvtkiBBxqFRFwuV6F4S97V609b6LU5wVVE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7FC2F800F5; Wed,  6 Dec 2023 14:45:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18EE6F80571;
	Wed,  6 Dec 2023 14:45:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7559EF8024E; Wed,  6 Dec 2023 14:45:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EF4AF800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 14:45:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EF4AF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YMJkqtlg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 59251B81F7D;
	Wed,  6 Dec 2023 13:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4B2C433C8;
	Wed,  6 Dec 2023 13:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701870326;
	bh=OOXRFN1r525T5U/njmTicMNcjvpIFxjy3A/HJdvfhfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YMJkqtlg1H/lfcxRidEk7JS2+6JHsSK8Oaipk5bLara6T7MNPhJC5VKPOjx+SdPno
	 uCWxbS/TJs4f1gWuxZaeIOW5th2aEFpvQW+ZfG1wYPG3+aGkgOk6PL04zy4ogMMzHa
	 Z/8+KlmxPAFiM+m3P77xxqPF/sqPECISOroDNxmuAQcwNidGj8XcM2g8hxB5TxyhI5
	 TiOGQVFmnoACjmtlMexS14HQGlqjYOp3G92DQhq1DYKE/GaNESYN+tO+JaIRg61lrJ
	 Kd7vldTl89+fLxEoXKq9BpOq5YbQu60A3cz+84jEz5gyXwM2Uuvzt0l4cMkDwUW7lo
	 gTVdXRPV9JMBA==
Date: Wed, 6 Dec 2023 13:45:18 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sbinding@opensource.cirrus.com, james.schulman@cirrus.com,
	david.rhodes@cirrus.com, rf@opensource.cirrus.com, perex@perex.cz,
	tiwai@suse.com, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael@walle.cc, linux-mtd@lists.infradead.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, michal.simek@amd.com,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	git@amd.com, amitrkcian2002@gmail.com
Subject: Re: (subset) [PATCH v11 01/10] mfd: tps6594: Use set/get APIs to
 access spi->chip_select
Message-ID: <20231206134518.GE3375667@google.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-2-amit.kumar-mahapatra@amd.com>
 <170142465659.3329910.8527538140063947758.b4-ty@kernel.org>
 <395caa58-a8a0-4c75-85d3-4fa0f6f4a9ba@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <395caa58-a8a0-4c75-85d3-4fa0f6f4a9ba@sirena.org.uk>
Message-ID-Hash: GIEHG2KFFVFRXWHJ42L7KYBEKIJSZKWG
X-Message-ID-Hash: GIEHG2KFFVFRXWHJ42L7KYBEKIJSZKWG
X-MailFrom: lee@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GIEHG2KFFVFRXWHJ42L7KYBEKIJSZKWG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 01 Dec 2023, Mark Brown wrote:

> On Fri, Dec 01, 2023 at 09:57:36AM +0000, Lee Jones wrote:
> > On Sat, 25 Nov 2023 14:51:28 +0530, Amit Kumar Mahapatra wrote:
> > > In preparation for adding multiple CS support for a device, set/get
> > > functions were introduces accessing spi->chip_select in
> > > 'commit 303feb3cc06a ("spi: Add APIs in spi core to set/get
> > > spi->chip_select and spi->cs_gpiod")'.
> > > Replace spi->chip_select with spi_get_chipselect() API.
> 
> > Applied, thanks!
> 
> > [01/10] mfd: tps6594: Use set/get APIs to access spi->chip_select
> >         commit: dd636638446c87c95c5beddcd367d95ac6764c6c
> 
> Is there a signed tag available for this - without this change the
> subsequent SPI changes introduce a build breakage.

Not yet, but I can get around to making one.

-- 
Lee Jones [李琼斯]
