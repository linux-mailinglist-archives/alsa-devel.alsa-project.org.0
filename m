Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7680D7847C6
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 18:35:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B77D3825;
	Tue, 22 Aug 2023 18:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B77D3825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692722115;
	bh=9vNzYg4w4GUbZNldzK1Za05IccqxfzHtxVoEZbMfmdk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zxk/P1uhAy1OlG9IJr/JNLwz4Bmc5dDx4XcEgjSgE9cLjPmQgXRmirZwNwyXMnJqN
	 cnGINwwzJ1f1A+OBreHvgAz/hey/jHZTFiez1cVDEMWlDrwc9n+Y2zwrc4XN0cdU5c
	 6n4RAdbXzfqnHYcrvgisWXex6GQJo17evJl7TU4I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAC2EF80564; Tue, 22 Aug 2023 18:33:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E642F80553;
	Tue, 22 Aug 2023 18:33:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5914F800F5; Tue, 22 Aug 2023 18:33:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63E42F800F5
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 18:33:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63E42F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=myFHZ1Ru
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 363F362FAB;
	Tue, 22 Aug 2023 16:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09833C433C7;
	Tue, 22 Aug 2023 16:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692722001;
	bh=9vNzYg4w4GUbZNldzK1Za05IccqxfzHtxVoEZbMfmdk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=myFHZ1Ruut94frOjQZ6sSGw5p4qC99wU+de2OKy9xVmhZ9nSPimiVzswVLAl9Sipt
	 5hVaT5god9DFHK+9HdAfl3I/j3aK1nH6c7Biujt3YMM8FC85MG3N3u9RlkLz10yl52
	 PTWesMjVBIgCd0Z3g/d1RAWJDQjSWeihv6SyhPiTCB6mfc7zCxKaQFdzUHJoINiMTf
	 J4cT6DojO//Bfo5Ei5C9ZwICBxo8WpbtJmjG9Thm+jRtW1gO9dPQGir+R36HDlE4P3
	 kvqOJ4yCNxD2cqUyPaRq5TpqQZAzXWevM+RT6dZpJB6+SB5/cU5tjuHNL7103sWs+7
	 CnTA3IRztQKog==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, seppo.ingalsuo@linux.intel.com
In-Reply-To: <20230821113629.5017-1-peter.ujfalusi@linux.intel.com>
References: <20230821113629.5017-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: ipc4-topology: Fixes for pipelines with
 SRC
Message-Id: <169272199975.71502.8304091663464060005.b4-ty@kernel.org>
Date: Tue, 22 Aug 2023 17:33:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: X5DOGIT7CMJHEUUIHQBU5DRXXPY3VVUI
X-Message-ID-Hash: X5DOGIT7CMJHEUUIHQBU5DRXXPY3VVUI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5DOGIT7CMJHEUUIHQBU5DRXXPY3VVUI/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 21 Aug 2023 14:36:25 +0300, Peter Ujfalusi wrote:
> the SRC component in a pipeline provides flexibility on the sampling
> rate which was not handled previously.
> 
> This series will improve the kernel side with the needed logic to be
> able to deal with the SRC type of components in pipelines.
> 
> Regards,
> Peter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: ipc4-topology: Modify pipeline params based on SRC output format
      commit: ef24388225f87f2604522fe86fafacc271ec4a29
[2/4] ASoC: SOF: ipc4-topology: Fix the output reference params for SRC
      commit: 56ecc164040b3685f6cb36b4d513d73d0f88140b
[3/4] ASoC: SOF: ipc4-topology: Fix pipeline params at the output of copier
      commit: 769e8f6cd7182c95d4bd37491e13300ff067c7a7
[4/4] ASoC: SOF: ipc4-topology: Modify the reference output valid_bits for copier
      commit: 70b0924b22efe2135222a2c7141a83dfe0c78779

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

