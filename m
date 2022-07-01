Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A467E563C4B
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Jul 2022 00:23:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4067F164E;
	Sat,  2 Jul 2022 00:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4067F164E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656714182;
	bh=QtVAvCpWJRtTqq2wfJizMcxgUjJUwOOMwgQo9QJsnoI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jQmajQEUuL3BLsQ/wsJP2pgUH1RhnO0EXgUpxZvmgz2cxIkeyEik8UwEDai3atEng
	 0F9znhXW3xnz1Oc/hGPZX6Ru4D1mC7O/gH615dQ/qljcERcxle+y2m4bv8Q19t9Pwr
	 cUBg5RCiY2KypYzq7qQmvt8RznCzHR3A9Qf/HROU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3873F800E8;
	Sat,  2 Jul 2022 00:22:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9198DF80155; Sat,  2 Jul 2022 00:22:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44CA6F800E8
 for <alsa-devel@alsa-project.org>; Sat,  2 Jul 2022 00:21:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44CA6F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s6b9Alkm"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3F488B83107;
 Fri,  1 Jul 2022 22:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C25C3411E;
 Fri,  1 Jul 2022 22:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656714115;
 bh=QtVAvCpWJRtTqq2wfJizMcxgUjJUwOOMwgQo9QJsnoI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=s6b9AlkmAh6MZJFmlunyM/WQ7AlhRNT0hmtUM7y4beWDoO9uLJKxxWuozrL7ogIKh
 fXiqnWm3GSxfDdU3SGjJFV6VxUbNuS9bTxuAN98+K9ZPI8/RTJSOqVU0YEKmc4s/5H
 UwLZ9dBki7ER5zIif0+7zKfVTQ8I34XlcPKYdZ9kLgqS1SJbsDBQ+x3erDOttOZ7x+
 +yRITE01aAHZYLQu4DsgyERaZ3ZQG/KdnYFLTv/FGuW9Le6mgIaf+j/VsTTQtYxsEh
 4lq1uuHqYiGhRXEDrC4iuSGnEoDlaCgKtwCQriW6VH+E68DXmvslN0ZjeUaNIJtrtO
 FJ3Xw4DyhTH/Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, brent.lu@intel.com
In-Reply-To: <20220701141517.264070-1-brent.lu@intel.com>
References: <20220701141517.264070-1-brent.lu@intel.com>
Subject: Re: [PATCH v2] ASoC: Intel: sof_rt5682: fix out-of-bounds array access
Message-Id: <165671411147.591936.521859286196210706.b4-ty@kernel.org>
Date: Fri, 01 Jul 2022 23:21:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 kai.vehmanen@linux.intel.com, ajye.huang@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yong.zhi@intel.com
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

On Fri, 1 Jul 2022 22:15:17 +0800, Brent Lu wrote:
> Starting from ADL platform we have four HDMI PCM devices which exceeds
> the size of sof_hdmi array. Since each sof_hdmi_pcm structure
> represents one HDMI PCM device, we remove the sof_hdmi array and add a
> new member hdmi_jack to the sof_hdmi_pcm structure to fix the
> out-of-bounds problem.
> 
> 
> [...]

Applied to

   broonie/sound.git for-linus

Thanks!

[1/1] ASoC: Intel: sof_rt5682: fix out-of-bounds array access
      commit: fba5a02a4c028dad32299aa723716349f93845eb

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
