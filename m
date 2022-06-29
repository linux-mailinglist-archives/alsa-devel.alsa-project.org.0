Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF435601DC
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 16:07:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B05C3163E;
	Wed, 29 Jun 2022 16:06:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B05C3163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656511620;
	bh=7fSXNKAkW4NtuV55Foe1vxjYNS6tiT4nsVWk8VqcIjw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fkmDNT5uvrPKzfkhCpdCums6QiShIJ/8pBKe8cBam0NmPo9UPxoOBD6XwCmnYTSuo
	 SSKVKkRAc9vQG0owH+JctlkX85MVHTH4DcC5LdB+CZaKkYcY6xF1WBGFyXzKj09SEw
	 U7oSsNzKciS+LryVICukP0yxirvNUrrW33v16hHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 139EBF8052D;
	Wed, 29 Jun 2022 16:06:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA5DFF800F8; Wed, 29 Jun 2022 16:05:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66318F80158
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 16:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66318F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a0LzRe13"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE91861904;
 Wed, 29 Jun 2022 14:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFBCC34114;
 Wed, 29 Jun 2022 14:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656511555;
 bh=7fSXNKAkW4NtuV55Foe1vxjYNS6tiT4nsVWk8VqcIjw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=a0LzRe13LpKG7DkbI4+6Bs3q1ry++6rZGbKMfxDwt0EJavRdNb3awhncJi+RSD4tR
 fK46caggw9UNlQWqm8sSjXiJyn/j37UENt6px8eCck3J8MKX6dyx3rXbT3dVywx67F
 hGAd7mB3QxaKYfgS3VbokN+L568oLIhu7o85nofze36nREmg5WrA8HejHryo0BaznI
 WAI3Wu7k5MTeq/Fn3R3CnEdk4KCRdLUQZn8HVGBBqGXl4iydbZxpeXDXkzJEWmgIRD
 v2r9dqcLOp5sYEJFQ5n2ee7Ic4ERx+xo/hLWMyFZBCci2hlVSNI1N/FpPBMxdL6z1q
 O2ZDxoI25mUig==
From: Mark Brown <broonie@kernel.org>
To: daniel@zonque.org, ryan.lee.analog@gmail.com
In-Reply-To: <20220629050630.2848317-1-daniel@zonque.org>
References: <20220629050630.2848317-1-daniel@zonque.org>
Subject: Re: [PATCH] ASoC: max98396: Fix TDM mode BSEL settings
Message-Id: <165651155437.1437597.1652159248136094201.b4-ty@kernel.org>
Date: Wed, 29 Jun 2022 15:05:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Wed, 29 Jun 2022 07:06:30 +0200, Daniel Mack wrote:
> In TDM mode, the BSEL register value must be set according to table 5 in the
> datasheet. This patch adds a lookup function and uses it in
> max98396_dai_tdm_slot().
> 
> As the first 3 entries can also be used for non-TDM setups, the code re-uses
> the same table for such scenarios.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98396: Fix TDM mode BSEL settings
      commit: d29e0a6e3631724c0b36786c6d9616b6e4ebeaa4

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
