Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4B54B6D41
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 14:20:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DD5B183A;
	Tue, 15 Feb 2022 14:19:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DD5B183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644931225;
	bh=8cMCtic2t5pEf/DSz0kJZRrHovHUh2AE3w5SyPIBVxo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DWjVHQGgfp6uSiNpZF00cDIK6bKtDh+kQ5CQBOUC+POM3usVvaQ31diVc0bUc+Rya
	 2ETg4c5K0RH01+MpHuSrr4KAR4U/1A0cgBh9O3QJra58O0M4hrqbe/lU4mh8Y59vsD
	 TcL3Qgol5ipPFK03jg7Wtr00ZArc73vH/eGBmmBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46A7EF80100;
	Tue, 15 Feb 2022 14:18:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B785EF80271; Tue, 15 Feb 2022 14:18:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36E4EF80100
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 14:18:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36E4EF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sANB+cZN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 49A59616EA;
 Tue, 15 Feb 2022 13:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E129C340EB;
 Tue, 15 Feb 2022 13:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644931110;
 bh=8cMCtic2t5pEf/DSz0kJZRrHovHUh2AE3w5SyPIBVxo=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=sANB+cZNShkF2pr662E4ZWpeXA64APS5swjVSiyw9GZjEsObehp/MFKFJcnjIL6PU
 IIwqQyTX9GRw3DbRMWGePPcl5FOKtQm0pVrKmvok0N120yRB80ueHiunpWJjZ+uvdd
 B/AiH6bCnLHnAsW+E1ZArx0yaIDCykMYVLYAKTZub/woS39wrd/V1Brts8c2TM5Dxk
 oBx2DfK2PgBewS3/n8Ik5MGT7tvUzjLNCGWf49NyF2PighXJhfeE4DP9dHw3JtPf2C
 bDLFnJgKQgjc3G8becqXbdn9i4aeGJGuxo/6ztLKB8ccd+GI240v7rCE7yPo3nmQOO
 YaSobjaXfBgHQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 perex@perex.cz, linux-kernel@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1644491952-7457-1-git-send-email-shengjiu.wang@nxp.com>
References: <1644491952-7457-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: soc-core: skip zero num_dai component in searching
 dai name
Message-Id: <164493110923.974741.6888113145562787379.b4-ty@kernel.org>
Date: Tue, 15 Feb 2022 13:18:29 +0000
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

On Thu, 10 Feb 2022 19:19:12 +0800, Shengjiu Wang wrote:
> In the case like dmaengine which's not a dai but as a component, the
> num_dai is zero, dmaengine component has the same component_of_node
> as cpu dai, when cpu dai component is not ready, but dmaengine component
> is ready, try to get cpu dai name, the snd_soc_get_dai_name() return
> -EINVAL, not -EPROBE_DEFER, that cause below error:
> 
> asoc-simple-card <card name>: parse error -22
> asoc-simple-card: probe of <card name> failed with error -22
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core: skip zero num_dai component in searching dai name
      commit: f7d344a2bd5ec81fbd1ce76928fd059e57ec9bea

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
