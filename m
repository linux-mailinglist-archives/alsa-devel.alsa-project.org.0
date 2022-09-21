Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ED35BFACA
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 11:24:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4309CE0E;
	Wed, 21 Sep 2022 11:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4309CE0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663752255;
	bh=OzjoJonxXGlB8nr4oncpwJv+C6VnsNGW0huAHa5YGA4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NmwGLwFdmsvds44ER0qE5rKxkkUZmlHLJ25orjgCtj86h+NSSocMMRSpZzQUzK3yd
	 TBS/EFYqFr2pkGAaUPSA9i0PG8sQNidWHgwviDdPkS05Y0VE3Z1gsbqQegKMgMPCGY
	 2ssQxiRsjFGNyWtPgpW1MMtX8IZUJDP3hEqy4L6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52F59F80107;
	Wed, 21 Sep 2022 11:23:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23802F804C2; Wed, 21 Sep 2022 11:23:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBEC0F80107
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 11:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBEC0F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="chYJ+neV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1E773B82EC6;
 Wed, 21 Sep 2022 09:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6947BC433C1;
 Wed, 21 Sep 2022 09:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663752190;
 bh=OzjoJonxXGlB8nr4oncpwJv+C6VnsNGW0huAHa5YGA4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=chYJ+neVh6CHNZy50WPC0mnPDolX2/Iy1Hr53I6PiXexzwfERP5nEqYgtY+IBGkv9
 ppTdNyPct+Xj5o8CWr8bQu59gGu9KKnIIMYjEIA2Z1/4RfqiWoQ9Y9TGHumt2Nqe1z
 Zxlr1tH4Iyr/hh7nnpXcbW8S5oCMwJbOQw/jnlAD7sR/q7ObwzGzeTc/e7hdVOkVWC
 86yNVpZC8SYufHjEkUJB4D4mGfxkINmTxD54j25pQdI+rRkZl3YxrJbTdrAXcoDeQx
 LZBWyhWuJNPJYDk0IcA+qoW+LJMohQbKBzP6MB8/TCkVM7V27ZE8cLqjceG+T01v3d
 aU2Jt+XUwlGUA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20220920131700.133103-1-pierre-louis.bossart@linux.intel.com>
References: <20220920131700.133103-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 0/4] ASoC: SOF: Add SKL/KBL support for IPC4 CI tests
Message-Id: <166375216695.526450.11351699549653144445.b4-ty@kernel.org>
Date: Wed, 21 Sep 2022 10:22:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>
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

On Tue, 20 Sep 2022 15:16:56 +0200, Pierre-Louis Bossart wrote:
> This patchset was submitted earlier in April 2022 as part of the
> "ASoC: SOF: add INTEL_IPC4 plumbing" series. As requested the SKL/KBL
> support is moved to a different series.
> 
> This update adds minor style fixes and the ops that were missing at
> the time. SKL and KBL daily tests have been running for several months
> and helped identify missing sequences in the SOF driver for HDaudio
> links, or platform differences that the driver did not account for
> (number of pipelines, etc).
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: Intel: hda-dsp: expose functions for SKL support
      commit: 556eb41622b01c50dbc330e03bad2b0a5a082428
[2/4] ASoC: SOF: Intel: add SKL/KBL hardware code loader
      commit: c712be3427ca7b76800f335a6cfabdddab380c27
[3/4] ASoC: SOF: Intel: add initial SKL/KBL hardware support
      commit: e2379d4a83da44816009971e932db31e665d41a1
[4/4] ASoC: SOF: Intel: add ops for SKL/KBL
      commit: 52d7939d10f25bc6635caa4d390e79a034626f79

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
