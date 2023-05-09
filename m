Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 367C56FBF5B
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 08:39:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5486E1125;
	Tue,  9 May 2023 08:38:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5486E1125
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683614373;
	bh=cL/8W1gKYqgUDJCngf9UaX/y9LEB1zjqY7zbcy6iHIc=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NFF2wzlgdAspk6YeYrQ1QjqaHUg5nQZ7bqMFDKX4UvW0wiaWZ36wdaVNkEgC09JAN
	 0XRUz5oM1SobBsKEfKxeOTeSRYpz5J/dUL0cD4mQ5SIZezOVCZkfKspm7NYXrhE/xj
	 7GJKiygv77hSpfYBr1FN4kEN5bOeqWSBIJgRQKck=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94FAFF80217;
	Tue,  9 May 2023 08:38:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B417F8032D; Tue,  9 May 2023 08:38:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04D63F80087
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 08:38:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04D63F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=F911bnui
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3F7E61325;
	Tue,  9 May 2023 06:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1125C433EF;
	Tue,  9 May 2023 06:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683614310;
	bh=cL/8W1gKYqgUDJCngf9UaX/y9LEB1zjqY7zbcy6iHIc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=F911bnui9tZ23j84w581GYOVtuVf+6m5FBu99Bn01JKqA6XwayUAgnpmMFMlwgzSR
	 7e2q7jrD9OVYYlXlRfUOBerFOaWZWOZ19FS5ttR2o3b+MBiPgkW568tuaRullTFk6D
	 xzez7fHibdifUwyBoSOnELLRP6JH2zFuMsm7J2Njdq9kJY7uTHvipDPq9b+Fz6fz0T
	 KsCn1kdfeOEcbD/0KSPwckVq1xtAS9ZZpOYM8haMfU8HI2k0UIWCBN3Bj78pULCo8S
	 IiRAJ1wWLX3DTR2r/sMW5wrkdb501s63OALduJUHOYFO1GOpUTvKwwypnR5h+bNZZZ
	 Hn6pRzuSMHdWA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 Anup Sharma <anupnewsmail@gmail.com>
In-Reply-To: <ZE9rK6mktPByvRRz@yoga>
References: <ZE9rK6mktPByvRRz@yoga>
Subject: Re: [PATCH] ASoC: dt-bindings: nau8540: Convert to dtschema
Message-Id: <168361430649.303059.2161758713822951358.b4-ty@kernel.org>
Date: Tue, 09 May 2023 15:38:26 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: LU7UTX3H6BCCBGSWYDP3DPJ2D4RO7OF6
X-Message-ID-Hash: LU7UTX3H6BCCBGSWYDP3DPJ2D4RO7OF6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 KCHSU0@nuvoton.com, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LU7UTX3H6BCCBGSWYDP3DPJ2D4RO7OF6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 May 2023 13:02:59 +0530, Anup Sharma wrote:
> Convert the NAU8540 audio CODEC bindings to DT schema
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: nau8540: Convert to dtschema
      commit: 0f0d70c2881f8c28e6d449349e057963a742f842

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

