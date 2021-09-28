Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EFB41B3DC
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 18:27:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF02E16BC;
	Tue, 28 Sep 2021 18:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF02E16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632846452;
	bh=Dv6JNmmq+3WUHs5+Yfa1MT9gM+K8WmH1ZhAcFQAuHrs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GaldrxFKt8B1/nN68vMq/rYXOLnD9RfPIa3539WT6GUOHwLp/GN1REqZ734mbG09q
	 vPPCZxhclWDUUvsCIp6MwMirSkYagWG2JOVuCvjq7yb5S6JUvj3WGno5g43MfsoJh1
	 Y7SevHytmIGI3sP/NCWaxIhSzPG5A67mW/fbUETg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9262DF80508;
	Tue, 28 Sep 2021 18:24:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62388F804FB; Tue, 28 Sep 2021 18:24:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B38DAF804EB
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 18:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B38DAF804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uO3l7y21"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8BFC361206;
 Tue, 28 Sep 2021 16:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632846253;
 bh=Dv6JNmmq+3WUHs5+Yfa1MT9gM+K8WmH1ZhAcFQAuHrs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uO3l7y21rXVgdFTlPA1vTk4zKjKfxpJFcBQogo8EkEUDD/8sGSLvPqlMiHBsoLvGg
 R85x1Xhsw06V9WR40Z1cTl1hkyFAwAbr2xsix37qSoUYRf3zCGdjHCpExhW2IBcehV
 4Gp9lL7/Mvo4DdmnM1GxS7ViJlD7wivnZOwdt1b8Cjd/BOXf6ky8mmEdUQBXW7P75v
 hF4Q+Glgh1/ArCKkMy4hlh7hMfW+76cDNMR8nVpEfrNi4qJENYQuKrD8SrGMJpI0FH
 BkoyewQLPKup2A6VuQjQ8TjmsmZGNLuOsaS6sw1TYQRkbbSD63j1mFA4qVjOjcfwJZ
 b4eFEB88jQpDQ==
From: Mark Brown <broonie@kernel.org>
To: marc.herbert@intel.com, pierre-louis.bossart@linux.intel.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: SOF: prefix some terse and cryptic dev_dbg() with
 __func__
Date: Tue, 28 Sep 2021 17:23:05 +0100
Message-Id: <163284573552.17390.10291650137925590468.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210928102635.26227-1-peter.ujfalusi@linux.intel.com>
References: <20210928102635.26227-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

On Tue, 28 Sep 2021 13:26:35 +0300, Peter Ujfalusi wrote:
> From: Marc Herbert <marc.herbert@intel.com>
> 
> These helped troubleshoot some DMA issue in SOF.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: prefix some terse and cryptic dev_dbg() with __func__
      commit: 18845128f5f88cc0a034ac5eb711eee83d8321a5

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
