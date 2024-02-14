Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A73D5854A62
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Feb 2024 14:23:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A6D7DEC;
	Wed, 14 Feb 2024 14:22:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A6D7DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707916976;
	bh=3BhU0aZnn35CAZKdM6PG56ZetB26JCBoUcsKfsvxGTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TxeNXbzUtXQw855n94vMzohpaIsvQEMPn6+Tfp5q4gUFVuaxypc+d+pfvKxQZcK//
	 Kd9w5eeSlzCtGxY5+4eeYZH7kE3iVsuveYqfYnJnKgkxn3cv3kaIodQp+v7JFVnMIv
	 NhlTxGNNkfQG1aq9V+jiz7V88ESl5ggC0blb6+BA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA4FEF805AA; Wed, 14 Feb 2024 14:22:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31816F8058C;
	Wed, 14 Feb 2024 14:22:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6B73F80238; Wed, 14 Feb 2024 14:22:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B328F8015B
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 14:22:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B328F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sX/UcCP3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75A9B61953;
	Wed, 14 Feb 2024 13:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6E5C43390;
	Wed, 14 Feb 2024 13:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707916928;
	bh=3BhU0aZnn35CAZKdM6PG56ZetB26JCBoUcsKfsvxGTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sX/UcCP3s3y2QCF0191UjJyD2CJK84+XSRUiI1nfqhs8x6EgXD4u/hDmD6bigwF0/
	 j4AjeSgE3JEtXKxEFmPBtkU8LZVYahLjimx/yREgHv32imHWfpSwWWpju+eb1e06kd
	 0f5MrjyH0sPnMVLVopaWMcRaet7EWXbGXir6Vi4F1W+jyDvOUE7z4uF2BpAN9JxIUe
	 iux4t/Hw7uSnQzEdn2E37Z0Nf5bJUGDU0uyQb1vVPmQGo/5OW7xy2xejDh9ixeJnrI
	 U2CE6YqI+unaEX68jDwd/JNsVxnsOHKrkBbcsNSwIGwOkG0xbFae2+1zSCxzB0hXD9
	 b73jVOR6qSvnA==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20240213215807.3326688-1-jbrunet@baylibre.com>
References: <20240213215807.3326688-1-jbrunet@baylibre.com>
Subject: Re: [PATCH v2 0/2] ASoC: meson: aiu: fix function pointer type
 mismatch
Message-Id: <170791692451.143237.6316282376548391909.b4-ty@kernel.org>
Date: Wed, 14 Feb 2024 13:22:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: MES5CT6677QNP73YV52ESXAZ4CHGHKVZ
X-Message-ID-Hash: MES5CT6677QNP73YV52ESXAZ4CHGHKVZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MES5CT6677QNP73YV52ESXAZ4CHGHKVZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Feb 2024 22:58:02 +0100, Jerome Brunet wrote:
> This patchset fixes 2 -Wcast-function-type-strict warning in amlogic
> audio drivers with clang 16.
> 
> Changes since v1: [0]
> * use devm_clk_get_enabled() instead of adding a dedicated helper in each
>   driver.
> * Split the patch, 1 per fixed commit to make it easier for stable.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: meson: aiu: fix function pointer type mismatch
      commit: 98ac85a00f31d2e9d5452b825a9ed0153d934043
[2/2] ASoC: meson: t9015: fix function pointer type mismatch
      commit: 5ad992c71b6a8e8a547954addc7af9fbde6ca10a

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

