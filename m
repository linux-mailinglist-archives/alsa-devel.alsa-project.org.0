Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5169B726AA6
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 22:18:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1ED7820;
	Wed,  7 Jun 2023 22:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1ED7820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686169120;
	bh=EnhsOR6kucpdK0EOSLdjc3AK/uSODOaGZXYxak38Ha8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ljAU+VFomPyTULz8/rYnk1f9WSqYCr1z7+JrVrSec5P/QXZya21QZgyBFTkfwyBrF
	 SxYnffps51jkcZB/57PFBVR/koKbgNT9b0B/0TG1/2LV8RpvWCmc2gFlXqniDK9BtO
	 kqubCYk+n45ook6bQ6kUlu8SKBoL6761JltXY7P4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E72B6F80494; Wed,  7 Jun 2023 22:17:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06A69F8016C;
	Wed,  7 Jun 2023 22:17:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C44F9F80290; Wed,  7 Jun 2023 22:17:43 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E7BAF80130
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 22:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E7BAF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WMAbdwrp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C589F6438D;
	Wed,  7 Jun 2023 20:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C655AC4339C;
	Wed,  7 Jun 2023 20:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686169051;
	bh=EnhsOR6kucpdK0EOSLdjc3AK/uSODOaGZXYxak38Ha8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WMAbdwrps7m7m85JIqoJJrvQxmam1frNR+HR81CoNY/zg6lhLodxJnA4TddOTqbjx
	 PZv2skSn8qXfz5a5RFdSrk94Tmb7MGANXF2PYHAk/mvn3vHR+7eEa6zX4/onzQu6Bh
	 HK5apALdrFPKp2Gpbx/aXqQ4OFQiHifP4+uygOhs4BYQmBBQF7AT95aj0ggKNjotkG
	 pIcKWCyybe8qdhW/g8h7UQnAIIS5MjA4xTb6PP9iY505z+cbcwKgZix+s1Ab0qFqTi
	 Wxt4DDCKwPud8Bnr/zow/AUoAj/7ylCYRtLBjdu2ZO4a2v8HrEGN/hu2aMmWHexE/l
	 /acSByfho4/bw==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20230531140912.819373-1-olivier.moysan@foss.st.com>
References: <20230531140912.819373-1-olivier.moysan@foss.st.com>
Subject: Re: (subset) [PATCH 0/3] ASoC: stm32: fix dtbs_check warnings
Message-Id: <168616904749.205102.9240096518191845115.b4-ty@kernel.org>
Date: Wed, 07 Jun 2023 21:17:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: IGOFM4SV4KKBWZQM6H2NINC3RWDPX5RP
X-Message-ID-Hash: IGOFM4SV4KKBWZQM6H2NINC3RWDPX5RP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IGOFM4SV4KKBWZQM6H2NINC3RWDPX5RP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 31 May 2023 16:09:09 +0200, Olivier Moysan wrote:
> Fix dtbs_check warnings in STM32MP15 DK boards Devices Trees for
> STM32 I2S and Cirrus CS42L51 codec.
> 
> - Add OF graph port property in I2S and CS42L51 DT bindings.
>   Fixes warnings:
>   audio-controller@4000b000: Unevaluated properties are not allowed
>   ('port' was unexpected)
>   cs42l51@4a: Unevaluated properties are not allowed
>   ('port' was unexpected)
> - Correct OF graph DAI audio format property for STM32MP15x Dkx I2S node
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: stm32: document audio of graph port for i2s
      commit: 401ec2b8878f34b6baf64fba3e29411c246b785c
[2/3] ASoC: dt-bindings: document audio of graph port for cs42l51
      commit: fe748da7c216528d46adb4c6f4a969346ec3a452

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

