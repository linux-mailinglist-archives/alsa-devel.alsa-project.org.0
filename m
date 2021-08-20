Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AC33F2E43
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Aug 2021 16:41:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7341715E2;
	Fri, 20 Aug 2021 16:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7341715E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629470499;
	bh=F32fCmxVJwHzZwoiAb4BAyJmdbuG0TKtKRRbOrhhKJc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IIzaGQmjPHxV1tvjoOMROFuG54bokbl2MeQyBJACFL8inGfIpurXcvHGsI+0Zmcj2
	 zkFqz7ep7NtXeUMcR1VrU/n9zxfIAa26hbQxPRAfHUbZWIPh9wQB9j60d5kfnGfsFl
	 DQ/3Nk9FD/AUkA8rGQiyGxGEF6sw7VJ1fVZubfiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 373C3F804BC;
	Fri, 20 Aug 2021 16:39:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CD4BF8028D; Fri, 20 Aug 2021 16:39:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96824F80249
 for <alsa-devel@alsa-project.org>; Fri, 20 Aug 2021 16:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96824F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="noy9oCEs"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 850D860F39;
 Fri, 20 Aug 2021 14:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629470381;
 bh=F32fCmxVJwHzZwoiAb4BAyJmdbuG0TKtKRRbOrhhKJc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=noy9oCEsp5wcdpo0GFm0RVPbid720PEICI9jtMEksr3WuBxycdXczJk19RaAyQXRE
 pbAahyn2J72vP8Vwgt4T1t92fXiBY+7WFGltDoDh5fdCJTAHDoD/InPNtpvLfJJBJr
 7ukJxiuMcnqYBEpg0+VpO32EegACr99WFVCiyYZldNQad5epUwec+8L6CeS9PqC6JA
 RBOErwTTaovvyoIEoxwqqczYGnKmk1zjX+K5CTNjCTjQ6WiSOA4jqtHFSuLj6pFfKn
 UXuJwxFhSO/lm/DwCSQoSce462vMgz/wnh2Cxn8zG91t+s8Psxgwt4jojqgja3b7g1
 CsZFFnWtP/fcQ==
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [PATCH v2 0/6] ASoC: Intel/rt5640: Add support for HP Elite Pad
 1000G2 jack-detect
Date: Fri, 20 Aug 2021 15:39:10 +0100
Message-Id: <162947011160.28998.8816188684211303425.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210819190543.784415-1-hdegoede@redhat.com>
References: <20210819190543.784415-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Bard Liao <bard.liao@intel.com>
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

On Thu, 19 Aug 2021 21:05:37 +0200, Hans de Goede wrote:
> Changes in v2:
> - Rebase on asoc/for-next
> - New patch: "ASoC: Intel: bytct_rt5640: Add a separate "Headset Mic 2"
>   DAPM pin for the mic on the 2nd jack"
> - Addressed Pierre-Louis' comments about calling
>   acpi_dev_add_driver_gpios() twice
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: rt5640: Move rt5640_disable_jack_detect() up in the rt5640.c file
      commit: 5caab9f48b96f6998fb23d38a7b57fca91ef1653
[2/6] ASoC: rt5640: Delay requesting IRQ until the machine-drv calls set_jack
      commit: 15d54840ecf6f00061d03180394a0a21ff8ffa48
[3/6] ASoC: rt5640: Add optional hp_det_gpio parameter to rt5640_detect_headset()
      commit: d21213b4503ea66777313e4345e116cc8a5366bf
[4/6] ASoC: rt5640: Add rt5640_set_ovcd_params() helper
      commit: e3f2a6603a982467601e0831d706786ed1ade833
[5/6] ASoC: Intel: bytct_rt5640: Add a separate "Headset Mic 2" DAPM pin for the mic on the 2nd jack
      commit: 0a61bcbba8737fe6d43dc34070ffa84a2f12e990
[6/6] ASoC: Intel: bytcr_rt5640: Add support for HP Elite Pad 1000G2 jack-detect
      commit: 9ba00856686ade106afee2884b5e8ac1e09d137a

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
