Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4D07F972D
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 02:33:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49CE311C;
	Mon, 27 Nov 2023 02:32:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49CE311C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701048785;
	bh=6gJ+oVXcv85wKK5hi51Aq9ovh5iUlMZEHZqeIkmUNI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CpNIkM2RAItX60+YfYacFDzbxJZ9zZO+wvZo30qV48427myeXq5QImT9ODVyEKRjp
	 1pl5qS2SDjBvVWfu0jvbOrQ4eGInq0TFDLMuFLkSK/mUZRN6ZHIYuABlwVlcxZhXsr
	 USQKjl3k6fig1h+zlEprpf6zFwraIaL7h32ag7bU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 334C4F805B6; Mon, 27 Nov 2023 02:32:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 486CAF805AA;
	Mon, 27 Nov 2023 02:32:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8825F801D5; Mon, 27 Nov 2023 02:30:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B2F9F80104
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 02:28:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B2F9F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G/HQF17Z
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D963060F3C;
	Mon, 27 Nov 2023 01:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C204CC433C8;
	Mon, 27 Nov 2023 01:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701048515;
	bh=6gJ+oVXcv85wKK5hi51Aq9ovh5iUlMZEHZqeIkmUNI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G/HQF17Zj4KnA5g6PmiJnyHdkhHSBuXOvxxS98kW7tkXSdZD/aKW+S3ky91EvRJ8A
	 uBiDW2nDhNJz9iR4TZywGOp+veME0bRvJcxFqbeT17eMRQ3Tcu1lJ16l7G5LdIRx3s
	 JsDV5KuABeTStqngW3znQrCqknzq+QNoOHlkx1jfrf3GBZhj/dJGVT73R3YuUekhoh
	 OQwjTDWdyeAdaKsnYdhZSifpVzwoxwRGYG5I3dlIQ057ilXx255fAD/OmK1UpUFIg7
	 r4BPzgVW7z7v80bHRmKv6QU0PA98iu0CUcaA0FtcNqf3CMU9gsYlBKWLdd/S5ndm9F
	 2kJwiFklfOvug==
Date: Mon, 27 Nov 2023 09:28:29 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 2/3] arm64: dts: imx93: Configure clock rate for audio
 PLL
Message-ID: <20231127012829.GC87953@dragon>
References: <20231122101959.30264-1-chancel.liu@nxp.com>
 <20231122101959.30264-3-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122101959.30264-3-chancel.liu@nxp.com>
Message-ID-Hash: XOIJJY2TQMQ534UXXBNLEQLCTANBMXK3
X-Message-ID-Hash: XOIJJY2TQMQ534UXXBNLEQLCTANBMXK3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XOIJJY2TQMQ534UXXBNLEQLCTANBMXK3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 22, 2023 at 06:19:58PM +0800, Chancel Liu wrote:
> Configure clock rate for audio PLL. There's one audio PLL on i.MX93. It
> is used as parent clock for clocks that are multiple of 8kHz.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Applied, thanks!
