Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A674DB985
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 21:38:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9A00179B;
	Wed, 16 Mar 2022 21:37:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9A00179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647463092;
	bh=tXKQPeY8zGH086upulVCq8kvmhNYSUEo8dfrTojYtdU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i7LdYka9NiATNKMpR/mCPW/1vxbFFKIc0YEYTe4Q3/u2WoCibNm4PHBK/IyGtRXeP
	 yfOpVWMcZM51ZC6ojHYDCWVOfTYHB2PKw+FTUdMVZi3XJfkerz3jPaG3FPf8CLumbI
	 3Q1QHnJzRqXzOKJ31Ed507cosc2sjNS4wcjStDxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09EBBF8051F;
	Wed, 16 Mar 2022 21:36:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30FD9F80311; Wed, 16 Mar 2022 21:35:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1097FF804D9
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 21:35:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1097FF804D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H4x0a0ia"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ABB03613F9;
 Wed, 16 Mar 2022 20:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E25DC340EC;
 Wed, 16 Mar 2022 20:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647462951;
 bh=tXKQPeY8zGH086upulVCq8kvmhNYSUEo8dfrTojYtdU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=H4x0a0iaDkGpX6y3/Ss2M5CeT3Uh4WRBoZlZ7u/NkjU5vEUaq2yw0FkyDV/JfIIHf
 hDRlXiQVuZT7msJs8ZiHvXphh6AS0I5ahfrZFcO46X2i8F6dq2lhr1+/sJTrujbscE
 xwx3SX1frbyKNKsbVHjBerViTQzcxeEJXKlAtw1K+o0qNZ7ygKwc9aNc8WpQB9hdVZ
 PB2Au6/80c8iC7MFLjnmyye+DP9tjRWYpGhkVtREumlZVnNQrRxZ+55Jlg+EMz0O+5
 hkVBpjktK7kBiP5NX0LHZzJC/sGEyghYjRPePVV76xVcwgBRJbKw4QNVPu0hRNDzJN
 CNQAiS94J6WHg==
From: Mark Brown <broonie@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>, alsa-devel@alsa-project.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Takashi Iwai <tiwai@suse.com>, linux-omap@vger.kernel.org
In-Reply-To: <20220315230816.2964577-1-colin.i.king@gmail.com>
References: <20220315230816.2964577-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] ASoC: ti: Fix spelling mistake "cant" -> "can't"
Message-Id: <164746294890.1220201.4043765909932401819.b4-ty@kernel.org>
Date: Wed, 16 Mar 2022 20:35:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, 15 Mar 2022 23:08:16 +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_err message. Fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: Fix spelling mistake "cant" -> "can't"
      commit: e8ca4cee43fa9d841d25c2b98c9c3a3390593094

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
