Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B608A57A653
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 20:18:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1475616E3;
	Tue, 19 Jul 2022 20:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1475616E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658254687;
	bh=uJvgO72SiyRaJPE6YTLJryU91Iao1S0WCIpV4MzLxRI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A71/qatI67f9gg/fj1HkUWV9sFvZyAGqkML/3rdhnnW3fYcqLkA8bI6u/zlnjgTQl
	 H0uhjFgOi5yWHoGb1FO/e4Kwa8FI0E+rqjxmFKs3sJ8NLX9TcQSb8skMUW/flsoqnz
	 MBe6xpEdeIw0Cds43adlBkRV4ORcffIs39v330S4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65FE0F80224;
	Tue, 19 Jul 2022 20:17:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D9C4F801EC; Tue, 19 Jul 2022 20:17:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4665FF80125
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 20:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4665FF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UafRYRtq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A96DB61727;
 Tue, 19 Jul 2022 18:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3F4C341C6;
 Tue, 19 Jul 2022 18:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658254618;
 bh=uJvgO72SiyRaJPE6YTLJryU91Iao1S0WCIpV4MzLxRI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UafRYRtq9y6DWI73tPpp+fg/3Gg89kSWTr8LVMWooEB4IWGt8IIjfblugu6eH1/MB
 PgQgmUtZmEdJLcQH1t96Wz3/djM7UIO+MjFnJA8pEeoYNN+i2xka2+XqtymxnZbR4p
 0Aa1YTo1wSwkR4w09x04+lklg7XUTClldxiEXrvnzNTHB89JyGK96e1mZsV6d9iAJS
 N5wyqZ0SAaykHnWJuRB6PQDEJrT1utIwmOrwjJj+Q7q1RnMgNZgxx9j0U9O0LKbQmK
 Az/hukBGfrGTq4N4C1ziYQXltdkcLIENqNyTllV73eCmU5Hh5aiWSoBif1PfCLUaqj
 XBI8Ky/+g1qJg==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
References: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/11] ASoC: SOF: Intel: updates and cleanups
Message-Id: <165825461798.440224.13897530657232751330.b4-ty@kernel.org>
Date: Tue, 19 Jul 2022 19:16:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 15 Jul 2022 09:52:05 -0500, Pierre-Louis Bossart wrote:
> Set of updates for IPC3, IPC4, MTL support and cleanups for the
> topology filename override which was broken for HDaudio platforms.
> 
> It may be too late for 5.20, it's ok if these patches are applied in
> the next cycle.
> 
> The topology override depends on the patch "ASoC: SOF: Intel: enable
> dmic handling with 2 or fewer SoundWire links" shared in a separate
> patchset.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: SOF: Intel: MTL: remove redundant snd_sof_dsp_read() call
        commit: 740e5d8713e08607c280e1569374401461f3ed5b
[02/11] ASoC: SOF: ipc4-topology: move ida allocate/free to widget_setup/free
        commit: 711d0427c7134c5ba65b8f408888a0335e23ed23
[03/11] ASoC: SOF: ipc4-pcm: set pcm rate to dai setting
        commit: bdb803c8280ba4fd8b8c1cf9cb69f3555853f397
[04/11] ASoC: SOF: add ipc4 SRC module support
        commit: b85f4fc40d56f69ee8e2ca99f202fb287bd767c9
[05/11] ASoC: SOF: ipc4-topology: set domain bit based on dp domain type
        commit: dc6137a56a7227da6e0d4cff6dfb952173403e71
[06/11] ASoC: SOF: ipc3-loader: Print out the non matching ext_man magic number
        commit: b9cb044f35fd5d6fdff92a0be23b020372525fef
[07/11] ASoC: SOF: Intel: atom: don't keep a temporary string in fixup_tplg_name
        commit: 27b196c19c5a10abf1bf5a379c1a6154a1686ec4
[08/11] ASoC: SOF: Intel: hda: don't set fw_filename
        commit: ef05eb575ed98f32d380a6ac8ecdc865b0f4e146
[09/11] ASoC: SOF: Intel: hda: only fixup topology name if not set already
        commit: 054d1fd1380a88e64fadee38771e311184db544a
[10/11] ASoC: SOF: probes: rename assign/free callbacks as startup/shutdown
        commit: bdcf7926fab202d37bfc8e17f1c8ed5d2e611404
[11/11] ASoC: SOF: Intel: hda-stream: test DMA buffer first in hw_params
        commit: 321add801bcd186c6b5477c0857521e127dbf016

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
