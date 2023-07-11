Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C8674F9B2
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 23:23:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 892C8103A;
	Tue, 11 Jul 2023 23:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 892C8103A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689110594;
	bh=3xkkuBXZf9xavOpTtJVeO/yJn1c+bcauJGizthRoAKY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O3jIZCBMnMXnEnejpS02SjGPLBfdQxmcQOFKuV2/6knwD+dQI0r18nghO+f+O2Aa4
	 q1gPmDeDMlGrMajLtFNgzVCwpLYNVHQK/Nwk394+I0KMI0aVEaKuwa4ykYNFMYCQ1D
	 3VM9plrPB3FbSadi5rDp2oeys/SFgdWiTUtrRgGo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BF09F8055A; Tue, 11 Jul 2023 23:21:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55E67F80549;
	Tue, 11 Jul 2023 23:21:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07B72F8027B; Tue, 11 Jul 2023 23:21:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B1B4F80236
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 23:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B1B4F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mNKdnOMR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9D90D61625;
	Tue, 11 Jul 2023 21:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD261C433CB;
	Tue, 11 Jul 2023 21:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689110485;
	bh=3xkkuBXZf9xavOpTtJVeO/yJn1c+bcauJGizthRoAKY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mNKdnOMRvt4fPbSCYrPHdLIVQJQSEtpamgqmoZUnhfGiPkh9pfX+vBzJra9dYviO7
	 IiQE6v4lnz0Ez8NPeCi9oI6PHZOBn1mnVm3d8eGrAB1gF47oxlsZyUCGuolBHOFaWU
	 iA+sLxyjz4WcZux+dNSYDifkkjUyFd0Z14miWn7InMfwYn8m81lVDR/X8cgC2p3X+H
	 D10bx+nMP8V5asohryc7vciU/+Or9GhziksX2VaTkx/wCZ5n0ufIGhuCBMr8l7L0QB
	 OFYrRq/ccXS4tJ7/c6KfYshtFTVpVwzInpDmgKFjWThaDzy8oiJcJv9EJsjwfU0hcz
	 ygWrs00o5vs7Q==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Syed.SabaKareem@amd.com, Vijendar.Mukunda@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230708025208.54272-1-mario.limonciello@amd.com>
References: <20230708025208.54272-1-mario.limonciello@amd.com>
Subject: Re: [PATCH] ASoC: amd: ps: Fix extraneous error messages
Message-Id: <168911048356.530041.349357901498684259.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 22:21:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: DFLXY4DPPOTMMFQW7QP7UBIHLRAEBJX2
X-Message-ID-Hash: DFLXY4DPPOTMMFQW7QP7UBIHLRAEBJX2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DFLXY4DPPOTMMFQW7QP7UBIHLRAEBJX2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 07 Jul 2023 21:52:08 -0500, Mario Limonciello wrote:
> On Pink Sardine machines that don't have SdW controllers in use, the property
> `mipi-sdw-manager-list` won't exist.  There is no point in showing an error
> to a user when this situation is encountered.
> 
> Furthermore if the machine doesn't have a DMIC connected to the ACP, there
> may be no platform devices created either.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: ps: Fix extraneous error messages
      commit: cd710900ed2b96b1fbc26d711d562581afc385e2

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

