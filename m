Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F811406F34
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Sep 2021 18:11:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 866CB16AC;
	Fri, 10 Sep 2021 18:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 866CB16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631290273;
	bh=q4lntEh1mQD2RO96jVSsyccr0dssPljMXQSktMXKMNc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dPPbjOrfLYQSCr9pGIhf6XG37IKedaYUaClw/PuiN6yuStnRvare9FKAwguo92hW8
	 7v32cTmsbpcQHHape/WpfoTJyHDHP/v+iH5gDqWY/XRNDwk4R+/TZa65BwZbJOVTk+
	 E3oXY6JU3ot7+Mx+tblgKGSuoz9yfOxqMgwHn7YY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 873C5F804B3;
	Fri, 10 Sep 2021 18:09:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD3C6F804AF; Fri, 10 Sep 2021 18:09:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58365F8026C
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 18:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58365F8026C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QOcnMIt0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 122D0611F2;
 Fri, 10 Sep 2021 16:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631290165;
 bh=q4lntEh1mQD2RO96jVSsyccr0dssPljMXQSktMXKMNc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QOcnMIt0OTAiSqdHD8c/NnC5iy1GiRQcQg1NOBMvW2Pc9SDuK7yJrpcr0aCvXsDjp
 3pwr+3JbIa6stkeRAg7V0mbKqunNJIf0fMD8DdH9DLe2EaGtLBjYVIhFlxZTgja4+V
 XhWGGudG1L1ooV0mnhQivMluq+RVvS7e/5A7dfRETkYlizpaJgom0dYxhoqfI3YuBZ
 sf7tkYJZH+ft/WoUyKj2lIx/va1nYhwRPA5BGKVIa7veBJ1RE/bzqTprd9JNN/gXPj
 mFLPpp1jHfAqFCQkGkkh6RsPFBrH9EeUPPGoe+KL9TW2Pwb27Bd1ZYYgCAKEHHlIvx
 MQlezumKf13HQ==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>, tiwai@suse.com
Subject: Re: [PATCH] ASoC: mediatek: common: handle NULL case in
 suspend/resume function
Date: Fri, 10 Sep 2021 17:08:44 +0100
Message-Id: <163128974013.2897.10752321808133485674.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210902082111.9287-1-trevor.wu@mediatek.com>
References: <20210902082111.9287-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bicycle.tsai@mediatek.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dan.carpenter@oracle.com
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

On Thu, 2 Sep 2021 16:21:11 +0800, Trevor Wu wrote:
> When memory allocation for afe->reg_back_up fails, reg_back_up can't
> be used.
> Keep the suspend/resume flow but skip register backup when
> afe->reg_back_up is NULL, in case illegal memory access happens.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: common: handle NULL case in suspend/resume function
      commit: 1dd038522615b70f5f8945c5631e9e2fa5bd58b1

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
