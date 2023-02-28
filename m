Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE836A5E88
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Feb 2023 19:02:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3ADC828;
	Tue, 28 Feb 2023 19:01:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3ADC828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677607349;
	bh=R/7POyqmq1O7Bzcc0o56fhcltvP3fzPvqgmzOYaJR8U=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pYJGBp2Ttvg6pPgnvfrFK0JakEpooWTBho5wlaYHm0yrFWgb3+ZbUrAL9E//sDRz8
	 VkohSAfN2FCkBHAcw/0YmTRwl1yNwYc1YwqVpjT2oUv0YZufK8TB57NaDEFNbqTo+r
	 DAHYF0fT0Eao3n5n+W+i7lrkAkmdebL6bUloKI7A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93F83F80527;
	Tue, 28 Feb 2023 19:00:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 502E1F8051B; Tue, 28 Feb 2023 19:00:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2FEAF800FA
	for <alsa-devel@alsa-project.org>; Tue, 28 Feb 2023 19:00:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2FEAF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ufFPg2bk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 98503B80E9D;
	Tue, 28 Feb 2023 18:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F8FC4339B;
	Tue, 28 Feb 2023 18:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677607233;
	bh=R/7POyqmq1O7Bzcc0o56fhcltvP3fzPvqgmzOYaJR8U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ufFPg2bk7+2WvYWDcsSzbKVfit/Oft1Z9PyGt9qcvsTWxLyJQyohKsbFi+/dk0iDu
	 km0RaMt8Bavvj0U/VhMKENOFNz1DYEETmuezgKRzogenDXOlan858UhcnXK+GYQ45K
	 J/zvr4SU7u6UjxLMUjY3dKH+1yUOkRNXmIZWX6ylj/nhBlo0ajPbHIDWWw3GaaTG1G
	 zaYZVn6Mbac0SC0QqiTENjFGm+BxEKHwpMviez02BruQ+YkzXtZgFEiBAW4WktFGKm
	 pjnSrNUAITG1euMH4biu6bhLdzwdmEC6LYYMlmi1216SFeMlt/nKdBLdaI3kWNhA7R
	 ncmAHUGky6uWg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Brown <broonie@kernel.org>
In-Reply-To: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
References: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
Subject: Re: [PATCH 0/3] ASoC: mt6358: Fixes from an initial glance at a
 kselftest run
Message-Id: <167760723093.68866.904867313003535507.b4-ty@kernel.org>
Date: Tue, 28 Feb 2023 18:00:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-ada30
Message-ID-Hash: XIUNJ6WCLY5VQEYLYZ4B5EHKUH5SRCXT
X-Message-ID-Hash: XIUNJ6WCLY5VQEYLYZ4B5EHKUH5SRCXT
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XIUNJ6WCLY5VQEYLYZ4B5EHKUH5SRCXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 26 Feb 2023 12:47:55 +0000, Mark Brown wrote:
> This is a collection of fixes I came up after glancing through an
> initial test run with the snappily named Kukui Jacuzzi SKU16 Chromebook
> on KernelCI.  There are more issues flagged, this is just what I fixed
> thus far.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: mt6358: Fix event generation for wake on voice stage 2 switch
      commit: 3425ddaea57af77ca96a59a5b8eaa2f9e1b021ba
[2/3] ASoC: mt6358: Validate Wake on Voice 2 writes
      commit: 8e847a43c28fca0aaa11fba8f91da7dfd9d6936f
[3/3] ASoC: mt6358: Remove undefined HPx Mux enumeration values
      commit: 8cbd7273a724d4e9615b26d696bb1221a8a48e4c

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

