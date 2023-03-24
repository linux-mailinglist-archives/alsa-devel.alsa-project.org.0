Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D56306C8281
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 17:39:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12B93E9E;
	Fri, 24 Mar 2023 17:38:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12B93E9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679675943;
	bh=DQY9ctg3T+c6abapIIjPB3Hmid4K/GBraiBtzjZ+RI8=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LrGlUeaBmg93aMQANpoEiDEypw6xKWbl3mSD4DRBmtK+w4VlqCuXNoSQlXu4Vo2tM
	 WKPnbonnRU1njS4wihehVRMVrG8dgCIurzVs6FttQH3qA3wCV8w0mMNBcbaKLmZFyL
	 dxT0ONgRffoKXOlIjFBEkAB9MmsISRYGatX30wQw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2DB1F8052D;
	Fri, 24 Mar 2023 17:37:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DE59F802E8; Fri, 24 Mar 2023 17:37:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A97AF8024E
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 17:37:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A97AF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DCD+lb6I
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6A242B82465;
	Fri, 24 Mar 2023 16:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B795C4339C;
	Fri, 24 Mar 2023 16:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679675838;
	bh=DQY9ctg3T+c6abapIIjPB3Hmid4K/GBraiBtzjZ+RI8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DCD+lb6IJt2QwJB8SJwL8szjw+XqxJt/CqpGGgr/CPpDbacxr2MJvPKclFmAsOsHt
	 AEDigOOkXKXCcG+E1S65Qev0bJ1n2AgKX3lEN89uYQzYG8TV4cjbI4JevxpoFUJjaW
	 Ise7lvI4btSE7/uypS3ZX0mF7lo4QWmP/yQTup4e3raNMT55gQTLzVN5CL/CSaFUMw
	 fegC9OBzwd02KsTt8X/bAdNTmqsJnc+W/1+Ptnq0Ml1Hy2Usw3eM6VGWwD4VukKjrP
	 0s22Oehpdh5ixSm0Jt7Cj9uznttock+nhUL6QX/h9E1VhdITddhbosYezRdKLbM+hV
	 uD6vWTFqhcCrw==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20230324124019.30826-1-daniel.baluta@oss.nxp.com>
References: <20230324124019.30826-1-daniel.baluta@oss.nxp.com>
Subject: Re: [RESEND PATCH] ASoC: soc-compress: Inherit atomicity from DAI
 link for Compress FE
Message-Id: <167967583502.2616375.6057575229781952766.b4-ty@kernel.org>
Date: Fri, 24 Mar 2023 16:37:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: LB5M2A2TVABP4YIKRYYWGPUZPJ3NWBJN
X-Message-ID-Hash: LB5M2A2TVABP4YIKRYYWGPUZPJ3NWBJN
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com, vkoul@kernel.org,
 daniel.baluta@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LB5M2A2TVABP4YIKRYYWGPUZPJ3NWBJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 24 Mar 2023 14:40:19 +0200, Daniel Baluta wrote:
> After commit bbf7d3b1c4f40 ("ASoC: soc-pcm: align BE 'atomicity' with
> that of the FE") BE and FE atomicity must match.
> 
> In the case of Compress PCM there is a mismatch in atomicity between FE
> and BE and we get errors like this:
> 
> [   36.434566]  sai1-wm8960-hifi: dpcm_be_connect: FE is atomic but BE
> is nonatomic, invalid configuration
> [   36.444278]  PCM Deep Buffer: ASoC: can't connect SAI1.OUT
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-compress: Inherit atomicity from DAI link for Compress FE
      commit: 37b58becc1cee4d591024f2056d7ffa99c6089e0

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

