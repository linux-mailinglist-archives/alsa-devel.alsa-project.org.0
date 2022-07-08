Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9878A56C15E
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 22:49:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CCBD825;
	Fri,  8 Jul 2022 22:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CCBD825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657313345;
	bh=Ki7BSssMR/sY2i/NbhPKrIyoLypU98vQTGisVtw13nM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=feJ5E/XXCmp+YK9HS13jmFRdXkRhipvbFlejqAms4Nb7LfnwtdYS/htfWOiZF1yoU
	 Oe4/NK+85RMYa7zJCIyopG1pRr9lnVXOlfg8khHNgRylAG1xs5Z8LfWDEbzSxba9RJ
	 43hVy1glrcCsCm21q4FK7SER0x/U/1UvEHqFkkew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24507F80538;
	Fri,  8 Jul 2022 22:47:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3BF7F80539; Fri,  8 Jul 2022 22:47:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38D75F80537
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 22:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38D75F80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qoxmw3qK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C1D12628D2;
 Fri,  8 Jul 2022 20:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37162C341C6;
 Fri,  8 Jul 2022 20:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657313247;
 bh=Ki7BSssMR/sY2i/NbhPKrIyoLypU98vQTGisVtw13nM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qoxmw3qKHBYsBS8jIKSSUFDl+zyPigyqE4ONlm2s4KLL8TcAbH/LzEBD8/xjbDKzn
 FGMjqbDP8E23+4pRw6QdGV82s7MKWvkbRSaNbH0xuQUHgypaUWFFJjx98aoWSVWVXc
 5P2RL9Z4C16wS7wsmeRwSTPYoxiWoTXQvrIYb5u+/JenMx+7sa+HKOPA2+/IaM+Hsv
 3EqIrfZeiNWHiksqeDt/8cdBkLTqyoUAsi5xIGIBz08jjB1oVEG15z0NV7Q92Ah7U4
 u8reFV7vJtWvmkxr++cJujcNNfFZV1L81WOrpnXEW46WHppM9XgtORTq1xW5rU3bDs
 bGWuiPZI3dcsg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com
In-Reply-To: <20220707132613.3150931-1-Vijendar.Mukunda@amd.com>
References: <20220707132613.3150931-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 1/3] ASoC: amd: remove unused header file inclusion
Message-Id: <165731324493.2467307.9897367470295247193.b4-ty@kernel.org>
Date: Fri, 08 Jul 2022 21:47:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Sunil-kumar.Dommati@amd.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Basavaraj.Hiregoudar@amd.com, tiwai@suse.com,
 amadeuszx.slawinski@linux.intel.com, zhuning@everest-semi.com
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

On Thu, 7 Jul 2022 18:56:08 +0530, Vijendar Mukunda wrote:
> Removed unused header file inclusion from Jadeite platform machine
> driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: amd: remove unused header file inclusion
      commit: d7e5d8d24c1179b36a3cb40b3f785e23a8992acd
[2/3] ASoC: amd: drop machine driver remove function
      commit: 8d9cd3ead42a6d3bac131c4331acfa5244674fbb
[3/3] ASoC: amd: fix for variable set but not used warning
      commit: 0de876c125188e502d2899de4bcba8d4a6b1f98c

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
