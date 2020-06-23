Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF402052C1
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 14:43:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3C5517CC;
	Tue, 23 Jun 2020 14:42:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3C5517CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592916198;
	bh=V4CYw5A9wOH8JAZwZiQucKjp4FHIDURRUQ6BozzfRFw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ft6GqnovhteXR6FKaejaspW8O1oX8o3OXRl0cN+vP2JyplwVJc1oWXM3PV1SLYR4t
	 kfKyYNI0ZpEgNgEjpip31/25D9GT2gBaPG5JgiG8gJzrDm6C9obsroywW0+W+ju35Q
	 VVaWP5y8rblM8HQcJS9bd1Qi67goaKw3UFSXeW2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69C29F802C4;
	Tue, 23 Jun 2020 14:39:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A441F802C2; Tue, 23 Jun 2020 14:39:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 888CBF802BD
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 14:39:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 888CBF802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OkQJx3Do"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 399E520738;
 Tue, 23 Jun 2020 12:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592915966;
 bh=V4CYw5A9wOH8JAZwZiQucKjp4FHIDURRUQ6BozzfRFw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=OkQJx3Do4CsxQcOavWIULwLzvYTO5qSV8wgntrMSeqgmkbtyDNjhXd59d/jKEexJk
 O+Z/zDEd2AQHDMdRIHZOx2EFM68gDYIoUtqAl1o6jRM/Zz3TvW3cz2ilTUZrwAxpr7
 9glIhYdtafnadX7xexMJ3nQtXPkS6Jnit16bFqIA=
Date: Tue, 23 Jun 2020 13:39:24 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200622154241.29053-1-pierre-louis.bossart@linux.intel.com>
References: <20200622154241.29053-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: add dailink .exit() callback
Message-Id: <159291594453.44561.7556325943085132251.b4-ty@kernel.org>
Cc: tiwai@suse.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Mon, 22 Jun 2020 10:42:36 -0500, Pierre-Louis Bossart wrote:
> While looking at reboot issues and module load/unload tests, I found
> out some resources allocated in the dailink .init() callback are not
> properly released - there is no existing mechanism in the soc-core to
> do so.
> 
> The addition of a dailink .exit() callback seems to be the simplest
> solution overall. It can be argued that the existing machine platform
> device .remove() callback can also perform the necessary cleanups,
> however as shown in the last two examples this might require a loop to
> identify components whereas the dailink .exit() already has all the
> necessary information to revert the actions done in the .init() step.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: soc-link: introduce exit() callback
      commit: 21a00fb33790f828a34b9ce50ab9f9130bc1ffb4
[2/5] ASoC: Intel: bdw-rt5677: fix module load/unload issues
      commit: bcb43fdae1c0d08b772b792cf46f323ad0d17968
[3/5] ASoC: Intel: kbl-rt5660: use .exit() dailink callback to release gpiod
      commit: e56054e75325c347f09c1be2f6400ef67bb9662d
[4/5] ASoC: intel: sof_rt5682: move disabling jack to dai link's exit()
      commit: b0c96fc1ab2947e331f817cecc5ca733eaf5619b
[5/5] ASoC: intel: cml_rt1011_rt5682: disable jack in dailink .exit()
      commit: 4fcc922cb31179f9bc1e99cd707f2b36138fbcf8

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
