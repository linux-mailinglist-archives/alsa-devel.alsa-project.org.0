Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9410639795F
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 19:42:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DB2E16D1;
	Tue,  1 Jun 2021 19:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DB2E16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622569360;
	bh=Y09JlCg2MGQstt58qhLtjjam7xzv7mhqTxwW01p4Eyg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OKZCpeAZ6kU1sVG8O5wqNpSaHTLi7lCyxyJWDjejktDplXI/aBPaDmSetx1Mh9j6M
	 wubBZ3kv6Z1HIXH/4KchJE4e5XdjhQeYhmPV5uAwazc5AV3cnTpMG/LJWcJpgfwvSZ
	 32wJN5NZlwU8XDX5/7534pmyyKUWpT3+32VtlWSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E3E4F804E0;
	Tue,  1 Jun 2021 19:39:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C8D6F804DA; Tue,  1 Jun 2021 19:39:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68238F804CC
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 19:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68238F804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jik9CqIp"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC3B2613DD;
 Tue,  1 Jun 2021 17:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622569143;
 bh=Y09JlCg2MGQstt58qhLtjjam7xzv7mhqTxwW01p4Eyg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jik9CqIpYkOPFmt6j54ZsPVwqpboLLXo57xFx5MbXBVwBiQpSM6KK9C2wsFtRhK33
 ADPsqnCvAEg/YyjwQFpp3ZLVN4vmSFFRZWqhWjc/wcrJY+4TCgUj28Bk9wz0vaYDfY
 kKawhDaZPC41wgqQ7hK/Xy8lUz20hnjWJXU8fO7abfMwS2PJ4TDJH45lnpXMwm5X/I
 EzAL3b6k3MSv5c+3VW7PDIqeDn0G4NKKlotspMlpN0zw3KJSxHNjAtOHstRaYROh1s
 wFYmkk6BCWYfHApY5G9UpwsuSQsBoqSpRYozrQFL89DCeGvZ9xjsRB5QzwpIIjLWhT
 pmRxxFqSyulTQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: Intel: hda: clean up hda_dsp_dump()
Date: Tue,  1 Jun 2021 18:38:14 +0100
Message-Id: <162256892744.19919.17769123257057992096.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210528160551.10145-1-kai.vehmanen@linux.intel.com>
References: <20210528160551.10145-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: daniel.baluta@nxp.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 Bard Liao <bard.liao@intel.com>
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

On Fri, 28 May 2021 19:05:50 +0300, Kai Vehmanen wrote:
> Clean up the hda_dsp_dump() function to avoid duplicating
> the ROM status and error.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Intel: hda: clean up hda_dsp_dump()
      commit: 7ff562fed98043b9e9eafa11db6100feb08412aa
[2/2] ASoC: SOF: Intel: hda: don't print ROM status if cl_dsp_init() fails
      commit: d95eca7e3b9f7c1361fc1e1329247490abec678c

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
