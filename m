Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCE8781263
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 19:53:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A874EBA;
	Fri, 18 Aug 2023 19:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A874EBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692381219;
	bh=iLvN5LUFc3qzwimwDQQmeQYT6TSxJS88Gz7h4Iz66/A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lrVPGmNYMytUTVUXAyj0wgQwf6gJL3CGDgKUXDwbIw57VE6I/DnryQySd2bpvJx5j
	 OP1EgCum08mv84q1krxJ1xhrPKxB1ehI4tajnVC6p4sLYgGSmDjFtkrz3mXzuIeKNg
	 9AjKvEqNyYNdbHSqfm1FdaBUFHFfcqf0c4ymvXF0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66464F80558; Fri, 18 Aug 2023 19:51:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7B47F80549;
	Fri, 18 Aug 2023 19:51:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D9B4F801EB; Fri, 18 Aug 2023 19:51:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DD22F800EE
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 19:51:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DD22F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pOokOidF
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A70AA634A6;
	Fri, 18 Aug 2023 17:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F886C433CD;
	Fri, 18 Aug 2023 17:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692381106;
	bh=iLvN5LUFc3qzwimwDQQmeQYT6TSxJS88Gz7h4Iz66/A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pOokOidFvAk3Pz6im4cQ5KDv3GlICSkoGkuXTlsRn2/Q5hOgU+3plZGnQIJ+vR6Wm
	 702mNoxaR0/dwxU4Kp8n4Q25QakrrFw3S1wzQYd7SMZfifDahmMjSyG1dJS0Nkpa3+
	 LHkZn47TI67o/HjgIDpN2bT2iSBbfCKoV/877C/Ud1YRhAqTMWf5WPspFBXk9L5YvS
	 RcrewrbSEhbz8mmVN1KQgIDRlonulEGCfQmLLE3LYqBWqvanj7bGd/VuvPl939/f17
	 tUCOmkvD3DxcPUcoLIpMDIokJdkm1IdGfq6A+qO1mQpfEskkHKKMBjiHDeqivELXBr
	 l5WDTJVGULs4A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20230818080314.32991-1-alpernebiyasak@gmail.com>
References: <20230818080314.32991-1-alpernebiyasak@gmail.com>
Subject: Re: [PATCH] ASoC: amd: acp: Add kcontrols and widgets per-codec in
 common code
Message-Id: <169238110424.55727.14056670602872102489.b4-ty@kernel.org>
Date: Fri, 18 Aug 2023 18:51:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: TQ5YYSCOROK7F3HZLDUALORYJPDG4AOX
X-Message-ID-Hash: TQ5YYSCOROK7F3HZLDUALORYJPDG4AOX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQ5YYSCOROK7F3HZLDUALORYJPDG4AOX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 18 Aug 2023 11:03:14 +0300, Alper Nebi Yasak wrote:
> Commit 7ac3404c2e21 ("ASoC: amd: acp: Map missing jack kcontrols") adds
> card kcontrols and DAPM widgets corresponding to jacks for Headphone and
> Headset Mic. But these were already being added in acp-legacy-mach.c and
> acp-sof-mach.c, so this causes a probe error:
> 
>   sof_mach rt5682s-hs-rt1019: control 2:0:0:Headphone Jack Switch:0 is already present
>   sof_mach rt5682s-hs-rt1019: ASoC: Failed to add Headphone Jack Switch: -16
>   sof_mach rt5682s-hs-rt1019: devm_snd_soc_register_card(sof-rt5682s-hs-rt1019) failed: -16
>   sof_mach: probe of rt5682s-hs-rt1019 failed with error -16
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Add kcontrols and widgets per-codec in common code
      commit: 919a4a941863c539e982d34903e93d9777316f7d

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

