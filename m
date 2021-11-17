Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3DA45509A
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 23:34:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE3EC1910;
	Wed, 17 Nov 2021 23:33:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE3EC1910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637188450;
	bh=82ceyM9vLIZ5d639AKquHRPRlsJyYThu0VLcLZrUCsQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S4c/lE/zetcngsJ/faDCXKFtba/ta87T4Zwjsro3OxU4KcgyeIu7wlxIrsJrdYe53
	 4cuTtoIb8at8wEWVBlqRp7fe8KTibLMylMUY2Zx5tmjaucZJm0XAeh0z3+Jb74HcyB
	 9s4ZkH30sq0VBruk6H0dZykp40uUrf3ER9m/PRaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABA14F804FD;
	Wed, 17 Nov 2021 23:31:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EE33F804ED; Wed, 17 Nov 2021 23:31:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2543CF8016C
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 23:31:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2543CF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J3RSmq8f"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6783F61B51;
 Wed, 17 Nov 2021 22:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637188293;
 bh=82ceyM9vLIZ5d639AKquHRPRlsJyYThu0VLcLZrUCsQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=J3RSmq8f5DtAtBMTpQuFXsUkdjHMe8QUYV+p3x5v+xz796JdL3g8Uv2Nhdw+lwCo6
 C73plujiJiR6fLtvWWbGALyLIZBTrT5w1+nkAiehFjvKxBKKHBuQDRT4NSC+JFO4s8
 A14gNpycG6xF8KXIjYVL36OCwe5J//tayhYUdcNvnpTWFozdzZkIhS/j2N9hXV1RQc
 Vits96ivmEMqmFFtvXAuJdr3crlKtSIezTZFNjebb2eCfjCl/PQwCoxunQRc+qYbly
 iGdOHWMJNN/CtwamBhT+R2pI5n1hLncm7Bf2C9juyZF0lPF89DUK/EPJyzgfgwru5f
 +IB1LYwt8JUQg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20211116163901.45390-1-rf@opensource.cirrus.com>
References: <20211116163901.45390-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/4] ASoC: cs42l42: Remove redundant code
Message-Id: <163718829216.136850.12619030505977686878.b4-ty@kernel.org>
Date: Wed, 17 Nov 2021 22:31:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Tue, 16 Nov 2021 16:38:57 +0000, Richard Fitzgerald wrote:
> - Remove field writes in regmap_update_bits() calls where the code
>   intends that the field value is not changed.
> 
> - Remove unnecessary complexity from reporting jack unplug event
> 
> - Remove a PLL config value member that was introduced in a bugfix
>   but made redundant by a later bugfix.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: cs42l42: Remove redundant writes to DETECT_MODE
      commit: 976001b10fa4441917f216452e70fd8c5aeccd94
[2/4] ASoC: cs42l42: Remove redundant writes to RS_PLUG/RS_UNPLUG masks
      commit: f2dfbaaa5404cadf70213146a5b4b89b647d9092
[3/4] ASoC: cs42l42: Simplify reporting of jack unplug
      commit: 3edde6de090617adea18f2068489086c0d8087e3
[4/4] ASoC: cs42l42: Remove redundant pll_divout member
      commit: bbf0e1d36519a5cd2c08dc1348f997cd5240eb2e

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
