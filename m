Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AEE518921
	for <lists+alsa-devel@lfdr.de>; Tue,  3 May 2022 17:53:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A15215CC;
	Tue,  3 May 2022 17:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A15215CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651593200;
	bh=btwaebfHCmMK73yrB9r1ctLvjIEFUIO9IcgVjVAtjK8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IQYV5z6ufp3hlCpAkeYuDuzT/0F8WfkU3IQTslEgS/sYR02AoEUM9ER8cGLrXvE7l
	 uSJCi9MdMhidcjYze+yln9kY22zh7nstNFHHb6Me2W7T8b13yHAJ03XH0G/gw0qwlR
	 qb58n8bKZyfGobnAcqOQ79vv4SdAIjxhzZDJFr/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2983FF80519;
	Tue,  3 May 2022 17:51:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D88EF80236; Tue,  3 May 2022 17:51:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E939F80129
 for <alsa-devel@alsa-project.org>; Tue,  3 May 2022 17:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E939F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tXopn52v"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5531F61675;
 Tue,  3 May 2022 15:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6BB8C385A4;
 Tue,  3 May 2022 15:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651593060;
 bh=btwaebfHCmMK73yrB9r1ctLvjIEFUIO9IcgVjVAtjK8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tXopn52vZqtX5eXufBVdUolAqrCu8hv95muy7S7VNdjn0rVGbY9pWmcT7K7Be7wGl
 3cIvYziw61/hxgRXi2rrZhTk46TJHh5/gkG+s6uZfBW05n0MSp0hvWin2y0tsykGUC
 QneUFPd9H/Ue1LSRq+lizINDV2HqH6GBi6y3frsBxbN04RP6amsVRQFOkwVaYRlKSZ
 /L0jK1J9zBckveBs4ZNNoybPpnSxoUH4lJ/C9fCGZeUHLcvKkMJ6tiIEO7G/DDRCVC
 pkveUvDrFfs2OscdPIIwI1wRDXJ9RgtVXH7aRpqCQbaYCPkMBKnVYufHHIMwOJL4yp
 MtToBOPUZW8ew==
From: Mark Brown <broonie@kernel.org>
To: ricardw@axis.com, lgirdwood@gmail.com
In-Reply-To: <alpine.DEB.2.21.2204281841290.5574@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.21.2204281841290.5574@lnxricardw1.se.axis.com>
Subject: Re: [PATCH] ASoC: adau1761: Add ADAU1761-as-ADAU1361 compatibility
 mode
Message-Id: <165159305960.184114.7599105455951981283.b4-ty@kernel.org>
Date: Tue, 03 May 2022 16:50:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel <alsa-devel@alsa-project.org>, lars@metafoo.de
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

On Thu, 28 Apr 2022 18:46:35 +0200, Ricard Wanderlof wrote:
> During probe, determine if the chip is in fact an ADAU1761
> even though an ADAU1361 is specified, and perform additional
> operations to enable the ADAU1761 to behave as an ADAU1361,
> i.e. disregarding the DSP and setting up routing and PM
> transparently.
> 
> This enables either chip to be mounted when an ADAU1361 is specified.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: adau1761: Add ADAU1761-as-ADAU1361 compatibility mode
      commit: c7b92395836c3962eedbe6b4f58f9dfb2b2cc921

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
