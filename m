Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8D657E97A
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Jul 2022 00:07:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACB0218E6;
	Sat, 23 Jul 2022 00:06:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACB0218E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658527656;
	bh=dlW2CQz7TWp6qIiSdmuvBHnY6y1qDLdv1Y57CrSoo9s=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W1ie7vf1KGbC3K4js3gg5TXteGBIxJ3MOnnV8OA8MBIdtu8K2FQATgGmYVZ0UbRw1
	 rGfiAaKNYS6arHI2rRu1IgdpU9khV+W5/wvj9fYETQ2ZRPaqbFXo/Cmpwh+rcxABrm
	 pkLiVKeL5T98ASWfZb+qjfbjNgFpKLHsGL9J7KSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 359CBF8053C;
	Sat, 23 Jul 2022 00:05:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D00DF80279; Sat, 23 Jul 2022 00:05:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0CDDF8012A
 for <alsa-devel@alsa-project.org>; Sat, 23 Jul 2022 00:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0CDDF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bq1FJmzv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C041621DB;
 Fri, 22 Jul 2022 22:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5D5C341CB;
 Fri, 22 Jul 2022 22:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658527545;
 bh=dlW2CQz7TWp6qIiSdmuvBHnY6y1qDLdv1Y57CrSoo9s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bq1FJmzvcM+BRuBbyq2synnPToejL8zu+N/RCRfBxAd+K5pUa9xHiD8H4MlwYe8ft
 T4AQfaIjbrNPtDX5NiGxOaMpEngXp++3c+2qGFw1t2Hr48TLYMngEaDEUQQzu0Sod5
 Y9muRh5wrVhBz0h58jId9A+Zf3dgHWtNYUF1VQxWEUTI2aOrpeD6ePkqGq67lCC7GH
 tfqVGAH7bzN10fhIi+XF38BvDvtV1lq91cMnmH4QsGKubSphpb5rOvujFgOzCnelHQ
 qFwpDxSrgFtX6RX7RbDvPRiIol6FVcteY/dVpEdWX9IHPrOnMFg+ehq6RU/i7wtuj+
 g+SbNZa2hqc2Q==
From: Mark Brown <broonie@kernel.org>
To: Ryan.Wanner@microchip.com, lgirdwood@gmail.com, nicolas.ferre@microchip.com,
 claudiu.beznea@microchip.com, 
 robh+dt@kernel.org, alexandre.belloni@bootlin.com,
 krzysztof.kozlowski+dt@linaro.org
In-Reply-To: <20220722152945.2950807-1-Ryan.Wanner@microchip.com>
References: <20220722152945.2950807-1-Ryan.Wanner@microchip.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: atmel-i2s: Convert to json-schema
Message-Id: <165852754322.1234289.5406223462611245285.b4-ty@kernel.org>
Date: Fri, 22 Jul 2022 23:05:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-c7731
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Fri, 22 Jul 2022 08:29:45 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Convert atmel i2s devicetree binding to json-schema.
> Change file name to match json-schema naming.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: atmel-i2s: Convert to json-schema
      commit: 6f78675445ca243229303cd72898c4a2b95a2bc0

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
