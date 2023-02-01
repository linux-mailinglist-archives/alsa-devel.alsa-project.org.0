Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7635C686587
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 12:45:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A273784B;
	Wed,  1 Feb 2023 12:44:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A273784B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675251916;
	bh=J0K9S8yFXiKlvm+y0wcMBTPEZqcD2PGq3EBiajeeAlM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=B9ij5mJy/6rf8q5nlHRxPiB22EY+HN8Md3IJW3+TMFoEv77iOQ55HcT8xwWA6S5it
	 QatBkB7p1+/LBgVms5r8kp7ctWzjn4jIXJbGYg7uxwg2Z1KNuUpzNXvaSi/sTZxEWK
	 GpqeVhUxRnMeT9FWVc+fzqvtQccF2DPgI7qAJaJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4FE5F80246;
	Wed,  1 Feb 2023 12:43:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A518FF80169; Wed,  1 Feb 2023 12:43:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E19F3F80169
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 12:43:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E19F3F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Hrll9uS8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 438C5616B5;
 Wed,  1 Feb 2023 11:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E91C4339B;
 Wed,  1 Feb 2023 11:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675251820;
 bh=J0K9S8yFXiKlvm+y0wcMBTPEZqcD2PGq3EBiajeeAlM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Hrll9uS812177H3TZChP2TRRwrck2UYmWHT02AlTbtkwTCp2TXn1+svofJr78+Vii
 6NBW6HHavvUt+JwkEwclA16GvbH66nYBVofVOEoekwGCs37zh9zOWTugNA+lSxIyGv
 wrl0nPdR+RHxtxa7rNraYXlqU9cVWtr/w5AyUC4oBdWCSdJSoYQoSl9X35mWJl20Qb
 syEtke4Dpa9mw97uceIFkMHDBBHAEmwRNNvWm9SY9Z3LaN6hz0sN4ZzDOP8wljX0zf
 PYsgsPrnjQZ+QSH+Ah760hU6jm4SVYbE8h7m1tZh+kisMJzC4D25FmvmXWfuNwDXz8
 3663/8ShiI7/A==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bkme6vp5.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkme6vp5.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: cs42l42: use helper function
Message-Id: <167525181975.63465.3386268959455951743.b4-ty@kernel.org>
Date: Wed, 01 Feb 2023 11:43:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 01 Feb 2023 01:06:15 +0000, Kuninori Morimoto wrote:
> Current ASoC has many helper function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l42: use helper function
      commit: cbfa85a5c5ab123f4dc99efae1b0182d2f8d956c

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

