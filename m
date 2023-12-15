Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EA181535B
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 23:14:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32191E9A;
	Fri, 15 Dec 2023 23:14:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32191E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702678489;
	bh=bDiBbPR3RfT/ab4YUavIkrVz8RJyt3orRvU5WNVHrPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LBGo2RBms4U86PGx/WashKxqNU50XL89u9c4O7JKtbiZT533lChyqpnV1iPzS79hs
	 dnK9zoAsIBq6DvaTx2emCMOY7CRYr/YBpS6cEC8YjFF88ssSCaEfNdoFN84yg4WEaO
	 8RSiYdiOraoXlxo8nucd73eYv8celX9eXh3fKHpc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AE30F80579; Fri, 15 Dec 2023 23:14:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 335E4F8001F;
	Fri, 15 Dec 2023 23:14:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3247F80166; Fri, 15 Dec 2023 23:14:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32FD6F800D2
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 23:14:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32FD6F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=toQpHFxp
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 440A3CE2F9D;
	Fri, 15 Dec 2023 22:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49836C433C7;
	Fri, 15 Dec 2023 22:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702678440;
	bh=bDiBbPR3RfT/ab4YUavIkrVz8RJyt3orRvU5WNVHrPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=toQpHFxpyulM1L2N5C8M6irdavEs9iuW8oMP/+3fmdfLp0d4PICOE+aRxjxdS40If
	 sJv7fKH7ZW4gTE0PwIm5j9ERUppx0vWlylXvy9aZee1glLuAVgGyUy85B/uDroXbmW
	 L1r9zR4hfDuFIUevglgPmurdxtTkuFKpEx5edpU5ObhTfTTVHuHEgwqPImJ3XiTQ+i
	 FrBHgffnwl212GM9USQh1+DweRURale5ZaXb6HSzBWGvds9f73qyEogAq1eROzsegI
	 vf/ps+doTRETPqYTNJ7OLh4jCZShym15zky05grMPyn8P7y0Fkq89+v0Cd7B3VYz68
	 01WyDrXke6xvA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com, posteuca@mutex.one,
 bagasdotme@gmail.com, venkataprasad.potturu@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20231215130300.1247475-1-Syed.SabaKareem@amd.com>
References: <20231215130300.1247475-1-Syed.SabaKareem@amd.com>
Subject: Re: [RESEND] ASoC: amd: acp: add pm ops support for renoir
 platform.
Message-Id: <170267843699.316482.4350897389116089852.b4-ty@kernel.org>
Date: Fri, 15 Dec 2023 22:13:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: VYDLY4KQRPHHANVDQVNXAEE5MWIBYFTS
X-Message-ID-Hash: VYDLY4KQRPHHANVDQVNXAEE5MWIBYFTS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VYDLY4KQRPHHANVDQVNXAEE5MWIBYFTS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Dec 2023 18:32:42 +0530, Syed Saba Kareem wrote:
> Add pm ops for renoir platform.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: add pm ops support for renoir platform.
      commit: c95a2a0be0b1bba2e051faa105c2e0401fc2de33

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

