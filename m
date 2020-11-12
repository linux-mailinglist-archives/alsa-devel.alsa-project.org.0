Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B86EE2B0E3B
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 20:40:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 928C9184C;
	Thu, 12 Nov 2020 20:39:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 928C9184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605210032;
	bh=CknkC8iFcZjR3YmZaUwP6H3rC6M40/iKuJIBJqm/+B4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=niw9mW2VmDIhY6DNGfn56gy5/nU4kM75T5Xa/PHyUNjGReUVrl64FhbCh0uKzEt5H
	 H6zUUSkzy6l52Tjl/KXdK3EvoeBXWz0+YNUfHC2jZ2zNtjPNh/nagUq7B/EQroZFoY
	 dCzlAOItMKgGIWGP1szlAtrDbqGGg7cj4YUpcKtE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F21FCF800D1;
	Thu, 12 Nov 2020 20:38:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FBCAF8021C; Thu, 12 Nov 2020 20:38:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E759F801D5
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 20:38:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E759F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xVuB1vZp"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E6F62224A;
 Thu, 12 Nov 2020 19:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605209925;
 bh=CknkC8iFcZjR3YmZaUwP6H3rC6M40/iKuJIBJqm/+B4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=xVuB1vZpqJ4jb5JB8NzZqR6z38F0zyj67mi7qm8dqL1bmjVLaLtLiHE5BV+hXMyUz
 XmsK3qDmFIIg4n9t7ltSFU4TvQc1eKml2VDa4nprb9u1DGaZEz21mrBMlrQgfiepXm
 9oH68r4UefoXaqbJEja60ByB/nczS2vn2fjy823o=
Date: Thu, 12 Nov 2020 19:38:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20201111173321.1933452-1-kai.vehmanen@linux.intel.com>
References: <20201111173321.1933452-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: loader: do not warn about unknown firmware
 headers
Message-Id: <160520990388.38586.8156949378615302490.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, Karol Trzciński <karolx.trzcinski@linux.intel.com>, daniel.baluta@nxp.com, ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com
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

On Wed, 11 Nov 2020 19:33:21 +0200, Kai Vehmanen wrote:
> The firmware extended data IPC and manifest structures are designed to
> be extendable without breaking the driver-firmware ABI. Driver should
> not raise a warning in case a new header type is detected at
> firmware boot. There are already checks for IPC ABI compatibility in
> snd_sof_ipc_valid() and if the versions are deemed compatible, extra
> fields in IPC messages should not trigger warnings.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: loader: do not warn about unknown firmware headers
      commit: 0c7f946d6b10ea240743cdcd8a502f82a6148b10

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
