Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 618D65450C1
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 17:26:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D9A61A43;
	Thu,  9 Jun 2022 17:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D9A61A43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654788389;
	bh=5sybBosVy4SqQ4BF1dypok5zPYfglVVIvP0ZEo7T5c0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kgJLIcjeCJgGQ3RuPKVn1qIbUMHt3TUlhpantkCqkQCkT7NNgCwC5QRwV66eVFO+v
	 3Qw++OUfuksvTAwP9NINZUAeYwNiNoUOJIoMt6C2vJFY9SzcpwDVduzs8aUlgW1zqI
	 L+t9gqIn6EkwZpn4zJG09r+GP+80JgoIC5J9BjQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C974F804B4;
	Thu,  9 Jun 2022 17:25:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 306D7F8012F; Thu,  9 Jun 2022 17:25:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E390CF800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 17:25:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E390CF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oFCUSJo/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B7971B82DE6;
 Thu,  9 Jun 2022 15:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2087BC34114;
 Thu,  9 Jun 2022 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654788319;
 bh=5sybBosVy4SqQ4BF1dypok5zPYfglVVIvP0ZEo7T5c0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oFCUSJo/RoToNkrrfvV0ott7cOQGeX7821ft5Z0YVApEeZEEcmXjk/1VeckSNuqI4
 VLda+99aIXK0/n+GXYcxp9vqCbIT9iWiYaZdchJJ/yTVDoEsCy92AQvgIw8Cqoe3FE
 8ZsU9iUSWUvJaYXoDLDsvo+taYRh8Vzh3DL1tDEZrQ9aPqiMgRhq9PLSBbKMdrao78
 I5gaagJYb4l4ZNiGzO/pFttogyV2qQYjJavngq4nN7g3KKmnZQzOYRWOI6bvb8kG4a
 /NClaVwzxNB7JMNMDC7LteCffBhnfxbJTQJM0dWPxwwF1Kxk3bSJFhwtmXy5KdA253
 VhjDGbSCIK91A==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 lgirdwood@gmail.com
In-Reply-To: <20220609085949.29062-1-peter.ujfalusi@linux.intel.com>
References: <20220609085949.29062-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: Intel: Fix IMR boot race caused by early
 core booting
Message-Id: <165478831783.1133084.13258585087552216099.b4-ty@kernel.org>
Date: Thu, 09 Jun 2022 16:25:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

On Thu, 9 Jun 2022 11:59:46 +0300, Peter Ujfalusi wrote:
> After the revisited IMR sequence patch
> 2a68ff846164 ("ASoC: SOF: Intel: hda: Revisit IMR boot sequence")
> 
> we have started to see random boot issues manifesting in ghost reply messages from
> the DSP for a never sent message.
> It turned out that an earlier commit:
> d416519982cb ("ASoC: SOF: hda: don't use the core op for power up/power down")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: Intel: hda-dsp: Expose hda_dsp_core_power_up()
      commit: 537b4a0c8b9490d762e70c0ecec38144c83d0c37
[2/3] ASoC: SOF: Intel: hda-loader: Make sure that the fw load sequence is followed
      commit: fcb3c775f7073410965ce9414ddb2a1f339c502b
[3/3] ASoC: SOF: Intel: hda-loader: Clarify the cl_dsp_init() flow
      commit: 4643e10a17e549467420aaeeb35c9b3480716618

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
