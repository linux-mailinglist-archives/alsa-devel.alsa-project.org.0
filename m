Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7391FA4AE
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 01:44:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35EA81670;
	Tue, 16 Jun 2020 01:43:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35EA81670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592264654;
	bh=nm6YjcSTLxiQn/pubcq2UsGgEJdKRxFZIDhtloCwd3s=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t5CGve4K895+NbIb5AdDBCcuZPwZPjwdqiqek5fOuOZn8/3qWqCfgGcpA2yhvqWqm
	 3TwhHJ9UaAH9dewYaFsQns7osfJlijds90ghzsrhc17q6qBuzw4A/Z3h7AV+Ei8e2u
	 5sGkUChaP2I/1HVLlMTdbouFSVWpIRwNBTzvXxk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8939AF802E0;
	Tue, 16 Jun 2020 01:40:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95DB0F802D2; Tue, 16 Jun 2020 01:40:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6021F802A1
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 01:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6021F802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ntm1hMrD"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B112820714;
 Mon, 15 Jun 2020 23:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592264416;
 bh=nm6YjcSTLxiQn/pubcq2UsGgEJdKRxFZIDhtloCwd3s=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Ntm1hMrDLcgcUAULOYdK9V2T9COZBi0HBv2lbd+T/0XIPlV3P2LtOklrjg2H9R5ZF
 WXBHlIVx63/6xgJ712O9Yvru8unHNZKC2c7gfLzcqgfkXv+wlUnKzHPGjSyCZxy0m9
 uImbbtZPHj0u940PM3xMTaTUc9P6eXktQpfUJ0g8=
Date: Tue, 16 Jun 2020 00:40:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Akshu Agrawal <akshu.agrawal@amd.com>
In-Reply-To: <20200530095519.24324-1-akshu.agrawal@amd.com>
References: <20200530095519.24324-1-akshu.agrawal@amd.com>
Subject: Re: [v3] ASoC: AMD: Use mixer control to switch between DMICs
Message-Id: <159226439188.27409.56215501183185998.b4-ty@kernel.org>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, yuhsuan@chromium.org,
 Takashi Iwai <tiwai@suse.com>
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

On Sat, 30 May 2020 15:25:06 +0530, Akshu Agrawal wrote:
> Having mixer control to switch between DMICs prevents user to
> initiate capture simultaneously on both the DMIcs.
> Earlier 2 separate devices, one for each DMIC, gave an option of
> using them simultaneously, which is not supported.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: AMD: Use mixer control to switch between DMICs
      commit: b7a742cff3f618d848e62e5a1ade0ff816e93092

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
