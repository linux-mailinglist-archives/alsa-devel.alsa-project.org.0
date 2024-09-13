Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9194D978645
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 18:55:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AF12DEE;
	Fri, 13 Sep 2024 18:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AF12DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726246532;
	bh=2KDVnb1mVoYZypPCGHyU3wETUgQJZHVz0zgPgKiRHYk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gIcZlr+GDrNE2dD+ChnD2TIZzB5C7OaMzBkDxnpBeKQrjYVaE5djuVDW4rDtZf0ET
	 3Kjovlc9pZouS1IWnf4CKgJaSLOBLg6iF7i8RxWhhJzXFfdU6xKCf+IY6zYjuSeMf2
	 IDXtMD2mbKAVjOYXtB23+M37ZmpAZ5aOw1ddtn/k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72071F805B5; Fri, 13 Sep 2024 18:55:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97126F8019B;
	Fri, 13 Sep 2024 18:54:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 658A0F801F5; Fri, 13 Sep 2024 18:54:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97AFDF800E9
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 18:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97AFDF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=odY/Np3c
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 740F35C59E2;
	Fri, 13 Sep 2024 16:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7245C4CEC0;
	Fri, 13 Sep 2024 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726246489;
	bh=2KDVnb1mVoYZypPCGHyU3wETUgQJZHVz0zgPgKiRHYk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=odY/Np3c3Gzd5x2Q4jugOAU9hIffgYQcI2j9IIqzDC8hh6KoiETUl68HWd79j6pTd
	 jf+XSs8AMJl7JCqaVsBC4AuibrZegs4eh6O+YO7LttAEBJtuk8siM7PcJwfOqav3kP
	 Vw6Jtn2R39G6rg0vr6KY2XAIJ9rTtprH1uZ4BuKsBxCTLhZdeVz4ujmh6Gs4Xhgbmx
	 bNsT04YbJFCKajSiVNpIJtqL46m28JNiEgoQ6NFBORi8Wydiqcl+atlcFCzMsbB3D+
	 4V+Gss6CVxBhiYNYiLdvsZs/1ORfbCEiLguYNw8qa8Tzjo2cM3syClFO2GKpjS1dyG
	 gpEsAtXK4UqaQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, kai.vehmanen@linux.intel.com,
 ckeepax@opensource.cirrus.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240913090631.1834543-1-Vijendar.Mukunda@amd.com>
References: <20240913090631.1834543-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/5] AMD SoundWire machine driver code refactor
Message-Id: <172624648667.60960.3648714524641692495.b4-ty@kernel.org>
Date: Fri, 13 Sep 2024 17:54:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: Z3T6XSZO476PHGPO5JVCYFUUJ7P4STWB
X-Message-ID-Hash: Z3T6XSZO476PHGPO5JVCYFUUJ7P4STWB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z3T6XSZO476PHGPO5JVCYFUUJ7P4STWB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 13 Sep 2024 14:36:26 +0530, Vijendar Mukunda wrote:
> This patch series moves common Soundwire endpoint parsing and dai
> creation logic to common placeholder from Intel generic SoundWire
> machine driver code to make it generic. AMD SoundWire machine driver
> code is refactored to use these functions for SoundWire endpoint
> parsing and dai creation logic.
> 
> Link: https://github.com/thesofproject/linux/pull/5171
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: intel: sof_sdw: rename soundwire endpoint and dailink structures
      commit: f5c05fd7e9d20a3a8f3401b467fec2d24f49ea5a
[2/5] ASoC: intel: sof_sdw: rename soundwire parsing helper functions
      commit: 23f020bd607b7aec5f301699227ed196430fbc40
[3/5] ASoC: sdw_util/intel: move soundwire endpoint and dai link structures
      commit: 7860df5b29945cfab40dd667f576af31401d7c43
[4/5] ASoC: sdw_utils/intel: move soundwire endpoint parsing helper functions
      commit: 13b24f84782d6c0373f62eb645353883d94d1dcd
[5/5] ASoC: amd: acp: refactor SoundWire machine driver code
      commit: 6d8348ddc56ed43ba39d1e8adda13299201f32ed

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

