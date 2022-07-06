Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6AD56866D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:09:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F41A16A0;
	Wed,  6 Jul 2022 13:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F41A16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657105773;
	bh=RogpuoWy8qfianqaIwi0HDTIG8Zn33CeVTw7+2LWNGQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Utg7A3SNyEvZwJNVkwv4KWQbFsgK+Wo+JBFsjMavQyKDhUnNtlmzLbhAKJtPGZWfe
	 BRB8pgtHBymY7mDujHvLXr5HoWzXPu+IQr6lp43In8q50Z+tp7i1L2DjMddqqwD1Bf
	 7gBSRfxKRam3ExMypro+Tqhnr08alF6GemNL6Gh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72E0DF8052E;
	Wed,  6 Jul 2022 13:08:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E10DF8016B; Wed,  6 Jul 2022 13:08:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 199F5F8016B
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 13:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 199F5F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XUcji2VE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 14CDAB81BE5;
 Wed,  6 Jul 2022 11:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C19C341C0;
 Wed,  6 Jul 2022 11:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657105673;
 bh=RogpuoWy8qfianqaIwi0HDTIG8Zn33CeVTw7+2LWNGQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XUcji2VE1GH/yJAccMlqJmGX0h6ZBd5R8LRiC9OaRG0uDwBqxqlhCmqjVlRjhJfAD
 N0lAZaQtIpe0OP+aLyMsWfD8PaPoSqGhfUP+c4m4qfx30BGvlZTF++GwieR1iETy4m
 t4GzDXxBcf1Lw6hb+fr/DMboarL5m/W4DMCR/B3onWgwtHZldBLDUXhuD1CMzaBUty
 5nQhsmK002eNqDee0PNneUgAHm1CfebXbiNclRTam2QUVtlOqcnL9riOBmFRLFsp3S
 /d9CrVeuUgg5C0ipIp6n8xqTmwKglW6JAPpxGdWCZaaZBia8TEaXqDfoNoW2RJSaC9
 MSO6RMlS7GiaA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 robh+dt@kernel.org, festevam@gmail.com, shengjiu.wang@nxp.com,
 krzk+dt@kernel.org, nicoleotsuka@gmail.com, devicetree@vger.kernel.org,
 perex@perex.cz, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com
In-Reply-To: <1656667961-1799-1-git-send-email-shengjiu.wang@nxp.com>
References: <1656667961-1799-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 0/6] Add support of two Audio PLL source
Message-Id: <165710567079.237380.5026373305183588583.b4-ty@kernel.org>
Date: Wed, 06 Jul 2022 12:07:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Fri, 1 Jul 2022 17:32:35 +0800, Shengjiu Wang wrote:
> i.MX8MQ/MN/MM/MP platforms typically have 2 AUDIO PLLs being
> configured to handle 8kHz and 11kHz series audio rates.
> 
> The patches implement the functionality to select at runtime
> the appropriate AUDIO PLL for root clock, if there is no
> two PLL registered, then no action taken.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: fsl_utils: Add function to handle PLL clock source
      commit: 7bad8125549cda14d9ccf97d7d76f7ef6ac9d206
[2/6] ASoC: fsl_spdif: Add support for PLL switch at runtime.
      commit: 34dcdebecf2f05e1b275e1da8352f8e4c1aab6f6
[3/6] ASoC: fsl_micfil: Add support for PLL switch at runtime
      commit: 93f54100fbdedc22e8d88d037a8a3e32101724eb
[4/6] ASoC: fsl_sai: Add support for PLL switch at runtime
      commit: 7cb7f07d2491a3435578ab97eeeb70fadac6385c
[5/6] ASoC: dt-bindings: fsl_spdif: Add two PLL clock source
      commit: df0835a810c1585bd54ffb10db92b455e922c7ec
[6/6] ASoC: dt-bindings: fsl-sai: Add two PLL clock source
      commit: 6c06ad34eda9e1990313ff80999e1a75a02fa1c0

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
