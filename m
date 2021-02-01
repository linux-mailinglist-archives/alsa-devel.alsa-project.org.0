Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9D530ACFE
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 17:49:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DC9F171E;
	Mon,  1 Feb 2021 17:48:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DC9F171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612198184;
	bh=3ZSShGaHD21VoaeFlggx+0UQjYQByAjimh392hgvzhY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qapbpTTTZ+MAQVWaOqrnc4bBbsrCM/xrUkJ5Y9EfpEY7whK2Na/vkCRV89ItEnoeG
	 w+ZKyF2q4DlCJUMSieWBKyQudteB8ParKb0u6UQPB4i//VsKWcB3aRT03xLGXe3rdl
	 Wdz1Su/ckeGJROzzZ9hexoNvMb2IzoexlBkkciy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF0F1F8023B;
	Mon,  1 Feb 2021 17:46:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56C38F8025D; Mon,  1 Feb 2021 17:46:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 146E5F8023B
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 17:46:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 146E5F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aCjyPqcf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17DAB64EA8;
 Mon,  1 Feb 2021 16:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612198006;
 bh=3ZSShGaHD21VoaeFlggx+0UQjYQByAjimh392hgvzhY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=aCjyPqcfr4ofpETKztXWpYbTGn+/khEH/aQpmzyVz+YL0YwbX4QRAqpuLKlBZSGq3
 IEY6IaslC+Yr/QbSksCQ0O/P2xP3N0EKCSwCSSbyHK9Yw2Yt5fTjCJ94fJNjZMDlTo
 iIA2UohPVL1mg1ao8grbmS5lXDfWAkVDCuq6Fvy47PH0rKh04+HnLVccoSoVRNoUt8
 AhEOdUEpHdgW+meyYLP3LrQRjGewbO8+Cmna6m8HUvcVUqsyTI38SQ4CaYwmCYfrws
 UOc3l7GwaRQw5Bd0lYRXmioc/Ugns3D3zRGi8pKmrB4O7G4uXSw5kQQi7ncDOH6rZR
 ZMc5ZIUy0MBuw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20210201161429.28060-1-srinivas.kandagatla@linaro.org>
References: <20210201161429.28060-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: add missing max_register in regmap config
Message-Id: <161219793996.46194.10385575485346385646.b4-ty@kernel.org>
Date: Mon, 01 Feb 2021 16:45:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: vkoul@kernel.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com
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

On Mon, 1 Feb 2021 16:14:29 +0000, Srinivas Kandagatla wrote:
> For some reason setting max_register was missed from regmap_config.
> Without this cat /sys/kernel/debug/regmap/sdw:0:217:2010:0:1/range
> actually throws below Warning.
> 
> WARNING: CPU: 7 PID: 540 at drivers/base/regmap/regmap-debugfs.c:160
>  regmap_debugfs_get_dump_start.part.10+0x1e0/0x220
> ...
> Call trace:
>  regmap_debugfs_get_dump_start.part.10+0x1e0/0x220
>  regmap_reg_ranges_read_file+0xc0/0x2e0
>  full_proxy_read+0x64/0x98
>  vfs_read+0xa8/0x1e0
>  ksys_read+0x6c/0x100
>  __arm64_sys_read+0x1c/0x28
>  el0_svc_common.constprop.3+0x6c/0x190
>  do_el0_svc+0x24/0x90
>  el0_svc+0x14/0x20
>  el0_sync_handler+0x90/0xb8
>  el0_sync+0x158/0x180
> ...

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: add missing max_register in regmap config
      commit: e8820dbddbcad7e91daacf7d42a49d1d04a4e489

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
