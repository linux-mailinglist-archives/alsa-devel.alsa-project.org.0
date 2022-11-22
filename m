Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E886633F51
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 15:50:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9AF41662;
	Tue, 22 Nov 2022 15:49:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9AF41662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669128645;
	bh=7I+XfN2BqN+3qSHAiW8cY4CrcfH+M3SNN/fQl1vN61k=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XO44/naTYJaIyUrfQBTP7M15kH75HGoJrq7wtrRQmQgyGvSn/JN5lOZJ9eai+DDyw
	 4eD7edjZUh1rT9WwP1M7Xf2o7lfqXrz5opkYpWyAZrYMi26WxHFAnxx/OEEXkPfQkq
	 dYbQMGpr9xvWGBQ4SwYgNQyp+RJKUouKGwF/t1Qg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36A1AF804FC;
	Tue, 22 Nov 2022 15:49:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B60EF80310; Tue, 22 Nov 2022 15:49:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96549F80272
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 15:49:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96549F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CMjqpk3e"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2032C61741;
 Tue, 22 Nov 2022 14:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AE9C433C1;
 Tue, 22 Nov 2022 14:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669128558;
 bh=7I+XfN2BqN+3qSHAiW8cY4CrcfH+M3SNN/fQl1vN61k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CMjqpk3ef/QIwZaxZgvdWruI4meOabC/g7djRMmOD82kBGPnkFxrADW2GYm9CG1dr
 JWXMms2kZIDFiChyXTnjI1PI/cBfosJDt2aZs5YJcLSen7oRiSh9+hU3lDQ354v8lk
 2vfak8JvjicSQPhJ5Tdp6mH9TXCQdpl57zog82ESLfRkcT6KYE5hLpxcjgBhbR9C5i
 PY+9gZ0PQIN4PJ+2hjIXnXu12+DEH+L+ePm20okL+0PiuCgOEpAFUVN4TSxX3Qk2wI
 muzXFjyM+NO+sNkFle0YTZ22x/oX8BZVjlEktQ4paayGQS9dcRSZ/64hr6+lLccd4p
 Drgo83FbannYQ==
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
In-Reply-To: <20221122073855.43024-1-CTLIN0@nuvoton.com>
References: <20221122073855.43024-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH 1/2] ASoC: nau8825: Adjust internal clock during jack
 detection
Message-Id: <166912855672.213382.4904038142642015999.b4-ty@kernel.org>
Date: Tue, 22 Nov 2022 14:49:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com
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

On Tue, 22 Nov 2022 15:38:55 +0800, David Lin wrote:
> This patch is to rasie up internal clock during jack detection.
> The fast clock will accelerate charge and discharge effect.
> So this mechanism will make jack detection more robust.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: nau8825: Adjust internal clock during jack detection
      commit: fa0fb0738e9c412d3c4a9fe655948ac9a87c6274
[2/2] ASoC: nau8825: Add a manually mechanism for detection failure
      commit: 7a37265046618b890adf7d7a1f9f1f5fbae908a7

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
