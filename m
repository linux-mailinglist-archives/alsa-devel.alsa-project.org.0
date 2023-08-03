Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B6C76F31D
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 21:00:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 129C1210;
	Thu,  3 Aug 2023 20:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 129C1210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691089207;
	bh=2v7C+V58OJPtZFXbcYDdpVPIVwHrJZxcwt59CZpHWt8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XdYi6M0o7rGHgA+OibfsGXvvfrWPKvCCN/KglqZqC4ILkOrAr6qqw5JFnkusMdwOv
	 zx71ZSYoR++8Rt4O0mSRG50bhdju5hgutWmct1aMequ6Jh3dTQysiAtUxNk2Asysx7
	 Fdj5Ro1tv3QPitCZkomPe1R/8/SRyMl/ihIXxhEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AE9DF8025A; Thu,  3 Aug 2023 20:59:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D091CF801D5;
	Thu,  3 Aug 2023 20:59:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 804ADF8025A; Thu,  3 Aug 2023 20:59:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40D95F80149
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 20:59:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40D95F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NnZbZDRT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1427661E53;
	Thu,  3 Aug 2023 18:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45719C433C8;
	Thu,  3 Aug 2023 18:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691089141;
	bh=2v7C+V58OJPtZFXbcYDdpVPIVwHrJZxcwt59CZpHWt8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NnZbZDRTpSnOx124IZgTaYJLCy0Oo87aQf7FDETSbVo4hjP3uF7Oi6XDlVuZI6heo
	 VY7xzTOtBmcJHAe0sWoBc+PF6fwM4JL7PveQBhcpJZ/+PwaKaZi7uYthLHitZV9njd
	 fuGK6GvLJiMWoW1JNHt7qNEdybo/nYuXCHbIjJgTj9AnSNz6ylhTZ2i/ZuHX2K237s
	 xATRVdOQ7knCQ5DepFwuDwnKk2OEZ48cloqRm6eX+77iAFCHx2VSw5iBkpIaSqkwUT
	 c8rK3J3JenSp6GX1FR31cl0Ig/0HRwQ+avSe8MadCWq3vy+xTxWhIMIechdOt6CDaL
	 Nrjs8KOnQWGDA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
In-Reply-To: <20230803162312.117771-1-ckeepax@opensource.cirrus.com>
References: <20230803162312.117771-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: soc-acpi: Add missing kernel doc
Message-Id: <169108914000.123358.13591899425970131423.b4-ty@kernel.org>
Date: Thu, 03 Aug 2023 19:59:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: APWPZVVA65ZSZJS2WNQM756PTK46JVQP
X-Message-ID-Hash: APWPZVVA65ZSZJS2WNQM756PTK46JVQP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/APWPZVVA65ZSZJS2WNQM756PTK46JVQP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 03 Aug 2023 17:23:12 +0100, Charles Keepax wrote:
> The UID field in snd_soc_acpi_link_adr is not documented, add kernel doc
> for it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-acpi: Add missing kernel doc
      commit: 9f0d4d47c7915ce21bde4a4974a7a6307e244a6d

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

