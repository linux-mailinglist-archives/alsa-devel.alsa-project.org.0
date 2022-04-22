Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9F050C48C
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Apr 2022 01:18:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 750E81723;
	Sat, 23 Apr 2022 01:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 750E81723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650669510;
	bh=UUuKq7/v2s16PA9tf0WTVtpENR95otUpRTdB8gb6G0E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BqGLdVknO22ph2sn2pNtEejpHR9WgXYmBiBIySObiMO3qbzb2eaD1SaYhJDfjei03
	 HVOZRLhvUKMOXkeyaVUs1r+nhBL1IGUx9Jodz8HLysJrPFmr3txLvlL8LeTnr9g3I4
	 4iTFOEypiYDj8OieffjFMyXYhASXoiXADl9QQQuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1089F800D1;
	Sat, 23 Apr 2022 01:17:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 111D3F80249; Sat, 23 Apr 2022 01:17:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92658F80125
 for <alsa-devel@alsa-project.org>; Sat, 23 Apr 2022 01:17:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92658F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fyxsDWV+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 000FEB8332C;
 Fri, 22 Apr 2022 23:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7DCC385A4;
 Fri, 22 Apr 2022 23:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650669444;
 bh=UUuKq7/v2s16PA9tf0WTVtpENR95otUpRTdB8gb6G0E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fyxsDWV+QSs4atJ2ZP4sSD13/+MV46fVSm0r6TYrCLgztRHqaUSsxAZOYGjP7sk+m
 cMXMicu+6oqlWPSrYdBGUeb+Q9pBBtVVtfbqQpGb9cUlTlRZUMp8Rb0oHqDldak654
 BMUzn/XQoAS1B+wb3iV10I58IKTHlYAh6c5jaZxQwTTF10l1COVqdIM7nNAjn06A+i
 tpkE/E8RJorcUR9XlVESucb5es+/a01cqdhJ1+Ri3QMVpx83Z7X+MDIXCsuPvp6Qm+
 K1JRXKYMXdtRR+CaSmWVR4M4K9Cz77/Q9+TaIZ7NmPiReCCgmBlfzLngIhgPQt3m8d
 ik0fxyBPJjEEA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220421162600.302230-1-pierre-louis.bossart@linux.intel.com>
References: <20220421162600.302230-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: sof-audio: remove useless assignment
Message-Id: <165066944323.12937.3868631808343062423.b4-ty@kernel.org>
Date: Sat, 23 Apr 2022 00:17:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@intel.com
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

On Thu, 21 Apr 2022 11:26:00 -0500, Pierre-Louis Bossart wrote:
> There is no need to assign spcm to NULL. Removing this assignment also
> removes a false alarm reported by cppcheck.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-audio: remove useless assignment
      commit: d516e96bdeca103224de2f84685bf733953b6303

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
