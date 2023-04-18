Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E1D6E6960
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 18:24:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5F3910E;
	Tue, 18 Apr 2023 18:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5F3910E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681835045;
	bh=4euNAmgm9FS8d6VwrBA6cQTwZjT2IJjY+8n8hbkSGpE=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xg6uEA+oMFKDaXo7WIC8JpW4ME70quhtG/ih4hZFO8PyvkQvOu1xsmxBBKXo0yhSe
	 d3XQnfvJp8F44dFXcJpl4cQeFem6AAkNfk2waPas3NKoVgoJTJWNagbOL0mfLAVWBv
	 ALzHNmSEmq93X5M+8V3oo7b/AhH7l8iaN2KxLwJA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB314F80553;
	Tue, 18 Apr 2023 18:21:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93F1BF80155; Tue, 18 Apr 2023 18:21:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D3D8F800AC
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 18:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D3D8F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=e0WOScVP
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6237D6151F;
	Tue, 18 Apr 2023 16:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0379C433EF;
	Tue, 18 Apr 2023 16:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681834878;
	bh=4euNAmgm9FS8d6VwrBA6cQTwZjT2IJjY+8n8hbkSGpE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e0WOScVPcE7a0ZNf8vvYDaCDczzgU1XUYxV7eCcuZSE6L02OWa089SDr60QJLIo+a
	 mNU7MB/1IHUXpK52zqG3n7Hv2txlxoOwQXXHS7wI5ZK8qJaxQTn3RtWjwWhPBSy5zN
	 oCgWti4guTp22n9jfTNgC3PQ/opekhb6F6JjGZ+afAsoRWktKLcUwN5NVnyBIY/gqo
	 IoXHgRcUFDl+ErJCMLfHI3Olpxa7HOnTZQiwUQUcjdLUcdXfyOB1vP7MT4i8V14RUM
	 BNU5PxtdqNCDga6WGKtTTCPROeE3/cUPX/dwFSsnACc6r+cY6nRLvuAxJWNtrvyuyW
	 ftHIHXE3DfLWg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, daniel.baluta@gmail.com,
 Saalim Quadri <danascape@gmail.com>
In-Reply-To: <20230417204323.137681-1-danascape@gmail.com>
References: <20230417204323.137681-1-danascape@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: wm8728: Convert to dtschema
Message-Id: <168183487655.87933.6597506413439051128.b4-ty@kernel.org>
Date: Tue, 18 Apr 2023 17:21:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: Q53SXHHYELQORUD6TI2HL5Y5CGQT5OBO
X-Message-ID-Hash: Q53SXHHYELQORUD6TI2HL5Y5CGQT5OBO
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q53SXHHYELQORUD6TI2HL5Y5CGQT5OBO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 17 Apr 2023 20:43:23 +0000, Saalim Quadri wrote:
> Convert the WM8728 audio CODEC bindings to DT schema
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: wm8728: Convert to dtschema
      commit: 3da9d149eb9f51560163bb0c13a245fd0ba74c6e

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

