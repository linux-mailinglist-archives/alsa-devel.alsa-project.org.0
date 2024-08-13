Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8800D9509A7
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 18:00:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 933A927A6;
	Tue, 13 Aug 2024 18:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 933A927A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723564834;
	bh=7GeuAkDztQNplE6PjsDW4V6w3YAvYYPSKCwdxojbmZg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bWWquh8C3tM8RDyabJiGywYUKXbuS1aSv+VfydOkUg1e4ym0HuyGwGBfUo6TMRpSq
	 ITNQkXmDa28n3LYBRe+MaVQ+TBu2FA6fafXAYBodY9LSZcrcv/q8FbBs6HVcLEmsHk
	 NsjWzdhKw0PZpCaCfE59l7+8ZtgsxLDrTMuM2wK4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80CA9F80605; Tue, 13 Aug 2024 17:59:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 695E8F805EC;
	Tue, 13 Aug 2024 17:59:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5D2EF8047C; Tue, 13 Aug 2024 17:59:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A5FDF80423;
	Tue, 13 Aug 2024 17:58:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A5FDF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ivc/z1rC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CDA8A61769;
	Tue, 13 Aug 2024 14:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57597C4AF09;
	Tue, 13 Aug 2024 14:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723560779;
	bh=7GeuAkDztQNplE6PjsDW4V6w3YAvYYPSKCwdxojbmZg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ivc/z1rCksasX0MTqTWoh5kIzd6Rw2+9rIY7cyl0EOmrJVJWhP+QTmqR/f8FvbKhZ
	 1qBJ+MoB6TcvzV1s1kJcdL/gCn/4LmEgLRDvaDWR3jHh6EACQL/QoMVMwtNXA71Ij+
	 SR1QIPdcZwqBgqSfcqCyMoIXsdCR5Ts85fWkS8w40DZxCUGdfxqANaXpCjga52+uMy
	 z+aggXNt8KN5IStsClmk7wMVQLOR1JE+lrbKB97GGXEqIMawwDUzXx5HAVJsoZ5g/y
	 w9l2SQfFGuFkbhy9fhCaazsOCdVmK+kxfZHhG1pfnb6YvGH8JxT8jaEwIey2HKaPTZ
	 RXnAIm/o1conw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, venkataprasad.potturu@amd.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
 ranjani.sridharan@linux.intel.com, perex@perex.cz, tiwai@suse.com,
 cristian.ciocaltea@collabora.com, sound-open-firmware@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 kai.vehmanen@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20240812110514.2683056-1-Vijendar.Mukunda@amd.com>
References: <20240812110514.2683056-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: amd: move iram-dram fence register
 programming sequence
Message-Id: <172356077609.62411.17348863586201066528.b4-ty@kernel.org>
Date: Tue, 13 Aug 2024 15:52:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: 6JXVTQRFG37LLWDPZ3SLBUVBQBW5NFZF
X-Message-ID-Hash: 6JXVTQRFG37LLWDPZ3SLBUVBQBW5NFZF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6JXVTQRFG37LLWDPZ3SLBUVBQBW5NFZF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 12 Aug 2024 16:35:09 +0530, Vijendar Mukunda wrote:
> As per design, ACP iram-dram fence register sequence should be initiated
> before triggering SHA dma. This ensures that IRAM size will programmed
> correctly before initiaing SHA dma.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: amd: move iram-dram fence register programming sequence
      commit: c56ba3e44784527fd6efe5eb7a4fa6c9f6969a58
[2/2] ASoC: SOF: amd: Fix for incorrect acp error register offsets
      commit: 897e91e995b338002b00454fd0018af26a098148

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

