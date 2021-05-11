Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9170B37A225
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:32:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 242B71779;
	Tue, 11 May 2021 10:31:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 242B71779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620721931;
	bh=h3vnEgAyBU0stZMPX8DMF3+dsDL6cOb6KoeTnUb88bE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tKYSyOu4Ex4xOhLihjxWs3BKqiE2icnkTRR9C0w2JbqrcmineiFJ2PDDMvESoKd8/
	 MFaEPiW5agCLdjDtznWEkTU1dtOIA5bSlskduK00J24xGxOji5dFAfnbJW0eExHU6T
	 3eJGyW8yJ3snZFBQrAmMPpeXXAhLdKRu4EpdVRkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9EB3F804DA;
	Tue, 11 May 2021 10:28:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC449F804D9; Tue, 11 May 2021 10:27:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24274F804D1
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24274F804D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NN57Sn+V"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 400DD613C3;
 Tue, 11 May 2021 08:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721670;
 bh=h3vnEgAyBU0stZMPX8DMF3+dsDL6cOb6KoeTnUb88bE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NN57Sn+VQ3zGHzG2B57+k5HVHnZiJtl+ScnT+23ghenHrk7orXm/3lCoZ7pCNKlKm
 hSFQcx8O7Uk2612Bm/9cjWHnTQi2+bMOFqW5WK6Qa8wcbwUbH3Zzva+56yWatKVNjf
 OEHEi+FWfpxt8DBX3t3BQDnYNiWgeUeRSAseWYI3nb2/6JxK+Yi8hWLbO4MrcjSXmc
 y4AvE0QpPnuM3uefzRfwllUdv32UZ/N6or76K/9eHTKhQ9zuf1q2Y0Z0GOXG4PXZhe
 d0uuMHGVo1VYfD/qoMunxIG4RoCuvfrmG7YsvaNvA6Nk0dqi9Gl702MdKH3cIrgcsX
 JWT6nK/NkYNXA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, paul@crapouillou.net,
 Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoc: Fix unused define in jz4740-i2s.h
Date: Tue, 11 May 2021 09:25:52 +0100
Message-Id: <162072058169.33157.15479595461412836048.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210506131833.27420-1-tangbin@cmss.chinamobile.com>
References: <20210506131833.27420-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>
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

On Thu, 6 May 2021 21:18:33 +0800, Tang Bin wrote:
> Delete unused define of JZ4740_I2S_BIT_CLK, because it is unused
> in any files.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: Fix unused define in jz4740-i2s.h
      commit: 37c881cd18f428b08cf46c5a9d67cfd2db2c4a32

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
