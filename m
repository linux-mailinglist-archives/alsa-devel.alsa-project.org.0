Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACA77B562E
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 17:19:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E918CE7A;
	Mon,  2 Oct 2023 17:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E918CE7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696259946;
	bh=QyLUHxCnjq96dRqqAZ2R16rfPM/ceuxmjSOr/ybBiBU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m/UqQh647qYHOC5jBjEu915/NvS7sNtTW0s1E6+qYIk3chU9Ulyn584scUhJpOvqp
	 KTzr/A2pXEmr4DDFZfQ1w4rDTsaqyoxD+eUwhkeO6MearxzIAJ4DSqr5Nva8MYdT/o
	 c2SVC+LxXBDWxat45KFqB5CgGl1bYNOI/3QnENFc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A40B4F8055A; Mon,  2 Oct 2023 17:17:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D102F8057B;
	Mon,  2 Oct 2023 17:17:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85A3CF80549; Mon,  2 Oct 2023 17:17:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF02DF80166
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 17:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF02DF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=shb7TX2p
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C45F360C78;
	Mon,  2 Oct 2023 15:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3FB3C433C7;
	Mon,  2 Oct 2023 15:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696259853;
	bh=QyLUHxCnjq96dRqqAZ2R16rfPM/ceuxmjSOr/ybBiBU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=shb7TX2pHDxTEKlFWlXNf7G/y9RynF7jCe2sTyhieqYayrT8GFNgN5Ms8FsUjjlXr
	 7mAUglbGkf4x9wdWlSM6ZT75sOaxvdG8rbFkmBv8UW+qqCVuy7u/27qLDoe+lUMEJi
	 cOo/Lq9By4bWG7yB7M94s89Vdl18nX23j7kPeHiSaaVfjvgGCj72/A9hOApYv4mlSP
	 ylBwSsEQrwPEiGhnRf95LIhCTdHrqYYcVnfVrpr9zcNjQ1IsNfESSzeah6YmCOOcfj
	 NFcfzlO/Emx8z3pOLivStTFPTS2egqJFrhIjNvy8zJB4xzvBbxOnQlxXwqqhU1xJf1
	 fYw5rKJaKcXOg==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20231002084629.903103-1-amadeuszx.slawinski@linux.intel.com>
References: <20231002084629.903103-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Remove unused variable
Message-Id: <169625985165.65718.11092639345516180535.b4-ty@kernel.org>
Date: Mon, 02 Oct 2023 16:17:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 5TW7BPJPSKI45V7EKEE3XH2OKMLBIPPP
X-Message-ID-Hash: 5TW7BPJPSKI45V7EKEE3XH2OKMLBIPPP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5TW7BPJPSKI45V7EKEE3XH2OKMLBIPPP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 02 Oct 2023 10:46:29 +0200, Amadeusz Sławiński wrote:
> Recent commit removed the only user of bus variable in
> avs_dai_fe_prepare(), also remove the variable itself.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Remove unused variable
      commit: 045059e4d3ce39104323fe01da61374ba73f31b3

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

