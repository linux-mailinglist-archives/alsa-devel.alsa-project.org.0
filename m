Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD9F7F366D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Nov 2023 19:46:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C5AADF0;
	Tue, 21 Nov 2023 19:46:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C5AADF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700592402;
	bh=EO6luDaoUXzK9d1/iYTv3zcFJV469noLg8l0rjIvJ60=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rVWOIvLf2kPABPhPG9DghK/huhQ3/JLdFJJPbd7UD9RVqcn1OdsRuBvV5YF8/XmkD
	 dueucJLWXsc2p8GOQqcJnFfbSJaxoBlex6E615xvEkX9e5uR8z6z2SRRWeQ72VpMZw
	 6Ti9bdLlzVGGn4VSlLiXiCiuOam/dzw7/nFDPkOI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1274FF80589; Tue, 21 Nov 2023 19:46:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21DC0F80568;
	Tue, 21 Nov 2023 19:46:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23087F802E8; Tue, 21 Nov 2023 19:46:06 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 623A6F80166
	for <alsa-devel@alsa-project.org>; Tue, 21 Nov 2023 19:45:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 623A6F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HSACHcHs
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1DA361AAD;
	Tue, 21 Nov 2023 18:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61DACC433C7;
	Tue, 21 Nov 2023 18:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700592354;
	bh=EO6luDaoUXzK9d1/iYTv3zcFJV469noLg8l0rjIvJ60=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=HSACHcHsqFmT/I15b1ugu5nNPev/5uP+Z7IWJBd4FR7SWsVV8y4+sKfyqB0uxEFlc
	 bfx15Z7Xh3V0+Ck9GMq7pzGksECDUE3tiIpl+/TCsoQaLV3ZBIxyVRKnpv2qaVxiNc
	 dAwa8Gz3b1R8VkdC3Bkcvo5nlaCXsVNfgS5zWjfx9d7splSvkdU/lTJUQb16nVtI+u
	 MlQtuVhbqq03mDxdedDyKVK72cZ1nJnQTlPnn65iAewwP3VaFT70jCQb0/udPPsAtv
	 1d3Ss7ZXVxFSJWXQIe98HTwaUFhcMMpnQOJCoslosDGb51wWmeEkcWzSWZs6sv0VYA
	 zYoDS6q8+ERcA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20231121052512.20235-1-chancel.liu@nxp.com>
References: <20231121052512.20235-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v5 1/2] ASoC: dt-bindings: sound-card-common: List
 sound widgets ignoring system suspend
Message-Id: <170059235006.1901021.2131981423033331673.b4-ty@kernel.org>
Date: Tue, 21 Nov 2023 18:45:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: PTECIMGYI32TJWOGGYQQLJQOM6DWPVFF
X-Message-ID-Hash: PTECIMGYI32TJWOGGYQQLJQOM6DWPVFF
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PTECIMGYI32TJWOGGYQQLJQOM6DWPVFF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 21 Nov 2023 13:25:11 +0800, Chancel Liu wrote:
> Add a property to list audio sound widgets which are marked ignoring
> system suspend. Paths between these endpoints are still active over
> suspend of the main application processor that the current operating
> system is running.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: sound-card-common: List sound widgets ignoring system suspend
      commit: 27c69d7da1084af0b8b3a20ef9ff01e9eda5270c
[2/2] ASoC: imx-rpmsg: Force codec power on in low power audio mode
      commit: 5d9f746ca64c3ebfba3b650dbc4b0de705c83f3b

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

