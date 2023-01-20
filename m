Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C74F36758F7
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 16:44:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 636033361;
	Fri, 20 Jan 2023 16:43:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 636033361
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674229486;
	bh=3s+a21jOuSUozVrGaavCBkqBzcDsMozFYa/XE/2Un+w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gUtxvOvV+9aiLH5pEK/vMVqsbvPfBrHBJU63PW6Nb+fmhbNg94lftrW90QzecsE/B
	 Nk6boteUXxa8bA44f3tjR2OW25ZIjqDRHAUVfLUARj+Tyg3gH+jHL93FSo/b9HffXQ
	 nuSYSxe9xHsQCvjCDCZ2BrkdNmNbUo8DnN4U8BJg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 006D8F80246;
	Fri, 20 Jan 2023 16:43:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E8F6F8024C; Fri, 20 Jan 2023 16:43:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60258F8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 16:43:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60258F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=A+K4w7Wa
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C20C861F99;
 Fri, 20 Jan 2023 15:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FE5C433D2;
 Fri, 20 Jan 2023 15:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674229421;
 bh=3s+a21jOuSUozVrGaavCBkqBzcDsMozFYa/XE/2Un+w=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=A+K4w7WaLrqkE8kedQFXC+9ojkJFgIrKoGED1GRXp7oI7fD74L0+Gmo6ZbpEPrEqs
 Pzckdy11E6CO6NvmVUi1Ixjk5MfHhcvPJnrb+N+yTG1niQDbmPNQuGM/KqaPkXFOOJ
 6t01oFLhNMQaLWGtvNCoQ6coeMn9pfxxPB2fq159E2A2K7T/qWY8GH3J4a8mPwi9wX
 fOiddFO7PFsQAU02Rcu6ea0b+5VkUcyr6hDJQyef7g4qOZ0175hTH0Ie4g9jDK+w+Y
 fl5SUE6EOA8qFgfgnNX+m6/1bbUYB9953uyC/rFQR4/OVZlICx7PHOMSUEh6Z/3CRT
 INn/dMnHdO4Ww==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230120102125.30653-1-peter.ujfalusi@linux.intel.com>
References: <20230120102125.30653-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: sof-audio: prepare_widgets: Check swidget
 for NULL on sink failure
Message-Id: <167422941865.1350653.16158325897991167721.b4-ty@kernel.org>
Date: Fri, 20 Jan 2023 15:43:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-77e06
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
Cc: alsa-devel@alsa-project.org, error27@gmail.com,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, linux-mm@kvack.org,
 oe-kbuild-all@lists.linux.dev, angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 20 Jan 2023 12:21:25 +0200, Peter Ujfalusi wrote:
> If the swidget is NULL we skip the preparing of the widget and jump to
> handle the sink path of the widget.
> If the prepare fails in this case we would undo the prepare but the swidget
> is NULL (we skipped the prepare for the widget).
> 
> To avoid NULL pointer dereference in this case we must check swidget
> against NULL pointer once again.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-audio: prepare_widgets: Check swidget for NULL on sink failure
      commit: fb4293600cc651cfe4d48ec489f1d175adf6e2f8

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

