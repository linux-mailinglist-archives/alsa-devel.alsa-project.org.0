Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 240FE704A75
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 12:24:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF06310E;
	Tue, 16 May 2023 12:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF06310E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684232688;
	bh=UtT+cu3FXiZJ1Mr9HS235vPUOkZGm2Gs6P2exNmcd6c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gkvh3qsPft+qqbUjS3oXfopiExkaWKUbO3l5wMky/uNI+bYeIMDpY+DuW7cAPBqLT
	 npRVeVTxtjPS+V/ECwOdKcUryvkHp0eFHBuUHW/K7RMJqZ/lFKw4FxAE016VfwVdAB
	 viHRiP8yniyuDlEgfWg8ShdHzTSHdnP1F1zD1vBI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99F6EF8025A; Tue, 16 May 2023 12:23:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 343DBF8025A;
	Tue, 16 May 2023 12:23:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87CCDF80272; Tue, 16 May 2023 12:23:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFF89F80087
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 12:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFF89F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aPbQcE8E
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B3DED62579;
	Tue, 16 May 2023 10:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162E0C433D2;
	Tue, 16 May 2023 10:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684232628;
	bh=UtT+cu3FXiZJ1Mr9HS235vPUOkZGm2Gs6P2exNmcd6c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aPbQcE8EkNLk39cKWelvpiORI+He4fat2OkVvsFm2co5WYNhH7vMSSNpjzrogqKOO
	 ZRAt+Wc9A2Nfgz9eXQ2mAkmCZIDZM/nlu0vf+41i6wVoYEI/q97FQB3iC2PU9Icxt/
	 ZSVIxcVNg74VX+z6zz8J94cLnW3vHqrOiWRgOwybM237OId/OAcYKTiB6qyQ1bElCN
	 S9nClummfY+xSX6sRhC3iarAus7ejGdYSXgMKzmxfhVKckq73WdxB71Qio+kyuAPKR
	 o4ZY9dU7S/BvSwz89F4vYr3h28+DCCQrGvbbO33Bjchp65k3b9TZRNoLBj3ZSP95xw
	 u12b/S09rOwrw==
Received: from sofa.misterjones.org ([185.219.108.64]
 helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1pyrqL-00FUuf-N5;
	Tue, 16 May 2023 11:23:45 +0100
Date: Tue, 16 May 2023 11:23:45 +0100
Message-ID: <86a5y4mv66.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	tglx@linutronix.de,
	linus.walleij@linaro.org,
	vkoul@kernel.org,
	lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com,
	sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/10] irqchip/cs42l43: Add support for the cs42l43 IRQs
In-Reply-To: <20230516100936.GF10825@google.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
	<20230512122838.243002-8-ckeepax@opensource.cirrus.com>
	<86o7mpmvqq.wl-maz@kernel.org>
	<20230512153933.GH68926@ediswmail.ad.cirrus.com>
	<86mt29mt2m.wl-maz@kernel.org>
	<20230515112554.GA10825@google.com>
	<86h6scmzf7.wl-maz@kernel.org>
	<20230516100936.GF10825@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/28.2
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: lee@kernel.org, ckeepax@opensource.cirrus.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, tglx@linutronix.de, linus.walleij@linaro.org,
 vkoul@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Message-ID-Hash: NUNOHZ7PJEZOAHPRA47FRQGGEYKDMUEB
X-Message-ID-Hash: NUNOHZ7PJEZOAHPRA47FRQGGEYKDMUEB
X-MailFrom: maz@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NUNOHZ7PJEZOAHPRA47FRQGGEYKDMUEB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 16 May 2023 11:09:36 +0100,
Lee Jones <lee@kernel.org> wrote:
> 
> On Tue, 16 May 2023, Marc Zyngier wrote:
> 
> > I'm happy to see an interrupt controller for the GPIOs. But the rest
> > is just internal muck that doesn't really belong here. Where should it
> 
> You should have been a poet! =;-)

Who says I'm not?

	M.

-- 
Without deviation from the norm, progress is not possible.
