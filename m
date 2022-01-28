Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B96949FD75
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 17:01:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D94C3170A;
	Fri, 28 Jan 2022 17:00:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D94C3170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643385707;
	bh=ahZ3NX7pofnxEB/aLAmmih4Vi3zsBzZh6R2P5k1wZ10=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NqE2LagFBCZJPRnFkOLmqiTWwkBxcPKTClQAoWrWLmwZswpggIgPMQsgwtypnOPOy
	 drd1IAoPfT3DVuDNZTA+RjHqhCLUU4OIO5MrkNq0tdiMbbC2HukleczS7RgO+XKJNM
	 +sAKB3nKGFg8x3klQNb1oWp/hdvYGH1+dgJiAHxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A44A7F80525;
	Fri, 28 Jan 2022 16:59:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15B30F80524; Fri, 28 Jan 2022 16:59:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C64FCF8051D
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 16:58:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C64FCF8051D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sApU4Fo/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A501660EB8;
 Fri, 28 Jan 2022 15:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D41ECC340EA;
 Fri, 28 Jan 2022 15:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643385535;
 bh=ahZ3NX7pofnxEB/aLAmmih4Vi3zsBzZh6R2P5k1wZ10=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sApU4Fo/soPKzn8EQ6l8dSRCeAD1gIOyBmbq1HxWwS7CKQQcbrE/lrBBx7osVCxS+
 loFW2Y+vOsDF6PzAiZj1q9o+cZImfglDAEgbbCvFjNUEEjHAXs1UvhCM6cB8nLgd4l
 z+g2tkJzrb7UNVKJ9wvq4QDfjLZOnxV7EW/R7QC5XrJctH1oUWQbKw5fLkN2YEC/x1
 30qgzMrFUpzoNAlgriwNRvPUVXfkT5+KqiNEtIRluiYWizvTT1MTUa4rC1C3DFw+Ga
 UguwfCwKE2MfS9/R+l79NjxyCm2mxdQ50SnRiLAy4Z5z4jmGAvMi398sr/HSETVitB
 YJ3qzQTrciJ8w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220128130017.28508-1-peter.ujfalusi@linux.intel.com>
References: <20220128130017.28508-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: Remove link assignment limitation
Message-Id: <164338553359.1711274.11036950846712094644.b4-ty@kernel.org>
Date: Fri, 28 Jan 2022 15:58:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 28 Jan 2022 15:00:17 +0200, Peter Ujfalusi wrote:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> The limitation to assign a link DMA channel for a BE iff the
> corresponding host DMA channel is assigned to a connected FE is only
> applicable if the PROCEN_FMT_QUIRK is set. So, remove it for platforms
> that do not enable the quirk.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: Remove link assignment limitation
      commit: 2ce0d008dcc59f9c01f43277b9f9743af7b01dad

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
