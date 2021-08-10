Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3281A3E7C0F
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 17:22:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E2D31678;
	Tue, 10 Aug 2021 17:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E2D31678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628608938;
	bh=kU8MFV7YslYW2xJNL20kvQgQdTi2xb/hQWirMa3PqBs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MmeNYQcqFvAjKxlquvH+Dhy487S5tcoJxQFvu01AxYlL0bLhfZMnlLLByqPLxvG3t
	 ispktP6ocaQbeWQgh/uUuQcxTfwlDa5rRQrxgyOJRiy+idLh7LCl1qpBq3PJdSSAlT
	 2iFnROIUeg0hBisOWi09K98vddd5nIwgaYrTilwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A5CEF8025D;
	Tue, 10 Aug 2021 17:20:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37AC6F804B1; Tue, 10 Aug 2021 17:20:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4A29F80279
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 17:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4A29F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rgYcDxXh"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 729D160F13;
 Tue, 10 Aug 2021 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628608828;
 bh=kU8MFV7YslYW2xJNL20kvQgQdTi2xb/hQWirMa3PqBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rgYcDxXhoTo3MejFlwZdWMwaKtKkIaT1sACghr0IryQ6KdEMyhmsh6bSz3aNyM6pH
 7jHUIBmTbIP0hHs342xow7Bh5HgTbx73M/VlnSMT7NvPtuKa3rLjUGOHGL2ueBtoYi
 Ao3JVCJYyLIsJmAuOxImrxq16qOD+DvsJ18SOO/x6/XhZk58A5wLARyh0YeEtKHLsN
 m6OZ6q5hijai+2TueBP6esygdWTvvmGp8JkfjEMNXaczYBY9nH2nR3i6qkOwkCt+eu
 lPvRT7OZJRjZFqb/F6aSPfoDJxoHf2W2VKYqww8CeYcz/VrmoxEbElUG4gj9sCSrMu
 l1eI9HMq9tSlw==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org,
	lgirdwood@gmail.com,
	Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH] ASoC: dt-bindings: rt1015p: fix syntax error in
 dts-binding document
Date: Tue, 10 Aug 2021 16:20:02 +0100
Message-Id: <162860604513.6045.15119662311844913843.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210810020834.32414-1-jack.yu@realtek.com>
References: <20210810020834.32414-1-jack.yu@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de, kent_chen@realtek.com,
 kenny_chen@realtek.com, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On Tue, 10 Aug 2021 10:08:34 +0800, Jack Yu wrote:
> Fix syntax error in dts-binding document.
> 
> 
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: rt1015p: fix syntax error in dts-binding document
      commit: eb7ab747efd600382bc2e9406ea1fc2a867e9804

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
