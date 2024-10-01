Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD65B98C4D8
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 19:53:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 493807F8;
	Tue,  1 Oct 2024 19:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 493807F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727805230;
	bh=V234jebYcblKJHaW08SlVHYoHv/9EbT1j3IuhFaCA6c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zux4AMnchRK8azPbw62UhbXcp4tAYK+f+WW1YctUkw10Sj1wgGu8kzgpvY9sXB6+B
	 wVyDm5Epd0H5MBAxIGDqSwWsQmVrt4yAc83xNKfB66Q/kg+z2fYrlvKCARax0s30Nu
	 QJyMstkCru+ysQYEoejLpcP9CAxurckJP+hncNJs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBF42F805AF; Tue,  1 Oct 2024 19:53:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03D54F805B1;
	Tue,  1 Oct 2024 19:53:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B33F1F80517; Tue,  1 Oct 2024 19:53:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91524F80104
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 19:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91524F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Rflcr7Z/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F23315C2783;
	Tue,  1 Oct 2024 17:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE149C4CEC6;
	Tue,  1 Oct 2024 17:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727805188;
	bh=V234jebYcblKJHaW08SlVHYoHv/9EbT1j3IuhFaCA6c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rflcr7Z/6fGAXVpxP4bcU1glKPbGggbNHSOZfP0soZhN1YPEIf7AIAvBR7dWeRVSE
	 3+Aiv6g3fJmCL0WVU6D17Zw6pdNhZ5D1KQw/f7aRFGI5DW22HYu64I9oXQVxvI7aRf
	 QarMvEEv0UHGxyVM+eBuMRrTx6TWf3ufHPJUzfwxgdJbnUMiSD508Iv6dYtSlJxzvX
	 5sR1HeW3SC4WFPJ4WkMwA+u6o3aAm+Iz+QKXRE5cI9zhy3ECrL2N/ZxDSo+HbX3Bog
	 1qufKeosWZVE/r/pFj00KrFDn0YeJkxHAv2UQbRS9ROy3Qlmv7X2gt3erZPbptFuG7
	 kiQFV/otleXZw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240918061540.685579-1-Vijendar.Mukunda@amd.com>
References: <20240918061540.685579-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/8] ASoC: amd: acp: refactor acp version
 differentiation logic
Message-Id: <172780518563.2298697.14487896281426250267.b4-ty@kernel.org>
Date: Tue, 01 Oct 2024 18:53:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: RCHTKUUYRGUHS4UDDU26X5V6BUDPVUZX
X-Message-ID-Hash: RCHTKUUYRGUHS4UDDU26X5V6BUDPVUZX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RCHTKUUYRGUHS4UDDU26X5V6BUDPVUZX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 18 Sep 2024 11:45:32 +0530, Vijendar Mukunda wrote:
> Currently different logics being used in the code for acp version
> differentiation. This patch series refactors the code to use acp pci
> revision id for handling acp version specific code.
> 
> Vijendar Mukunda (8):
>   ASoC: amd: acp: simplify platform conditional checks code
>   ASoC: amd: acp: use acp_rev for platform specific conditional checks
>   ASoC: amd: acp: use acp pci revision id for platform differntiation
>   ASoC: amd: acp: store acp pci rev id in platform driver private
>     structure
>   ASoC: amd: acp: pass acp pci revision id as platform data
>   ASoC: amd: acp: remove unused variable from acp_card_drvdata structure
>   ASoC: amd: acp: replace adata->platform conditional check
>   ASoC: amd: acp: remove unused variable from acp platform driver
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: amd: acp: simplify platform conditional checks code
      commit: 839a8b18dbd2e2345a261169fb68d950a1071862
[2/8] ASoC: amd: acp: use acp_rev for platform specific conditional checks
      commit: fca471b5d094dabd65f6d8777096e9ed1df1bef7
[3/8] ASoC: amd: acp: use acp pci revision id for platform differntiation
      commit: 5dbf8a19fe5d5a4c764ba88d171b06704354296a
[4/8] ASoC: amd: acp: store acp pci rev id in platform driver private structure
      commit: 40412a298c77eaa4a22a1aa7030bcc0b2e02c618
[5/8] ASoC: amd: acp: pass acp pci revision id as platform data
      commit: 0eae2c96b49d85b31ab635b9dc6f09b09d3c54de
[6/8] ASoC: amd: acp: remove unused variable from acp_card_drvdata structure
      commit: 2e609185e174a9ffd462ab125085ddfcbe9e2f4d
[7/8] ASoC: amd: acp: replace adata->platform conditional check
      commit: b33d93990e3774a24575517c6fcc2167036672d1
[8/8] ASoC: amd: acp: remove unused variable from acp platform driver
      commit: 9864c8af89eb14a2e5334f8e24bb82086182e894

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

