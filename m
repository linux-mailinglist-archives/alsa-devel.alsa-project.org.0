Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F24A1FA4C2
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 01:48:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00C9E166F;
	Tue, 16 Jun 2020 01:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00C9E166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592264897;
	bh=lOvmryFJWxVe+rag3gT3bLGVqKZmlDGKv/2fXSTKcXc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CS0QWnhSElIcz4ZdsxqIkxZQ+CqmAWK6sguBXv7Fdv2u7+zjk2le5GjTS+4k7NU7v
	 PI+9CrhPFzKmjCxLLTQ6btGHnWYXq01uI403jWku902xO3UiR76K7GZuHaNOvCC3YU
	 ipCwcjMg24ORbZE/aDphHEURlxMIvqWopAJWQ2/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 474F3F8032A;
	Tue, 16 Jun 2020 01:41:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1C29F8032A; Tue, 16 Jun 2020 01:40:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA76AF80328
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 01:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA76AF80328
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NQdbvAuO"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE27A207D3;
 Mon, 15 Jun 2020 23:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592264451;
 bh=lOvmryFJWxVe+rag3gT3bLGVqKZmlDGKv/2fXSTKcXc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=NQdbvAuOSDp9BpJB3wd+YzO8Whu2ZOvFfjfyERBOO3HUkGmb2RvqZEj3g5jbilADU
 Sb/SVegDwxQFs38vOWpYdt2ija6CjFJCIu4f9TqY89OoMwWtF6UBklB1AQrPLoku/t
 rp4OivZxVmkOEo/eHUtmCpv0ovBJjlLmin/2/fqY=
Date: Tue, 16 Jun 2020 00:40:49 +0100
From: Mark Brown <broonie@kernel.org>
To: kjlu@umn.edu, "wu000273@umn.edu" <wu000273@umn.edu>
In-Reply-To: <20200614033344.1814-1-wu000273@umn.edu>
References: <20200614033344.1814-1-wu000273@umn.edu>
Subject: Re: [PATCH] ASoC: img-parallel-out: Fix a reference count leak
Message-Id: <159226439190.27409.17076823025937855745.b4-ty@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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

On Sat, 13 Jun 2020 22:33:43 -0500, wu000273@umn.edu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code, causing incorrect ref count if
> pm_runtime_put_noidle() is not called in error handling paths.
> Thus call pm_runtime_put_noidle() if pm_runtime_get_sync() fails.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: img-parallel-out: Fix a reference count leak
      commit: 6b9fbb073636906eee9fe4d4c05a4f445b9e2a23

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
