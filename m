Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 056292C8A1E
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 17:59:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AE05177D;
	Mon, 30 Nov 2020 17:58:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AE05177D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606755559;
	bh=hu534EK9r0WZxsm2Ymjg3Kxbs1PNpEpRf2AWxg8FYCs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fGJO8h55nzgkH3E1FeVIhZcwK0GZrrEwXpXF/wYQYS26bLXffwDm70JyycZUroWBw
	 +kJTUPuKyf9O7WTBnLHrvsWSefTcQet+eoDB0JbZCvS1m7EURwfFpKKCfHH97oenx/
	 OwZymxWwobpUOHP26I0XRMLt7/pxH4qrn6b3PoLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 957CFF804E6;
	Mon, 30 Nov 2020 17:56:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0467F804D8; Mon, 30 Nov 2020 17:56:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58521F804CA
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 17:56:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58521F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T+t2cxIh"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D32B5207F7;
 Mon, 30 Nov 2020 16:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606755365;
 bh=hu534EK9r0WZxsm2Ymjg3Kxbs1PNpEpRf2AWxg8FYCs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=T+t2cxIhEh9i8ndqwtsLvL4bgoLc+dn+HXGTw9BvYss0sDLA7TRmCarmuSfdHUxeu
 QIKwlLcNREek3PuKL24d4AwwDJwoVptRpZweiYm6DKltM1r1Zj8QOdG9m4rwSQLGQm
 JlVIuX7rxRU8nMzI2uPAusXDPcqdhQvrO9Aetll4=
Date: Mon, 30 Nov 2020 16:55:37 +0000
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20201127164022.2498406-1-kai.vehmanen@linux.intel.com>
References: <20201127164022.2498406-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: SOF: Intel: fix ICL boot sequence
Message-Id: <160675530954.30326.4208119704252283319.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
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

On Fri, 27 Nov 2020 18:40:17 +0200, Kai Vehmanen wrote:
> Series introducing a modified boot sequence for the Intel Ice Lake
> platform. While no bugs are currently open for this, the current
> DSP boot implementation does not follow the full programming sequence.
> 
> This patchset is the first instance where SOF driver uses data in
> the extended manifest (part of the firmware binary), to influence
> the boot process. IPC cannot be used to get this information, as it
> is already needed for early boot.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: ops: add parse_platform_ext_manifest() op
      commit: e984f3ef3d2ac4a1896f7a3845b7c89c27841cbe
[2/5] ASoC: SOF: Intel: hda: define parse_platform_ext_manifest op
      commit: edbaaada5c9b57e243a98bf5b442f3a7a43ed14d
[3/5] ASoC: SOF: ext_manifest: parse cavs extra config data elem
      commit: e3a85dbe30cf4c6904640da10e7dbd18c4ee7be7
[4/5] ASoC: SOF: ops: modify the signature of stall op
      commit: a70eb70827b4160ada657649c74647f8bb7768ae
[5/5] ASoC: SOF: Intel: hda: add sof_icl_ops for ICL platforms
      commit: 0cde3e9f029c25b671402425a01e029952a38c8e

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
