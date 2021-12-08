Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D7F46D8DB
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 17:49:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6E602425;
	Wed,  8 Dec 2021 17:48:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6E602425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638982158;
	bh=lYb2Kj6m9oPKsI3VCoXbViVJdjy+yJ9GUUp34226s9A=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xs8tTOCtvrLvWSlqqdZRlQrjgxWSnvdQL0OITySIfH7ln1bPgA1wH5JKY8IYoZMcY
	 vlXNALAzI4iZyM73giPcWa7ztgBN8mmjWLZoCveDvZM6SPLFti0jpJ4U7jrY0cCoIj
	 aLRCsfDiZuAZSFKO8Jj6DPSTMKwpJrE74MQ9VtE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12C75F80517;
	Wed,  8 Dec 2021 17:47:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 955DFF80516; Wed,  8 Dec 2021 17:47:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FBB3F8050F
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 17:46:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FBB3F8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lyQ0TtWr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 41B40CE1E7F;
 Wed,  8 Dec 2021 16:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7A1C00446;
 Wed,  8 Dec 2021 16:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638982012;
 bh=lYb2Kj6m9oPKsI3VCoXbViVJdjy+yJ9GUUp34226s9A=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lyQ0TtWr3Bch5OPFRSNjgU3NBEKAx9mMsHEeDKq83qbTkOVzvUSj37k52szqgvclR
 gOvAABYTAWgjJtgaLrBOfLhBghG3xSk3fJiF+oqZJKJR5ujV/z4unltpz5IYx7yA/F
 LjOySUBMfvPKETAuYUl0patPfZX9FMaS+ZvdJBAepjCs+1P/hyfT45d/lwBqj837nR
 aRPGfdv3j30Hgr2W2AhxZfDwje/1zaXJ4sgpcndf/WgooQNzdwxe28JJ+FhD24jUQf
 2ekI3of9BFBWN3lZmIvMA8vON6nP+ka+u8AlOaN5giqpmPTk979eVPrOrxfwDuXNf4
 rjY0tXxvLBgcQ==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20211207192309.43883-1-pierre-louis.bossart@linux.intel.com>
References: <20211207192309.43883-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: AMD: acp-config: fix missing dependency on
 SND_SOC_ACPI
Message-Id: <163898201114.3880815.8479861749914237444.b4-ty@kernel.org>
Date: Wed, 08 Dec 2021 16:46:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, kernel test robot <lkp@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Tue, 7 Dec 2021 13:23:09 -0600, Pierre-Louis Bossart wrote:
> With a custom .config, the following error is thrown:
> 
> ERROR: modpost: "snd_soc_acpi_codec_list"
> [sound/soc/amd/snd-acp-config.ko] undefined!
> 
> Fix by adding a clear dependency on SND_SOC_ACPI
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: AMD: acp-config: fix missing dependency on SND_SOC_ACPI
      commit: d9b994cd7641ad8eda97aa8633f4e2f35d7d0a79

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
