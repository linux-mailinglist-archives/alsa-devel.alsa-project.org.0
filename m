Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D3885CD1C
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 01:52:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0890E847;
	Wed, 21 Feb 2024 01:52:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0890E847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708476747;
	bh=cus2iwaXW84ognaMM49j+z1rlDGkGcW+6/WiXWamahE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EouiQ9jUEibR8ybm+IyJsfXrZWRFVglwOqCgCXJyne65TVoRmOY1G/CUYFG40IwWT
	 BNWS6T67qqN43F0w9qRiECLvCoQHuNemw163z2TB7sIR2aVIuFTvrUiSgRKS9hnYoN
	 CFpJtCXfjq2a77rf9F+KMc1rylbxor8b4mgK/bX0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EB7FF805A0; Wed, 21 Feb 2024 01:51:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45381F8059F;
	Wed, 21 Feb 2024 01:51:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC553F80496; Wed, 21 Feb 2024 01:51:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57A6EF800ED
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 01:51:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57A6EF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dzIIh7bf
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3A361CE1BC7;
	Wed, 21 Feb 2024 00:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782D1C433C7;
	Wed, 21 Feb 2024 00:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708476700;
	bh=cus2iwaXW84ognaMM49j+z1rlDGkGcW+6/WiXWamahE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dzIIh7bfuiptnNznsNXeH5o9LEzfqNAuZ1GtMgqCzwm+qCK0ujePcwDTcEPseDAzc
	 hRFu8ZfTOIi3gMWB+RBMLu4b/c/TQOT16GUBjE3N7FyqypPQD7xvubFsfji6fbAy73
	 sR6OgHJriElGDgOsW6akpmfO34tSdgLQnK9A8Dy4u0EPtjJyj94ruKsLq3JQx3nXIG
	 m1vI8DvDr7wIc4c/F+POFL4cv4t/xM2pVh3k1OWhpKMi3y6YUfCmMoJbGJ+srpmwaF
	 bUT/q9rwF7kVyNM6Du2wxAqzrEky/8W4LvteznpAeTEYHbB2mgRSxtYys8eI4VYTWk
	 FXPN6ekcM3xKg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240216140535.1434933-1-rf@opensource.cirrus.com>
References: <20240216140535.1434933-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Must clear HALO_STATE before issuing
 SYSTEM_RESET
Message-Id: <170847669920.72316.9216524053259588241.b4-ty@kernel.org>
Date: Wed, 21 Feb 2024 00:51:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: ZZKMFZ4VQSVGWZJ3CJW224YVOOYZQGOS
X-Message-ID-Hash: ZZKMFZ4VQSVGWZJ3CJW224YVOOYZQGOS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZZKMFZ4VQSVGWZJ3CJW224YVOOYZQGOS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 16 Feb 2024 14:05:35 +0000, Richard Fitzgerald wrote:
> The driver must write 0 to HALO_STATE before sending the SYSTEM_RESET
> command to the firmware.
> 
> HALO_STATE is in DSP memory, which is preserved across a soft reset.
> The SYSTEM_RESET command does not change the value of HALO_STATE.
> There is period of time while the CS35L56 is resetting, before the
> firmware has started to boot, where a read of HALO_STATE will return
> the value it had before the SYSTEM_RESET. If the driver does not
> clear HALO_STATE, this would return BOOT_DONE status even though the
> firmware has not booted.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Must clear HALO_STATE before issuing SYSTEM_RESET
      commit: e33625c84b75e4f078d7f9bf58f01fe71ab99642

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

