Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E64F3613DF3
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 20:01:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6965C167A;
	Mon, 31 Oct 2022 20:00:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6965C167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667242873;
	bh=eBSCyaR7N20XUP5jjdTikiWUII0s9wqCuQArlebldSU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AlGEjuvjU8kf3oCMcefanVCVRrEbdnwsanIydWPxSeCBTm0+96GCoLwC+pII+wvyC
	 qqz+SpWIIyE28qqwXpTdjWXT4vLZEv+msaAV3nsXPGFzWutt6qTamLbiigxG2LLxwY
	 ZaBPbA8E7Kjie3VvMXRnLBtxDZpEwtmWuLsUfqOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5E2AF8032B;
	Mon, 31 Oct 2022 19:59:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD616F80163; Mon, 31 Oct 2022 19:59:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E3AAF800E1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 19:59:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E3AAF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lwB3B1/d"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A9A561418;
 Mon, 31 Oct 2022 18:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D470C433B5;
 Mon, 31 Oct 2022 18:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667242787;
 bh=eBSCyaR7N20XUP5jjdTikiWUII0s9wqCuQArlebldSU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lwB3B1/dr8/Nth1WJNJ3moolWBMQGfdbbB+pd478PMGpmmiRvMsmEECgxXl31A90A
 lUBFaIgxxrFLBk5F09YUAuTmX+9j7vw+XxrdFDvl9yPOQsLiqxf9ri6LrCVwvHD1Xl
 VzmTQIyFuuKbmAf0Ay1flrpI03bC13A1FwmB0JOoT3IxIrDQfPJ/pwIdi0GyuuD307
 Kenzli26m/CG8TRRNvxaszKciDdVJVWGoxBbC61+wLJ09CgFFH53nthPmY0GBkSRFp
 /PfyAMzXaXDhYOB7pmLfZWPVLdmUrBaUB5TmvyD/hIdCipvLqj70gAo9PHqcVKLy9k
 nLcTwmPefyVaA==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 jyri.sarha@intel.com
In-Reply-To: <20221031105141.19037-1-peter.ujfalusi@linux.intel.com>
References: <20221031105141.19037-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: SOF: client-probes: Add support for IPC4
Message-Id: <166724278623.784642.13122185614099948179.b4-ty@kernel.org>
Date: Mon, 31 Oct 2022 18:59:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com
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

On Mon, 31 Oct 2022 12:51:36 +0200, Peter Ujfalusi wrote:
> The probes (the ability of probing the audio data from firmware processing
> points or to receive stream of debug/trace information) is supported by IPC4
> as well, but due to the differences between the two IPC version the low level
> setup and information we need for probing is different.
> 
> This series will extend the existing probes support for IPC3 with IPC4 'backend'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: probes: Replace [0] union members with DECLARE_FLEX_ARRAY()
      commit: b7b080cf3c33976eb2b51f73948dd9a6109a1107
[2/5] ASoC: SOF: probes: Separate IPC3 operations to a separate file
      commit: ccf06b148fc22e3a964308df1d158c87710a35bd
[3/5] ASoC: SOF: client: Add sof_client_ipc_set_get_data()
      commit: d8bc54a5f2cb8b3bc2d727badc351b0ad24eb702
[4/5] ASoC: SOF: client: Add sof_client_ipc4_find_module() function
      commit: 7f0a3dff1f23eadbc36a64600ad2c17912163b66
[5/5] ASoC: SOF: IPC4: probes: Implement IPC4 ops for probes client device
      commit: f5623593060fc2f4d84781edcc5d15e44acfcbf6

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
