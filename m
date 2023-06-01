Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9C171A2FB
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 17:46:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F976822;
	Thu,  1 Jun 2023 17:45:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F976822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685634382;
	bh=Xzrs4uQvpV2FbJzVvZTm9OPYbe9DmKt40BV1GwUulo8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=STRdivGGhCSVAU4IHd16WAV3rfUjL9FB2vSQ0Pn4t5qaln/dJ+VIigbYpzaGNBfuY
	 ssY9YJogchRFD5bDnUiWimjh6Uq47rEv/R9Nctrf1kUfs0RZFA2wziEmSK8lRcxQ/O
	 iyDRKNuRwYPnWfTffat8fsn4lxa16uw4jahNjxlc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DEC3F80552; Thu,  1 Jun 2023 17:44:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56BDFF80494;
	Thu,  1 Jun 2023 17:44:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13F4FF80199; Thu,  1 Jun 2023 17:44:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61B11F80132
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 17:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61B11F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a8b5RwP/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 00DB1646B1;
	Thu,  1 Jun 2023 15:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6938C4339B;
	Thu,  1 Jun 2023 15:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685634271;
	bh=Xzrs4uQvpV2FbJzVvZTm9OPYbe9DmKt40BV1GwUulo8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a8b5RwP/q2MckI42aUURkKKBNPr1cp0rArsl9eEeIj04CsfD7J1MYS5ghGdweHnOC
	 37WtY0LFF33r66tagsiC/2OmM25chJn+in1U7f2gnXLK0L+MweBs0FHaprQCXrncJx
	 5sHVNeFanq/4CcxnNWotITt/eJc6RSZRTDkWsz6bu1aOrRtvvs6ZvCcoKEwKIdRqGl
	 K6Dann5V9W8hogqZcDjyDKyIPRZce860bTKqmeZAAPx/GY6wlMRTlI0gxL+1ycqiLo
	 5VvPlfOUfWtZiIbkJTgemcyNpT9fC9JDbghU4mX7vXYYY3A5RaGLg7R6thgbw2EQwh
	 DX/4cb7QVf0Zg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Walker Chen <walker.chen@starfivetech.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
In-Reply-To: <20230526145402.450-1-walker.chen@starfivetech.com>
References: <20230526145402.450-1-walker.chen@starfivetech.com>
Subject: Re: (subset) [PATCH v5 0/3] Add TDM audio on StarFive JH7110
Message-Id: <168563426847.132600.7350104738221381081.b4-ty@kernel.org>
Date: Thu, 01 Jun 2023 16:44:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: BZ5INZDGWGZDH2CTKX3O3JP6U2THIYFX
X-Message-ID-Hash: BZ5INZDGWGZDH2CTKX3O3JP6U2THIYFX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BZ5INZDGWGZDH2CTKX3O3JP6U2THIYFX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 26 May 2023 22:53:59 +0800, Walker Chen wrote:
> This patchset adds TDM audio driver for the StarFive JH7110 SoC. The
> first patch adds device tree binding for TDM module. The second patch
> adds tdm driver support for JH7110 SoC. The last patch adds device tree
> node and pins configuration of tdm to JH7110 dts.
> 
> The series has been tested on the VisionFive 2 board by plugging an
> audio expansion board.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: Add TDM controller bindings for StarFive JH7110
      commit: d9afe0d36cc27dcacbcecf02fe803a30d544698c
[2/3] ASoC: starfive: Add JH7110 TDM driver
      commit: fd4762b6b5cfa27bf44f5d624ce74b7dce4a479c

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

