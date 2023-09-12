Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5586579D43A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 17:00:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AED2DBC0;
	Tue, 12 Sep 2023 16:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AED2DBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694530842;
	bh=xuo3FQJBuHtKVaZ47fDycI+jaARYxTGdjsIR1CB+gpQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Av3ToL+2kcmCAhFMCMZ8VeAteaSc3slUaM8QNG1HqZoHjUelTa7vJHCglyGu0xL8O
	 7xre406GOLClLHyh6eWx0ttSDdrMamrngsBWdrN4nWDVQVp9Qn9YgswOtD9nueDl3T
	 553iX20ZLzwFD6K7WvOAeUVEMSTbtvbj8Y7OU3jM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2ECAF80563; Tue, 12 Sep 2023 16:59:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97D09F8055A;
	Tue, 12 Sep 2023 16:59:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74A07F80425; Tue, 12 Sep 2023 16:58:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD79AF80246
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 16:58:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD79AF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=N+yz3y4f
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 33AB3CE1A21;
	Tue, 12 Sep 2023 14:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413D8C433C7;
	Tue, 12 Sep 2023 14:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694530726;
	bh=xuo3FQJBuHtKVaZ47fDycI+jaARYxTGdjsIR1CB+gpQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N+yz3y4fbg0tyoshpVBvM3cZdgcpeOdeH5TYWk9OJruL6rMM9GPJT/ow/9KZc+/KD
	 FUcLv3z9uz+tY7WTax0F4wVZ+12zSTd3XhMvcEpkG9eVi+QfN1T0BixL6SemZRq3Gt
	 6KAV2trBEDW9ldFaUI8y7vgcdCuKDuFANOE3ESusez3OF9kI8ItOVQd+JXORuzTVW8
	 c+hKZp6pipFW9FbEqD1/4gNcBJyIOFc/HEVxFOggTDpfupzvcYxWfxs+7ze1FNV1h3
	 Vulem5hSJB/DkhP9SBcOa2A8uYBf6+l34Oupd67ikntb6AWuLDtaNMgQxHQyrVZNti
	 sCzqKJ9yhghwA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 August Wikerfors <git@augustwikerfors.se>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
In-Reply-To: <20230911213409.6106-1-git@augustwikerfors.se>
References: <20230911213409.6106-1-git@augustwikerfors.se>
Subject: Re: [PATCH] ASoC: amd: yc: Fix non-functional mic on Lenovo 82QF
 and 82UG
Message-Id: <169453072498.64014.17577108685886768504.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 15:58:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: 6N4AKZJPUUX7FDZLNPCOHL6QVAPETWER
X-Message-ID-Hash: 6N4AKZJPUUX7FDZLNPCOHL6QVAPETWER
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6N4AKZJPUUX7FDZLNPCOHL6QVAPETWER/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 11 Sep 2023 23:34:09 +0200, August Wikerfors wrote:
> Like the Lenovo 82TL and 82V2, the Lenovo 82QF (Yoga 7 14ARB7) and 82UG
> (Legion S7 16ARHA7) both need a quirk entry for the internal microphone to
> function. Commit c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on
> Lenovo 82SJ") restricted the quirk that previously matched "82" to "82V2",
> breaking microphone functionality on these devices. Fix this by adding
> specific quirks for these models, as was done for the Lenovo 82TL.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Fix non-functional mic on Lenovo 82QF and 82UG
      commit: 1263cc0f414d212129c0f1289b49b7df77f92084

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

