Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B4E21AA30
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 00:02:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D76511616;
	Fri, 10 Jul 2020 00:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D76511616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594332170;
	bh=KTis7LSip2tgNS5BmCt1ETgGx7obSOtc3jyA8p8H4sw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XxvQr5s3iur1afnjwiW26B1+0bpEAWgqvx/ZobdwGuZ9Y9QEio0GKz+4ZS0jsXmG4
	 d1jaV4j4XpWHwY2J1gN1ML5sqc0Y/XD4gAJc3VPxppwwKiDnZQOoJFRF9A3WC9ITmH
	 QNGQXaVz86I9bWFqloOzmLnaWEQGTCcQ9jmj+Fr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85CEBF80264;
	Fri, 10 Jul 2020 00:00:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF244F80216; Fri, 10 Jul 2020 00:00:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33643F801F9
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 00:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33643F801F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PHMP7Xd9"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B3D420774;
 Thu,  9 Jul 2020 22:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594332011;
 bh=KTis7LSip2tgNS5BmCt1ETgGx7obSOtc3jyA8p8H4sw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=PHMP7Xd9W5mrdKGHfMyNojJjvi1AX2bOlaZZrstfJtKuWkOzf0dWvK0WZY/4aAhnw
 HgFnv+QExkEClG2/Hgy8EY8q4bsbyRqbc/ZtCv/K2j8tZSZibVqZtgxJrEaRVWFq1i
 UwMLWx4kp4Be+ReFZY9C/E6MIPrKAH97xRtZGm1g=
Date: Thu, 09 Jul 2020 23:00:05 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, "shumingf@realtek.com" <shumingf@realtek.com>
In-Reply-To: <20200709101345.11449-1-shumingf@realtek.com>
References: <20200709101345.11449-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt286: fix unexpected interrupt happens
Message-Id: <159433200031.57213.1169861509572541722.b4-ty@kernel.org>
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, pierre-louis.bossart@linux.intel.com, derek.fang@realtek.com,
 flove@realtek.com
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

On Thu, 9 Jul 2020 18:13:45 +0800, shumingf@realtek.com wrote:
> The HV/VREF should not turn off if the headphone jack plug-in.
> This patch could solve the unexpected interrupt issue in some devices.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt286: fix unexpected interrupt happens
      commit: 12eb3ad0638c2a6af72de866e9d7837de16ee82f

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
