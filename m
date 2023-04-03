Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F08656D4B79
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 17:09:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E2633E8;
	Mon,  3 Apr 2023 17:08:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E2633E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680534588;
	bh=ctP9KIAO52Kp15QFrAPu3MWL9C3jbTxflfhT27h9H/o=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XAyDnB6yTRYPhN8Lc10cJlWrP995rjpTfXEph1nwZWlI6Qez36+Y9jpMEYF1aHz06
	 3hBq0osPYnVfE8iesO3CkkrvPQZ7+E9hxp3gvgj3PmFWqhVnOu9nH3UN2halt//M/m
	 hPtAfkUAGjur5Pz07eId3l4b9XXGFR92/wAkTwL0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 506F3F8052D;
	Mon,  3 Apr 2023 17:08:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B68E3F8015B; Mon,  3 Apr 2023 17:08:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C7D8F80249;
	Mon,  3 Apr 2023 17:07:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C7D8F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FOmuBoJ0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 679FD61FDF;
	Mon,  3 Apr 2023 15:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8940C433D2;
	Mon,  3 Apr 2023 15:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680534469;
	bh=ctP9KIAO52Kp15QFrAPu3MWL9C3jbTxflfhT27h9H/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FOmuBoJ0X4jOYdtKh8CRqMwhs27px+AxE+7pLhSqT8rgHo1i1xYYFbdYNkdz/JFA2
	 vKMt+++kgjj3YRmzknvo9lZOb/Q56jhn4RA3Sa1REwK+GJiFMTLoSOjTHLj35VxHaP
	 fh7CH4FBJXxvsG0FqbWZpqyRwU1cbkSKMo1+7BQxEpATSYeNvdG/nbz7NQFxE0AQvT
	 MovYQmQBu83eW8OPz62qop86uVe+bQsNwLH3cc5mhDuPuaswbj00MJj/W3M2+ZJ0ft
	 wOOBfKvTDG3xPBLXx5NDA4ILKt43RFg93rAqzKG0atUryCJVU+pCQnOeojVDY+jbMY
	 iPz2+2o6M1QLw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
In-Reply-To: <20230403071651.919027-1-Vijendar.Mukunda@amd.com>
References: <20230403071651.919027-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 1/6] ASoC: SOF: amd: remove unused code
Message-Id: <168053446539.47553.12390291979840159138.b4-ty@kernel.org>
Date: Mon, 03 Apr 2023 16:07:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: B4QVL34DNTJ4UFRTKKS42TRBNDPZBT4D
X-Message-ID-Hash: B4QVL34DNTJ4UFRTKKS42TRBNDPZBT4D
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Rander Wang <rander.wang@intel.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Zheng Bin <zhengbin13@huawei.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4QVL34DNTJ4UFRTKKS42TRBNDPZBT4D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 03 Apr 2023 12:46:41 +0530, Vijendar Mukunda wrote:
> During initial SOF driver bring up on AMD platforms, only DMIC
> support was added. As of today, we have a complete SOF solution for
> I2S endpoints along with DMIC endpoint.
> This code is no longer required.
> Remove unused code from RMB and RN platform ACP PCI driver.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: SOF: amd: remove unused code
      commit: 56e008146e5b46059c5469a8b47478ab78f5b895
[2/6] ASoC: SOF: amd: remove acp_dai_probe() function
      commit: 9eb48aeddd8dcf2defd94a837a65e052576cf42b
[3/6] ASoC: SOF: amd: remove unused variables
      commit: 2675de62de702dbda936eb0f9a20ce3d8fed5ab5
[4/6] ASoC: SOF: amd: refactor get_chip_info callback
      commit: 292b544ef4555ec5c69522e9c6eace6a90c4cd00
[5/6] ASoC: SOF: amd: refactor error checks in probe call
      commit: c7a3662f14d7e0add7b50dc2f971e77bebb333cc
[6/6] ASoC: SOF: amd: refactor dmic codec platform device creation
      commit: dd6bdd8b4d41b8f9db4b88dff2d10c0c62dbeb1d

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

