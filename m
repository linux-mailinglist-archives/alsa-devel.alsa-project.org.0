Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CDA958F46
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 22:45:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3BDE82B;
	Tue, 20 Aug 2024 22:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3BDE82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724186732;
	bh=cypaa9U8Ky8ybogEmIi/zzlIjSwLEDGvGkrxvKYEfjg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dJqSBYQuAxam2zuApu2lREvc+qp79HXkU2bxySK1lZSs9W1w48mBIltZlIvpM8HBM
	 a5AwNzkNDNbe8TviFsjHJrGLp/9KaqpbCMj5KlTOIW3V6vGNkbpqi3+4qLv7TsHdu2
	 uO08qFAyg7F5P7UFoqH2/ilYy9zoY4hXvMTN3HgM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A45EFF805B6; Tue, 20 Aug 2024 22:45:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5654BF805A9;
	Tue, 20 Aug 2024 22:45:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9E76F80494; Tue, 20 Aug 2024 22:44:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E553F800F0
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 22:44:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E553F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lMQj1q5t
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0ACD9CE0B8B;
	Tue, 20 Aug 2024 20:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85687C4AF09;
	Tue, 20 Aug 2024 20:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724186681;
	bh=cypaa9U8Ky8ybogEmIi/zzlIjSwLEDGvGkrxvKYEfjg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lMQj1q5txFXPh4sph+vowVK2ND8OMURIeFJv+tWiimwdI5aEpo6U4eZE/rTy7FeOK
	 Q7EI0JxzZnysR/03ISROGcQUXtj3lhJUqX8ntLxS9QOCwRPZ1fOyrMQu1oraAugJhW
	 14PJ9o/3WO5j8PIpGp4S17N4vsojsZLTV3eA3AwlvuCM8U4K2SURDfXJd6yFLaqPoY
	 uWdgt2ubIz5hVe4hBLOloaSYZB+ODEas8h3IR5g3T51ujva8m8e5oVgwYeDH6FYPAM
	 9EIfg7PISmQ6cJd8oNIjksxdA6q/SwPgbgYQFKI02bSWJJE6u/mjrkd6xUZ1H8WMkn
	 ciXKLT2OpbFMw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20240820184604.499017-1-Frank.Li@nxp.com>
References: <20240820184604.499017-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: Convert tpa6130a2.txt to
 yaml
Message-Id: <172418667827.929388.15440064155822460838.b4-ty@kernel.org>
Date: Tue, 20 Aug 2024 21:44:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: SSMPJLYROF3KBI7RJSZYEIFG55INIE4G
X-Message-ID-Hash: SSMPJLYROF3KBI7RJSZYEIFG55INIE4G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SSMPJLYROF3KBI7RJSZYEIFG55INIE4G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 20 Aug 2024 14:46:03 -0400, Frank Li wrote:
> Convert binding doc tpa6130a2.txt to yaml format.
> Additional change:
>   - add ref to dai-common.yaml
>   - add i2c node in example
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/i2c@30a20000/amp@60:
> 	failed to match any schema with compatible: ['ti,tpa6130a2']
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Convert tpa6130a2.txt to yaml
      commit: aaf55d12fb51d7aa64abe51e27acac1d3d1853ec

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

