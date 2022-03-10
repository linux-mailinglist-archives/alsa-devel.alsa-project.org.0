Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8BF4D45D9
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 12:38:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B29718E3;
	Thu, 10 Mar 2022 12:37:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B29718E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646912289;
	bh=AnDM7FNCQi75VSOYT6xKBeT+BDE6bxlYZVn7KRHx63U=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n1CMR5E5tKCF4TEuIh65Zc8i4jrJp5SVl4Q1aj7cpfLvgmLkeUuAklV7NYF6H9hrg
	 yBxdG6atuhnQRk+Qt+Dbho0MfRj1tDKRZ2sxmvjL7/x3cM7aPo4JUEX9oNooqkr+8j
	 23MYGHH7HYkAFeHx+SfCl1Ummcb2mL2SPN1ZwnmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF1BAF80537;
	Thu, 10 Mar 2022 12:35:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BE2FF80534; Thu, 10 Mar 2022 12:35:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18C46F80529;
 Thu, 10 Mar 2022 12:35:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18C46F80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k+VS0Ue7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E5586164F;
 Thu, 10 Mar 2022 11:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20060C340F3;
 Thu, 10 Mar 2022 11:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646912125;
 bh=AnDM7FNCQi75VSOYT6xKBeT+BDE6bxlYZVn7KRHx63U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=k+VS0Ue73un/AjXuiuoFw90Gps1nTbaWecCkV9N9DLS3Gn6zq33rkwvipTqMtKZyL
 RyXXOGbRwCQDV/q7nzerB6Paj/sk92/CLNvtzQHAgL6no6Xs+O8cBXlTRrk3trESRO
 xmk/T/+OXD4DAA4tRxMA8ih+W/uh9JvGeVHK5n1fou2vvOMSqMBMHLUkPuLTRWnnHY
 Lth2108o4NjYQWaynuX6mMPMBZTLh0iQXDHueziwgPOdyM30W/YJkMy2UzCZdMMdXX
 e01vJo2tz+5tuxZdBz1KZYzrPfO+UbFpCf+doblZoISICBRcy956OvvzVK/cNlhxRB
 XIY03BjYQ1VBQ==
From: Mark Brown <broonie@kernel.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220309004929.125558-2-jiapeng.chong@linux.alibaba.com>
References: <20220309004929.125558-1-jiapeng.chong@linux.alibaba.com>
 <20220309004929.125558-2-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: amd: Remove unneeded semicolon
Message-Id: <164691212284.13798.8164925619305971959.b4-ty@kernel.org>
Date: Thu, 10 Mar 2022 11:35:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 sound-open-firmware@alsa-project.org
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

On Wed, 9 Mar 2022 08:49:29 +0800, Jiapeng Chong wrote:
> Fix the following coccicheck warnings:
> 
> ./sound/soc/sof/amd/acp.c:280:3-4: Unneeded semicolon.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: amd: Remove unneeded semicolon
      commit: 5af07dad696422d48368409461a754990faa713c
[2/2] ASoC: SOF: amd: Remove unneeded semicolon
      commit: 5af07dad696422d48368409461a754990faa713c

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
