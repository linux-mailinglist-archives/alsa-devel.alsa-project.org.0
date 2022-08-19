Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD84059A8BA
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Aug 2022 00:49:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62780169D;
	Sat, 20 Aug 2022 00:48:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62780169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660949350;
	bh=abBk2ZVaOUy4xBHNLpaWPwVqobxMotacxQj6vrlXOF8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bLTZLqPyhEXvWDyJiE+zYa5nD3sVSyNbm1O9OnnKLZGwOr/SZJEq1xhmL+Ai6LQ+U
	 blpQVDaIl/fsbONTnW75QXm8owSI5SRJ6C3dWzGaLN1mz5uzPLDC2nKIeURMq/LDXp
	 xnI0UbnVvZ0LVHisJUkfIRQ+dBFDsBJyy7hRhe7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05C00F804B2;
	Sat, 20 Aug 2022 00:47:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F39F6F800EE; Sat, 20 Aug 2022 00:47:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79BE2F800EE
 for <alsa-devel@alsa-project.org>; Sat, 20 Aug 2022 00:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79BE2F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JPnHC67O"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 91369B82978;
 Fri, 19 Aug 2022 22:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF50C433B5;
 Fri, 19 Aug 2022 22:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660949258;
 bh=abBk2ZVaOUy4xBHNLpaWPwVqobxMotacxQj6vrlXOF8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JPnHC67OdTPByjj+kJpmTKYDxy7krVXj0njO1ZZ1T0bQMkPdsapXoSiYxXE5Bb39X
 uC2oJtZASNh3GFde0A4c4KoKBpqOU9okMlEQYPsrs9VHAi865KYK5rlGdpzaoLpxzD
 iAaII8vXu/Y7u3H1GH+S107EJhxgPTxxGabZk2HjhKc1rX6Wt8A6mUSUDJJfhlGzLT
 8OBhz4hMmMB2DIyDfIkIVJCmIpvJJ56aFSaTLHkjXDp0e0cSbjIYw2zk14+GNSykoS
 d1aVqIF+gXA1enKl8KZemZzEgzFPagXRgknZhZ/x85P9vKZ3fwlBwVUQs6QXbhAXMv
 xlLmj9l4vR1Xg==
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
In-Reply-To: <Yv8ePUuBfzaRu6xV@kili>
References: <Yv8ePUuBfzaRu6xV@kili>
Subject: Re: [PATCH] ASoC: amd: acp: remove unnecessary NULL checks
Message-Id: <166094925576.19151.18203388990072079046.b4-ty@kernel.org>
Date: Fri, 19 Aug 2022 23:47:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
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

On Fri, 19 Aug 2022 08:23:09 +0300, Dan Carpenter wrote:
> The list iterator can never be NULL.  Delete the bogus NULL checks.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: remove unnecessary NULL checks
      commit: a74ec0bf5b67eae87317646571116ce4b4166d95

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
