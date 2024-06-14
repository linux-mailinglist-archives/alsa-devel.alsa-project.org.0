Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3FC908D29
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2024 16:17:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFF07DF9;
	Fri, 14 Jun 2024 16:17:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFF07DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718374643;
	bh=EX6cdofRw4dUHQuRQKyswAwkF9oaLKdLL0bEeYpkN0c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rPqSNDrJpehTu6rgizp5bDGvYOUVcPCfUGrSk8HN0muiQLBMuP5Lfw9kJzJYx/YWy
	 lzSDBTRBT1puncHXvTSPq5mCnTx+F9l7x5dBYvyS04BSoqB9a2n+bDPMNFWSye+uWX
	 BYxELFZwWgyuFdyb0rr86Lnm2o2/yDcN9sxlnzfM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 582C8F805AC; Fri, 14 Jun 2024 16:16:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F8F8F80578;
	Fri, 14 Jun 2024 16:16:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36F83F80448; Fri, 14 Jun 2024 16:16:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1082F800E9
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 16:16:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1082F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rNDaWNoN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 45EFFCE29F3;
	Fri, 14 Jun 2024 14:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBF4C3277B;
	Fri, 14 Jun 2024 14:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718374588;
	bh=EX6cdofRw4dUHQuRQKyswAwkF9oaLKdLL0bEeYpkN0c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rNDaWNoNl/zru7fTjvTOIiOuAI2sWjyLC0jLShFLrCcVASyQYJffYY2aPSfo3uiL7
	 5IHl7sCy9XYPFPUfM5rKtpeAxNxAtcFMHH12uiaVxD/LGr/Ec7n+AnSujLyERoSibX
	 y281v4Ujdvlr22DRxTxVZlWouq8mV2ALSfB4b4QhjGgYZSBBeMZsiMfE62e+m2uXen
	 h/IKPANnC43gsAkqXyxhHnX32dPeuw10O+/E5+MSOp1vt9BzXDep5JvVTOPS8cCZsS
	 SoPjh5AHJio5+Sex1dxcADnn1SiegUd7+/WrQErP71e7wmL6AqqueZ8yc0Mt/XyTDP
	 zEYZs9IigIw6g==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240613090126.841189-1-amadeuszx.slawinski@linux.intel.com>
References: <20240613090126.841189-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: topology: Fix route memory corruption
Message-Id: <171837458634.276136.882653794696177346.b4-ty@kernel.org>
Date: Fri, 14 Jun 2024 15:16:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14-dev-0bd45
Message-ID-Hash: T7S2S6LDZ43RY7ZSOCPOIHZPTK67JLSY
X-Message-ID-Hash: T7S2S6LDZ43RY7ZSOCPOIHZPTK67JLSY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T7S2S6LDZ43RY7ZSOCPOIHZPTK67JLSY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jun 2024 11:01:26 +0200, Amadeusz Sławiński wrote:
> It was reported that recent fix for memory corruption during topology
> load, causes corruption in other cases. Instead of being overeager with
> checking topology, assume that it is properly formatted and just
> duplicate strings.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: topology: Fix route memory corruption
      commit: 0298f51652be47b79780833e0b63194e1231fa34

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

