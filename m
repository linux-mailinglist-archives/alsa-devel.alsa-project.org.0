Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE567694E6
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 13:30:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9162832;
	Mon, 31 Jul 2023 13:30:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9162832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690803053;
	bh=PiUwuP1rRuNg85mBm3h0tfnKvyXwPsRiypzl3EEp98o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AGxs1ylrLxWeCiXDJ4QlvfLZcoo24EDe4C+OsRB6QtX8GCO7jnF6hCAff1jPb+tdO
	 JOqcWAoOS2jjFSL5/gvNExvRaXcON/8utAHSmDl+85AAoeX47eZQ3TfD6sn9OYH02g
	 oV+ulGJZNNgtS1mRwzxwjIGmZpql+AdSQuMd5yTU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7184FF80544; Mon, 31 Jul 2023 13:29:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B28FBF80163;
	Mon, 31 Jul 2023 13:29:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84E05F8016D; Mon, 31 Jul 2023 13:29:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E30BAF80153
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 13:29:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E30BAF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hjmk4pdi
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ECCB761062;
	Mon, 31 Jul 2023 11:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7509C433C9;
	Mon, 31 Jul 2023 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690802963;
	bh=PiUwuP1rRuNg85mBm3h0tfnKvyXwPsRiypzl3EEp98o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjmk4pdiB5SU1jrvesiynxonXjfTlZOCjUBhJwE71PMHmLd9+Jwozq2QJtsiZy2ZU
	 +za4efC7uYUkgtzTqQO2BL5PL86cGvAsFvItct/o8uBQAI/Nb1GP2OAapGu+vjkGQb
	 AJoAY/mu4m2E2PsPeEWdt2SCa70V8HhoXFebIcdEIjUKhW+g3tn9GCVtcM2DlD8X6t
	 cAXJDT2kzd4W++ftLKBS1Smbdidi3FuDC1kX6g8qAZFurGcqJ/xAwbZnilLo9F6zqv
	 vrubxRuFuzg9NbHBWLqrAdojW5YeGnjZc4eDj852aQpRWxpStlU+/L3Pnm9WaV+hnN
	 DVryR1qgCrNow==
Date: Mon, 31 Jul 2023 16:59:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/6] soundwire: bus: Allow SoundWire peripherals to
 register IRQ handlers
Message-ID: <ZMebD//fpy5TbYyH@matsya>
References: <20230725102532.2567580-1-ckeepax@opensource.cirrus.com>
 <20230725102532.2567580-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725102532.2567580-2-ckeepax@opensource.cirrus.com>
Message-ID-Hash: QYM6GJLAZPCH4S5S6QABCYGRVVKNXBRM
X-Message-ID-Hash: QYM6GJLAZPCH4S5S6QABCYGRVVKNXBRM
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QYM6GJLAZPCH4S5S6QABCYGRVVKNXBRM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25-07-23, 11:25, Charles Keepax wrote:
> From: Lucas Tanure <tanureal@opensource.cirrus.com>
> 
> Currently the in-band alerts for SoundWire peripherals can only
> be communicated to the driver through the interrupt_callback
> function. This however is slightly inconvient for devices that wish to
> share IRQ handling code between SoundWire and I2C/SPI, the later would
> normally register an IRQ handler with the IRQ subsystem. However there
> is no reason the SoundWire in-band IRQs can not also be communicated
> as an actual IRQ to the driver.
> 
> Add support for SoundWire peripherals to register a normal IRQ handler
> to receive SoundWire in-band alerts, allowing code to be shared across
> control buses. Note that we allow users to use both the
> interrupt_callback and the IRQ handler, this is useful for devices which
> must clear additional chip specific SoundWire registers that are not a
> part of the normal IRQ flow, or the SoundWire specification.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
