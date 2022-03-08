Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F08434D1EEF
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:24:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8940118AC;
	Tue,  8 Mar 2022 18:23:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8940118AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646760248;
	bh=OTBvjPDi+isTMADoBJKHUAl7J8WbruRWlXA5d3Qair0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mEPW3mA3cqGIcfctyx/2VwRiF9KkFwZFe9pEPovfnQ/fF2RT6+8diTC/BWckmrWFv
	 EylRTjlNwFgpfmxMpFcVbYJlAwy+SESm0Md2FX6o0TY6bsRMLZks5o4hufS8mZiU8Q
	 izeupgFZWGgQAGxamaecfm0XgP8iya53ALTzH4fw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B945EF804F3;
	Tue,  8 Mar 2022 18:20:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 181C8F80271; Tue,  8 Mar 2022 18:20:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B45BAF80271
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:20:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B45BAF80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h+9lSc42"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 92A6361093;
 Tue,  8 Mar 2022 17:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1471FC340EF;
 Tue,  8 Mar 2022 17:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646760050;
 bh=OTBvjPDi+isTMADoBJKHUAl7J8WbruRWlXA5d3Qair0=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=h+9lSc42lHWYcPr8dH9nm8eA1GZza7+G7Amy5YzWHbBP5WFKhjLghncJ+7zerIBSa
 CeFMl2t0J3fmb982ZU1FSL0knrWyJB1GKmgs0zd6x/+pkqDI9kicM9Adtzd0GJ/8KC
 GdE5NeOr/Nr/APVNkh5RUFSUTcFWIjLkuCRoDyii5cM7C7hicAlT812Q6aVlCour+j
 V1mfVnnXjpGBLujey+3UDyvbe9AEd9/ADUG4p076i/rfkFNZ6d9CSfPfpKZiAtIJ3Z
 Td+60L2vllqUOqMBYTYv/Hp//xHUMbAvQvC6LVOvxoVYm79T7sV0fTdMujx87FlQ+0
 Y7BTMEY7+RBxw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 linux-rockchip@lists.infradead.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>, Jianqun <jay.xu@rock-chips.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <20220307083553.26009-1-linmq006@gmail.com>
References: <20220307083553.26009-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s: Fix missing clk_disable_unprepare()
 in rockchip_i2s_probe
Message-Id: <164676004779.54315.18423520292577645597.b4-ty@kernel.org>
Date: Tue, 08 Mar 2022 17:20:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 7 Mar 2022 08:35:52 +0000, Miaoqian Lin wrote:
> Fix the missing clk_disable_unprepare() before return
> from rockchip_i2s_probe() in the error handling case.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip: i2s: Fix missing clk_disable_unprepare() in rockchip_i2s_probe
      commit: f725d20579807a68afbe5dba69e78b8fa05f5ef0

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
