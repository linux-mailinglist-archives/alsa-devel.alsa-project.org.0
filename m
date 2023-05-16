Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 897F57050B1
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 16:28:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 979C61DC;
	Tue, 16 May 2023 16:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 979C61DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684247275;
	bh=yr6EaQUtUyVjRPCZDNsdX/xYTqOXPgGQCFNn7en4Fg8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PScG7BIa8CjoEXUmETL00wxE9X02gebbqyLNSu9VKvJWGbJ2kUZx1l6wjDx0DreEe
	 Ww54ngLddbKoAutC5adPnO3G923XsmqmKtUF+mm62VeybLJ2FeGGeuLmBdiigTe1zO
	 yU+DLqMIirRd3qF2C+A3iH4cedU4o14a7tLt0KBI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C562F80551; Tue, 16 May 2023 16:26:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A88A6F80551;
	Tue, 16 May 2023 16:26:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BC85F80272; Tue, 16 May 2023 16:26:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00B67F8016D
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 16:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00B67F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TureAuVB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2F98C63ACC;
	Tue, 16 May 2023 14:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED63BC433EF;
	Tue, 16 May 2023 14:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684247161;
	bh=yr6EaQUtUyVjRPCZDNsdX/xYTqOXPgGQCFNn7en4Fg8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TureAuVB3tzgW34rFrXlh/VJ4Bd9oJZk5khZGOx3VmBBgDTs3ukTKsXbmRuODlMEh
	 5fNnGOO5OunHy2h+PEdQG4Ds5PIetne5a5sE4WG8S3RXMTdd+xpih8SkQV028o/r3X
	 SNcJtVF84YDlsdcBgnRvvDpw6kJyPtz9MVcBs4kvBTmkVArdGwXX/npcVS5uRwXWn1
	 gzki2FbpXm8sVoDnrYKdUVuHp9OECEObQRTgT+Vq9506ucQVPKaGkv+rQCpehYHxJi
	 y/bOoTR2kgnI5eaJ9+DkZIFN1KrSucPweNWBhqafPU+5ZfW/OVvwfJv7aE8s2hiBOE
	 s9Y1NI8JlHkZg==
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
In-Reply-To: <20230515065557.614125-1-CTLIN0@nuvoton.com>
References: <20230515065557.614125-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: nau8824: Convert to dtschema
Message-Id: <168424715777.430742.11040319872515006787.b4-ty@kernel.org>
Date: Tue, 16 May 2023 23:25:57 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: FAQZNOAHNPTSMTIZCXEN52XMQTSFSNUS
X-Message-ID-Hash: FAQZNOAHNPTSMTIZCXEN52XMQTSFSNUS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FAQZNOAHNPTSMTIZCXEN52XMQTSFSNUS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 15 May 2023 14:55:58 +0800, David Lin wrote:
> Convert the NAU8824 audio CODEC bindings to DT schema.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: nau8824: Convert to dtschema
      commit: 518a1742f47792b5ea905b6cc4ecb05b77defd88

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

