Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5A25810D9
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 12:12:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29E9084B;
	Tue, 26 Jul 2022 12:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29E9084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658830331;
	bh=ogVKEyH2n6wMwdJQk64NIQ0QlsvgWIhFyxyWcaMBLaM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HGZj5JwdR1HJAWtQyCLo1BH2OPEh/UKnMCu3zC9OsNDanLxuCxERdKRBEHY0ZNbEv
	 Tz9NWoj9tYF+V02pvM0iJVq5Snlbw95dw8jYCNEGaVQD94FPou0x6SlE8HDbXLU4iD
	 ZvMWRjLE7jGvUfUDuu11411D29Gklca27DjWQUUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3D04F80271;
	Tue, 26 Jul 2022 12:11:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6981FF8025A; Tue, 26 Jul 2022 12:11:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4115BF800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 12:10:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4115BF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uPMPk00K"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A7D9B8122F;
 Tue, 26 Jul 2022 10:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C61C341C0;
 Tue, 26 Jul 2022 10:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658830255;
 bh=ogVKEyH2n6wMwdJQk64NIQ0QlsvgWIhFyxyWcaMBLaM=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=uPMPk00K6JphqqEuwMR2fgOgr8BEkA20bhMx47J1UOOpD9XX7yhNXbWnds8MaBOAS
 Bt7wUHkQwZL+/f+NTxv3BPQa1naZ3n1+zPOEeLL6QGnM6pNd1X/6CSPrzk0u/j2P8i
 EsXASVsHHzQZCbltIe9vG9MfBlO2De0ItFwM2e7O1/IQsNCM8/Ae+IDcqNCHomBDbx
 VFGpleNa7lKhfc5q3L/uHBusc4kR89fSf7/5W3xHKWHGmVfzxVCDjdylNW676/YCR0
 1EHHuEvq+fof6pwWnyqPhr8bjH3IrFgQr5vVoDK5rHu0Df7hnnxHDR/TwMifxqBNnF
 IuYyOjipJ34mw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 steve@sk2.org, alsa-devel@alsa-project.org, 
 perex@perex.cz, ryans.lee@analog.com, Ryan Lee <ryan.lee.analog@gmail.com>
In-Reply-To: <20220723015220.4169-1-ryans.lee@analog.com>
References: <20220723015220.4169-1-ryans.lee@analog.com>
Subject: Re: [PATCH] ASoC: max98373: Removing 0x203E from the volatile reg
Message-Id: <165883025392.54936.4365512627715267394.b4-ty@kernel.org>
Date: Tue, 26 Jul 2022 11:10:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-c7731
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

On Fri, 22 Jul 2022 18:52:20 -0700, Ryan Lee wrote:
> The 0x203E speaker gain register should be non-volatile.
> This register value was not able to be synced because it was marked as
> volatile.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98373: Removing 0x203E from the volatile reg
      commit: bd1963d837a082e1083cd396803d3d263a9ef68b

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
