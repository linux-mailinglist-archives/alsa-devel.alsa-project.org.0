Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E1728E75B
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 21:33:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4C6E1761;
	Wed, 14 Oct 2020 21:32:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4C6E1761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602703997;
	bh=VQXCsSv8gMlOEdEEH15CpccKRodAk5kMGIrl+q/P3Is=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qVpJt4Q7g6RogTTdKBes4cjBqVBVGkSwj/Uyq3IJGKn98UPkClN2WMyu4y1hnGrrz
	 7Z4OQlCo53Kry+H8+V+hx9Mk94cQNi51pzHGUXrrAdBnH4qR1zy/BbNTp6jzHlVbdb
	 IwWoY+ANY8Z08jdBRtMLMxE6QpLBJ3ISvN2eFw7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3666F80260;
	Wed, 14 Oct 2020 21:31:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22B8DF80226; Wed, 14 Oct 2020 21:31:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64515F8021D
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 21:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64515F8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OvbMrESf"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 347392222C;
 Wed, 14 Oct 2020 19:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602703885;
 bh=VQXCsSv8gMlOEdEEH15CpccKRodAk5kMGIrl+q/P3Is=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=OvbMrESfPN3cZrZmFmvmHv/tiahNVNBjk1x0ensS6VOd9a1RjopwLQOG6oxp+SF1p
 q7ppAOCiAmvgyccSOO7awAdL15Y75bCiR2DyAmFt4+NEpPelW7T/6fAV963WV7mMxT
 yKgKn3uZ0t/mbpsRUp759CYDRY/GF29yXQiovjq0=
Date: Wed, 14 Oct 2020 20:31:19 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20201012095005.29859-1-cezary.rojewski@intel.com>
References: <20201012095005.29859-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: Intel: atom: Remove duplicate kconfigs
Message-Id: <160270387382.42239.17410937829732174223.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, vkoul@kernel.org, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, tiwai@suse.com
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

On Mon, 12 Oct 2020 11:50:05 +0200, Cezary Rojewski wrote:
> SND_SST_IPC and its _PCI and _ACPI variants all target
> sound/soc/intel/atom solution alone. SND_SST_IPC is the core component,
> required for PCI and ACPI based atom platforms both. _PCI and _ACPI
> target Merrifield/Edison and Baytrial/Cherrytrail platforms
> respectively.
> 
> On top of that, there is an equivalent set of configs targeting the same
> solution:
> - SND_SST_ATOM_HIFI2_PLATFORM (core)
> - SND_SST_ATOM_HIFI2_PLATFORM_PCI
> - SND_SST_ATOM_HIFI2_PLATFORM_ACPI
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: atom: Remove duplicate kconfigs
      commit: 1849a3872f035494639201fdefb394425233647b

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
