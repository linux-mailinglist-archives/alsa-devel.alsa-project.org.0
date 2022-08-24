Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE12459F872
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 13:13:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F80F161E;
	Wed, 24 Aug 2022 13:12:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F80F161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661339603;
	bh=VOqnFDyiEIqBZ8w37kaq14ND+nysAVqM1VyiC0YUPno=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qQbinOdsa9obnelicGp0tSdKzZU33ZR0gZaVRFYVo5e+GiZwI270+p5EWBM0Zl6IQ
	 UfJ488Ba+IEmFaYOGxT2EOCL1PzXmxGSBdByQs4fc0/I/vt7UDYvc4kaKUwaRopuRi
	 oo92DhUjs3Kz5PypyeHYttrrMCBV0O8mIcqGJad8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90BA6F804C1;
	Wed, 24 Aug 2022 13:12:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AD64F804C1; Wed, 24 Aug 2022 13:12:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 770F4F800A7
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 13:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 770F4F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OHGQoR9T"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8DD03B823A2;
 Wed, 24 Aug 2022 11:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5168C43140;
 Wed, 24 Aug 2022 11:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661339536;
 bh=VOqnFDyiEIqBZ8w37kaq14ND+nysAVqM1VyiC0YUPno=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OHGQoR9TTPNXQKj/m0hbr9KMZlWqQYL1TmXYmCGkJ7hXkjg/yTmKwLudpN0cWh639
 wGCQTYZIFRH/j8O+mC6Ddl+/EbI2yYIxzsSr8dWaXoNtNoV1k0jgphHsDBZ/xKI8XV
 iTjcn8x/285L74LFwRWP6XlgREAi1AkPenTAXk2UNaL5W6WqX0wah/B412t1cdy+Za
 xEoLcodCop8ESOQWEtBlDf/Fbka+NDiFEDvhvcvWE9I2coHBN9jMxXqjiJIMEOJmQq
 I52itM5+w0luE+J8rFSJXSfYHj09ssHEIEMgnn5fFWZNvtjz8QnY7kUxNrD1riNTOx
 xpPRbPZlzeSgQ==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220823124219.927-1-peter.ujfalusi@linux.intel.com>
References: <20220823124219.927-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-loader: Verify ext manifest magic number
Message-Id: <166133953439.17904.16209764128409365284.b4-ty@kernel.org>
Date: Wed, 24 Aug 2022 12:12:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
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

On Tue, 23 Aug 2022 15:42:19 +0300, Peter Ujfalusi wrote:
> Firmware image must start with an extended manifest. Add a check to make
> sure that the image does contain it.
> 
> The magic number (the first u32 of a firmware image if manifest is present)
> for an IPC4 image must be 0x31454124 (ASCI "$AE1").
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-loader: Verify ext manifest magic number
      commit: a337c2012774d588fcab318c42edc2601d90e549

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
