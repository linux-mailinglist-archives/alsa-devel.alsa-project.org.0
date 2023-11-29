Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 898F47FE1A4
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 22:18:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58EBCDEF;
	Wed, 29 Nov 2023 22:18:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58EBCDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701292731;
	bh=zjroZ4QizTDpv6VelU2kE8o4muDeYZ4T2Ye9AJFVwMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Fp2eUYCvmK0Vy2ze0G3cgGUtTgHv8p8lBy48arrDVmn4VnJFs0N9ZuKPUdp66azBl
	 XFrvLq/nDc/W1I8vD/sdGf2CAT8r969FPqrwSCHTNIlqNUZf6jspWWiHQcgLnpe8zs
	 VvNezBiJ3o0M70dW5hcgBF81cS4fuAZy3XC102UA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C60B2F80571; Wed, 29 Nov 2023 22:18:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE66EF80571;
	Wed, 29 Nov 2023 22:18:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4181F8016E; Wed, 29 Nov 2023 22:18:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98D58F8007E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 22:18:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98D58F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rAArUxbt
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8B349B84027;
	Wed, 29 Nov 2023 21:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBACC433C8;
	Wed, 29 Nov 2023 21:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701292682;
	bh=zjroZ4QizTDpv6VelU2kE8o4muDeYZ4T2Ye9AJFVwMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rAArUxbtM+j4rCmKl3RWqtqa5K/gk6w10YpTrrq2tIJxQzVR02YtCZ4LIVuiCTxR5
	 an7aKu0isjep/gxN/H25zICbpcSqvDYZZrz0lEoBxTjIpqs5FoU6H+lX6cHSmcayZ1
	 Q/BWpIsXhEfnZ333Da0EMHD9Bz0wRq6Zl+N9sfaEUkn5jfnqXlKqeFHKdi3r2072Rr
	 mH/untkI4jNuaYKe31Jymkb559ETzqTFcfF4mCLDuIpWGnMVYMjUvW+tGVS1X457/C
	 mUmxm6UUWNKmMN4SG0VaTCHZ15CyM1Ww3P4DLfPGNZQSDDXPjqNSMsavy2RuEB/YUf
	 nzxaOL1Bgxl0A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.com, yung-chuan.liao@linux.intel.com
In-Reply-To: <20231129131411.27516-1-peter.ujfalusi@linux.intel.com>
References: <20231129131411.27516-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: ipc4-topology: Correct IPC message
 struct layouts
Message-Id: <170129268022.323590.12416749966996283844.b4-ty@kernel.org>
Date: Wed, 29 Nov 2023 21:18:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: N4EOX3EOUL2D24NYODXJOJYQZTQ6SPO3
X-Message-ID-Hash: N4EOX3EOUL2D24NYODXJOJYQZTQ6SPO3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N4EOX3EOUL2D24NYODXJOJYQZTQ6SPO3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 29 Nov 2023 15:14:09 +0200, Peter Ujfalusi wrote:
> The SRC and GAIN module defined it's kernel side private struct in a way that
> part of that is used as IPC message without making sure of proper alignment and
> padding, which happens to work but it is better to be not 'clever' about these
> sort of things.
> 
> The two patch corects this overlooked detail.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: ipc4-topology: Correct data structures for the SRC module
      commit: 2cf4da68a480f999ce1327a23557fad7b6dd80dd
[2/2] ASoC: SOF: ipc4-topology: Correct data structures for the GAIN module
      commit: c7095d154ddf40b6221118a0bbf30e68d78460b3

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

