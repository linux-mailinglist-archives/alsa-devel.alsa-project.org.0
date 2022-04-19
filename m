Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9C45071D7
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 17:31:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DADA21B1A;
	Tue, 19 Apr 2022 17:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DADA21B1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650382295;
	bh=jeuAQBpU0IHUM+HhJwHhOHne7mMnnHWM5rRI0BeHijg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ebwSqhTDyVzxyCoYBRy3ZdzaesR4rC8wGlvLWd734hZ8ZxiTF/1uU+AFtdEIq79qh
	 LT1yfxyl1DpwlFAvatZeADqkwo/u2wuhKmzQeN0/4hYZD6u99/kehQuEgTJ2loBUJr
	 laGWNQrMgrwVAEcuHqmgP4b+iqEW04lCPfaZp/sE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C1BEF804FD;
	Tue, 19 Apr 2022 17:29:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B0D7F80269; Tue, 19 Apr 2022 17:29:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D303F800C1
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 17:29:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D303F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cyR57D2I"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6352CCE19C7;
 Tue, 19 Apr 2022 15:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC0EC385AC;
 Tue, 19 Apr 2022 15:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650382184;
 bh=jeuAQBpU0IHUM+HhJwHhOHne7mMnnHWM5rRI0BeHijg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cyR57D2ICWHJ/NMVxwPTme78WwAyiGmCp6E1vMcQLNezlDTTMo4Qi+NCx3ByGkdHm
 8onsLupf7HSN5GlA9sxsO6ltkXc3CaxajXtN5b14mzhIw7DmFK6FTPrMagLY/8eRPX
 OLxy69BEW/PNM3pwHW0wykCV/J3zdmLZiGFnKCXDtCcSvqVtc5e33UWHpQUGHywpL0
 sw1B/5Th0+O9UtAkJJqIbAoKSRcFLmYVyls53zQ3RNrZC5yB7/Ix/XQ2ZvCwCkHk2Y
 j1LcAD3HCj+Yhg01CgPadYViGxZXjNdqDXEpiAPh+zaIZAczcEGXd3n9Wx113zbBya
 b0IbYQUGcu1ZA==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com, lgirdwood@gmail.com
In-Reply-To: <20220418110259.2559144-1-chi.minghao@zte.com.cn>
References: <20220418110259.2559144-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] ASoC: codecs: wm8962: using pm_runtime_resume_and_get
 instead of pm_runtime_get_sync
Message-Id: <165038218304.995461.12975238868778224251.b4-ty@kernel.org>
Date: Tue, 19 Apr 2022 16:29:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, zealci@zte.com.cn,
 alsa-devel@alsa-project.org, chi.minghao@zte.com.cn,
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

On Mon, 18 Apr 2022 11:02:59 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wm8962: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
      commit: e65f2fce08fc708e65b544131999bdd933d09164

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
