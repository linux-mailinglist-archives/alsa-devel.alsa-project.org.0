Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFCD6FEB4D
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 07:41:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF17CFB3;
	Thu, 11 May 2023 07:40:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF17CFB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683783659;
	bh=Li8TsZIC3+G4sZ2u2PoC9+w39L+GRTcS+o1WoXz/ThI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NnrLyM+hDb6iVoGFv3uGqU0r4KyMxmaJ70i7LUSg2CU8RTmrVOlc/1sWqYDUjRxoh
	 AxmcNJf27QfpX91Y0azjroXWPTdC2gAnmJlTQc9Jmo9uyPGctMT6LnnYS+ykVS0QdO
	 0qOnkEMLSrEUdX/JFP4Zm8wve4B4ul9yXNi3e1JA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF9A8F80534;
	Thu, 11 May 2023 07:39:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD780F80310; Thu, 11 May 2023 07:38:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 877D4F80310
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 07:36:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 877D4F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UnXFj0rd
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CEF8464AC8;
	Thu, 11 May 2023 05:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560E7C4339C;
	Thu, 11 May 2023 05:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683783388;
	bh=Li8TsZIC3+G4sZ2u2PoC9+w39L+GRTcS+o1WoXz/ThI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UnXFj0rdh8DwN+JHlhLSnNxwfTgexUDqgGtNS2cNcZnsG0iTilDw2U7Kc+E7kwesT
	 5qLNXLTRDF7lAFiXSQEk9zbwp0BjGwkHrILyto4FlE9RfxzR7+Yr7k+IZgaBNOde5L
	 Mzazg7ELqqbqEAo/PrmEq1jeXNhBMF63+6v7a10emFnHu961HtJZjdQP5dwqjjId40
	 2tG1qtH1h8m2sM5fll8XQnUtmbCqDqxIsh00yxT1eHBxBwSMHah+67Mt6wTYxdBUcP
	 xwzrG8Jb6p2rvnpIwVE+useb2qy4QEvjvA2CtDSoQ4lWTQcTaEvoZgGhRGAOS9CyTl
	 RxnvLyWAkAqqA==
From: Mark Brown <broonie@kernel.org>
To: paul@crapouillou.net, Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-mips@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230509125134.208129-1-aidanmacdonald.0x0@gmail.com>
References: <20230509125134.208129-1-aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH v1] ASoC: jz4740-i2s: Make I2S divider calculations
 more robust
Message-Id: <168378338586.323079.4615747574575722094.b4-ty@kernel.org>
Date: Thu, 11 May 2023 14:36:25 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: KHRT2B2W2GWSRHOW3FQKPXFZQW7U4Q7Z
X-Message-ID-Hash: KHRT2B2W2GWSRHOW3FQKPXFZQW7U4Q7Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KHRT2B2W2GWSRHOW3FQKPXFZQW7U4Q7Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 09 May 2023 13:51:34 +0100, Aidan MacDonald wrote:
> When the CPU supplies bit/frame clocks, the system clock (clk_i2s)
> is divided to produce the bit clock. This is a simple 1/N divider
> with a fairly limited range, so for a given system clock frequency
> only a few sample rates can be produced. Usually a wider range of
> sample rates is supported by varying the system clock frequency.
> 
> The old calculation method was not very robust and could easily
> produce the wrong clock rate, especially with non-standard rates.
> For example, if the system clock is 1.99x the target bit clock
> rate, the divider would be calculated as 1 instead of the more
> accurate 2.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: jz4740-i2s: Make I2S divider calculations more robust
      commit: ad721bc919edfd8b4b06977458a412011e2f0c50

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

