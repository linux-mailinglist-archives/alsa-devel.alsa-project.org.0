Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEA2759B0E
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 18:41:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 833251F4;
	Wed, 19 Jul 2023 18:40:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 833251F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689784877;
	bh=hpd4KDlCVbb9UV25Db6X99cNQA41UhTFbnri/UeLO4s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PO5MuhLQ4Lcyz3BXDHdMKJdZyO1gjfrywoZRWXpT/l8xckLrpXJhZwonS0V6Un40h
	 ShD7wnXPDGMtpApkRCHRwy3EDw7ZW1N0atGPWV3oPf5mlt5OM+3CkbYd0axo9PLZE9
	 08s5HM4Lbwfid1NHJBIfOj8+xagp4LknLz8nK6vY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 145F0F8047D; Wed, 19 Jul 2023 18:40:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A44DF8032D;
	Wed, 19 Jul 2023 18:40:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEA66F8047D; Wed, 19 Jul 2023 18:40:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EC3DF80153
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 18:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EC3DF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gb5p8/FF
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4583060CFA;
	Wed, 19 Jul 2023 16:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9EFC433C8;
	Wed, 19 Jul 2023 16:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689784814;
	bh=hpd4KDlCVbb9UV25Db6X99cNQA41UhTFbnri/UeLO4s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gb5p8/FFPdXgyqBN38mcYLDnewxT6m393E4gbTv/WXBaiI2Bwo8PLLRWltYWtZfB4
	 0msKE3w9/9B5XBeq/sV0HCGSZZfc9gaE+EMElMGNAGEwNwpin6Ryjju9EUglxw/IYz
	 6jsdDYW34QwTZGA4SN7BlK3iCqxg2BmZwu6rwr8gxBqoCkATijX1tX1V+SdGpS026l
	 dR+5zHnLz2Xe8enBIxQ6IwrFNg5r9zzeO6UgxFIiswtYkZdrREK5ARTUjrSuw9MLzl
	 7sT/sRyNu4pm/WoQxAeyYxU+2pP2EyFJv3JlPtg76CNQ846nqJslMFCwN9y1YeWLZg
	 veM4cm+kPbplg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230719130846.633701-1-arnd@kernel.org>
References: <20230719130846.633701-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: amd: acp: fix SND_SOC_AMD_ACP_PCI depdenencies
Message-Id: <168978481190.111081.12971357887459390811.b4-ty@kernel.org>
Date: Wed, 19 Jul 2023 17:40:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: MHEVFVYRN2242YSWYVBDF67QCTJC5G2D
X-Message-ID-Hash: MHEVFVYRN2242YSWYVBDF67QCTJC5G2D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MHEVFVYRN2242YSWYVBDF67QCTJC5G2D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Jul 2023 15:08:37 +0200, Arnd Bergmann wrote:
> The new PM functions require code that is part of the snd-acp-legacy-common
> module:
> 
> x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o: in function `snd_acp_resume':
> acp-pci.c:(.text+0x23): undefined reference to `acp_init'
> x86_64-linux-ld: acp-pci.c:(.text+0x58): undefined reference to `acp_enable_interrupts'
> x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o: in function `snd_acp_suspend':
> acp-pci.c:(.text+0x89): undefined reference to `acp_deinit'
> x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o: in function `acp_pci_remove':
> acp-pci.c:(.text+0xec): undefined reference to `acp_deinit'
> x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o: in function `acp_pci_probe':
> acp-pci.c:(.text+0x26b): undefined reference to `acp_init'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: fix SND_SOC_AMD_ACP_PCI depdenencies
      commit: 4edc07fc7fe1a9eec1a4ebc518d2dec222382f43

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

