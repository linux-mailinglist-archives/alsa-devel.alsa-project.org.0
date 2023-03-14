Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A42D96B87A2
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 02:38:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 619BF1450;
	Tue, 14 Mar 2023 02:38:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 619BF1450
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678757933;
	bh=kaYAeX10da0Sz0xHoCN9cJauQS/JO4mb6Wf+gicdZJo=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kwpE/hWOHYTFGnDfuhemJwmZ3XxnwT7tfXLT69ziAKWmPpoCtMU62syuzD4scjIRj
	 bm9yjI9cmup4zPZ2Yk98DD1Qi3yD9loc96t+V+crg5MqCuVs7s6NLK+gD+ldPqUURq
	 vjfuN+suIdFv6L9rs8GVJ5upBP7ukWH+haEr/MwA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF5F3F8032D;
	Tue, 14 Mar 2023 02:38:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8CC0F80423; Tue, 14 Mar 2023 02:37:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 626ABF80093
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 02:37:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 626ABF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QVjVOSWM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 30BC761587;
	Tue, 14 Mar 2023 01:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1190C4339B;
	Tue, 14 Mar 2023 01:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678757869;
	bh=kaYAeX10da0Sz0xHoCN9cJauQS/JO4mb6Wf+gicdZJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QVjVOSWMh+PBT16fPVp4RJ9G9DiYYg6DwbZou4wn3iEiA/sLMyB6pG8U49dmymdn2
	 xUwVUp89GJWZNbdE8xNU+jKUQnn7pluUdw0VO83jAUK28TmqHehiq40UZmaBhaPaNX
	 7rEysvNpiTaLaU6puYNjitJistu52DKFc8Dao7dVDi4YGlAVGRPDZVvZjdZOi6hUkU
	 3RgOfMcpW1PPbxFMUWD+n3Ng2zUk0jgzXtQdn60wbZKKPjWKTuZ1AXS3oVGByDsCcz
	 WwkntzK3shLzilMZKQ2yTMevr5JgGRHuFPHcKBdsKxX4ZPJpVw1BWRgltZWiSe81LM
	 JT3hW28jlBORA==
Date: Tue, 14 Mar 2023 09:37:41 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/3] arm64: dts: imx8mm-nitrogen-r2: fix WM8960 clock name
Message-ID: <20230314013741.GB143566@dragon>
References: <20230217150627.779764-1-krzysztof.kozlowski@linaro.org>
 <20230217150627.779764-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217150627.779764-2-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: 4D6XCRSJQCWQT7H6IHFEOFBV6Z7IWNAJ
X-Message-ID-Hash: 4D6XCRSJQCWQT7H6IHFEOFBV6Z7IWNAJ
X-MailFrom: shawnguo@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 - <patches@opensource.cirrus.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Randy Li <ayaka@soulik.info>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4D6XCRSJQCWQT7H6IHFEOFBV6Z7IWNAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Feb 17, 2023 at 04:06:26PM +0100, Krzysztof Kozlowski wrote:
> The WM8960 Linux driver expects the clock to be named "mclk".  Otherwise
> the clock will be ignored and not prepared/enabled by the driver.
> 
> Fixes: 40ba2eda0a7b ("arm64: dts: imx8mm-nitrogen-r2: add audio")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!
