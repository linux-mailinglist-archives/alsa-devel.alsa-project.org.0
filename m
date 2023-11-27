Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE087FA0EF
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 14:23:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88778844;
	Mon, 27 Nov 2023 14:22:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88778844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701091384;
	bh=2JKjpQ+5QKANLP+xGmPCkybvq6kf6sMCsdtq+PhVm3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kpjkkn6Wx9l3tooqJSndB+V49BcnOjhRqcnsYNmBOYLoeHVHAKJu66xx1ynelLf6X
	 /qquhWYJNvQIs7YRqnR14peTX0fBRlb/1KdmE1WJ+h21iceD+kIkfzUOnlHomHp4dv
	 zfkTf0wGASdiFoqJtm3Jt8xd4F+SPDDx/Deln1IE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27528F8057D; Mon, 27 Nov 2023 14:22:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67A30F8057A;
	Mon, 27 Nov 2023 14:22:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C67BF8016E; Mon, 27 Nov 2023 14:22:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE895F800F5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 14:22:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE895F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bCbLnI25
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 26FB1CE0EBC;
	Mon, 27 Nov 2023 13:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756C5C433C8;
	Mon, 27 Nov 2023 13:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701091347;
	bh=2JKjpQ+5QKANLP+xGmPCkybvq6kf6sMCsdtq+PhVm3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bCbLnI25DgO/3NhVtGI6COesZn76ioTqblgX0vP1w6UCsafKA1UsKw7/uB3q5Si7E
	 p3Kwxii8gLbZ2pI48nGZ95j7tCxkjRhPDeDT7MIb1pu3byNgX7F9a4EJOuREIhO0KE
	 omLxzqv8kaY+/4fjVKkhTbtcao3YOMTD+yEee7TTDbDD0gN9sSx0tOisOzv+002ZU9
	 NSNR9SnqbE5j0LVkbDbzY9ZBG53CmO/nLruMScsiR115l2tUbzLKTvIGkd4MoZGRKI
	 eyfyZQWOIpSFd+X71z4OeyFouedfd4sC93e34la6eVNuzs3w8/gDNq1j5lW7DL4YbT
	 QcrR/GgjDKUdg==
From: Vinod Koul <vkoul@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Alex Bee <knaerzche@gmail.com>
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
 Johan Jonker <jbx6244@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
Subject: Re: (subset) [PATCH 00/31] Fix and improve Rockchip RK3128 support
Message-Id: <170109134007.42627.12929766893521974712.b4-ty@kernel.org>
Date: Mon, 27 Nov 2023 18:52:20 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Message-ID-Hash: 2RD466JKKX7S67PVD2YDRBSO7T37O24G
X-Message-ID-Hash: 2RD466JKKX7S67PVD2YDRBSO7T37O24G
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2RD466JKKX7S67PVD2YDRBSO7T37O24G/>
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

Applied, thanks!

[08/31] phy: rockchip-inno-usb2: Split ID interrupt phy registers
        commit: 2fda59099462ee700e424ba3ac928d13ad6389a8
[09/31] phy: phy-rockchip-inno-usb2: Add RK3128 support
        commit: 62ff41017e147472b07de6125c3be82ce02a8dd7

Best regards,
-- 
~Vinod


