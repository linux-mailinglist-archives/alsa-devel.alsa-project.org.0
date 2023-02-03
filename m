Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5AF689C59
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 15:57:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13241826;
	Fri,  3 Feb 2023 15:56:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13241826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675436235;
	bh=AfximO0XA1qQ5K6AIumXt+j709lhqdJgdcHy1k/Idq4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IaJEHqfcu7R41m+qgf9u7EV5QtuGSKAXoH9ft1eqU+3cTMzP+vQr6f6cghFAzf/LC
	 YJpH2bjhkzYr17XSRVueFSqBK32zCrMucXrfD13+Tvp6xpdk8gT9hSJRapHzZbkYVz
	 ji0bHjLaygsBA0+Gei7CQFuwLCs9zxk4IrwW4epo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F216F80494;
	Fri,  3 Feb 2023 15:56:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99F86F8045D; Fri,  3 Feb 2023 15:56:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23344F80022
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 15:56:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23344F80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fw/YutoM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A58AC61F45;
 Fri,  3 Feb 2023 14:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF43C433EF;
 Fri,  3 Feb 2023 14:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675436161;
 bh=AfximO0XA1qQ5K6AIumXt+j709lhqdJgdcHy1k/Idq4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fw/YutoMkTSVcNAuUumbadfIP1DTq3wHkZasJnKpNmUlriIz12bQLKMt0eHKBdqNI
 zOhFMYosVD79zv65pxs00eYYrCrl9/yg4gxzi5LYcO75R94NvPZulMI4TuZuotmfjG
 QEBsILnz4krnlK4vlap+IhNgtBRO7Od5J47sgdo/3j7W2RiWmMXfrQ2tE0bl4XJSvs
 f4n23CvVaSI+UNSKaKq7dxuZ6dWPF2n91z/tCkaCYoN3HyaGI2mElAkwOyledJ3X68
 ARQoKbAuJIDimv01jMWqwg3PwwkiqLxKbDzpeJTDsCIvvzukVela5XPFuIX22s/53n
 fGZF/uTA1tfoQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com, 
 amadeuszx.slawinski@linux.intel.com, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230201112846.27707-1-peter.ujfalusi@linux.intel.com>
References: <20230201112846.27707-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: (SOF) topology: Regression fixes for next
Message-Id: <167543615882.928818.7736386383877714681.b4-ty@kernel.org>
Date: Fri, 03 Feb 2023 14:55:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 kai.vehmanen@linux.intel.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 01 Feb 2023 13:28:44 +0200, Peter Ujfalusi wrote:
> Today I came across two regressions in next with SOF:
> 
> The topology would not load with a failure of creating playback DAI
> the first patch is fixing this which was caused by a missing 'else' in the patch
> 
> After fixing the topology loading, the module unloading caused kernel panic.
> The second patch is correcting that which is I likely caused by copy-paste to
> set wrong unload callback for the graph element.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: topology: Add missed "else" in sof_connect_dai_widget
      commit: afd7c141c750f3f043c755bd8d01a2ffee7e95b2
[2/2] ASoC: topology: Set correct unload callback for graph type
      commit: dd184c400e10295631e5742fc7318ba071c67007

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

