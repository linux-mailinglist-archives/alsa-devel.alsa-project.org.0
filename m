Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C09C56D9F56
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 19:55:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E1F0F69;
	Thu,  6 Apr 2023 19:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E1F0F69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680803749;
	bh=AnwacomM1iD9Tyc8ERcf/HH5qu5lLcyO3dh52AB5eII=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i9I/EFxba70Y5nOP2cWpiC/5GM27kVQ3Zy9el8rPszwOzjyhbAAwclu6vPtdwzOsd
	 T50OpgLpAAy769Bla6z27dt+tR1W5vIofpkH/Oc8gIOCg16Fgd6ToDDULq4qlOiYmb
	 q9Oxu5NUkszqjzm/TTjkBW9sT9WU5I5efdtAsaf4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABC87F80171;
	Thu,  6 Apr 2023 19:54:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0046F80246; Thu,  6 Apr 2023 19:54:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CB18F8013D
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 19:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CB18F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AIeg0VT5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 23FE160C99;
	Thu,  6 Apr 2023 17:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7A3C433D2;
	Thu,  6 Apr 2023 17:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680803685;
	bh=AnwacomM1iD9Tyc8ERcf/HH5qu5lLcyO3dh52AB5eII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AIeg0VT5RR3GJ29HkJWAwB6FSGdq8pXdmobKqBWch8pJWcryqnKPoqBuhVBRWjKmU
	 e9JqR+ly1T/XwtNKwTxMgKIuPe16EhRVuzn3lRpjOvOfkzkkF++C+WWffQ/bm9veWa
	 s2nJzGB8ktm/O9Hvjh3TUyAP7U4mWsn6I4HYoSG7NCb4tnghINeNlHNskCBcwEYJno
	 T1reai+Du2z158hOx6JBt/IyySr7Z1N7C+QR8cdZQWmbYObdO4t53jzsQ4DjJWcEad
	 D5nNOFOqM8rG+6Mwh3kKj5QDM7OU9cMkyK+5bb41bfR29dC9pD/JZiFHqXeZJVyRkT
	 4QCBD3j7XiS7Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230406154535.18205-1-pierre-louis.bossart@linux.intel.com>
References: <20230406154535.18205-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: max98373: change power down sequence for smart
 amp
Message-Id: <168080368401.149953.14101023757465047038.b4-ty@kernel.org>
Date: Thu, 06 Apr 2023 18:54:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: WVDKLUSVA72CVIU4LMTM5BAPGBIEKSIR
X-Message-ID-Hash: WVDKLUSVA72CVIU4LMTM5BAPGBIEKSIR
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, Long Wang <long.wang@analog.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WVDKLUSVA72CVIU4LMTM5BAPGBIEKSIR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Apr 2023 10:45:35 -0500, Pierre-Louis Bossart wrote:
> In order to avoid pop noise which occurs when switching
> device from speaker to headphone, the amplifier should
> power down first when stopping playback.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98373: change power down sequence for smart amp
      commit: 352e1eb17eee86ab4dd66c0c9df528b350aaace2

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

