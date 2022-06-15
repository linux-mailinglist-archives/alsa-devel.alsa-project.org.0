Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F9654CA65
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 15:55:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C38A318F7;
	Wed, 15 Jun 2022 15:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C38A318F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655301345;
	bh=68WDubxLhalXX3kweNLoMTxlg/l57c7HnJZeSRidsVA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OakZBNVZ7LaxwJ2hwRdMHvz8uydAUp+FD1m6R1M4/OEY6S4snl+A1YIxoR/yqauZL
	 ZB4J+hfVmN2KG94IgshfYbTh9EHqf7XMSBXCUCWjYKweMCkVwq8PUf9UekF8TkZ9qL
	 l2Rsf6L3WR5PE8nkIt5LRoA7j/JcdmJ8e4xXAQ8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECC6CF801F7;
	Wed, 15 Jun 2022 15:54:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C13FF8012B; Wed, 15 Jun 2022 15:54:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 382E5F8012B
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 15:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 382E5F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QAzXoOV4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CE0A461B22;
 Wed, 15 Jun 2022 13:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF4DC34115;
 Wed, 15 Jun 2022 13:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655301276;
 bh=68WDubxLhalXX3kweNLoMTxlg/l57c7HnJZeSRidsVA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QAzXoOV4qTFwG8YVlXC05IjRNwEjXExoHhXn1AJGsF2HS0KEVA8CHGNSnsVxcld7b
 Lpy/pDwaajKjuxdzaKnpZopJnoHqlK0qOeA0D30gc/1dpJsalqe+kIoWj77uMnIZKm
 AYtqFbLhKAnM5RTT9Z3nubRWFeKItEKKS3d/sPFhNo0J9OUdWn2jlHzGIT2fmBPP/A
 lxr0fBwcbCKNWaBRSDzct1hfBlPPB4ABVbs6w+pltkrAWvGn623voDTOSIFzRJ4qav
 Y27Xy48O3BNDprSliQP2gHws+avLinAhZWla3FEhuQTND6dA/X5r2WfadKvgBKLt5W
 7g+fEjhytoDLg==
From: Mark Brown <broonie@kernel.org>
To: spujar@nvidia.com, dan.carpenter@oracle.com, perex@perex.cz, tiwai@suse.com
In-Reply-To: <1655267914-24702-1-git-send-email-spujar@nvidia.com>
References: <1655267914-24702-1-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: Fix MBDRC bypass mode check
Message-Id: <165530127422.947339.13523217289289739247.b4-ty@kernel.org>
Date: Wed, 15 Jun 2022 14:54:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 thierry.reding@gmail.com, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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

On Wed, 15 Jun 2022 10:08:34 +0530, Sameer Pujar wrote:
> MBDRC supports different modes of operation. There is no configuration
> required for bypass mode. The hw_params() call does not filter bypass
> mode correctly and it leads to following Smatch static checker warning:
> 
>   sound/soc/tegra/tegra210_mbdrc.c:778 tegra210_mbdrc_hw_params()
>   warn: bitwise AND condition is false here
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Fix MBDRC bypass mode check
      commit: 4edf738d4c7989c315e37d4d61e34c94557b6ed2

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
