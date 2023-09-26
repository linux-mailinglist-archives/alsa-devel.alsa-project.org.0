Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6860A7AE781
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 10:09:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0B04DEB;
	Tue, 26 Sep 2023 10:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0B04DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695715793;
	bh=UjHcxElqJT2Xn40h70QVPAzMGgQiQRJNiS+9s0Gk/2Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hea/AyOoPEW3xz4yP2nDsk8dAI2OFl3pN9EZ4pbcuMlOJNfi08p7iiSR73Z8wHYa+
	 z8Q4ztQz927GWBNOwZ3YmfCumLzFvaLUDn9vUfVrQHU5LnLw5sLPNmTTfYsgreBssk
	 LE6huc7rLvFZZziiT0wL653sZR+z0fEVNsiXDZ1E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC5A9F8055C; Tue, 26 Sep 2023 10:08:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63748F8055C;
	Tue, 26 Sep 2023 10:08:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CD12F801D5; Tue, 26 Sep 2023 10:08:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB35DF8001D
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 10:08:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB35DF8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Tbfzb396
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 581B261326;
	Tue, 26 Sep 2023 08:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12C4C433C8;
	Tue, 26 Sep 2023 08:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695715702;
	bh=UjHcxElqJT2Xn40h70QVPAzMGgQiQRJNiS+9s0Gk/2Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Tbfzb396Id5RYpSZusFkKdTiL9aPVNcGgS0A0dsHmqnoeaLC1HtiE+jwMZNzXUs9H
	 uuRoqOoSaznBmPFFknL2+Obbdu3r2S8RdSLvjueky9tM0+prY6DIqOuHyWNXvEVpO1
	 CQZaVkCTpHqMv04Zgn6xY9NV7Ynab9biQhu5D0HL9Bh0bRX9bvuaQ5avK/6cc0Ovfx
	 AYLacydmC1YKFY3nr83v3IQDO1tvJPc/HkP656G6Tm+iwQDWPaMCm1NclDK6AaWwf4
	 Gkk2ejWhkF/NzRyL/ZxjpS8AO1pfdyLbtwFwDqIZiqP7CN7Yn2SjJyCCn1UVy5CYHS
	 c93sy0mgxUI7w==
From: Mark Brown <broonie@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Alex Bee <knaerzche@gmail.com>
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
 Johan Jonker <jbx6244@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
Subject: Re: (subset) [PATCH 00/31] Fix and improve Rockchip RK3128 support
Message-Id: <169571569769.2520438.14041840367987493896.b4-ty@kernel.org>
Date: Tue, 26 Sep 2023 10:08:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: A7OZF2VSCFFUS3TUKMXR27PURMLWIN64
X-Message-ID-Hash: A7OZF2VSCFFUS3TUKMXR27PURMLWIN64
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A7OZF2VSCFFUS3TUKMXR27PURMLWIN64/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 29 Aug 2023 19:16:16 +0200, Alex Bee wrote:
> this series fixes some issues I found when testing my "new" RK3128 board
> with the mainline kernel and adds some core functionality like SMP bringup,
> usb and networking.
> 
> The propably most distinctive change is the split up of the DTs for the
> different SoCs of this platform: RK3126 and RK3128. Even if I'm not adding
> a RK3126 board in this series: I think this change should be done as early
> as possible in order to avoid issues in future.
> Actually it should have been done like that in the first place.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[03/31] dt-bindings: ASoC: rockchip: Add compatible for RK3128 spdif
        commit: 5c8a033f5674ae62d5aa2ebbdb9980b89380c34f

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

