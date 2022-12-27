Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0F1656A5F
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 13:02:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DA2273B7;
	Tue, 27 Dec 2022 13:01:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DA2273B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672142554;
	bh=AC5FnV+us56kX2g+J2arHCm2TIeoiHguvwSTxqc9Vr0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jf4gaKJFcRAOjAkBquWfzAfNY4xM4Uza9gcUEVuwP67vPeZYsFhPCcyLZzMRRPqel
	 svOtCEnbNCIkk8HDW8m8zVHMvaSz8S67noOQfha0WrYL4uIagGWC10irU97x/XUnGB
	 2H/dp35XwCE9qpeENtpwqrWXX5WaHBS/JSX4Hh8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 338D2F805CA;
	Tue, 27 Dec 2022 12:57:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38C05F805C0; Tue, 27 Dec 2022 12:57:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5D9DF805BD
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 12:57:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5D9DF805BD
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rGOEDUYt
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0061AB80F9D;
 Tue, 27 Dec 2022 11:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41A6C433D2;
 Tue, 27 Dec 2022 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672142252;
 bh=AC5FnV+us56kX2g+J2arHCm2TIeoiHguvwSTxqc9Vr0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rGOEDUYtzgB1k2pa8t6TaBvOPnKjFzXecnh32jRu46OKU6kpcfyFjVXOo9aooVaSz
 NthmSNLKpCYNb+Hyk6hyTaNpA88x5wilSD34rcbpJSbT+chUTT9kckzSYdrv92Kygi
 sQW2Np86FkO3abvijBO+69aZro7eIDqcvMbTUDZuTFKtuk8EHzAtDYb5NaoXSr0cOP
 lPbR+Mb6RSpd862KXBgCWj8F2j1EHTWnRUHwbmFn7wE7ie5xLsrNGUxTb4bbQ6SPLt
 c7GUJNbYs070yGOM429wK6UgtBQun82/5PrW/Uty0pewwBnRZgh/6e78iriI+px5Ng
 txO6nJpAOWxqg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
In-Reply-To: <20221221172855.1618766-1-Vijendar.Mukunda@amd.com>
References: <20221221172855.1618766-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V2 1/4] ASoC: amd: ps: implement api to retrieve acp
 device config
Message-Id: <167214225052.82924.1961233191499199699.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 11:57:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Mario.Limonciello@amd.com,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 21 Dec 2022 22:58:48 +0530, Vijendar Mukunda wrote:
> Implement API to retrieve acp device config and calculate platform
> device count and dev mask for platform device node creation.
> 
> Currently for DMIC configuration, mask and dev count are calculated.
> Same api will be used to extend support for different ACP device
> configurations.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: amd: ps: implement api to retrieve acp device config
      commit: 2cdabbde0c24bb76978d57856cba958b85584c32
[2/4] ASoC: amd: ps: refactor platform device creation logic
      commit: 1d325cdaf7a2747df42b43eed8b3de2e2d6c69bb
[3/4] ASoC: amd: ps: update dev index value in irq handler
      commit: 9d327a4443bffe8d48acc6a31c0198f251fca08b
[4/4] ASoC: amd: ps: move irq handler registration
      commit: 966ef755d3b66853be4f15c698f5210115c15d23

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
