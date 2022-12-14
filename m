Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F63564CB68
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 14:34:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 385562A52;
	Wed, 14 Dec 2022 14:33:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 385562A52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671024844;
	bh=ZVmx5Rff4Vm5MIo621M/fPY+vW9rWQEpruPjysJg/r0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=K2e7a99F5PW2slOE4cEeIifMnmAh3mlIPtgyb2Bgq/b0AOdRH1dmTJCX3jX4jc6bg
	 0ycwndJap4ZD67DH2QiA/w7AvZXViwYyPJn1ssTCoMmpF4IFTqUJdk5CYf1/Mm5ncK
	 GWmG1FBpwvcFRfyPOZGjJH/AQ+P5Gn8LVzw+lH+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 972EAF80552;
	Wed, 14 Dec 2022 14:32:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97711F8055B; Wed, 14 Dec 2022 14:32:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 210B6F80552
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 14:32:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 210B6F80552
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RIJ8TqrD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DE52CB818B6;
 Wed, 14 Dec 2022 13:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C082C433F1;
 Wed, 14 Dec 2022 13:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671024729;
 bh=ZVmx5Rff4Vm5MIo621M/fPY+vW9rWQEpruPjysJg/r0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RIJ8TqrDbzKoEcGhBRkUncWimFEIVpBfF1UfcRCwU2LjXarjYOWnaUbOIa4Kk+1dR
 1P2p9i13S4NV+gabSXv7y4RAfMFjwV12vBVgM+0DJB7ZbXAWXCkORMGsvhsmZQcY5l
 1ye0HLxqwV7yzDuoaylfYAnAeLqJtqBjoA2AEgMlPQXwsLIv3/AkIXvJsoUu3XQ+og
 6GvmcGJlapxKXNHsTx1sfjqsgf7yg7BlX6rQlrJarHDqDKqyqfwU6vNCQuOBFnymNN
 Uj6OZ5EwPXuIjKwV3dBUQ5Pkj6rGQ5LuOycZ1xDicAfWUhnfZBhjxJLwYpvwCF7PXM
 JSfRzWt+HuHhw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20221212085527.1886168-1-yung-chuan.liao@linux.intel.com>
References: <20221212085527.1886168-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi: update codec addr on 0C11/0C4F
 product
Message-Id: <167102472836.27755.16754783350587988867.b4-ty@kernel.org>
Date: Wed, 14 Dec 2022 13:32:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-7e003
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
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 12 Dec 2022 16:55:27 +0800, Bard Liao wrote:
> The unique ID is determined by the ADR pin level of rt1318.
> ODM changed design, update codec addr to match new design.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi: update codec addr on 0C11/0C4F product
      commit: 0612d748003ce7bcd0d67a8d270900fcdadb1009

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
