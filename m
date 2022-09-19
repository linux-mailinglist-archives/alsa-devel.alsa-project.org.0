Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 261BB5BD7F6
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 01:14:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6D67850;
	Tue, 20 Sep 2022 01:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6D67850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663629245;
	bh=l9RhsR6AHBXm63O4pBHWzeYasPOjJC7mWwU/CelbM9Q=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mWoxXbKcgkWq3Q6IQyOPgIuQLZFsxwm5NaidzpLG+0oie3b4d6fojND3AYgwnxuN8
	 h7q4sT8tMmtDc6SXULUGQ+9m1FjpOJbSDE4umIqKJuDPq10KQV87pVDvfVHH6Okz00
	 e7pOFTpGeVQurpTtZo14/lk9ItcRwmi+K8QmuWPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71070F805B5;
	Tue, 20 Sep 2022 01:10:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE169F805AB; Tue, 20 Sep 2022 01:10:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFEFCF805AB
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 01:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFEFCF805AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XuaQ2d3h"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA6E6620DD;
 Mon, 19 Sep 2022 23:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60736C433D6;
 Mon, 19 Sep 2022 23:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663629022;
 bh=l9RhsR6AHBXm63O4pBHWzeYasPOjJC7mWwU/CelbM9Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XuaQ2d3hLmTfzb6chd6T4z/DLU/Kw8wkAR9zjg8XJL1u+zFYgtV8tUezFoeu/JYSw
 CM5QDV7T5TqJ06EB+PqeYCSj0ta8Pvmrog6UbcLaV+sIi+OautjtwIt7LL9CtrKyIy
 e2AjVUYP9uV5u/5XdOJaPNTh8j5mHo7k1jvQiA8Uz57uAIiiMcFtxjUW/Knhgjnzp0
 t8CZGYT3XvY6aziwktRixpXfzxiGEE6Emi+0gC+RIIGgoxuAOR2T14CoJU9aM3Of7Q
 fYQnzA+885CBkdkT/QHQUtZbOsVhHlGT5NjIXU5OpFuEv9dtlceLCfWStAKZMaTKbK
 k92pxMWvYLCPw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220919122108.43764-1-pierre-louis.bossart@linux.intel.com>
References: <20220919122108.43764-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: SOF: start using tracing instead of dev_dbg
Message-Id: <166362902112.3419825.5579029076965625073.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:10:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
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

On Mon, 19 Sep 2022 14:21:01 +0200, Pierre-Louis Bossart wrote:
> Multiple maintainers have told us to start using the tracing
> subsystem. Wish granted, this patchset suggested by Noah Klayman
> removes a number of verbose and arguably useless dev_dbg or dev_vdbg
> logs.
> 
> Beyond higher efficiency and less intrusive instrumentation, the use
> of bpftrace scripts bring new functionality and helps gather
> statistics on usage count on a running system, see how we can get
> information on suspend/resume times with [1]
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/7] ASoC: SOF: add widget setup/free tracing
      commit: fa6e73d69193d0ba3b794f7c303beae498732f40
[2/7] ASoC: SOF: Intel: add HDA interrupt source tracing
      commit: baedc6300b3d52c71a06f4bddd426488ec243c2b
[3/7] ASoC: SOF: Intel: remove unneeded dev_vdbg
      commit: 032e7c68bb4f4d977d2dd7f7629771973131f15e
[4/7] ASoC: SOF: remove unneeded dev_vdbg
      commit: 4a232cc910b943947a52da363bce1265911555f7
[5/7] ASoC: SOF: Intel: replace dev_vdbg with tracepoints
      commit: d272b65704bbbb9c054093c8c7dffb7b1793539f
[6/7] ASoC: SOF: replace dev_vdbg with tracepoints
      commit: bcd2cc350ded769963970c4b0074b38bc9240a64
[7/7] ASoC: SOF: replace ipc4-loader dev_vdbg with tracepoints
      commit: 794cd3bd69315f724532e35fbc1c45dfad9a79e6

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
