Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7017A2CF3
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 03:15:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5C48E94;
	Sat, 16 Sep 2023 03:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5C48E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694826942;
	bh=J5e03yZd7Sk+R0FI6BNLHst3hPjDQleRw4pHwxvjJig=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BGOW2ygmMKFu0nCVSQ5cOHsvfKRGn7TtgnyTOQWbS1YvpCDF294d5ezLnmmxt6UnW
	 J6uiYF/YYxWjrW7Y554AwSqaEl3pefw+VnYdxx32OhJoQuRj60eL3aVLyoXAg+Ho56
	 T0QTVZ35FLls+oTk1vqz3CxLIkw5MDKo4Jv1xgYU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 258EEF80537; Sat, 16 Sep 2023 03:12:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10C66F805EF;
	Sat, 16 Sep 2023 03:12:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8998F805C2; Sat, 16 Sep 2023 03:11:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7AEEF805AF
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 03:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7AEEF805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Rk9fbqGi
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 06D0DCE2CD5;
	Sat, 16 Sep 2023 01:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71094C433C9;
	Sat, 16 Sep 2023 01:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694826712;
	bh=J5e03yZd7Sk+R0FI6BNLHst3hPjDQleRw4pHwxvjJig=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rk9fbqGiVwOQR9pCauvREG2zCiaSyUgBFUWBlai77aIMxQfT7NgdOKDLz9nC+pxFW
	 PV4Kgj2lvMwvutiFmcpEyB+Jcn3yNuGI0NZGokNTacbHAqcifUBrgiunm0cLa15nrt
	 h//SIu6d3ScmQmxDir9Tau4bNsLzZjynLO4XMPxhMx9Fu9g8DbdCGOsMdxrK441G/s
	 gapSv/pwcozCUjuoWeug688ahw5NHpkinaUf+HKfAdIpyahVRaI+Lpln8E/LC/zkRu
	 n9gZVGasi0M32ICf29izK0TQwayRogPUJwfPR1PfbVuUBtWjCeMy1FhhRmXMXamkWP
	 TzFRCjrNciNdQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com
In-Reply-To: <20230915144300.120100-1-ckeepax@opensource.cirrus.com>
References: <20230915144300.120100-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Add shared IRQ flag for shutters
Message-Id: <169482671117.606223.17161304969957211847.b4-ty@kernel.org>
Date: Sat, 16 Sep 2023 02:11:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: HFKFY5QJVWNGBFZTM2PUE5CTEHJVTSB7
X-Message-ID-Hash: HFKFY5QJVWNGBFZTM2PUE5CTEHJVTSB7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFKFY5QJVWNGBFZTM2PUE5CTEHJVTSB7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Sep 2023 15:43:00 +0100, Charles Keepax wrote:
> The microphone and speaker shutters on cs42l43 can be configured to
> trigger from the same GPIO, in this case the current code returns an
> error as we attempt to request two IRQ handlers for the same IRQ. Fix
> this by always requesting the shutter IRQs with the IRQF_SHARED flag.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: Add shared IRQ flag for shutters
      commit: c923e7759a29cf67aa4dda77b816263771380f86

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

