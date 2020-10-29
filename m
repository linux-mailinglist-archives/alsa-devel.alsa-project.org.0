Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E2729EC05
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 13:41:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14D8915DC;
	Thu, 29 Oct 2020 13:41:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14D8915DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603975319;
	bh=p/WnSlwE7z/dV6rJKMbN+kl2u1f/wqMUmU+0pa8n5Ns=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SU5UCORNzyn9lewdsngsUv3opi3pynECOdE2UxaWfibtco/yZluiqogH2DLsKq0eZ
	 BADsdjxf71nZ+rM/N50UJbdBQtP8ixs/oKlUe3fw4FCLsGWip0wUgS3lFehEgGPL1D
	 9MzWXjriEIdaH2Nrh5mzcG8ALXYR0kZid2MD7Q7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57702F800D8;
	Thu, 29 Oct 2020 13:40:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3125F8020D; Thu, 29 Oct 2020 13:40:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD00BF800D8
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 13:40:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD00BF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aGU1uq5J"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 77FE02076B;
 Thu, 29 Oct 2020 12:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603975216;
 bh=p/WnSlwE7z/dV6rJKMbN+kl2u1f/wqMUmU+0pa8n5Ns=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=aGU1uq5J9Y+zzUHke9T4g5YAV6jpi5m5gbJ+5bhp4p0Tzx1xkbk+oq3utZsoF6AnT
 BIvJ8aNL0ZEXLS/DD7q75cOVzjnk9llEWu4+8Za/HyGIzLawRQiMfGEbnQN/Dah+LM
 Wdhg+xxTLP3vucNaCg5P17DaLD8qI4jAwhtiZx8o=
Date: Thu, 29 Oct 2020 12:40:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Patrick Lai <plai@codeaurora.org>, Colin King <colin.king@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 V Sujith Kumar Reddy <vsujithk@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@codeaurora.org>, Jaroslav Kysela <perex@perex.cz>,
 Srinivasa Rao <srivasam@codeaurora.org>, alsa-devel@alsa-project.org
In-Reply-To: <20201028115112.109017-1-colin.king@canonical.com>
References: <20201028115112.109017-1-colin.king@canonical.com>
Subject: Re: [PATCH][next] ASoC: qcom: fix unsigned int bitwidth compared to
 less than zero
Message-Id: <160397520896.55401.11950538848257876856.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, 28 Oct 2020 11:51:12 +0000, Colin King wrote:
> The check for an error return from the call to snd_pcm_format_width
> is never true as the unsigned int bitwidth can never be less than
> zero. Fix this by making bitwidth an int.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: fix unsigned int bitwidth compared to less than zero
      commit: bcc96dc3cf8048c80af7c487af17e19be27ac57d

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
