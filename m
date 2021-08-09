Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4693E4951
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 17:56:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7173B165D;
	Mon,  9 Aug 2021 17:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7173B165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628524591;
	bh=0QkxDzqsUF7YVC0Z1evJykDt9DC/MHfDfmzv0D3EVUA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uqhLK7a6wDu58CngJwJBcbAa1HloX5J7hh3pOEhAztqIja+7Fd1GVbOMaxTU7B/Yh
	 UdA/Mhjp+n0EqqjYHrAIqyOv3HNooWvDdanV8G9plAQd2ZgeqwTS8Z0JlgwtLcKRFI
	 BVw+Tk/K1bwX4V09dmnytH5pN49bdIE0yg7YuBK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1BDAF804AE;
	Mon,  9 Aug 2021 17:55:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C20AF802D2; Mon,  9 Aug 2021 17:55:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7D46F800C8
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 17:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7D46F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SGf89fpY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99D4D6101E;
 Mon,  9 Aug 2021 15:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628524494;
 bh=0QkxDzqsUF7YVC0Z1evJykDt9DC/MHfDfmzv0D3EVUA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SGf89fpYXEeogLPYP9VonbrJvlAqGONL8rOrzhF/FrxOq5AUwnhVOO3wNFSt/jhI3
 A+EpMH2v/7SKIEBGCggFPiq6dTPyYQ2NbmhpNScr1BGQVSPaYS0O7eEWfYhdemeoww
 C14rLinx0dmZNxuF1HQcHU+YPXIqc1avAym/xqTJ4vgPNnjOHlAg2SHJZZi1nCDofG
 5ewuvh2JMC7ZI03TSwn3N/+WSuX/WTdO2bVgoHd7uQHY7AeVa1mhQx/xurZ92rTl1d
 kiOKyHkxYsoFixSMNnpRD2MEBlb224JSUh2Wp0D+BoUDkQv4RKsl7EUVdXsRrO8a1U
 PRp8qF4GvWETw==
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>,
	lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: rt1015p: add new acpi id and comapatible id
Date: Mon,  9 Aug 2021 16:54:33 +0100
Message-Id: <162852418086.21716.3875772923924644880.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317062309.14051-1-jack.yu@realtek.com>
References: <20210317062309.14051-1-jack.yu@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, tzungbi@google.com,
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

On Wed, 17 Mar 2021 14:23:09 +0800, Jack Yu wrote:
> Add new acpi id and compatible id for rt1015p.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1015p: add new acpi id and comapatible id
      commit: 6d0a764d418fb508119e129c73f39ecc66826675

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
