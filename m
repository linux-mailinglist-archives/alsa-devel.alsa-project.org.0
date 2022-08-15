Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B19DF593321
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 18:26:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FB631630;
	Mon, 15 Aug 2022 18:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FB631630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660580766;
	bh=a1McajjZBLg4+o4Mngq4Nas6xSzpje4QIdi9DWARZwM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P9P5zNSIJbgqHAtxdz6ETYJC4Lst6p63rdKbS38W/Iy++lVjn8PykzEe2Wg/c4z3N
	 DZ7NczpTeFhj2tS+R1m4XtBoMrOPAY0owpnWZIjMyBI234bNQ3JisB71BlN7uIEtMg
	 UycXQOxAogSv/WhlSbWUmZwvLPDEVkp/v946vegk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50891F80588;
	Mon, 15 Aug 2022 18:23:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B18A0F80578; Mon, 15 Aug 2022 18:23:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E241F8055C
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 18:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E241F8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KTyTi2cN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 65514611D6;
 Mon, 15 Aug 2022 16:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBDDC433D6;
 Mon, 15 Aug 2022 16:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660580592;
 bh=a1McajjZBLg4+o4Mngq4Nas6xSzpje4QIdi9DWARZwM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KTyTi2cNmB6+pC4+OPuS2mbjWu8IDcyxjABlJtbJOstVXP7Cnc/rs/LwzQTIoO7RJ
 EOpQIpktn4q5kOV4HL/haotJ1w1HQxRPEtmxsacZsny8fHkWpxr0kBlou3Cn/KH3Xa
 sZhrRfjWbENvpFu7tC61plXSlg2mCv5kpXXaJIkFZw+UMfAF4zZMLd55mKkkb6KPUs
 BPYSNEt1RYz70SnsiYjV+yV1ntMMM5NO7HNThK2AfSwfHPi63vYKuzxPvXvmN6KA+r
 xnJWtH9u6XXplZz7Q91K2iNcjP9QJvFRpG7FKBV6MzYqU5qGUcjrqo6jNeNVqrryXw
 f9/fQIj68dk8g==
From: Mark Brown <broonie@kernel.org>
To: Xin Gao <gaoxin@cdjrlc.com>, perex@perex.cz, tiwai@suse.com
In-Reply-To: <20220808153910.59545-1-gaoxin@cdjrlc.com>
References: <20220808153910.59545-1-gaoxin@cdjrlc.com>
Subject: Re: [PATCH] ASoC: Variable type completion
Message-Id: <166058059129.769843.571852618081031336.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 17:23:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
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

On Mon, 8 Aug 2022 23:39:10 +0800, Xin Gao wrote:
> 'unsigned int' is better than 'unsigned'.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Variable type completion
      commit: 1b5efeabf75a74043f1eb509ca3ac183b3ffaf89

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
