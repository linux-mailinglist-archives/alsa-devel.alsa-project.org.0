Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2BD7488DD
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 18:06:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 566DB83A;
	Wed,  5 Jul 2023 18:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 566DB83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688573207;
	bh=CTAvb6JMEf73tIiPsKFyvyNZoYYTcypUwmV94CiGldw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nvXpiyG30B71F0M1XNMcvkv4DRJx1R3AwsojyiUoGCl+G5dlLQ4nVrRo4pvtVfx+0
	 WoWcqIogmqlYCqsCn+a9t4lTsh4BT1iF72iMiRd3RnpX9wQMP6F2Gw8eOpU8nTXgh/
	 kKtqGB4uHJ+vsA6uxPl1loqXT0iaGw2hAhzcFQes=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA7BBF80535; Wed,  5 Jul 2023 18:05:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 996FBF80544;
	Wed,  5 Jul 2023 18:05:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F18AF80125; Wed,  5 Jul 2023 18:05:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7C2FF80100
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 18:05:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7C2FF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g0bUY8Th
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6DD5C61543;
	Wed,  5 Jul 2023 16:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B50DC433CA;
	Wed,  5 Jul 2023 16:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688573110;
	bh=CTAvb6JMEf73tIiPsKFyvyNZoYYTcypUwmV94CiGldw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g0bUY8Th4vWaYNWwyLz7jTJPy3ZDM6KoOBH8ukFXwhB3KGyk71f1koc/tz34wTTH1
	 DThD7v22L3L/U5eoWMyqP+9X4kpeiE+7qgStYWmEJF4tiRLaLyLcqcsXeKbVT7HOAe
	 tQbtpc6EFEI780FDnqbC8BvZcQyf/Jf+pKe9nVJ1rlRhqsP3AoNGPuC6L23+EKwc6Z
	 P0NdV1rJdTLVXlQYTrkvD/BlN34aCA3rVj5Gub0QkZejwIqX8iaeHYsqNy/gVqh2hf
	 HRwKln3IA6VP8UspUNp8HtWpTZiev5fwPjRDNjj1PQ2d6MeXs1WwiVR+7yLEJ1uLT9
	 /nExiyC2UH4Pw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 cychiang@google.com
In-Reply-To: <20230705042915.24932-1-shumingf@realtek.com>
References: <20230705042915.24932-1-shumingf@realtek.com>
Subject: Re: [PATCH 2/3] ASoC: rt5645: check return value after reading
 device id
Message-Id: <168857310884.55162.3076080568171850157.b4-ty@kernel.org>
Date: Wed, 05 Jul 2023 17:05:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: KZBCADCYP4VKHUD37IXJIDCM3B2PMZC4
X-Message-ID-Hash: KZBCADCYP4VKHUD37IXJIDCM3B2PMZC4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZBCADCYP4VKHUD37IXJIDCM3B2PMZC4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 05 Jul 2023 12:29:14 +0800, shumingf@realtek.com wrote:
> If the I2C controller encounters some problems like timed-out, the codec
> driver will report the error code for the first read.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/3] ASoC: rt5645: check return value after reading device id
      commit: bf62eec5cdecbe7eeab02407da98f36cd7b1dea7

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

