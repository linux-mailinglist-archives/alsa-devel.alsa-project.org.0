Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C5E716B5B
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 19:42:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06B0E825;
	Tue, 30 May 2023 19:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06B0E825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685468545;
	bh=3w78bON1nlLndTYQBkqJdw+vPRGsIhPOJ5x5/f8khPw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lDgU6hNX+HSIIM3CX0Qg5tXMKthpuLg+aq94PBAzI1zIG++uYq4PmSoLMg8Q8eCZI
	 WNyXyCbXTFrMYVGvU33lu1xluKKeSpZyeGCnfFc5cYeMUK/01ZK1iBspSkpoGxYSyj
	 uhhORlm2g9vPjJr97V+/UN9ShFqvnQfOPFlrSzgI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D9EEF8055A; Tue, 30 May 2023 19:40:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 994D5F804FC;
	Tue, 30 May 2023 19:40:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D61DF80552; Tue, 30 May 2023 19:40:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25421F8016B
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 19:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25421F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mnDJkRzO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3FAB262D5F;
	Tue, 30 May 2023 17:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA268C433D2;
	Tue, 30 May 2023 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685468436;
	bh=3w78bON1nlLndTYQBkqJdw+vPRGsIhPOJ5x5/f8khPw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mnDJkRzOdr20zkHipq3EaPa8w3A5BC3y9DHzSkIwv0M/mi+G2VqLnV3nsM7syYwT2
	 0juJ7hR1mRXPconWpgZ+0r2m930oE8YOv/5YZkO3maoDhrPscOjIwr6yi6C2P6ChxC
	 bV1DsBbXjZMdaT2b2EEGJZ8AdmYVDJ3fXHiOyfJkO+f6gBRg6rA9XxUmPMwXGbjR6a
	 oK3EUD3OFyYzi9HeB1VkaTEMR2OYvraPiWLP1oa+pqB4ZG6/12wbcYLTKNpKiwdStY
	 2y2mfzbHY61dfay/CmQBA65RYiNZTWoMTjNAf/7b4z9iLILZm9Br1/2t+DHjM7rFTw
	 xoZuXgKQLKAxA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230526204149.456068-1-pierre-louis.bossart@linux.intel.com>
References: <20230526204149.456068-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: topology: allow for partial dailink
 stream_name match
Message-Id: <168546843541.690777.13510507677430208531.b4-ty@kernel.org>
Date: Tue, 30 May 2023 18:40:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: HRA5BJRBHMET3HIP34C7LPPJ5YRBGAIV
X-Message-ID-Hash: HRA5BJRBHMET3HIP34C7LPPJ5YRBGAIV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HRA5BJRBHMET3HIP34C7LPPJ5YRBGAIV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 26 May 2023 15:41:46 -0500, Pierre-Louis Bossart wrote:
> The topology file and the machine driver rely on common definitions
> for the dailink stream_name.  To avoid any backwards-compatibility
> problems, the machine driver stream names are set in stone and cannot
> be modified.
> 
> This is problematic when we try to name some of the topology widgets
> after the stream_name, since the widget name is limited to 44
> characters
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: topology: Allow partial matching when finding DAI link
      commit: e018e0b346706d0a0d7d7f884f3850cc0903abc2
[2/3] ASoC: SOF: topology: Use partial match for connecting DAI link and DAI widget
      commit: fe88788779fc30a4117dc2f9db4b50182679bb67
[3/3] ASoC: SOF: Intel: HDA: Limit the number of dai drivers for nocodec mode
      commit: 0f7b6a433097808e7f3e82f837ccc1353f070e4a

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

