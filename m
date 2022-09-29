Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE2E5EF613
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 15:09:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E52015E5;
	Thu, 29 Sep 2022 15:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E52015E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664456942;
	bh=sj+OdEAtykHcBziJ2ilGZDg/T4fIfEtsnxrbhj4A+U0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nHFjnl5EaOp/gvyLD2eHQoiQC6ttLri1ayI8LjQxB2vtRT4ts0Jw/lY0pwzaNu7kv
	 gV62ho58mpswW0Y1SFVPgLtuVIIUSpGMGlNJ8+iiyJwbT9P57SZ7bLiTXINjeT0Ni+
	 +GCRASagnF4miUjyyBivUWsVCwH1KxnOOGrlNsP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 959E2F803DD;
	Thu, 29 Sep 2022 15:08:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3637BF8023A; Thu, 29 Sep 2022 15:08:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34C80F80109
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 15:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34C80F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s3E375Lb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0318D60F83;
 Thu, 29 Sep 2022 13:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F72C433C1;
 Thu, 29 Sep 2022 13:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664456875;
 bh=sj+OdEAtykHcBziJ2ilGZDg/T4fIfEtsnxrbhj4A+U0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=s3E375LbnG4eXybX2ENtevXcY20C0PZdCx3Q3e6yp/kZXN7zNECGzVmHl32719qh/
 raW4MuWEJZvdJiJQCVTlE7KErEZv8Lk215c1IvjuZmAhYY1SqupUdapxcZ+ofl+rrQ
 oqA2Dm1oqRfXid7alPVTyIDylj18xPf+x6sss1RJJcz6uR53Lzldb3Qp4/q5LMtMpG
 yt6W2CcQiS9OIxn4Fj9N3/CpN5LnqlhsGUrSZqOkAYAQVjnDP/pPag0RU/iSlH7ULl
 qIDu7AewPCAFjTtOCm27Coc+pVraVBWFzSPD3Ro6umAKSEGWBtRTJVpjPR2dtSNJGq
 sP2+Bn4vk7bIQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org, 
 Colin Ian King <colin.i.king@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-kernel@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220928220417.66799-1-colin.i.king@gmail.com>
References: <20220928220417.66799-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Fix spelling mistake "slect" ->
 "select"
Message-Id: <166445687286.114358.7172094686592004129.b4-ty@kernel.org>
Date: Thu, 29 Sep 2022 14:07:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Wed, 28 Sep 2022 23:04:17 +0100, Colin Ian King wrote:
> There are some spelling mistakes in dev_err messages. Fix them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Fix spelling mistake "slect" -> "select"
      commit: 65c94e4d15830406a31a55085887e97bacd25434

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
