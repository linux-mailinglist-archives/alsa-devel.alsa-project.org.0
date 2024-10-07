Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC41993931
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2024 23:30:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80F24868;
	Mon,  7 Oct 2024 23:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80F24868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728336656;
	bh=8o+yrEOOtiSiBfWaBp1QfIZYWs4xvqSa5neZU4qy49Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QHp9j1mCmWbgiH41LBJgj2eUYQKVxgTUEkHR2VRDTQiqEiFycoaLM6CB4FWxjFOpD
	 yYCOKuUGN4iC+756uFqp4PQeE0ynBmC5OczDI8WuQpWGWfYc3hLuBCvgj0Q+fifpTK
	 ch7o9n2TRwXpce9uFpC0xwLESNbCpiQLK/jKB4xo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3D3AF805A0; Mon,  7 Oct 2024 23:30:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFD2DF80579;
	Mon,  7 Oct 2024 23:30:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0170FF80528; Mon,  7 Oct 2024 23:30:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA707F800ED
	for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2024 23:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA707F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nU1Y9BX1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1FDDFA4266E;
	Mon,  7 Oct 2024 21:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C16EDC4CEC6;
	Mon,  7 Oct 2024 21:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728336614;
	bh=8o+yrEOOtiSiBfWaBp1QfIZYWs4xvqSa5neZU4qy49Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nU1Y9BX1SobaMtnlYNWyiLFyo1C4SFdbgigsuJOrrmVl+hpNOZ4CgQo9gOw8znbSC
	 4T54XVJtVNigk4qQgYSNT5bnhQL7GgpiWMGKkHB1+xsELWg2yN23neB58PcXuPcFhb
	 sHKzcCS/jvzeCN3oXoCzCQDNaaS3fBsZKf78RwWzIFe8w04Lb0FI0YXPTOdxONksnw
	 nF3tNTYFeL84t76nu4zo7Z3DySBIDtQq+XR7yyepujHhgaEbozm8Oosj1g170rXhtj
	 nt91ANdW8fNBkZLLTLReWrE9si7+KalxTwVwqmsDOYf0AWVRu2hmKpU5DYj7RzGUMJ
	 tsBvRHeaknSSQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.dev,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 dan.carpenter@linaro.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241007085321.3991149-1-Vijendar.Mukunda@amd.com>
References: <20241007085321.3991149-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/3] Fixes and improvements related to amd soundwire
 machine
Message-Id: <172833661153.2566981.7852746403843852691.b4-ty@kernel.org>
Date: Mon, 07 Oct 2024 22:30:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: PLA6T5UWC46E5KIY3NIIEQQYZZQJEBDN
X-Message-ID-Hash: PLA6T5UWC46E5KIY3NIIEQQYZZQJEBDN
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PLA6T5UWC46E5KIY3NIIEQQYZZQJEBDN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 07 Oct 2024 14:23:18 +0530, Vijendar Mukunda wrote:
> This patch series consists of smatch error fixes and code improvements
> related to amd soundwire generic machine driver.
> 
> Vijendar Mukunda (3):
>   ASoC: amd: acp: fix for inconsistent indenting
>   ASoC: amd: acp: fix for cpu dai index logic
>   ASoC: amd: acp: refactor sof_card_dai_links_create() function
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: amd: acp: fix for inconsistent indenting
      commit: 914219d74931211e719907e0eed03d8133f8b1b7
[2/3] ASoC: amd: acp: fix for cpu dai index logic
      commit: 7ce8e4d380d68f34edc96c7efcf95b1476e7f033
[3/3] ASoC: amd: acp: refactor sof_card_dai_links_create() function
      commit: 0372abfcd81a4db94070d235e1ae3ff928efcab9

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

