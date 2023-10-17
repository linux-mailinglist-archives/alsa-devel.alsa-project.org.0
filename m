Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BE77CCA04
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 19:41:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D004D852;
	Tue, 17 Oct 2023 19:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D004D852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697564474;
	bh=0XW0onhMsdWHTogZuCFXILzxbu1EahYG2jAHnvIRFiI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lYLRhGMjZUZKQQtGTQ+YeXzyh3nhdzdh+VMcfxgMOAXtEOVg+esErQGv7PCMshomX
	 NPIQd4lq1+MelEJDFbk9qQLjiRyZMISelTr2cN2S/4KqJzHETdu7rsqegwWznU8NXr
	 0aNq8iItqW/1/3z6jQnB3Befxn+2och1LNgiP5EU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D1CFF8024E; Tue, 17 Oct 2023 19:40:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99322F8024E;
	Tue, 17 Oct 2023 19:40:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DB99F8027B; Tue, 17 Oct 2023 19:39:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44519F8024E
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 19:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44519F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Rw6hcHRo
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 08B10CE2075;
	Tue, 17 Oct 2023 17:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73614C433CB;
	Tue, 17 Oct 2023 17:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697564387;
	bh=0XW0onhMsdWHTogZuCFXILzxbu1EahYG2jAHnvIRFiI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rw6hcHRoSeoapz3OQTXjIuZxdryPugYP8E+cShs6K+4+QzVkPCmtPR6Fp+03Asz4P
	 t17VNQMBGnZsEGuW9jn5sxL1OABwon+z58CxBVYLb8VsrZGgloXB4KNJveklGCYlfm
	 DlzlasgrRO+leNYvBUaSZG++brezMhCaB1AZhmcQRZrNTP+e2mBqdFpaTIrkQTSHVl
	 g2Ow7GKIW0Xs+6E9ZQOrWatwzNYA1OuX3IelnVGnrEa+jzrdo7Mif8rMybaDTvbMHw
	 e/vAhlEB+ZSvTRhriVTelOw+a5jDZ4clQLTA1rtT5rkE0Or6CwdSg5QdDTh6A/If4e
	 mFdmtBcFPwvXg==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20231017071939.953343-1-Vijendar.Mukunda@amd.com>
References: <20231017071939.953343-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: ps: enable wake capability for acp pci
 driver
Message-Id: <169756438519.1863854.149905912969891191.b4-ty@kernel.org>
Date: Tue, 17 Oct 2023 18:39:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: Y5DR3QOZKSQECX62PTG23TZJ5YO4XPDE
X-Message-ID-Hash: Y5DR3QOZKSQECX62PTG23TZJ5YO4XPDE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y5DR3QOZKSQECX62PTG23TZJ5YO4XPDE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 17 Oct 2023 12:49:36 +0530, Vijendar Mukunda wrote:
> Enable wake capability for acp pci driver for Pink Sardine
> platform.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: ps: enable wake capability for acp pci driver
      commit: 70227e1574e47a759422beec78675f1c19e56e25

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

