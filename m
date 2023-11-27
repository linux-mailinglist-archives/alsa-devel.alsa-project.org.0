Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 810FC7F972C
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 02:32:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A894950;
	Mon, 27 Nov 2023 02:32:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A894950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701048769;
	bh=pMn0ALzR57zJy6WWUl9/MYezMl/SFwEMMySu1BA/Gfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vBYcSG+LCyo4HffFP903COx8dvc2E5e5O1QVaub4Q/mlhWy7bYnp//w5mKa1Lr73U
	 YTHlRc8j1qm/w1QecR+7TGNnqApxa3BhrLQI8MEJxHSgZZZZ5IeJya7+uqDdnXg5s4
	 OuvlwtOp4LVxSGJkZrJGIQcHoTdQKTzMigZHUP+Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45DABF80589; Mon, 27 Nov 2023 02:32:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 130DBF80579;
	Mon, 27 Nov 2023 02:32:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E58DAF801D5; Mon, 27 Nov 2023 02:28:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39AFBF800F5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 02:28:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39AFBF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u4nAgSuQ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 45991CE0907;
	Mon, 27 Nov 2023 01:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0362DC433C8;
	Mon, 27 Nov 2023 01:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701048498;
	bh=pMn0ALzR57zJy6WWUl9/MYezMl/SFwEMMySu1BA/Gfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u4nAgSuQLTaMv2Iln2/7AiGra7MQK3QQBm4kqJ/R0X01Xh+DDrZqLz7m+CpZmfU6Y
	 6715YG45kizVIM94jaJSbJXf+hh9NL1OzJOja3lYsqL4dlQhdHBokV1AR+B4qA1agY
	 L7gEDz64U3bG+nTAQ7yitUpPi+sawZ8vKhdnuqgReEi6g2Gg6SWz0kpnKqG0jiGaQ9
	 6luRLfhyEj+EoPmU5Fx2gEnqV5LJkmCJWfgmpH6qls2Y/2pldPmdFnJrN7Q7ri7bbm
	 wPtfbIUTTROdZZ6TLl3xj2KzraOKUOPpty4j4lL/b/sroSA+hCoGx+2HPFsWHXNbQ2
	 9/DyZFjzTZGtg==
Date: Mon, 27 Nov 2023 09:28:11 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 1/3] arm64: dts: imx93: Add audio device nodes
Message-ID: <20231127012811.GB87953@dragon>
References: <20231122101959.30264-1-chancel.liu@nxp.com>
 <20231122101959.30264-2-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122101959.30264-2-chancel.liu@nxp.com>
Message-ID-Hash: ZTQIZL3NN2DDPE2K5RXTB2RITVORZ6O4
X-Message-ID-Hash: ZTQIZL3NN2DDPE2K5RXTB2RITVORZ6O4
X-MailFrom: shawnguo@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZTQIZL3NN2DDPE2K5RXTB2RITVORZ6O4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 22, 2023 at 06:19:57PM +0800, Chancel Liu wrote:
> Add audio devices nodes including SAI, MICFIL, XCVR and MQS.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Applied, thanks!
