Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D94C2159D4
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 16:45:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B2371661;
	Mon,  6 Jul 2020 16:44:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B2371661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594046716;
	bh=BMTGnSfyyTih+mfac1i6gQaItqXavlcJTMAVh5GhEQ0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q/BDd0qm6b6g/ikSy5HxfmddXSP+WwAAwJ9OtQ7R4EZUzgCMQT9cWEM0hExaGlTSh
	 nfGL9VtgwTtMy93h43hdKSccrwOXLox6yPScNFD0p5VfHcClXB8SqkPDyyY8o7UyY9
	 6e7s1T9dR+yaZb+8QzzsvPsQ4rT45Lw84IVsvMlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B4A5F8011F;
	Mon,  6 Jul 2020 16:43:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF9FCF8015C; Mon,  6 Jul 2020 16:43:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27F0FF8010A
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 16:43:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27F0FF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CDaobt8H"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ABA8C206CB;
 Mon,  6 Jul 2020 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594046607;
 bh=BMTGnSfyyTih+mfac1i6gQaItqXavlcJTMAVh5GhEQ0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=CDaobt8Hjrg+8hAJF/DlhXq1qi2+UjQPGQD1pKzcu2hnpgw1zUkYwbyUFOY5wDKdp
 NPhnsieK/aJV1gyqqJM4szs0W4iFBv09K6fxT2gbT7fFnMRtODe9WA0GLJJLESq0mW
 Q17sj+5/TepUV1pWkY7Wz7zt/sjaoFVNOPbp9eRo=
Date: Mon, 06 Jul 2020 15:43:22 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200702163633.162508-1-pierre-louis.bossart@linux.intel.com>
References: <20200702163633.162508-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: codecs: wm8400: remove unused variables
Message-Id: <159404660285.36513.3295360909561762251.b4-ty@kernel.org>
Cc: tiwai@suse.de, Charles Keepax <ckeepax@opensource.cirrus.com>
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

On Thu, 2 Jul 2020 11:36:33 -0500, Pierre-Louis Bossart wrote:
> Fix W=1 warning by removing unused variables

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wm8400: remove unused variables
      commit: 2cb7802b50a2e3bb68e3960aae3955fef75c009b

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
