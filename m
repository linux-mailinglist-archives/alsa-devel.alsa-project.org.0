Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 720F9706BA1
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 16:52:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01560200;
	Wed, 17 May 2023 16:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01560200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684335139;
	bh=Olfg9mZnTWLqAx9RmY3HRQw50RoYRgYNWDShY4kMfSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=shJes5s93Ib0PSlH1Ijrql7oyApMuEzNeQ3VuwLbrHUPGCIUmTrcmMpNQ/TsAoa63
	 +NzJZHllSm+zaRrsB/CSdlPgFiaC+XYDWGBIATfeeImyXQv+eZMxK+6eYi9MUx04Hv
	 q8vN2OcYbELRifH2mGYwtbvoskQMXJTylSndPw74=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E653F80571; Wed, 17 May 2023 16:50:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26074F80557;
	Wed, 17 May 2023 16:50:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A3AFF80272; Wed, 17 May 2023 16:50:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB725F8016D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 16:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB725F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c6bRaEkv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6DF3D64813;
	Wed, 17 May 2023 14:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6ABAC4339C;
	Wed, 17 May 2023 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684335048;
	bh=Olfg9mZnTWLqAx9RmY3HRQw50RoYRgYNWDShY4kMfSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=c6bRaEkvwJEEKkgkZtUueJG/jIJU2n8UYA6tHXaXSbLK2mR38uPCLL/DpP0ShYnba
	 73DghKlY/OzDuSmcrzAXc3a/p0LpfhkWfU7z5EOJYoKLZn/vZAdiCRBstLMrkd+bw2
	 5PrLbw3+9EPzEGuxbRXWnMYj14lSuQabaP9TAcWaLNem3zblnmeIHBGiLvTgNetQ5o
	 9lN8yxRqRPpA9EtMmyKQVHGcZvt24fpO2iFMEFm/L6byP8xY/+qW2OsJ6sXMPiYVLk
	 /sHIJSJNF/dlc3KUMCfunlnI4V9CRYfLVc74n+r3cYbbydnh66ETMYPUYqIfhd34vC
	 YVs/x0DUa8Amg==
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
In-Reply-To: <20230516054944.1081808-1-CTLIN0@nuvoton.com>
References: <20230516054944.1081808-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH] ASoC: dt-bindings: nau8315: Convert to dtschema
Message-Id: <168433504550.453649.7898584089373655080.b4-ty@kernel.org>
Date: Wed, 17 May 2023 23:50:45 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: HTSEHHVKN4ODURTL4IJUOHWYDZRMYCBU
X-Message-ID-Hash: HTSEHHVKN4ODURTL4IJUOHWYDZRMYCBU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HTSEHHVKN4ODURTL4IJUOHWYDZRMYCBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 16 May 2023 13:49:45 +0800, David Lin wrote:
> Convert the NAU8315 audio CODEC bindings to DT schema.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: nau8315: Convert to dtschema
      commit: 268777caf0dd8d3c852cccb949ae73b7ea7b2f5e

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

