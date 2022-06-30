Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B1856198A
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 13:47:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48A3316C0;
	Thu, 30 Jun 2022 13:46:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48A3316C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656589636;
	bh=y23dn3xscoxlX2Hr88BQdcfLioVdD06aIUSMoMRHtvA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gWhVWvCKj71TTF+CUVGBFk4hDA5QnrU3m7IBLHj8agA07MEt6zRroIdSaf2dJ3Omg
	 bvUOIyW4YI8XdvgYtdFvejYzdo8ZDG+g6PcMmVWde8CqpNu49Jo9V0+RfYaBXAufKR
	 42FyydKIxojVK02wW6QDUDaqBzd208Tvv13b1B+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6AD1F80107;
	Thu, 30 Jun 2022 13:46:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAE4EF804DA; Thu, 30 Jun 2022 13:46:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 414BBF80107
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 13:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 414BBF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rR07Abj/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8EAA6167E;
 Thu, 30 Jun 2022 11:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18990C385A5;
 Thu, 30 Jun 2022 11:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656589571;
 bh=y23dn3xscoxlX2Hr88BQdcfLioVdD06aIUSMoMRHtvA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rR07Abj/wDXH5e4AouaREXvtyQrnW87e87tJKq4ZKB4+lzH7po/52SjphelNLbVQ8
 3+IuRB7NomXz6e29XsgtnnkJsn5UYgU1FMED9VLrsljdJUMnc/MtbeHqFwLg8Qy6Tb
 Ev18iKbjdrdlY+BIT7vESYzg6TnyTGYUxTL9Gxl8f8T9etRqSUTJ+7CmPy9S8jFIQ7
 nsxyGwCHCA/JerbGr37jYF4AB5NbhhyiFiMSA0JPwEPTChWe3Q7BraNyzrZWXLKBjU
 OU6ybckb419id1xGkYEfVE5bRb2JCWyAt7wUbjoQvruAkuCEL08Hcrq8KnFbsds/Ni
 85gXFDP9VfBEg==
From: Mark Brown <broonie@kernel.org>
To: marex@denx.de, alsa-devel@alsa-project.org
In-Reply-To: <20220628165807.152191-1-marex@denx.de>
References: <20220628165807.152191-1-marex@denx.de>
Subject: Re: [PATCH] ASoC: doc: Update dead links
Message-Id: <165658956982.346792.17836675302325290041.b4-ty@kernel.org>
Date: Thu, 30 Jun 2022 12:46:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, linux-doc@vger.kernel.org
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

On Tue, 28 Jun 2022 18:58:07 +0200, Marek Vasut wrote:
> The alsa-project documentation is now part of the kernel docs,
> the original links are long dead, update links.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: doc: Update dead links
      commit: d15534a6f4cff031f1233154f1e275302c03e5d4

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
