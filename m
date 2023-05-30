Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE79A716C87
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 20:30:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD85120C;
	Tue, 30 May 2023 20:29:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD85120C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685471399;
	bh=EKx6VTVPtif3VopxDUTsogjb7XDS6ckoH87zFUChkRk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mqv7DQFwLzDsiyRV6P9PFnIYTK5ulsTws/gSBFH+RN3qjaCQ91JAQCZAofgywfIX4
	 pMKAx8pP3Q8b841JfCOgIpaGSZR680qzeSNVg0FnQ0dOEhgFLy7V8bjDFJj2NaGWqK
	 T2mp5lkiVyTow/Klqx76dEQhuyGtVP2YYVA6asaE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FD49F804FC; Tue, 30 May 2023 20:29:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1F26F8016B;
	Tue, 30 May 2023 20:29:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4C62F8026A; Tue, 30 May 2023 20:29:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E382EF80149
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 20:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E382EF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gNq/ZsXD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3595616FB;
	Tue, 30 May 2023 18:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07BBCC4339E;
	Tue, 30 May 2023 18:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685471327;
	bh=EKx6VTVPtif3VopxDUTsogjb7XDS6ckoH87zFUChkRk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gNq/ZsXDpV3i7lAAIj9wedxoaIHRiPa8GeMA8KY+BCc+AtgakCixsCrcHU8v2kD2S
	 qjnXa48y6IVO/aLnDPRCGY3kpkEcBd0FFnj/Q3kjZNZ0xk88kLveBEI0YD/Kp1h0pv
	 wqPhDhAOt3KWFaOqSJcfgF8JBgPb8c5uMWp6U3Xrt7eRhVp9yhDenqNBPb0QvBwIpb
	 gyzSzCAYGhIEHZu9lj61HTMaAyZxD1CClcEgLnZnW8fT6ECmvgfC7/PZYbL1KVFZ4v
	 uJkNEAot6nXMpDrNfwQgTKt/eHJTPJdb3HZtlkh3yVLR3bETuF72j3SQtRz5ujEj/a
	 wwctPjUFDTKeA==
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dipen Patel <dipenp@nvidia.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Dilip Kota <eswara.kota@linux.intel.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 timestamp@lists.linux.dev, linux-watchdog@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>,
 Oleksij Rempel <linux@rempel-privat.de>
In-Reply-To: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 0/7] dt-bindings: restrict node name suffixes
Message-Id: <168547131548.1034788.34188090441869561.b4-ty@kernel.org>
Date: Tue, 30 May 2023 19:28:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: YOEKHH65FQUBZSR7AT7PHBNWXST7R4BB
X-Message-ID-Hash: YOEKHH65FQUBZSR7AT7PHBNWXST7R4BB
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOEKHH65FQUBZSR7AT7PHBNWXST7R4BB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 May 2023 16:48:44 +0200, Krzysztof Kozlowski wrote:
> Tree-wide cleanup of DTS node name suffixes "-N", e.g. "pwm-5", so we allow
> only decimal numbers.  In few cases narrow the pattern to also disallow
> multiple suffixes, e.g. "pwm-5-5".
> 
> No dependencies, can be applied by individual subsystems.
> 
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[5/7] spi: dt-bindings: restrict node name suffixes
      commit: c4fb6880edc15866a530c7b8f2698ae65f80cfab

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

