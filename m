Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B3369A3A5
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 02:56:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9CE1EE4;
	Fri, 17 Feb 2023 02:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9CE1EE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676598963;
	bh=x1LZ7ii3mg07z/Meu9ICZ3rodqhgkj9TTWtOSt2yxeE=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WUD4qlh8uGdeFDil9Vr+LEB0hTSG1VyBHc5x6aUxDAw8GgVbnc2hno3jGFLL/u6g7
	 HF+yTJdpc8temxcZuk1eg5R2YZm5Eq65lNxTTxATu6n0dhh4FgKwjcHiUh/4ZL9k5b
	 /5wddfAS6wprEX472UuiejUziTTj7FAcOYCLvWlo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76C1EF80525;
	Fri, 17 Feb 2023 02:54:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49771F80083; Fri, 17 Feb 2023 02:54:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16FC9F80083
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 02:54:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16FC9F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DZrs8vgu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E4FFBCE2DA2;
	Fri, 17 Feb 2023 01:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17422C433EF;
	Fri, 17 Feb 2023 01:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676598847;
	bh=x1LZ7ii3mg07z/Meu9ICZ3rodqhgkj9TTWtOSt2yxeE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DZrs8vguh32f2pgoIKp8k28jH3vcgo584avhYb2L2ODTUQwdDwwzk7azVMuuzly6r
	 6Z9kizj3uLtSTVPatMQl6Wg451Dm05osb8hBeJxi4dAfXddkf+zPKHjWnt42urTJaT
	 I2c2w22o/q6tbUODfDj6YTjJ9wIuSW/Pjv3a5MRzcTwPrFsuEBsqYtQqCjI3FU+JBQ
	 8ocAkH3I9BPiV5NVR/wC+HkdQ+q69jLUr4uDpocN5abPARquSdahX/Jg4N0lhZ2UqJ
	 HsvlkzRgP8XlBOK2KXLrLExA6w82MUsFxammmdu/hbhGqLsJGJboy1z2buyUstHBAN
	 vi9YUgrxwu0GQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230216144054.26203-1-peter.ujfalusi@linux.intel.com>
References: <20230216144054.26203-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-dai: fix possible stream_tag
 leak
Message-Id: <167659884474.51394.4671218930545421608.b4-ty@kernel.org>
Date: Fri, 17 Feb 2023 01:54:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: KZM2PBE5DM4E7KTBKBLPJ56ZHQFKHSZC
X-Message-ID-Hash: KZM2PBE5DM4E7KTBKBLPJ56ZHQFKHSZC
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZM2PBE5DM4E7KTBKBLPJ56ZHQFKHSZC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 16 Feb 2023 16:40:54 +0200, Peter Ujfalusi wrote:
> The HDaudio stream allocation is done first, and in a second step the
> LOSIDV parameter is programmed for the multi-link used by a codec.
> 
> This leads to a possible stream_tag leak, e.g. if a DisplayAudio link
> is not used. This would happen when a non-Intel graphics card is used
> and userspace unconditionally uses the Intel Display Audio PCMs without
> checking if they are connected to a receiver with jack controls.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-dai: fix possible stream_tag leak
      commit: 1f810d2b6b2fbdc5279644d8b2c140b1f7c9d43d

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

