Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 445CB2B0E53
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 20:41:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE55B1866;
	Thu, 12 Nov 2020 20:40:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE55B1866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605210082;
	bh=j+JtGTBvMHYCHfQHpAz9c1kkGAVM+mIIwqJIfvLdePk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dQgutXxcb2vVHWFOO2nv5+givaNK+dHy+UWLxwwOFttGfTtIyvbLZ4fHPy01iG3pD
	 /ARBz+9UHtPmQAAPEXvWJsiU9LPAjmN4IXSSKvVB8Jac+MPIG/Quxv1EbKUOxpehyP
	 bhVXtDMftWuQO4E+GIP0K7pBMYoSKUXrf8pvXEi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0F08F804C3;
	Thu, 12 Nov 2020 20:39:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A17BEF804C2; Thu, 12 Nov 2020 20:39:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32C4AF802C4
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 20:38:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32C4AF802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Qzr9cGZ6"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB6912224B;
 Thu, 12 Nov 2020 19:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605209936;
 bh=j+JtGTBvMHYCHfQHpAz9c1kkGAVM+mIIwqJIfvLdePk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Qzr9cGZ6oblC6S9kSRGP+62CTomN46qTcsuhXYJl6gTimsPMIvpDkRWcsl1N7bkEY
 fgx0vB3ZrlLd9sEdXgRXrCUdA6ecYXd2bLz6q9h33WQ43VeBO7WKW4wyJj2c/J6W1t
 a8p+uWHa4XjebCo0kqQY3sZUuRm4rGb0kcBGV/to=
Date: Thu, 12 Nov 2020 19:38:40 +0000
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20201111214318.150529-1-pierre-louis.bossart@linux.intel.com>
References: <20201111214318.150529-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: soundwire: SDCA device quirk and cleanups
Message-Id: <160520990387.38586.7695977613989445450.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Wed, 11 Nov 2020 15:43:14 -0600, Pierre-Louis Bossart wrote:
> Add one quirk to handle new TigerLake-SDCA device and cleanup code.
> 
> Pierre-Louis Bossart (4):
>   ASoC: Intel: sof_sdw: add quirk for new TigerLake-SDCA device
>   ASoC: codecs: rt*.c: remove useless pointer cast
>   ASoC: rt711: remove warnings
>   ASoC: codecs: max98373-sdw: align regmap use with other codecs
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: sof_sdw: add quirk for new TigerLake-SDCA device
      commit: 488cdbd8931fe4bc7f374a8b429e81d0e4b7ac76
[2/4] ASoC: codecs: rt*.c: remove useless pointer cast
      commit: 4a55000722d74e4ad1ea4700a423e21fab0d53ba
[3/4] ASoC: rt711: remove warnings
      commit: 17f6433192d858e49a40d1fa939bf61cc493a3b7
[4/4] ASoC: codecs: max98373-sdw: align regmap use with other codecs
      commit: f184892613dddcc12a1880c3b406314ec81498c7

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
