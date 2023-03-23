Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C876C69F0
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 14:50:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85C22EC3;
	Thu, 23 Mar 2023 14:50:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85C22EC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679579454;
	bh=yAzkV6grSee3ZhAMytDT78qAG+Cw2Q+FPunKiJuj/lw=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dQuuQwezkXQVLZSpAMI0mOptH0MyXMGpRuvYueHKzweRlekhYZBtVOw5+cgnwweVh
	 IbIYm/8UZyZMykbZxVTOfpyafcDjkA6HvSKW7gOxryHTGvD5wgy5RwVgleplx5EMOd
	 olgij7Wx9jGA7fiAS80CHw2/P5N853nLscuyRXfs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21226F8027B;
	Thu, 23 Mar 2023 14:50:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ED68F804B1; Thu, 23 Mar 2023 14:49:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70980F800C9
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 14:49:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70980F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Nq68+a6B
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4F689626BB;
	Thu, 23 Mar 2023 13:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23815C433EF;
	Thu, 23 Mar 2023 13:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679579391;
	bh=yAzkV6grSee3ZhAMytDT78qAG+Cw2Q+FPunKiJuj/lw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Nq68+a6BvMZaLwlV29Ile/3Db56WqBNHtLNH+SLq1M8HU3mqXhmcp4wEqXjAv+JJJ
	 zap+FM6qd0kHcLyaamnCnhKmnodFB/FtE0kdpPy3tS4rUKkmopsPqK87FTaHrCqdz4
	 ettwr7s4SWQMQ9R1Xp/7IkuizvXI4WXRVVt4eoq63nevG/h9IeD422J29IW554jtA7
	 HhJioogWYOBH2DDdWCRQxpZDTgNi2v8ysnYQNLSRuBZuyyAF/PlOXEPaNvU2KjlrnS
	 j1t5nbM8fiTCfQ3EGlweehbzDL3h/pN0d7FjdTweJ8iNxemcGyq3RHz5ZL/TkI98Zf
	 G+7S6RLR+QwWg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230321092654.7292-1-peter.ujfalusi@linux.intel.com>
References: <20230321092654.7292-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: ipc4/intel: Support for ChainDMA
Message-Id: <167957938986.26985.1129337044165292533.b4-ty@kernel.org>
Date: Thu, 23 Mar 2023 13:49:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: CJJG3C3YL3OTIFAZ7JQLMIHSLH7QA6EK
X-Message-ID-Hash: CJJG3C3YL3OTIFAZ7JQLMIHSLH7QA6EK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 jyri.sarha@intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CJJG3C3YL3OTIFAZ7JQLMIHSLH7QA6EK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 21 Mar 2023 11:26:51 +0200, Peter Ujfalusi wrote:
> On a platform when the DSP is in use, we cannot select individual links to use
> or not use the DSP, it is either all or none.
> On some audio endpoint, like HDMI/DP, it is preferred to not use any processing
> in DSP to reduce the latency and to allow bytestream pass-through (DTS, DD, etc)
> 
> IPC4 introduces a new type of end-to-end connection within the DSP which is using
> the host DMA and link DMA in a single buffer, working back-to-back, passing the
> received data without looking at it or trying to understand the format, content.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: topology: Set pipeline widget before updating IPC structures
      commit: 3d3e223f09ed59f7a47d27cf4301b4d0d5c7fc3d
[2/3] ASoC: SOF: ipc4: Add macros for chain-dma message bits
      commit: cb3cdef33136baceada86ba2a21ba30cd53a9087
[3/3] ASoC: SOF: ipc4/intel: Add support for chained DMA
      commit: ca5ce0caa67fa9eeecaa29d895c2e4c3151c159e

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

