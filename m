Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1492FDDA6
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 01:09:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D8B0182A;
	Thu, 21 Jan 2021 01:08:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D8B0182A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611187764;
	bh=N1mlBY088igQfsMBJR6jW/QOyJyZXrVgghJ4959COtQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nDdcvJKyNzAeIfqNmZAbUrOgMFg09zCSpS0krFQJlWDQIXmdHwvvwtXOdU5QPp7dL
	 cbtm/gNqHVptHMUL3NmVMBfZeC9Cu36knzxRFlyaZU1h2kImGuZuYw71KrKoLVX7gP
	 t4NxPQG8sdEyuh1Bfqgd8mIg+2ecMEo7wtkO0CEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B480F804CB;
	Thu, 21 Jan 2021 01:06:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A060F804D8; Thu, 21 Jan 2021 01:06:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FB5EF804CB
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 01:06:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FB5EF804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sZT099S3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E1F52054F;
 Thu, 21 Jan 2021 00:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611187607;
 bh=N1mlBY088igQfsMBJR6jW/QOyJyZXrVgghJ4959COtQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sZT099S3yrC7+GQVsgAY20HuW3eJmjIe15yHokXNRt/HMqFbClhRgxhKmT+Hz9RtC
 N0TM1RDgj9ZIVg2xuPoxrj8GhMV1KjYVZXuFUaQPZeP/5UHSk0HN2k2QoaXspLfwzu
 QTkEkIxjmAYxeVvfWRKRqTImNA/nwRNifg51rI4MuWQaRPbeRgtsicjcQgqIY2Bd3M
 jKdiALTUqHJixHd3U1qQfXg8JPmsLfKxjr70Cm81WRhiUZhrqHbbPHsE7A/HYS2fVh
 eZIQ5F0fbydWMcSlFxrtEQRAdnzsEfVEtJL/ItD1Xi85HOSlWKYWTgFJ61ufWYG7dX
 6V4yV27x4obHg==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20210118123815.1630882-1-festevam@gmail.com>
References: <20210118123815.1630882-1-festevam@gmail.com>
Subject: Re: [PATCH 1/6] ASoC: fsl_ssi: Use of_device_get_match_data()
Message-Id: <161118753485.45718.16707397897261103162.b4-ty@kernel.org>
Date: Thu, 21 Jan 2021 00:05:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, shengjiu.wang@nxp.com,
 timur@kernel.org
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

On Mon, 18 Jan 2021 09:38:10 -0300, Fabio Estevam wrote:
> The retrieval of driver data via of_device_get_match_data() can make
> the code simpler.
> 
> Use of_device_get_match_data() to simplify the code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: fsl_ssi: Use of_device_get_match_data()
      commit: 9ce63203eb2071fe0117d2e2454c19d79af4a2f1
[2/6] ASoC: fsl_micfil: Use of_device_get_match_data()
      commit: d7388718d491463ed0fb7383a4c678b94fdda785
[3/6] ASoC: fsl_xcvr: Remove unused of_id variable
      commit: 42450175a3d21d0818976114833d23ca5035e713
[4/6] ASoC: fsl_asrc: Remove of_device_get_match_data() error check
      commit: 214172a9ca26f77c3d6912f97246dc6ec9b16141
[5/6] ASoC: fsl_esai: Remove of_device_get_match_data() error check
      commit: 1ccf6e6ef9261c0c8c0be495070c45c030adcc40
[6/6] ASoC: fsl_spdif: Remove of_device_get_match_data() error check
      commit: 4e63b56593e25937f22c01ae60574a3b0548553c

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
