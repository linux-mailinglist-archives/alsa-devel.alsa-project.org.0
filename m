Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B37D93F4FB3
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 19:40:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 383E3112;
	Mon, 23 Aug 2021 19:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 383E3112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629740435;
	bh=ZNw9GHf8Xb9k6PQIfmJTZrNrqMnGGK2uPHf1PTpMid0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dHeX5cCAs8F2mQiswOKTkMZh0X+Kzf9FzDaEompuPM2ebNYtl44hqUFj88aVnLZb0
	 CTVlB9SNxVCKWEiLOdyqLGJseiK7WoBnI3vw9/lLUnLEel+wt9h1Ww/UCqu6qhvROh
	 izJE2MryuieSRXboVfOXg+QXFgJIJ3BL1Rh0FeGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 423C7F802E3;
	Mon, 23 Aug 2021 19:38:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AAA9F800AE; Mon, 23 Aug 2021 19:38:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AA13F8020C
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 19:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AA13F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fAnQ601z"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1C6F6138B;
 Mon, 23 Aug 2021 17:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629740310;
 bh=ZNw9GHf8Xb9k6PQIfmJTZrNrqMnGGK2uPHf1PTpMid0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fAnQ601z/WgkxQCbGfeTFU6p6ZLgReV4pqyupjRqm/3RK8KmzOjHMB5qJL1bdRKUK
 KMYXPCQkgG79SCrptMRtN0rj3RHuqEcaGf+GNU0/YFmjFvw4MWWajGPiuM+5HZxwDq
 YCLwur5+TQo5PwxQTJha0CYbvJoFN+4ocpvTlyEKFrQuhdE5fZsbC5rcSoOT80u2VH
 9o3Rm4UUcfVQt2QbTgkQAP7TUtgxO/aokj7hfsENQhfiaD405GF3afI9T7IPLqmBJZ
 /+ugrKLg87j++mtmcfdmYiquZBtpbXDAAf/2ZqjFKK7rPYtBydRx56g5xtu+sv6FSH
 CiZpq3UZSCjOQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Mark
 hp_elitepad_1000g2_jack?_check functions static
Date: Mon, 23 Aug 2021 18:37:53 +0100
Message-Id: <162973996481.3102.18076403439747731862.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210823110432.64860-1-hdegoede@redhat.com>
References: <20210823110432.64860-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kernel test robot <lkp@intel.com>
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

On Mon, 23 Aug 2021 13:04:32 +0200, Hans de Goede wrote:
> The byt_rt5640_hp_elitepad_1000g2_jack?_check functions are only
> used inside bytcr_rt5640.c, mark them as static.
> 
> 
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bytcr_rt5640: Mark hp_elitepad_1000g2_jack?_check functions static
      commit: a5ec377133674a0318bfb9342488d5d0ad0e1327

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
