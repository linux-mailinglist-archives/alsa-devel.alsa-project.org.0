Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C55E12A4E2E
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 19:17:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 604B715F9;
	Tue,  3 Nov 2020 19:16:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 604B715F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604427428;
	bh=ALXzQE2fcGXC/HZ3VGTSEZUD0TE16Sre/6edOvYV9CY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g1uAm0LAYLDPFRRfxH0YrDRJ4+ooJW+cP4CysHb8on0pwNO5SskUU2YZuSl3co8aQ
	 0gfuLbhXeDe/Fovmm7aCa6aLeLsqHLymg1g5ETqGrXU7WryDIU8tMvYSjSDAauqBmu
	 XCx3XZTvSMSGW0INsOn63eOCSckIBqFUexMHGfPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92F5AF8028D;
	Tue,  3 Nov 2020 19:14:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02437F804B4; Tue,  3 Nov 2020 19:14:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1A6EF8028D
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 19:14:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1A6EF8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rNG+8niD"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E38A20757;
 Tue,  3 Nov 2020 18:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604427289;
 bh=ALXzQE2fcGXC/HZ3VGTSEZUD0TE16Sre/6edOvYV9CY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=rNG+8niD3W31+DSXl54KO3V0sGuMehX8Rn86Vtcox28BxFJugzqf9sEZDl8xj/0Rk
 lqOtoY9LKHtsSWLozHW2sS/1n3MrE7fpVkRi5x+dKL9uXscDa6tZGYKgp3nWbriARc
 uaEquhkiu6OG2xHPrsjeMi4p5Mb89MeM3hG5vlVs=
Date: Tue, 03 Nov 2020 18:14:40 +0000
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, steven.eckhoff.opensource@gmail.com,
 "trix@redhat.com" <trix@redhat.com>, lgirdwood@gmail.com, tiwai@suse.com
In-Reply-To: <20201101171742.2304458-1-trix@redhat.com>
References: <20201101171742.2304458-1-trix@redhat.com>
Subject: Re: [PATCH] ASoC: TSCS454: remove unneeded semicolon
Message-Id: <160442726961.14840.4470080067281230825.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Sun, 1 Nov 2020 09:17:42 -0800, trix@redhat.com wrote:
> A semicolon is not needed after a switch statement.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: TSCS454: remove unneeded semicolon
      commit: 99503469bdb54868fc9566480f1897c85dddd256

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
