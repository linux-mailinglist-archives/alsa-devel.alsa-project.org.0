Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A5D611746
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 18:15:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E3BE1749;
	Fri, 28 Oct 2022 18:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E3BE1749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666973744;
	bh=hPulKsWfwmPS12vC8SipmsqMezI1Fy/nKCO0cEWbjbw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k0gCaF9TQyha6O9k+jfrdP91X0oKVQD5VpmpTKdGhUi5znqr9EwfbskmRSoG7E8nW
	 M3izrxFX6Q4WyCV1nTv7Q6v5mopIMUvqrkbmfvuLJ0bYFdyb+yx/Mo0c5pfDirZJ3L
	 rt6kYotrZ7U1w91z1AFRQ8MugQ0zo3KNhVygZFjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF01BF80095;
	Fri, 28 Oct 2022 18:14:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9F71F800E1; Fri, 28 Oct 2022 18:14:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37C32F800E1
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 18:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37C32F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AwfmZaL4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E5EA62971;
 Fri, 28 Oct 2022 16:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02AC9C4314D;
 Fri, 28 Oct 2022 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666973680;
 bh=hPulKsWfwmPS12vC8SipmsqMezI1Fy/nKCO0cEWbjbw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AwfmZaL49GbbKADMrHKMnSR4f8L6gDd7gYK+muQWnFx+nq5hB7Zetnlq90s9jvqtH
 h+Rt5C3MlVeEzz57EVBxSJqR9z5i9yVcl5uP7yXsZ+O/NeB8EmO1uv/5tDx8UEd5OP
 DnxHq9BSpn8H7VYxYVHc3Sc2oAz2yYWdQ+ONpyytV03wqPzez1ohg5cuD56Qk3+ria
 fIvghKVyII0Eo5+vNL+YvKysbUxfKr/knS+P1PoS/xxSSEGJV2idWG8u5jeDy5RctS
 XraqgYTvFh8X0uT1WepaBkMk2HxHymcrahRwNPCV+CANILBOUK1iGFjJX9Bk11hDgN
 SOeNIE23zAJ4A==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Chen Zhongjin <chenzhongjin@huawei.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20221028031603.59416-1-chenzhongjin@huawei.com>
References: <20221028031603.59416-1-chenzhongjin@huawei.com>
Subject: Re: [PATCH] ASoC: core: Fix use-after-free in snd_soc_exit()
Message-Id: <166697367874.746166.7503879951900455151.b4-ty@kernel.org>
Date: Fri, 28 Oct 2022 17:14:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: lgirdwood@gmail.com, tiwai@suse.com
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

On Fri, 28 Oct 2022 11:16:03 +0800, Chen Zhongjin wrote:
> KASAN reports a use-after-free:
> 
> BUG: KASAN: use-after-free in device_del+0xb5b/0xc60
> Read of size 8 at addr ffff888008655050 by task rmmod/387
> CPU: 2 PID: 387 Comm: rmmod
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
> Call Trace:
> <TASK>
> dump_stack_lvl+0x79/0x9a
> print_report+0x17f/0x47b
> kasan_report+0xbb/0xf0
> device_del+0xb5b/0xc60
> platform_device_del.part.0+0x24/0x200
> platform_device_unregister+0x2e/0x40
> snd_soc_exit+0xa/0x22 [snd_soc_core]
> __do_sys_delete_module.constprop.0+0x34f/0x5b0
> do_syscall_64+0x3a/0x90
> entry_SYSCALL_64_after_hwframe+0x63/0xcd
> ...
> </TASK>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: core: Fix use-after-free in snd_soc_exit()
      commit: 6ec27c53886c8963729885bcf2dd996eba2767a7

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
