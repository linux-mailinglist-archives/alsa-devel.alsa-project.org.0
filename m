Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6337E438378
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Oct 2021 13:44:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF1B81666;
	Sat, 23 Oct 2021 13:43:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF1B81666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634989479;
	bh=4XWHzvmtR+wyqWJ4k/FFXOcBIOC+UMb5i8hvEybrro0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lhhQJ7T4KCkkPxyOgUCLQY06l99vhrzXquUcsSyhuDIiAP9oHXjUGwooEfiqSWAZT
	 rAtSKkWYHlY3jnYY4P2bugTEpNOKaT0lrXgd0J2aNFbNuFD2BVIHpx3CDkIWdHOiRP
	 3LP5VgMwOgEMfDaeAVZJb9z1T8umPgxckq9FtD2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 679B5F80246;
	Sat, 23 Oct 2021 13:43:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D570F80246; Sat, 23 Oct 2021 13:43:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0A92F801DB
 for <alsa-devel@alsa-project.org>; Sat, 23 Oct 2021 13:43:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0A92F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uWCGOpFm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 001226101D;
 Sat, 23 Oct 2021 11:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634989393;
 bh=4XWHzvmtR+wyqWJ4k/FFXOcBIOC+UMb5i8hvEybrro0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uWCGOpFmHw594t9/j++tNZ7cvKVnwFfIjur8Dpcc3JvolLixfuvhgG1g/5Oo1xcXa
 AZ7p2MhfmHV2WPD+O4Qr7W3+nus7oJfwYzkbflMYWs/tjR/vtvUjqsNL2SBYQC7UGV
 jmOwmNkEJzZZxfObAQpQAI5lsi8ycht9r4PTQe7e7vGklxvQwwu4d5BGaRN34To6/A
 HF19/YOvnOwOWJaylnNX2swke+U48ymfnJh9IIrVVZu+OTWGcq7BTTkspM6LGtk1mf
 8WJdowxh3AeO0X0IxODhQkZ3BWQQMvVjympSsStSHLRMHOGq8foun88Pmk9L8zKajZ
 EA/LhrRymdTHg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l42: Remove unused
 runtime_suspend/runtime_resume callbacks
Date: Sat, 23 Oct 2021 12:43:08 +0100
Message-Id: <163498938018.2020965.16977108609282715073.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211018164431.5871-1-rf@opensource.cirrus.com>
References: <20211018164431.5871-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Mon, 18 Oct 2021 17:44:31 +0100, Richard Fitzgerald wrote:
> The driver has runtime_suspend and runtime_resume callbacks, but
> pm_runtime is never enabled so these functions won't be called. They
> could not be used anyway because the runtime_suspend would cause jack
> detect to stop working.
> 
> These functions are unused - delete them.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l42: Remove unused runtime_suspend/runtime_resume callbacks
      commit: c778c01d3e665045d29d548d946f7cd64aec0ff9

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
