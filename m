Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D960766C8C
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 14:11:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7432FA;
	Fri, 28 Jul 2023 14:10:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7432FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690546264;
	bh=hr08sFblK2PlOHBQQDRMaZSE8Tvc3Mr5lVMZCkCBHRw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MCrePHX6hAXDpsaXN7GlyI3xb91Gx+ZDIlFDPryTiVsAYSii+cwrSsWjMUlSDFEJs
	 MdChzfqehAxGKB0pPEzi36YQX+xr5oD0Qw/OLK52Gx79NeCjhu4k5pRS59k+MgmRvK
	 8urfS8mf8aDUMZRH16F6JAInKbrcnImlkOcJZdQU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E030BF80153; Fri, 28 Jul 2023 14:10:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41548F80163;
	Fri, 28 Jul 2023 14:10:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 460DDF8019B; Fri, 28 Jul 2023 14:10:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A4265F80153
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 14:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4265F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SwzbVy6c
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C9C561FD0;
	Fri, 28 Jul 2023 12:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4484BC433C7;
	Fri, 28 Jul 2023 12:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690546198;
	bh=hr08sFblK2PlOHBQQDRMaZSE8Tvc3Mr5lVMZCkCBHRw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SwzbVy6cYmeWx/SRVOQeS+YJ7wKfyyPHbMJqy4AyPVXP6NH5iy8kfApCBZjfwSYqi
	 Vbs0/jrPCxfBhEnW8FEkxSNt0E2x45Bg3O7wTYRRwJwGLG49CUtuHulkZA6LgOMa/8
	 xUrhovw2RaAekvpI0xuZe64oYCnTdIRjOcCP8LeCNdj0mNY/GowG2nGyZV/tn/fGNO
	 Zt1UkhT7QTTOmQCskP8qorbeJeiMjnNYU724jjjbdyjUy0z7j4YkcsRTkxLDEyHx1F
	 Olc3B253LFitP7jNCn3yS0uecJrrNbAbgmrPO5n/4tAp99OMdZ9XoA1XDdmBpjz1b8
	 5On5h8rQc89iA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <20230712-asoc-st-maple-v1-0-46eab2c0ce23@kernel.org>
References: <20230712-asoc-st-maple-v1-0-46eab2c0ce23@kernel.org>
Subject: Re: [PATCH 0/5] ASoC: st: Use maple tree register cache
Message-Id: <169054619693.29528.3445761893950579970.b4-ty@kernel.org>
Date: Fri, 28 Jul 2023 13:09:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: CZBX64UVQ22BN537KNH7QE42K3Z6OXS4
X-Message-ID-Hash: CZBX64UVQ22BN537KNH7QE42K3Z6OXS4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CZBX64UVQ22BN537KNH7QE42K3Z6OXS4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jul 2023 19:44:26 +0100, Mark Brown wrote:
> The maple tree register cache has now got to the point where is is
> roughly feature compatible with the rbtree cache, let's convert the ST
> drivers to use the more modern data structure.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: sta32x: Update to use maple tree register cache
      commit: c8af46580b0f5300bb3df16b89f795f255cbcb65
[2/5] ASoC: sta350: Update to use maple tree register cache
      commit: 87256942e90242ec7ddeeba9f6b9433f01eec9be
[3/5] ASoC: sta529: Update to use maple tree register cache
      commit: 35959958df14542c68b0d0c1a7906838323fcbeb
[4/5] ASoC: stac9766: Update to use maple tree register cache
      commit: 4810c775484b373ec5c1c75f53bb9a09ba96a7ef
[5/5] ASoC: sti-sas: Update to use maple tree register cache
      commit: 66b1abc17c9d9e4af58098b9d6b8d7ade961e195

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

