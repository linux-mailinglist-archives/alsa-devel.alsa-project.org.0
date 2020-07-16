Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D254A222FB3
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 02:05:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 852661614;
	Fri, 17 Jul 2020 02:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 852661614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594944331;
	bh=oFW1cl+r20hCLJ4pfkKV3RYD8Qs6TkPlxv0gjk1ZC/4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GD9ejv51syCt+k8nXhotdmXsAV5CjTQM1nh/MIJpNARflgnP/3Wqx0Yh/yAkdGEb4
	 CfBFsbvy5LKDknsZjRVVMDlcjAgMIdrup0vHBmWuXv6ovTtueiUUif2iyasKtsg4Yd
	 ysPfV1KQu16q/XyDqVAf7bCa99zjlHUu5XvVt370=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A4AEF80332;
	Fri, 17 Jul 2020 01:58:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59791F80331; Fri, 17 Jul 2020 01:58:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DC20F80329
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 01:57:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DC20F80329
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dmrjWPZf"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85897207DD;
 Thu, 16 Jul 2020 23:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594943878;
 bh=oFW1cl+r20hCLJ4pfkKV3RYD8Qs6TkPlxv0gjk1ZC/4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=dmrjWPZfs03JsoBSLG00UWERkRjDmkCCpfqFocx4AtXOzxNIBEbeqfiDmulKpfhu9
 LX9QjhTPsPjfJZnyzmfPzjbT48DveeTsySr6eZSkxI9CeltjMh7N8YpbDdPa5YC6iE
 xUNuDY3L2xc+m354XKAyf1nPh7Rx4KR5rRJiM9jI=
Date: Fri, 17 Jul 2020 00:57:48 +0100
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, kuninori.morimoto.gx@renesas.com,
 hdegoede@redhat.com, paul@crapouillou.net, yang.jie@linux.intel.com,
 liam.r.girdwood@linux.intel.com, cezary.rojewski@intel.com,
 Jing Xiangfeng <jingxiangfeng@huawei.com>, tiwai@suse.com, perex@perex.cz
In-Reply-To: <20200714080918.148196-1-jingxiangfeng@huawei.com>
References: <20200714080918.148196-1-jingxiangfeng@huawei.com>
Subject: Re: [PATCH] ASoC: Intel: bytcht_es8316: Add missed put_device()
Message-Id: <159494380522.42174.15064040875252381887.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Tue, 14 Jul 2020 16:09:18 +0800, Jing Xiangfeng wrote:
> snd_byt_cht_es8316_mc_probe() misses to call put_device() in an error
> path. Add the missed function call to fix it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bytcht_es8316: Add missed put_device()
      commit: b3df80ab6d147d4738be242e1c91e5fdbb6b03ef

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
