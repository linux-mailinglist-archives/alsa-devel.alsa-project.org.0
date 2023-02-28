Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C16F6A5E89
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Feb 2023 19:02:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A684483D;
	Tue, 28 Feb 2023 19:01:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A684483D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677607350;
	bh=OEe2wAjAN5Wk3+/Gr8WAFlMWCXBu8whw25LrAQEArjE=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UCJlb52Db/1n1i/xGXYPsv8xr0JQc0aor9l3Egv8rl56S6myhRySyxwV609qcFiOw
	 +MJa+9WAktTQNorDj7B/ffV37ey4Ftz3qd3OrLAYuuXjWrXIei4S04NU/Ect0B9Yzb
	 EtKDEYv9Kko7Jy8ele4bRvwouuJ1EqZ2JLmQ+8cE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C097F8052D;
	Tue, 28 Feb 2023 19:00:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32E93F804FE; Tue, 28 Feb 2023 19:00:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FF47F8049C
	for <alsa-devel@alsa-project.org>; Tue, 28 Feb 2023 19:00:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FF47F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fUlCaCrm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2F1B1B80E9B;
	Tue, 28 Feb 2023 18:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C570AC4339C;
	Tue, 28 Feb 2023 18:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677607235;
	bh=OEe2wAjAN5Wk3+/Gr8WAFlMWCXBu8whw25LrAQEArjE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fUlCaCrme1FbHiY+4s3OeDrWTDvt7fHBRl0xaqaILYRrDLdhpn62iLCwpX0Oh9206
	 Ct1GeeXawus4QVZYYiHmMMdLF+xK4pmRH+zVFh9K+F7kuZ+Ap1W+evafNlck9QXwsp
	 YlTHeccnaa96QFRp4Id+YULbn7dTGg2WMH+91yHb7oYCmnNlf72rkOlBIEjfF0frvU
	 b5Xwte7IR9Cn/kMnvv3Tggtj0cXiSYKSe2Uh308K8VmCMrhiRSJegdg+nPm6tjaXsQ
	 6QK0CexD+vrAVnKmX9MHf2HnkbIMNtLmJkCrecSFo00kMscjEiMBpTSrr5Dqi/PoEr
	 dbDoSeqUwRffw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Brown <broonie@kernel.org>
In-Reply-To: <20230224-asoc-mt8183-quick-fixes-v1-0-041f29419ed5@kernel.org>
References: <20230224-asoc-mt8183-quick-fixes-v1-0-041f29419ed5@kernel.org>
Subject: Re: [PATCH 0/2] ASoC: mt8183: Fixes from an initial glance at a
 kselftest run
Message-Id: <167760723351.68866.5282074700831903370.b4-ty@kernel.org>
Date: Tue, 28 Feb 2023 18:00:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-ada30
Message-ID-Hash: ETYJM7WRUB643I7AXX2SXFQ3QULI5DYE
X-Message-ID-Hash: ETYJM7WRUB643I7AXX2SXFQ3QULI5DYE
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ETYJM7WRUB643I7AXX2SXFQ3QULI5DYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 26 Feb 2023 12:49:55 +0000, Mark Brown wrote:
> This is a collection of fixes I came up after glancing through an
> initial test run with the snappily named Kukui Jacuzzi SKU16 Chromebook
> on KernelCI.  There are more issues flagged, this is just what I fixed
> thus far.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mt8183: Remove spammy logging from I2S DAI driver
      commit: d71ed1c8f0f458ae6852fdab055790fe1d9d19b6
[2/2] ASoC: mt8183: Fix event generation for I2S DAI operations
      commit: 18f51ed09888c8e48bd377d1715d4ff807b4c805

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

