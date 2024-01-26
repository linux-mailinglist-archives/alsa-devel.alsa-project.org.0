Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BF883E411
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 22:38:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04A8F846;
	Fri, 26 Jan 2024 22:38:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04A8F846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706305137;
	bh=Cyr+ohTCDNTF015J2dl9lIrDXnFHUzCsBweKOJFBkuw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OOJ859XIG/ppYt6O7xzzDfiyKbtlVeCKw6Q51RkGXN8n+AmrDG1sXLNQ43hErCQEK
	 Q0Zqi7aCRo02z+c695NPpVpLcU2xQeyDObX6SQkAAx3q3Sh3njoWRY5oUcN0vN7rnl
	 ZlDf4PLN4H5jrL0EG6/B6XzwkVWh+ubzHyFTn0NE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F05EDF80567; Fri, 26 Jan 2024 22:38:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7CE3F80563;
	Fri, 26 Jan 2024 22:38:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D60C1F802BE; Fri, 26 Jan 2024 22:38:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AB31F800C1
	for <alsa-devel@alsa-project.org>; Fri, 26 Jan 2024 22:38:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AB31F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KAPLvw0/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F7F462334;
	Fri, 26 Jan 2024 21:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC00C433C7;
	Fri, 26 Jan 2024 21:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706305088;
	bh=Cyr+ohTCDNTF015J2dl9lIrDXnFHUzCsBweKOJFBkuw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KAPLvw0/vaB0QKZx0Mo4DAoXZh5RzceBvBjcNZ7f0T1o5tZIqA+6+qFPlZi3DkuOg
	 wAj3bFB7Q+GG480+li8sMBk70or/p0ziIjQDlO+DTa7OeTVA2ZJLIUjRUATwQp810m
	 BGyLONVlk4pUz5DZarX/yzwG9KA3Z3gxe7b6MKAoplZx1Rzmd/WwmUtRaKUcJqaXrK
	 pup1pk3Sbt9jrIeE9lhgrh6LzP2DZOYtWok4k86diFPH7Co1pimFGiFQCxSo0sNORv
	 h5gff3Ta3vnKFIpA6omH23Nb9IeZRg2Q1YsT6jrCkV0UJvzwu7c1XI+wlL8mH4o7u/
	 a/Jaj13xIbnlw==
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240124190754.1554899-1-robh@kernel.org>
References: <20240124190754.1554899-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: samsung,tm2: Correct "audio-codec"
 constraints
Message-Id: <170630508611.52716.16893175190780075572.b4-ty@kernel.org>
Date: Fri, 26 Jan 2024 21:38:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: XGSTOIIVAZHPANCAR6XZ4HRKZFTU6FH6
X-Message-ID-Hash: XGSTOIIVAZHPANCAR6XZ4HRKZFTU6FH6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGSTOIIVAZHPANCAR6XZ4HRKZFTU6FH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 24 Jan 2024 13:07:53 -0600, Rob Herring wrote:
> The "audio-codec" constraints define how many entries(2), but not the
> size of each entry. Each entry is a single phandle. Define the size with
> an inner 'items' list.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: samsung,tm2: Correct "audio-codec" constraints
      commit: 36553eb7785da18568de2b8ecafb3d80db1a0d6b

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

