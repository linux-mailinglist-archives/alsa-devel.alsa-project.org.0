Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5957EAF57
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 12:41:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 234A584A;
	Tue, 14 Nov 2023 12:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 234A584A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699962072;
	bh=whBGpcG47xVNRfzEEzDm3fJ5D0wWUem1/axCjyGCLGI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W5775iOhOZ2FCuRncdyxh5rQQmPgDQuDdVHr08ttdACVHspsFp3Z/UcQFyDNa/zDz
	 8j+P76jkhTD+D163B9sh7jN5FHeOdugXd8niB+NARJuqcN0zJ8VYNCWuEcfdWcuqR7
	 g2ACtbqHJN6d4T/7kpSmLUyowJ/DjhJyJCsphQMY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75DA2F8057D; Tue, 14 Nov 2023 12:39:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D020DF80578;
	Tue, 14 Nov 2023 12:39:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46CFCF8016E; Tue, 14 Nov 2023 12:39:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C83AF801D5
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 12:39:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C83AF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eJx97K7F
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 42A36B811D2;
	Tue, 14 Nov 2023 11:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE51C433C7;
	Tue, 14 Nov 2023 11:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699961947;
	bh=whBGpcG47xVNRfzEEzDm3fJ5D0wWUem1/axCjyGCLGI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eJx97K7FXBh/W6uOU3lXCslzPXCfkDabOUXMKzpdNQAet6sVCJoGaMnx6OuWkPCxA
	 QTqWg3EvseZkQInBprXqqWFrEOXou56XHRuu+iZU1ZqAFT+5THj3U7d0yKAXCTLZp+
	 3z6bjc1dgOXecF99Q2fQ2qDN+verUSjl/06p0VmSDGg3oBpQhq8g40K0wkrkhvSEni
	 FNZih164O3iRJ+TIyFsQKpa5ncdfS9x2HuYo8poIxs56lsrQh9zbfxzUw14Nq5jlqJ
	 1TuWDnWhaa3BAQvC6R4i17glDK00uGm6pqZ2OhnGx2tXbOfAVIOXV2/KJCaQUzFeU5
	 0DfQnquWzpVvw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com, richgong@amd.com,
 posteuca@mutex.one, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20231113123345.2196504-1-Syed.SabaKareem@amd.com>
References: <20231113123345.2196504-1-Syed.SabaKareem@amd.com>
Subject: Re: [PATCH V2 1/2] ASoC: amd: acp: add Kconfig options for acp7.0
 based platform driver
Message-Id: <169996194304.29934.12872019600831589638.b4-ty@kernel.org>
Date: Tue, 14 Nov 2023 11:39:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: EMIHIEIORBZR3JYPL2YKSLFG5CF6KK4L
X-Message-ID-Hash: EMIHIEIORBZR3JYPL2YKSLFG5CF6KK4L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EMIHIEIORBZR3JYPL2YKSLFG5CF6KK4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 Nov 2023 18:03:42 +0530, Syed Saba Kareem wrote:
> ACP7.0 based platform legacy drivers can be built by selecting
> necessary kernel config option. This patch enables build support
> of the same.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: acp: add Kconfig options for acp7.0 based platform driver
      commit: d3534684ada99ef8c0899eb28c62b4462483ee19
[2/2] ASoC: amd: acp: add pm ops support for renoir platform
      (no commit info)

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

