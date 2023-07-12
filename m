Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BC67506BF
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:48:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D20C84D;
	Wed, 12 Jul 2023 13:47:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D20C84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689162507;
	bh=hfYmgTs7Yz+1w3C0SktKIFOEMa76BxiST1EdEAk09Q4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SmgFNRINDHlADlmKLA7TlX021YaIFRn5nW68ozggbAOpXTqD5tZuc1dNWqQlflMpL
	 t6pH12f/hpMoG1bpsFC21FIlu++WN8eckUVhVjPODVlN+myEBQ4YfGClL0pxKHrupC
	 r0JYUXWjkK8j+W0xhFZDHzvO44Gb/nublDelCOLg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E8C0F80568; Wed, 12 Jul 2023 13:46:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB1C9F80548;
	Wed, 12 Jul 2023 13:46:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53C7BF80153; Wed, 12 Jul 2023 13:46:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A7DFF80153
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 13:46:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A7DFF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fOLUgnhU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8966561783;
	Wed, 12 Jul 2023 11:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558FAC433C9;
	Wed, 12 Jul 2023 11:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689162398;
	bh=hfYmgTs7Yz+1w3C0SktKIFOEMa76BxiST1EdEAk09Q4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fOLUgnhU4q0iVGdPdmDW5i+/LrqwsYp2aZGxel7DeBPB+f5YnfskDWftfEnwL2drb
	 qLoLUtwdhUlVghGa+j0V3eF3+U/P+WokO4qMBEJH0nEwLMr8fAHVw8IRC+8od90qv6
	 /xj2tKWGYyZTIEwMq6LU4dKBAK2jFD/ll8Sg3XhDKKWvKn8WWL5/0FL88k63r1+nOJ
	 4hA4x46ndO05isGcZr5Gb1Bbdhu+L+nlE36ZqUQ15viYzlr27T4ep4zn7AWzTcWl6T
	 quKClbBE1isZWLNIpIg0w7xKhZLFe+OcaULKjA2FRrZo1MY/C3Nez1kvZzthpkVlcG
	 bKyrMGM34Wf5w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, shumingf@realtek.com, derek.fang@realtek.com
In-Reply-To: <20230621080750.13511-1-jack.yu@realtek.com>
References: <20230621080750.13511-1-jack.yu@realtek.com>
Subject: Re: [PATCH] ASoC: rt722-sdca: Remove redundant sdca mask
Message-Id: <168916239706.46574.15623314155634673300.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 12:46:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: QW7OSZAYQYBP5QC6UQB7W2SX3BZWDNJ4
X-Message-ID-Hash: QW7OSZAYQYBP5QC6UQB7W2SX3BZWDNJ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QW7OSZAYQYBP5QC6UQB7W2SX3BZWDNJ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Jun 2023 16:07:50 +0800, Jack Yu wrote:
> Remove redundant sdca mask for clear code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt722-sdca: Remove redundant sdca mask
      commit: 209fb30ee1c7edc6807ac94f98c9ce78b4891aed

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

