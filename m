Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23665722592
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 14:24:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41CB0829;
	Mon,  5 Jun 2023 14:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41CB0829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685967878;
	bh=Tako9Jjn1qXwfvMcNXryNFwd01oKCbgQ/tQ/2ZULMhM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BhSTwszvCmZb+bC9oIDVFq3kbvVgjv/rz0tNPaUoOcNJiDZoS355SQBHcUNln+641
	 oXsJOYGeEMUGWhaccAjlQWox5Chbr7nNABROpiRx1JQ0m2kHFDKC/wejJ7Yq6/e9Xq
	 gdaE6WxUpbjGhOtNLLHTkmalCoXdIJiA8cNw794A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73677F80553; Mon,  5 Jun 2023 14:23:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6BDAF80548;
	Mon,  5 Jun 2023 14:22:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D0C4F80199; Mon,  5 Jun 2023 14:22:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5988BF8016C
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 14:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5988BF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Lv8we7ie
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3BF96135F;
	Mon,  5 Jun 2023 12:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DD9C433EF;
	Mon,  5 Jun 2023 12:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685967769;
	bh=Tako9Jjn1qXwfvMcNXryNFwd01oKCbgQ/tQ/2ZULMhM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Lv8we7ieDx+RY6Ldb4aRrIR5GFCyFjxfCSZ0xxzNiw0bwbyw5JEs3vSwIz6V4eYpv
	 2nMbOP7OdL3OXeBzXzjDUEqLfHoWwRusjOxPoo5rW89MKNIcdE6AVlgWnmH1m/v71F
	 qI8jpgDR14+ps4sAYYKt3Nz3pP9YpA1PORDX/kANuxqklpADEXC8ON+vUyevyDN23s
	 Lq/kN7V6wYlL40QtF7aHpplwKZU05d5F9oVk9uGsg2QCDahNB4L5FYJlp+jOTqkds+
	 Phz4nnFZyYXTiLyGlFsKbYl7Je2/+GlUFcNK2cBSPLo2NsG/n9IUrOQiZaAKIcHVJY
	 lo1+aQYmIjtpQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Randy Dunlap <rdunlap@infradead.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230602124447.863476-1-arnd@kernel.org>
References: <20230602124447.863476-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: amd: vangogh: select CONFIG_SND_AMD_ACP_CONFIG
Message-Id: <168596776700.22528.17027039625806220969.b4-ty@kernel.org>
Date: Mon, 05 Jun 2023 13:22:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: O3HEJVBB4WIN2HQAIGN76VDB7NHCPY6V
X-Message-ID-Hash: O3HEJVBB4WIN2HQAIGN76VDB7NHCPY6V
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O3HEJVBB4WIN2HQAIGN76VDB7NHCPY6V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 02 Jun 2023 14:44:39 +0200, Arnd Bergmann wrote:
> The vangogh driver just gained a link time dependency that now causes
> randconfig builds to fail:
> 
> x86_64-linux-ld: sound/soc/amd/vangogh/pci-acp5x.o: in function `snd_acp5x_probe':
> pci-acp5x.c:(.text+0xbb): undefined reference to `snd_amd_acp_find_config'
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: vangogh: select CONFIG_SND_AMD_ACP_CONFIG
      commit: 812a05256d673b2b9c5db906775d1e6625ba4787

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

