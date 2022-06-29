Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8454F560206
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 16:07:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32E641661;
	Wed, 29 Jun 2022 16:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32E641661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656511652;
	bh=UTir4jvtX/Wc9f3wx5siduKUlp1IwFcyfl2zQub0Q54=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vmc1xwOnQxN9MuLylAL2y+YTBKCvfgfvowhmamt123CGLram1v1FUrOI0IwxUwzWD
	 lXr9WKCe9su0D0agSYgLT+cK+6vRefkqph8Flkfo2rs9OTztdwViM2glnBwAYeXYU1
	 5DKc/ogpMr833TwRqAOdwqcfz3VnfIHFOd4AQd20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15079F804E6;
	Wed, 29 Jun 2022 16:06:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6177AF8027B; Wed, 29 Jun 2022 16:06:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31CFEF80107
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 16:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31CFEF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Dw1yUl6j"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DC265B824A9;
 Wed, 29 Jun 2022 14:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F6FC34114;
 Wed, 29 Jun 2022 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656511551;
 bh=UTir4jvtX/Wc9f3wx5siduKUlp1IwFcyfl2zQub0Q54=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Dw1yUl6jJ7er1GoSbOqDxte5EKisctjZQcPmXUyqaQH1bY7xwW7YnFOeaq4U0mXSp
 G4I02MyNDCl5svJ8CsA9h+q4xVSspolwODPkBvv6QiqTjmAcIkoxPgkE3gfqHs/kt6
 WSHUJe0BTgDxI5Zvhlo/3ht1+i59FPyJmi1vYLZgznseboWsYn47Dt0RuZU6sSTK8j
 zFsA9Kxmiil2q3OQTReiEEclNgQADZkTo5hHJjE/ge6bJJ1Mecto2cBwmFsbxetqvk
 onok6aZT3wRCZHuOHZYOgAmeNkMharNuGXM1s9R/Q03NaQx7C1ca9wU8wj5PM8wgKn
 px5Etqg2jrL7w==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@nxp.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <1655980125-24141-1-git-send-email-shengjiu.wang@nxp.com>
References: <1655980125-24141-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: dt-bindings: fsl,
 micfil: Convert format to json-schema
Message-Id: <165651154969.1437597.15028170773257315286.b4-ty@kernel.org>
Date: Wed, 29 Jun 2022 15:05:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: shengjiu.wang@gmail.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 23 Jun 2022 18:28:45 +0800, Shengjiu Wang wrote:
> Convert the NXP MICFIL binding to DT schema format using json-schema.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: fsl,micfil: Convert format to json-schema
      commit: 02d91fe47100a29a79fcb8798e45c22591ca852d

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
