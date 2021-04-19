Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F41AE36491D
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 19:36:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 813A91690;
	Mon, 19 Apr 2021 19:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 813A91690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618853812;
	bh=NgWE+Y14oEXjj3XI0/8fQYVwvBIcizawu9p4FXol94g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cfy6p+Mn+00FdGhvI4BKVq12uOTUtNl/TC/EHP3YSKDdw61fsXmmoF/Gp7CYWStgE
	 B266B12R4YfBKGGcwCkQtOkHJlVLslxw9NtEVTbYki1zxBLHcyPe9xVFqBI/JJq6N6
	 g9lKNU7Mi1ZHu10qnTjyaFVvIKJPCq3+UmXvFq2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EDF0F8032D;
	Mon, 19 Apr 2021 19:34:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F5DFF800C5; Mon, 19 Apr 2021 19:34:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74BE7F800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 19:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74BE7F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NMRPC3iO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E93361285;
 Mon, 19 Apr 2021 17:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618853669;
 bh=NgWE+Y14oEXjj3XI0/8fQYVwvBIcizawu9p4FXol94g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NMRPC3iO+Ykb4ZMBmLA7DOsteOVV7Z2pR/G2XO9BBnzrsJDBDDZrvQmNT6/4u7Sdm
 YBv2C4SNSywtkIGVy9eZRMU1CieLgY01pVd40LZJcvtb6XJr8fUk/KYnKkhG+iZVRA
 AE5X7a0IJrPaCGrsdG8GuIzOuW9yYIQRb+WurTsCPO4WZB32zxG73FHTwI9vPwOmew
 wQ3PQum3w6mPTyAVmP0aaQ7WHpF+aNOj8M0PvBtWRmlezvdet7WmY2gwu4df2lK27X
 xJLEDzRV267IRiZSHfxSpTQ1G0L/WN/taI7/rVGLdHw1qyi9fLA/rOPcZcr4TjuFzF
 2hOF9I2cPTcdQ==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/5] ASoC: remove more cppcheck warnings
Date: Mon, 19 Apr 2021 18:33:49 +0100
Message-Id: <161885301896.45150.5472537532582041875.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210416191144.27006-1-pierre-louis.bossart@linux.intel.com>
References: <20210416191144.27006-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>
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

On Fri, 16 Apr 2021 14:11:39 -0500, Pierre-Louis Bossart wrote:
> I missed those warnings in the previous rounds, they are mostly
> trivial and shouldn't change the behavior.
> 
> Pierre-Louis Bossart (5):
>   ASoC: soc-acpi: remove useless initialization
>   ASoC: soc-core: fix signed/unsigned issue
>   ASoC: soc-core: fix always-false condition
>   ASoC: codecs: lpass-rx-macro: remove useless return
>   ASoC: codecs: rt5682: clarify expression
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: soc-acpi: remove useless initialization
      commit: 59ce3233a538fc21c5c59ff38cafd784cbcd6de0
[2/5] ASoC: soc-core: fix signed/unsigned issue
      commit: d3b47a888f0bc66a8590941cfa57ba015b288040
[3/5] ASoC: soc-core: fix always-false condition
      commit: e2290daefef3afa08135a0a65d4f0ce7fe23d5c0
[4/5] ASoC: codecs: lpass-rx-macro: remove useless return
      commit: 36924a12c32021a098fec621fb5ea707a72cd5b5
[5/5] ASoC: codecs: rt5682: clarify expression
      commit: 9726db36ed83670be93d053e05e150308e3ce743

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
