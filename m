Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FB43399E4
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Mar 2021 00:04:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CBE318B0;
	Sat, 13 Mar 2021 00:03:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CBE318B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615590239;
	bh=9RVyEoYAlQ7GZfSBXHiyQVVErCf3SSm3a7352AyUUXE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DlQA9xRmJPidzJ1mfM3fzSBnxiF53XUbSVGmcgN6dMv/ZhPBX1qeOLn1z1fwdYtS4
	 ZOHQaVpP7Dt/ZQw7gjv2w0hoiqp+mJjae11jD1LX4I59Tn4m2xW1HEhjesCiONzoUa
	 z6JmJdO3XbDOwyo2v8hsgVHS1dlcSnfrZrjuyfy4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF687F80272;
	Sat, 13 Mar 2021 00:02:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFE60F801D8; Sat, 13 Mar 2021 00:02:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6F0CF8012A
 for <alsa-devel@alsa-project.org>; Sat, 13 Mar 2021 00:02:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6F0CF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JmeGxaZl"
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC9FD64F49;
 Fri, 12 Mar 2021 23:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615590130;
 bh=9RVyEoYAlQ7GZfSBXHiyQVVErCf3SSm3a7352AyUUXE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JmeGxaZlHk7s8AKx4Qse8ZuFcuT5RSP1utJvkTmgl78bcdS4j+3jIVBSm99mUIeTU
 AbiUK5Rl/hoIGQ5195++fXEOMwhn40cZQioOrwMwFhL+8dN/EYRRV67DFavuOr04tE
 /aYxJbGeE+6YwlSNKAiuYhcN9FD5t9RSGVgdms59J7rW84Me0QzEAqTvSsNVH/cPjm
 whOn6tk7kcaDd872BBHDRMIOZQLii61llUhQjnXiONRSO27G3ACFYHOhuWPExzk3Cp
 Hw5jV1NTrldB5VO9k48arsdMjhahgTJ4uHrmaqVVTDK9vIZ4yq2IB+KKpzua/p4qng
 AG+mRMg+SD3zg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH v4 0/2] ASoC: samsung: remove cppcheck warnings
Date: Fri, 12 Mar 2021 23:00:50 +0000
Message-Id: <161558981189.31753.14691275395674140496.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312180231.2741-1-pierre-louis.bossart@linux.intel.com>
References: <20210312180231.2741-1-pierre-louis.bossart@linux.intel.com>
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

On Fri, 12 Mar 2021 12:02:29 -0600, Pierre-Louis Bossart wrote:
> v4:
> corrected Fixes tag
> Added added Krzysztof Kozlowski's r-v-b tag
> reverted patch2 to v2 since this is the agreement.
> 
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
[2/2] ASoC: samsung: tm2_wm5110: remove shadowed variable
      commit: f7b61287cf17486dd09438115a993d699db2ab3b

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
