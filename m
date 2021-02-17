Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CD831DF47
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Feb 2021 19:55:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1DCD1663;
	Wed, 17 Feb 2021 19:55:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1DCD1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613588150;
	bh=XA7ITtzJmxA8zn4JD40Vvp8IBVaGbQMP+/zDhaDDGcs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nBg8GN+ulDn+rxhk/kk4sRzdbwXlSU1SwkpqYPkjhSJY9azpm+uJ6JVaHhJ/E84Nk
	 NOlohD4jiYeP5l4z1Ji0VtFJdKVZaenBuwAuJwUxSuAGdmCoBk0XpmuXIP+z2FjBCS
	 AS+G7JJuurT5tFATBNTRH9bYxrT+t1X8vXmcAcEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C849F8026C;
	Wed, 17 Feb 2021 19:54:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE173F8026C; Wed, 17 Feb 2021 19:54:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 244BDF800AE
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 19:54:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 244BDF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OAHlC1k4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A31E364E45;
 Wed, 17 Feb 2021 18:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613588043;
 bh=XA7ITtzJmxA8zn4JD40Vvp8IBVaGbQMP+/zDhaDDGcs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OAHlC1k4Ipa/xWyXF/RHM+fL+2g6GX4u/LFJk/PPUyCIJplMFlWeBhfDTDe8gsVwM
 WfbOxx15VP2ZO3mneBVEqACPZsLoVzB45AknvhLdBn7N2G+PmxDirdgYyy+9XR6bC/
 yoWZ6z8xZ3yfRG3W4PqEmYRhoYH+D8672BnbOyztcZ2BwmL8dNfsX4U2NI0gOYDAVt
 +j0Qq0GpNf9IedhYRD96gWH4SAYZi6PPduuPufYOkn+48Ri7lOF2iM3QeYZrjnfgGW
 VAa6Vm93p8j/bApdQF+EvcBXWxlpcMGcia0g3Ux6SZ2d7xVIAeD48Lb45kaKa7rjy8
 RVLSTK5nZoGPg==
From: Mark Brown <broonie@kernel.org>
To: kuninori.morimoto.gx@renesas.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20210216172251.3023723-1-kai.vehmanen@linux.intel.com>
References: <20210216172251.3023723-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: soc-pcm: fix hw param limits calculation for
 multi-DAI
Message-Id: <161358797884.15305.17517139861911870804.b4-ty@kernel.org>
Date: Wed, 17 Feb 2021 18:52:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com
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

On Tue, 16 Feb 2021 19:22:51 +0200, Kai Vehmanen wrote:
> In case DPCM runtime has multiple CPU DAIs, dpcm_init_runtime_hw() is
> called multiple times, once for each CPU DAI. This will lead to
> ignoring hw limits of all but the last DAI.
> 
> Fix this by moving soc_pcm_hw_init() up by one level to
> dpcm_init_runtime_hw().

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: fix hw param limits calculation for multi-DAI
      commit: 8a353d7bafddb447fae136ca68899a6ba6187be6

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
