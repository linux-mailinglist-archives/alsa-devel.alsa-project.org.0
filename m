Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 601B179DB9C
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 00:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B89784B;
	Wed, 13 Sep 2023 00:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B89784B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694556431;
	bh=cMFJeeeepm35KFHcauBfMNebPgVOW3tLUqzLxKSK7rg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=INXquklJ2JoTzyCAZ7SOINje4u6Px/dFyBlKvrdPrtu/JHL3MzovbMKBOcOfW6odw
	 WxkvWseuygqHH+apuXPlrMTQdoYOyI1U55fDrHr87cveE3lUyUGER0bvJA8lqn+E13
	 oB4ettbodHnaIwVNf46W1TuXXjAjh3eyp0sxkHaI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7394F8047D; Wed, 13 Sep 2023 00:06:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 681CEF80246;
	Wed, 13 Sep 2023 00:06:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 352CAF80431; Wed, 13 Sep 2023 00:06:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DDBEF801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 00:06:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DDBEF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nifYmR1A
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5A377B82170;
	Tue, 12 Sep 2023 22:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F5CC433C7;
	Tue, 12 Sep 2023 22:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694556365;
	bh=cMFJeeeepm35KFHcauBfMNebPgVOW3tLUqzLxKSK7rg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nifYmR1AgsrnKhBQnnSUwAulUkInPzHW0AyYGXC546nmQP4gfS429dUdDsLoWaz/A
	 10jK41G8EBYxlmTH1cBo7WQ3TU0RSVooROf6+FWEYsZgF87PxsMvGsZ3GXgJXp3d2C
	 4jpvJk6U4Tdd99vv+9LZItB9Miz+muztPHy7TMxLMkUHwE/EGP3x3/p4rBHmm7B2kr
	 1fcngSrjUpA2DXHxKb+yhlwGmURqU14FG5qunNT+nqB/GN1TWVBXON6fzGNSHp6Ske
	 fVCAL5cgcJMWfFY1PSRetHg6IL3UMzDPIR7zBjOpMPofJLcZo7zjQMx7BhwKYSMtl1
	 7rU/1iRIFj4Ew==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Sameer Pujar <spujar@nvidia.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20230912113245.320159-1-hdegoede@redhat.com>
References: <20230912113245.320159-1-hdegoede@redhat.com>
Subject: Re: [PATCH 0/6] ASoC: rt5640: Fix various IRQ handling issues
Message-Id: <169455636307.155240.3649714894529542162.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 23:06:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: OOEE6HBBUJ2CBVBP2O4CFA7L2CA7VTFX
X-Message-ID-Hash: OOEE6HBBUJ2CBVBP2O4CFA7L2CA7VTFX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OOEE6HBBUJ2CBVBP2O4CFA7L2CA7VTFX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 12 Sep 2023 13:32:39 +0200, Hans de Goede wrote:
> The recent(ish) rt5640 changes to add HDA header jack-detect support
> and the related suspend/resume handling fixes have introduced several
> issues with IRQ handling on boards not using the HDA header jack-detect
> support.
> 
> This series fixes these issues, see the individual commit messages
> for details.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: rt5640: Revert "Fix sleep in atomic context"
      commit: fa6a0c0c1dd53b3949ca56bf7213648dfd6a62ee
[2/6] ASoC: rt5640: Fix sleep in atomic context
      commit: df7d595f6bd9dc96cc275cc4b0f313fcfa423c58
[3/6] ASoC: rt5640: Do not disable/enable IRQ twice on suspend/resume
      commit: 786120ebb649b166021f0212250e8627e53d068a
[4/6] ASoC: rt5640: Enable the IRQ on resume after configuring jack-detect
      commit: b5e85e535551bf82242aa5896e14a136ed3c156d
[5/6] ASoC: rt5640: Fix IRQ not being free-ed for HDA jack detect mode
      commit: 8c8bf3df6b7c0ed1c4dd373b23eb0ce13a63f452
[6/6] ASoC: rt5640: Only cancel jack-detect work on suspend if active
      commit: 8fc7cc507d61fc655172836c74fb7fcc8b7a978b

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

