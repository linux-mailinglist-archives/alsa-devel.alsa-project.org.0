Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B624737C6
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 23:44:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BF2018B8;
	Mon, 13 Dec 2021 23:43:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BF2018B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639435454;
	bh=Hsx/h17pYckZy7guc8kdLDa2Eaa4EzAB9kUhCPjzMrQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I3kmFt+0148fWmLRxH4C3OnHXKJEiwdLEh+LVUusgye+wyDzrqd+bQTGp1jqIHgxV
	 QvTn629ue3/CVkgSwyJOCTfx1d5mSaf1mkzWCOxXYCizF4vdGpNRReP9YibzOI/N9T
	 80on8YPQshWGH25ogx2vksoINmhPgHfNyX9AaG8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA64EF8016A;
	Mon, 13 Dec 2021 23:42:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04478F8025F; Mon, 13 Dec 2021 23:42:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66EFDF8025F
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 23:42:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66EFDF8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mGILp2LW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78502612A0;
 Mon, 13 Dec 2021 22:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CCCC34607;
 Mon, 13 Dec 2021 22:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639435352;
 bh=Hsx/h17pYckZy7guc8kdLDa2Eaa4EzAB9kUhCPjzMrQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mGILp2LWRQQJVBn2BQsI+IBRy4krJktvKZrGVHBZl5j74HvYeAmxmu8J+LjGSoWfS
 uHuEzvzeiFdZlju+K8Qjj2dVwu+QpgrXF77ygeXYYV4J6OBvEwlcqwwXw4iOf3IoGi
 Si8EKf+ksobmSYJIsPcMQf4Ss3Gx+Gg4mX2IKZnv/F4cXFYRy6LvBJyyzl0VQQ2FXW
 HxhWw9XsaZB1C6ct+EbHgyvdp6kQnn6HAtac/znZaOzBn71NQL3Wlq2e+rUM5uZyze
 Bt4pwfiSiCEcbDP8kUdAdRsplOjY0BRlCFPVnoEJox2+fOyLLj/dKmnJyHRb9qyuGw
 sI4Ppp8wAkGpw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20211207193947.71080-1-pierre-louis.bossart@linux.intel.com>
References: <20211207193947.71080-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: Intel: SOF: clarifications on hardware support
Message-Id: <163943535114.1016050.11577883573360025061.b4-ty@kernel.org>
Date: Mon, 13 Dec 2021 22:42:31 +0000
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

On Tue, 7 Dec 2021 13:39:40 -0600, Pierre-Louis Bossart wrote:
> This patchset revisits the Intel hardware support in SOF. The HDAudio
> DMA position information was not following hardware recommended
> programming sequences (similar changes are already part of the HDaudio
> legacy driver), and the stream assignment applied a work-around that
> was only needed on specific versions of hardware. These changes are
> not tagged as 'Fixes' and don't need to be applied to -stable
> versions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: SOF: Intel: ICL: move ICL-specific ops to icl.c
      commit: c697ef868f596aba7a5e90be8eb10bf4d4a98990
[2/7] ASoC: SOF: Intel: hda-stream: limit PROCEN workaround
      commit: a792bfc1c2bc4b5e2311edc62e0efe5adec5d079
[3/7] ASoC: SOF: Intel: hda-ctrl: apply symmetry for DPIB
      commit: 12ce213821b77242b2217d08850ff972e1fb50bb
[4/7] ASoC: SOF: hda-stream: only enable DPIB if needed
      commit: ae81d8fd57ff7d2b421c80f0f9426d9e775023b5
[5/7] ASoC: SOF: Intel: hda: add quirks for HDAudio DMA position information
      commit: 288fad2f71fa0b989c075d4984879c26d47cfb06
[6/7] ASoC: SOF: Intel: hda-dai: remove unused fields
      commit: 924631df4134d62b51a9442d97355eeba7ff613c
[7/7] ASoC: SOF: Intel: add comment on JasperLake support
      commit: 290a7c5509b6f14c28e959392f3cbc4d5b2c9318

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
