Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2067A7EEA17
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 00:48:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3D81852;
	Fri, 17 Nov 2023 00:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3D81852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700178512;
	bh=WOHViIxsGHrN/gNE3gzTC77FjzxEiTyE2iTd8xz+Wfo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hDjhu0dYl2JjMq/X5pQn+s7aHc4+CmqzSNYqIlUWk+nSlSJzKK8nc2PDV8lpfyf5E
	 BJyqpUpdrd67fIuV9OPOfbSnR3eMCDCptuIBQNExVUeC7at5J5TqN+DyROaVyuRr8Z
	 pNNo5PSxe8c6HXW0d38lEFVzY+9VMk4MevAT5HAI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65695F80551; Fri, 17 Nov 2023 00:47:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11483F8016E;
	Fri, 17 Nov 2023 00:47:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FF34F801D5; Fri, 17 Nov 2023 00:47:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9AC78F80152
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 00:47:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AC78F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=spwA8m5P
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B8511CE22DD;
	Thu, 16 Nov 2023 23:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A2E2C433C8;
	Thu, 16 Nov 2023 23:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700178448;
	bh=WOHViIxsGHrN/gNE3gzTC77FjzxEiTyE2iTd8xz+Wfo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=spwA8m5Pr1mTw2K20qPXTga4zIBXC9OJ1X5QWrXnqNs2gzaXFKXrU/H+7kfniORsl
	 u2IE2F3hl2dfiq64dm6BPyEZMcaMTwKlPjq6JXkxQ1MwtXHTEcvo4fn/ZJFMlODiRu
	 efIaSERo1pGEo045uX3+ZG8AM2PDrdX5VUwUP8h6tx+9Oxpc/gDUzhSA7rYpAX7OaJ
	 O+2aY9djpBVlYAsRXWBBgRPxx0R2Z6Jd4pA93kSbw5Y0JjiBAvxcnJIN2ieIpaKSL2
	 4wIipQZdYm+IEPYuH7HFcP/4Gdd0wVbeOBBg7p4OI+PWVtP/ffsVobKBX+DNmX95tG
	 E59PATZh6evLQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20231115213358.33400-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20231115213358.33400-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/Five
 SoC
Message-Id: <170017844517.82995.8563530422140477667.b4-ty@kernel.org>
Date: Thu, 16 Nov 2023 23:47:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 6GY4QLRV6AFSVIVZM573DOJHV4G54C6Y
X-Message-ID-Hash: 6GY4QLRV6AFSVIVZM573DOJHV4G54C6Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6GY4QLRV6AFSVIVZM573DOJHV4G54C6Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 15 Nov 2023 21:33:58 +0000, Prabhakar wrote:
> The SSI block on the RZ/Five SoC is identical to one found on the RZ/G2UL
> SoC. "renesas,r9a07g043-ssi" compatible string will be used on the RZ/Five
> SoC so to make this clear and to keep this file consistent, update the
> comment to include RZ/Five SoC.
> 
> No driver changes are required as generic compatible string
> "renesas,rz-ssi" will be used as a fallback on RZ/Five SoC.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/Five SoC
      commit: 7d562ac331ddc4f798e6185a858bc98c22ee7d1b

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

