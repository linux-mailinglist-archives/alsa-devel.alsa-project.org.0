Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7F95706DD
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 17:21:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6426015E5;
	Mon, 11 Jul 2022 17:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6426015E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657552863;
	bh=MTXjjMKkthtOSW45I5feGFwx9rTYziret7FwmGPzzl4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CQbw3n7p3516mqqu8klyJtipNxPNqCr5+XEijKU9NlCKF0ZtcrRrIRx/q8UIk1YDw
	 ZgTnVojL3KIChpH1qW+katoiMo8PL2u6iUxpQKSi5ZI3DEGdWzqsn1ldj+hwVDEqHx
	 ca32Lxw3B5JqqYWxKFimAKmgP9LecLiSPikIgnaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8D78F8054A;
	Mon, 11 Jul 2022 17:19:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B787DF80542; Mon, 11 Jul 2022 17:19:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A15EEF800E1
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 17:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A15EEF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZrAEUeCC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C5AAB8105D;
 Mon, 11 Jul 2022 15:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0F7C341CA;
 Mon, 11 Jul 2022 15:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657552737;
 bh=MTXjjMKkthtOSW45I5feGFwx9rTYziret7FwmGPzzl4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZrAEUeCC3JdJJZ8lHcao7Vkeyd3YYFzuG9yHW+4b9xQ0g7uCjS+FF1AHnHKnXz92I
 T9ezrcXbXs+LXTFc2jvyturuBzMMHB3vgfRQl9uuO/0FJhdDFF44JMkpNNk8VYyXp2
 t5mC3UA1/ttzsTdcMTpxPgIRXt+KUjAgCTvOk8z113mWazC7VXGRODimeIZMtHWO1s
 YlXHf3jlLtXtbTZ9ekx0z8bElrU4bngvhCpaKL8uIuW6m4MTEoANqVHSFPvaOyGWIB
 ut8ruZI0ZarsQlXfKMb5ToYWDCdtbIdKqSIoeTzxuW/bMGlFSOqrGIJ3NvpXMtLBlW
 AJgzyBSlxw5qg==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220708200719.26961-1-pierre-louis.bossart@linux.intel.com>
References: <20220708200719.26961-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: remove warning on ABI checks
Message-Id: <165755273569.520536.16779033978288169088.b4-ty@kernel.org>
Date: Mon, 11 Jul 2022 16:18:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, peter.ujfalusi@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

On Fri, 8 Jul 2022 15:07:19 -0500, Pierre-Louis Bossart wrote:
> We should only have an error when enforcing strict mapping between
> kernel and firmware versions. In all other cases, there is no reason
> to throw a warning.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: remove warning on ABI checks
      commit: fd1c769d33872d6c7ec474c199f6a910d3555927

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
