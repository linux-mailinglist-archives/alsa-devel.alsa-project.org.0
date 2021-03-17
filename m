Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E02F433F15D
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 14:43:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77B7918BB;
	Wed, 17 Mar 2021 14:42:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77B7918BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615988618;
	bh=XgvDN9+ZI5AiUc+xPeXnYranTBmsXCf/a6s6tclb1O4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RD/8KYYI0CyfbtOp5rNmFBmGbFuwWEifRaoCEIkgfTD42fpIa+niJM0+pJbWzfkWa
	 9DNq/IY7khIRHkPRPJ9kf2z8TSnpCEiZ2dQeal+/zytn0NEJNvzDlDodl0vzUwRirw
	 uq6YQ9BjEMaAHc0TRKcrgjFLGU5NYati4KZ2Hz7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B466AF8023C;
	Wed, 17 Mar 2021 14:42:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62920F8021C; Wed, 17 Mar 2021 14:42:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35C40F80148
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 14:41:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35C40F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ry/J/KEL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08AC364F50;
 Wed, 17 Mar 2021 13:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615988508;
 bh=XgvDN9+ZI5AiUc+xPeXnYranTBmsXCf/a6s6tclb1O4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ry/J/KELDZqxjjGdXfoG66TK374xNVt0uqjTCVcsRBI+G/RGWlxaMMmDiAcM/YlgP
 4DSYTP0oWfVNcAFChbYikuLsRfJ6naMVaxDm6naCaHuBIg1Zei+62uvq0cvOZ9pGdL
 PoypXouEOUX7vQ0zZCulTmi5C4jqsTnoJS++kXGzWBpKE0PmVMJWOKaQOk53hF5OGS
 qucohmKbvnj2q6+y2QwQmFWmZ5dF3DRUFGsiqCoqYU5M501yw5J+8qVvi8xN4swkB8
 MV4i0DaAEHnBa3SmuuumI+gv9vxRdvNSAFgtV9UfGerKdalb4BcFxUddirI+hhXAVk
 jdnL16wVulrDw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, tiwai@suse.com,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, peter.ujfalusi@gmail.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz
Subject: Re: [PATCH] sound: soc: ti: Fix a typo in the file ams-delta.c
Date: Wed, 17 Mar 2021 13:41:38 +0000
Message-Id: <161598838274.8460.1631004595185849740.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317082042.3670745-1-unixbhaskar@gmail.com>
References: <20210317082042.3670745-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, rdunlap@infradead.org
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

On Wed, 17 Mar 2021 13:50:42 +0530, Bhaskar Chowdhury wrote:
> s/functonality/functionality/

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound: soc: ti: Fix a typo in the file ams-delta.c
      commit: c00f4f2598d334470b49385f811ca8f5c966a63e

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
