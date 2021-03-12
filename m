Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF73399E5
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Mar 2021 00:04:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ED4318BA;
	Sat, 13 Mar 2021 00:03:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ED4318BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615590278;
	bh=gKRx09iEEzT9fEiWAZ/WywZpvs/RAYQqI8WAKlElFYQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vpy3B6wxknw2xxu8EsATOy9cARQ7SqeeuqpEVJYbF59W3LAhM8BvqRyeG14k9h434
	 tnabbqEGogFEunmL1N8Gso3ohMOTihxrqMmVZi8uoRbbbhhD0q7C7aFqaHNC+Kjfuv
	 knfg8X1/kZHTTuAmfyjxdToIi03obe9DGzhWIyis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EA58F802E7;
	Sat, 13 Mar 2021 00:02:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F18FF80272; Sat, 13 Mar 2021 00:02:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ACA2F8012A
 for <alsa-devel@alsa-project.org>; Sat, 13 Mar 2021 00:02:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ACA2F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lJDsGGeB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7519564F6D;
 Fri, 12 Mar 2021 23:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615590133;
 bh=gKRx09iEEzT9fEiWAZ/WywZpvs/RAYQqI8WAKlElFYQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lJDsGGeBUBAgWoOvLFNlj4XVDLcIpp382xSzdXMx5FMir3/xKgpVJIyITYaVIJGx3
 WYEFhRwtUULH3sgpDwNRZHEcG7BkjdCqVKUPq5/6jDnZENyxVBtVtre6G6LHZunFtc
 jqfEfLd1aL1ysYGKcVGn7Z3EGyO0fSgqby1ZB48p0GexNwVPMp/bX2zOgxmURl0/DL
 FA9POWxn9Ju3hwyeCR+q2CTu9iCtr8lcNDDJo9l/tE7Tvu+ieTpiWRNBVI/K//kcpX
 9kjQhkzcU03t/KPxeh8aoHSCpyolxADNGM/+bngRgmYMJVk+aeOkdwMHZBIX6qt+z6
 5CyVu70/F+njA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: (subset) [PATCH v3 0/2] ASoC: samsung: remove cppcheck warnings
Date: Fri, 12 Mar 2021 23:00:51 +0000
Message-Id: <161558981189.31753.5372027063951646682.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210311003516.120003-1-pierre-louis.bossart@linux.intel.com>
References: <20210311003516.120003-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
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

On Wed, 10 Mar 2021 18:35:14 -0600, Pierre-Louis Bossart wrote:
> v3:
> Added Sylwester tag
> Rebased and squashed fix with initial patch which was merged at some
> point but can't be found in broonie/for-next (not sure what happened?)
> Corrected patch subjects to tm2_wm5110
> Reverted second patch to initial v1, after agreement between Krzysztof
> and Sylwester
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: samsung: tm2_wm5110: check of of_parse return value
      commit: d58970da324732686529655c21791cef0ee547c4

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
