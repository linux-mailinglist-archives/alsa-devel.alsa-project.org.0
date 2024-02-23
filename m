Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB83B861868
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 17:48:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4062E84D;
	Fri, 23 Feb 2024 17:48:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4062E84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708706890;
	bh=BesFWAtuTprjWylLkXSgMFyYOvsUukjAQwbOy9l/KHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eSwMKTT1zy4q/zxfBcbO6sT47/ejev1GcNSnItgndfg8vQEwkqyCpOW/dD+QoTQXG
	 FMOCRfiF97kSTv/4cgSek2BkTrNe8QChmO/EPwv73+5eKDi/aPHGM29E/QfmpeIEoW
	 mti9cyLz212ecLs012xYOxh93vG5id+0sVPn4lVI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D55CF8057B; Fri, 23 Feb 2024 17:47:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE8B4F805A0;
	Fri, 23 Feb 2024 17:47:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92CC5F80496; Fri, 23 Feb 2024 17:47:18 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D700BF800ED
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 17:47:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D700BF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a/ldrGtS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4BDE63413;
	Fri, 23 Feb 2024 16:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36D1C43390;
	Fri, 23 Feb 2024 16:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708706824;
	bh=BesFWAtuTprjWylLkXSgMFyYOvsUukjAQwbOy9l/KHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a/ldrGtSSfN/5ylfj5KLaM0svgwwTwG7L3iT1TvCMv+me9j8uswywGNPKVtvDO/pv
	 jvHa9sxagoBw0mc5TWkO3GCU9qxBMj1D5cBTiPNGowEox60TSujga1DTrdunar2KFh
	 6HjqrLlVB/V7tQqQwBFkTnUZiABawY79VDb0j4FFGN8tj5kH+dgST9txDFV5xag2PJ
	 c8Kk/SyrNrcFP5S29sD8T/HzhlALn4tcF+scn0J8bHTQq1B2ycE9HBRRpj9GeGQlwk
	 Rv/BaMwFdAz49QF9s/ys7R2s8i/rPG3mpJfMkNtYfM/qI3iyb5qGtCKPlvrFip0StD
	 QSWEMbQo16JLA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 patches@opensource.cirrus.com
In-Reply-To: <20240221123710.690224-1-rf@opensource.cirrus.com>
References: <20240221123710.690224-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: soc-card: Fix missing locking in
 snd_soc_card_get_kcontrol()
Message-Id: <170870682233.2835191.8056467761867046237.b4-ty@kernel.org>
Date: Fri, 23 Feb 2024 16:47:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: M3VODJAKVBLZTGZEUAF4HAA6UJL3SR2O
X-Message-ID-Hash: M3VODJAKVBLZTGZEUAF4HAA6UJL3SR2O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M3VODJAKVBLZTGZEUAF4HAA6UJL3SR2O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Feb 2024 12:37:10 +0000, Richard Fitzgerald wrote:
> snd_soc_card_get_kcontrol() must be holding a read lock on
> card->controls_rwsem while walking the controls list.
> 
> Compare with snd_ctl_find_numid().
> 
> The existing function is renamed snd_soc_card_get_kcontrol_locked()
> so that it can be called from contexts that are already holding
> card->controls_rwsem (for example, control get/put functions).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-card: Fix missing locking in snd_soc_card_get_kcontrol()
      commit: eba2eb2495f47690400331c722868902784e59de

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

