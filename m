Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F01F5E69FF
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 19:55:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E23481EC;
	Thu, 22 Sep 2022 19:54:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E23481EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663869301;
	bh=6109OhJkTiqvxUueTBXlQDLMPyXWUfUQEj+dE1Zi4MI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=koXkIrrDDyU7UYk82PTKYAQd8E4y3moSz89i0pQJWwkYxnUvuqPrWed6PT/VQkkbm
	 2yYBqUYZWKbsgXF6QtdPSm3A31IRrjpXx1k4Q5KavfV0tpiAaq2DiipFMtVOggTre5
	 j7ZxT5vqDNXLBQBInBeyBfhWJw7H3GyjuM/yvgJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AD23F804AA;
	Thu, 22 Sep 2022 19:54:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65D8AF8027B; Thu, 22 Sep 2022 19:54:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1229DF80107
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 19:53:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1229DF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d66ISQKX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 67118B8398E;
 Thu, 22 Sep 2022 17:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BF7C433C1;
 Thu, 22 Sep 2022 17:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663869233;
 bh=6109OhJkTiqvxUueTBXlQDLMPyXWUfUQEj+dE1Zi4MI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=d66ISQKXQWpZlphqAOBEx58NhbJOtRhrVyeeKfz6iyVBpSjBIBGggjTwKAcIUXMNf
 MT0lsVtXw68cvT5xDE6cPKZ8lw4kvauNQtjAGYmifMuGSGPZXLIi7sBKbFJdVkAuBt
 vKV+syZ/FITxbG/dFxkvh5mlKHV2BEOvzkwJs2BXXmp281U2rdwIigifeTPMD1CyCi
 F96gkQOJ5sdxBfus28fyNAhtcnabuoYFkX+FsWXIUgiEuPVP0ac+W/5eTDD/nPfE1P
 nP6I7Q++g5CK4j971XxDJvN9SAc8JBg7QWdZqN3mVusCfARmJ4cGgUuqrOdmfbshrT
 oF1MUGk6Avx0Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220922095912.27010-1-pierre-louis.bossart@linux.intel.com>
References: <20220922095912.27010-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: es8316: fix register sync error in suspend/resume
 tests
Message-Id: <166386922985.727705.7408315500762781615.b4-ty@kernel.org>
Date: Thu, 22 Sep 2022 18:53:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: FRED OH <fred.oh@linux.intel.com>, tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>, Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

On Thu, 22 Sep 2022 11:59:12 +0200, Pierre-Louis Bossart wrote:
> The SOF CI tests report failures with the following error thrown
> 
> kernel: es8316 i2c-ESSX8336:00: Unable to sync registers 0x0-0x1. -121
> 
> ES8336 only supports I2C read/write one byte a time, so we do need to
> set the .use_single_read and .use_single_write flags to avoid this
> sync issue.
> 
> [...]

Applied to

   broonie/sound.git for-linus

Thanks!

[1/1] ASoC: es8316: fix register sync error in suspend/resume tests
      commit: 6de0b0292b548010b09917e8cdfc337a6dcf67ce

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
