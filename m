Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F4B92A45C
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2024 16:13:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9BCC84C;
	Mon,  8 Jul 2024 16:13:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9BCC84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720448018;
	bh=UAONCeebsplpzb6v0IQ6ozOfZrmocNxAZ6+xro42huM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j+bGVOu8Wn4vRtMKBceenZAnu+Hc9lYrVLFu5uIWgoxgqRi2/O4QVHW/a5sSqDS/t
	 n/soUzVsEqe1Hd+6CB1HC69HPyTNmnKJssJ1q6Sbq+oisbsp7TjPSmAfePcLQqp1Cu
	 F8uUiSXYL/pLBH9/ZZ64x5A1s261I/fi5YeK7sFE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E17CAF805B2; Mon,  8 Jul 2024 16:13:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07BABF804FC;
	Mon,  8 Jul 2024 16:13:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1E77F801F5; Mon,  8 Jul 2024 16:13:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA78EF8013D
	for <alsa-devel@alsa-project.org>; Mon,  8 Jul 2024 16:12:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA78EF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EkhvNsxt
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 240E1CE0B72;
	Mon,  8 Jul 2024 14:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60C7C116B1;
	Mon,  8 Jul 2024 14:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720447968;
	bh=UAONCeebsplpzb6v0IQ6ozOfZrmocNxAZ6+xro42huM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EkhvNsxtuY9YHFkT725PDuEZLyDf0TPGKwH05guyoF3C+nYy9nCISQnstDs4ixYcX
	 3E3S1nMjZYSE2AOBj3+vqFQROhWaK5VR0PxdpV42vOYdeYCHyr6OJnGIAQHfNQwCAb
	 II1g/sG3lrj1tN3hrD7awJO3fEWZBAc52edXSNptMYfnRTRHOmHQ4Nkxj+LlFQW2tN
	 ot3WKM7B5+L0IjDj9YU6g/ZoV0R7Icf8ZzY+tdCIHW3m32XwjXflqOFKUPDnja+Mg0
	 fVtNaBhhhpol+0GC1BvNXE/IUYCaKd87yVjKxI0wjtcua9vhqrcsh/3tmehRUp0G5r
	 6Il4FwtqWjEVw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
 zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
 linux-kernel@vger.kernel.org, j-chadha@ti.com, liam.r.girdwood@intel.com,
 jaden-yue@ti.com, yung-chuan.liao@linux.intel.com, dipa@ti.com,
 yuhsuan@google.com, henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com,
 soyer@irl.hu, Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
 cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
 savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com, jesse-ji@ti.com,
 darren.ye@mediatek.com
In-Reply-To: <20240707083011.98-1-shenghao-ding@ti.com>
References: <20240707083011.98-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoc: TAS2781: replace beXX_to_cpup with
 get_unaligned_beXX for potentially broken alignment
Message-Id: <172044796258.45994.10321780261934158542.b4-ty@kernel.org>
Date: Mon, 08 Jul 2024 15:12:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: N5PMZQBQR7M4BM6EO33SMGZF2XPP2X2K
X-Message-ID-Hash: N5PMZQBQR7M4BM6EO33SMGZF2XPP2X2K
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N5PMZQBQR7M4BM6EO33SMGZF2XPP2X2K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 07 Jul 2024 16:30:07 +0800, Shenghao Ding wrote:
> Use get_unaligned_be16 instead of be16_to_cpup and get_unaligned_be32
> instead of be32_to_cpup for potentially broken alignment.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: TAS2781: replace beXX_to_cpup with get_unaligned_beXX for potentially broken alignment
      commit: 1cc509edbe23b61e8c245611bd15d88edb635a38

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

