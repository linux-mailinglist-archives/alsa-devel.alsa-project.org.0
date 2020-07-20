Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5BD226252
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 16:40:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE3D81614;
	Mon, 20 Jul 2020 16:39:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE3D81614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595256023;
	bh=//VcV50sd9tJfeIlah/mgh0sXpaKA3AM9BA89bGtJik=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l8fvZHSXinxEGYZMjpnwvwOWHX048XW6Bm1oJgEG9qEMrD8R6sdOATjWIWlr1Vsb6
	 9XbTRTwEJHbmokMUHKUkZ8IyATGUmus8V4NowNteTamSZXDltPNZcir+xaunEZoVB5
	 hcpBi1Fls+RsxpeWWCPgW38kRtGVJzmnth1ht6o4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAABEF800E0;
	Mon, 20 Jul 2020 16:38:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE371F8015A; Mon, 20 Jul 2020 16:38:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21C12F800BF
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 16:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21C12F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZxGavlJ3"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C15122482;
 Mon, 20 Jul 2020 14:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595255906;
 bh=//VcV50sd9tJfeIlah/mgh0sXpaKA3AM9BA89bGtJik=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ZxGavlJ3VVn396J9cgbir70V/1RmjPJzHG4K+YtI7ok4nWGDlpDWk8NoBdpCieNXf
 mlamUVuaTZZBTbuGZIyi0uok1mHPUu+jtPJueydAgTv21n5/DsQIPKhUEYzhVoViBO
 3aT19mJsdM4JCtM3J38+lt8ODaORFASEOOFcS5OE=
Date: Mon, 20 Jul 2020 15:38:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20200719180912.30770-1-rdunlap@infradead.org>
References: <20200719180912.30770-1-rdunlap@infradead.org>
Subject: Re: [PATCH] ASoC: tegra20_das.h: delete duplicated words
Message-Id: <159525589435.6792.4381959603221775343.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>
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

On Sun, 19 Jul 2020 11:09:12 -0700, Randy Dunlap wrote:
> Delete the doubled word "to" in two comments.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra20_das.h: delete duplicated words
      commit: e1b4a53df26956620fc093219a725f44405db781

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
