Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF9758DF47
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 20:43:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BD80846;
	Tue,  9 Aug 2022 20:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BD80846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660070632;
	bh=pACUFQcrgf4jDZyW9YY5W+FggE+N1VntD7OTvYdHFIs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WBK4iq+WjFncAVwGEWrIeI5MBG4nl7WJWclSZYD9kiDnaaijelRPcG0ghs/HvCVvr
	 86vs8uY6R/0Yv4yDDljEMR0uzVRAe+PH251PcV1/wDKCiFs4P3j3hxGe/Cn0rFuJlp
	 6u6FaZJ77DwqdeY+VX6YS2QmidfvbcOK7mKTrNtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8BA9F801F7;
	Tue,  9 Aug 2022 20:42:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEF56F8016C; Tue,  9 Aug 2022 20:42:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9252BF8012A
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 20:42:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9252BF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e7uM4ebe"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 00845B81611;
 Tue,  9 Aug 2022 18:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7504C433C1;
 Tue,  9 Aug 2022 18:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660070567;
 bh=pACUFQcrgf4jDZyW9YY5W+FggE+N1VntD7OTvYdHFIs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=e7uM4ebebJYxfea/SI26ybVg0bXMS3lx6qbINGTWS/hKTVCGo55D7maiGHMbExh81
 +EdnqKDUpv1DNOgr0n/e1Zo5Yu9FH5cxaNcp/1FeXFeTSp9YQxL993w5SMQN5YJt3m
 hITABIHRGTjAqjEXBGWEFD3pwXD+3/tod7fr+Iseqrlj9R8L5ULO+HN5VSf7LdmLJI
 YF5hxN758jICAyweXIbGcAzZ9s8H66uQAtbUxdej1sjndOwWoSZlKEf9/kDD/4rn9n
 2fFtBSk1Xo5XVvSkS4btPx592AsHqorsFKj4heCr7hwYQLc96ClReWPkKhIkPl9Ysq
 DggaR3oUSIdtQ==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, lgirdwood@gmail.com
In-Reply-To: <20220808052836.25791-1-oder_chiou@realtek.com>
References: <20220808052836.25791-1-oder_chiou@realtek.com>
Subject: Re: [PATCH] ASoC: rt5640: Fix the JD voltage dropping issue
Message-Id: <166007056543.69415.2112585577112979520.b4-ty@kernel.org>
Date: Tue, 09 Aug 2022 19:42:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, jacal_tseng@realtek.com,
 albertchen@realtek.com, derek.fang@realtek.com, shumingf@realtek.com,
 Mohan Kumar D <mkumard@nvidia.com>, flove@realtek.com
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

On Mon, 8 Aug 2022 13:28:36 +0800, Oder Chiou wrote:
> The patch fixes the JD voltage dropping issue in the HDA JD using.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5640: Fix the JD voltage dropping issue
      commit: afb176d45870048eea540991b082208270824037

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
