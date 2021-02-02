Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E34E730C7BE
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 18:32:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B25E177A;
	Tue,  2 Feb 2021 18:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B25E177A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612287153;
	bh=MsYWS5fR84takhXK5ZPtutS06RculY3MNRJAjqjwzAo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Enh+wv7e1ItYnLm/JEwysY+umgTY8+MjvJANaKx3ADisYiJqQYVH3eWcp5oqJrWqL
	 W3Q64mGVaFvF2T9Z8Kv2RTVbU2gOkr4a7kaff/lyYDrdOz29g034Kr4JfVfDAPhGkS
	 u9nu8xOyJ4uuhLnJIC3Cjf9CwzJVSWxBSiYjEWUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3887BF80152;
	Tue,  2 Feb 2021 18:31:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5526F80171; Tue,  2 Feb 2021 18:30:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE962F80109
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 18:30:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE962F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Laas/WDE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01DE564ECE;
 Tue,  2 Feb 2021 17:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612287047;
 bh=MsYWS5fR84takhXK5ZPtutS06RculY3MNRJAjqjwzAo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Laas/WDEqIz1PIDtsTH4GdAnfy1yrBNddu0b36XRjEio7LT1P7BhfX4gvVnb9wPPc
 A+lGtedCxIzhaWtltzzzWVon4e3FD/SIWXyJq0Rw6xZ3kKrzqVjIxsr82f2fMVN2vP
 0SwFYEVtn2at8vnfhT4onKoZ6ZO2vubtrB1kLyexgSbxO9ffLe4nNRTUOooWYlD4jd
 q/eKGMpT/urUV8NAwaZjo68CvH1/Z5KKivObsx/E37G0vqSdCXLWTChBiwMJL36F4x
 Nd9UlIO5Zj3+LVHT6ZlXR/c3c+8IZQa4mXfGmh3GkDZ4wyzyr99gmX4WnuyXXZUmRt
 rdRIspXmhkQNA==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, timur@kernel.org,
 Tang Bin <tangbin@cmss.chinamobile.com>, Xiubo.Lee@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com
In-Reply-To: <20210128112714.16324-1-tangbin@cmss.chinamobile.com>
References: <20210128112714.16324-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Utilize the defined parameter to clear
 code
Message-Id: <161228699993.35075.10104623503101493059.b4-ty@kernel.org>
Date: Tue, 02 Feb 2021 17:29:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
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

On Thu, 28 Jan 2021 19:27:14 +0800, Tang Bin wrote:
> Utilize the defined parameter 'dev' to make the code cleaner.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: Utilize the defined parameter to clear code
      commit: 68be8ed6a4622d4eb6cf7632bc7cb78464c83c78

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
