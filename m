Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF552425F51
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 23:40:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 996FB1674;
	Thu,  7 Oct 2021 23:39:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 996FB1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633642849;
	bh=+XFheclGijsJkX5Wef9fRQUiRbEAPw3jt9c9OIWnZw8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HFEf5vU9o/4xuu2SY7QPgDdbC7Guejfxitt1vY+dKXDf4pF179mWtbjr3D4rcvFHI
	 /ovb+w+uXg8e5w1CtO1Rjp1tXVPH0mZVPuHJV0LCTj2i8GAMwnk45OdcapxKOejMSZ
	 2bwqgWUcNRJwvR4M1e7aWjhISMLonnjAuxt+Flss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12A11F804F1;
	Thu,  7 Oct 2021 23:38:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50A23F804ED; Thu,  7 Oct 2021 23:38:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92EC9F804E0
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 23:37:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92EC9F804E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ejeDJru8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EBDB60EBD;
 Thu,  7 Oct 2021 21:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633642672;
 bh=+XFheclGijsJkX5Wef9fRQUiRbEAPw3jt9c9OIWnZw8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ejeDJru8DN0LVQ3vQnNhn6ZauR+bUQpLE1okqT4vV4Ia80XJd3UywkwcYEMkUcaVG
 mkqSsvllloKZ/r4dHAtwePB8xucZwbJaEH6aRcL9A8o59i5yXjaUASTxkxQeD/vP1T
 xUipXRgGX3atop0HJE8vzFS8enZUzoxxtusa9v+HAlzRZH+biHqSEl8dVwKZ1k6CVG
 z5JsDsurguT36p877A3orksdy4e+D3GYvH0y4kfMs/KU0zMVId0r/zbPtcPf2KUXe6
 KWbtpUsMpaOi4RpsD+1znmL6L6AHCFnC2PawaY3kyit0M7EooefJTBYwN8xzp1/bwo
 G81+0aD6ninPg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH] ASoC: SOF: topology: do not power down primary core
 during topology removal
Date: Thu,  7 Oct 2021 22:37:27 +0100
Message-Id: <163364264606.649699.3455055658335794221.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006104041.27183-1-peter.ujfalusi@linux.intel.com>
References: <20211006104041.27183-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

On Wed, 6 Oct 2021 13:40:41 +0300, Peter Ujfalusi wrote:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> When removing the topology components, do not power down
> the primary core. Doing so will result in an IPC timeout
> when the SOF PCI device runtime suspends.
> 
> Fixes: 0dcdf84289fb ("ASoC: SOF: add a "core" parameter to widget loading functions")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: do not power down primary core during topology removal
      commit: ec626334eaffe101df9ed79e161eba95124e64ad

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
