Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE1D3B673D
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jun 2021 19:05:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B8191695;
	Mon, 28 Jun 2021 19:04:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B8191695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624899903;
	bh=5Jw20D3KnyymqKVj3zWvEcR9ibpe5qDJAVNPIrCH1qo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o8QsBf/YoRxESJZABodjDNJCANlsxqLUa/sqEZuLxKNtwNC/SVaz7llVnPt2BmhC0
	 XcLoXcMVFWZ7fZIBMv2u5awuwxQwOdZodQ+KDJ/o/W32IWozBSvip3wfuoGqHUdadb
	 YWrn+XYBgGfaX3x6W5VXPzoDGX3fgjPSAFJoD3WU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72D84F804D8;
	Mon, 28 Jun 2021 19:02:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FBDCF80272; Mon, 28 Jun 2021 19:02:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F167F80257
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 19:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F167F80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W/utDaqy"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B182361998;
 Mon, 28 Jun 2021 17:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624899762;
 bh=5Jw20D3KnyymqKVj3zWvEcR9ibpe5qDJAVNPIrCH1qo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W/utDaqyjj68g4pGphbden6rZsqtz6Q1MkBJZeOzGLuZWUKImSohc3q2U6RYWK8Dq
 LxGPScNVjnT7qB8eVHE3A6gEJxKiIu2gj0iVDO8/DYfhBgxzDCggXw6O+ZknxIR9/4
 bs2yDn62iD2ROm0dI/cM/svcDwRAqmubRF4byU3HPc4rQXSsGt67eHru+1ymS3QY3K
 BmSy3/ZVTPVPuEhMQLB/ZhubpKN4Yw6GUWr8d3ci9sFLMabFQUWeIH75VwWVwcYQ2t
 9Wa+sKNTs5KUiCRofoxdMLV9LExbx+sfyMjZSZ7OJ8V7s6x92AD+NA0trI1KOpioht
 Vi7+YX5J4vohQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 1/3] ASoC: wm_adsp: Correct wm_coeff_tlv_get
 handling
Date: Mon, 28 Jun 2021 18:02:02 +0100
Message-Id: <162489923152.4847.6691820642758045143.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210626155941.12251-1-ckeepax@opensource.cirrus.com>
References: <20210626155941.12251-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
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

On Sat, 26 Jun 2021 16:59:39 +0100, Charles Keepax wrote:
> When wm_coeff_tlv_get was updated it was accidentally switch to the _raw
> version of the helper causing it to ignore the current DSP state it
> should be checking. Switch the code back to the correct helper so that
> users can't read the controls when they arn't available.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: wm_adsp: Correct wm_coeff_tlv_get handling
      commit: dd6fb8ff2210f74b056bf9234d0605e8c26a8ac0
[2/3] ASoC: wm_adsp: Add CCM_CORE_RESET to Halo start core
      commit: e588332271b9cde6252dac8973b77e580cd639bd

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
