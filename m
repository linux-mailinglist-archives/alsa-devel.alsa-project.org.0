Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B4C3D604A
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 18:10:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 877991727;
	Mon, 26 Jul 2021 18:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 877991727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627315822;
	bh=80wDvhw3TGp7yRC6GXcqnilfbx5rPUo09aB+d1Nu1xw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cxyf5adkqHOC5JixsbawrGSBr1ZS1pzgU2tb5a6M9OKRSkSK85tNy+eIYA0VBMBlo
	 yg3imBmTfZyH3WtD9a70r9DVUGFGE1KNMvP/RCvH8BfX5Eqwef++Bn3TMRUppKPQSO
	 J8pTWwe1Xyaunb/DX3TFus5ENXPuDM2ka2IvQR4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1CFEF8025E;
	Mon, 26 Jul 2021 18:08:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07DF4F8025A; Mon, 26 Jul 2021 18:08:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77E5EF80130
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 18:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77E5EF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LGq9QA2V"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D24E60F6F;
 Mon, 26 Jul 2021 16:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627315723;
 bh=80wDvhw3TGp7yRC6GXcqnilfbx5rPUo09aB+d1Nu1xw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LGq9QA2Vsdr4Ez3jXY/g+7NG6GuuXC+ZfEOiiIc7cyRpvLLPym+TqsbuGy3X9cnxO
 FegtMH7lx6TmwaEx/4z9q6MJgAAGRxGPCff9Cm3hDqlt9pr3/vKWaIo9FI3oiF8iLz
 zkwh7FbcSiEKwrkkZ2JjSY7lmwXYIwbzJqLhpe/cnn7tqxVpValzbOY/Qjh6V/LaZD
 opsq3UuwRX7k2yMA1Z66Ph4iHjSwf4zZPyJDOjBYuNPD78gSLvFH7S/IXjSxMUEVu6
 sxK4vgpqruJzPdNXAZ5rWgS69CcIb/hnkgyYqn9To7skq+CV1u81Wle6GTDSTElLwH
 2A0AVsMNa9GJg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: tlv320aic31xx: Fix jack detection after suspend
Date: Mon, 26 Jul 2021 17:08:32 +0100
Message-Id: <162730195369.27511.5506032869262329482.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723180200.25105-1-broonie@kernel.org>
References: <20210723180200.25105-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Fri, 23 Jul 2021 19:02:00 +0100, Mark Brown wrote:
> The tlv320aic31xx driver relies on regcache_sync() to restore the register
> contents after going to _BIAS_OFF, for example during system suspend. This
> does not work for the jack detection configuration since that is configured
> via the same register that status is read back from so the register is
> volatile and not cached. This can also cause issues during init if the jack
> detection ends up getting set up before the CODEC is initially brought out
> of _BIAS_OFF, we will reset the CODEC and resync the cache as part of that
> process.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320aic31xx: Fix jack detection after suspend
      commit: 2c39ca6885a2ec03e5c9e7c12a4da2aa8926605a

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
