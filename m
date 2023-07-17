Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 057F7756BA3
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 20:16:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C013AE8;
	Mon, 17 Jul 2023 20:15:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C013AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689617789;
	bh=Lm7z2hIma39ARJyVJMfmqyTST1nReetRguMkdQ0eFTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rOgIv31cz7EP3U2jZcsMu0vf5iOgTFrQlJAFIyRrMjxOKq3aRqbu3xiBvbtDv+W/w
	 /ADcuSBZ4ST8mJ0p2IjF0vHmH7AN8uQPzcJFTojPj9cb8hO2bf9Xkf+/2ZKGW9fZxc
	 Rb16+dz+3ye389UsSDaDLgZTPaRcSFLE2pnt6+lM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40618F804DA; Mon, 17 Jul 2023 20:15:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3478AF800D2;
	Mon, 17 Jul 2023 20:15:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D8B0F80494; Mon, 17 Jul 2023 20:15:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43A77F800D2
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 20:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43A77F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bkHWjO6g
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3B17611DF;
	Mon, 17 Jul 2023 18:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B056C433C8;
	Mon, 17 Jul 2023 18:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689617692;
	bh=Lm7z2hIma39ARJyVJMfmqyTST1nReetRguMkdQ0eFTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bkHWjO6gX3C4QljixgWueiP0/OdOcvFrH1VZ5UexKowPLJ6w9cL+Jy1nNXZE9LoLg
	 +QopuLyfpoXqgkIqs7nyfhEyka4U9q+X/ypDkzJlpa+gHMNOZHSX3Sz88GUajWUCGA
	 AEJ1yhKl+OiKg5Jrm2KTtFcXMaB1RtUlj4htDvcnPZYf462/+Krfsk1xNotmkHvkSG
	 /Q+sGwUdt9kwLsXzlkUTZx/tBAeTrEcsvyznyYISq3U2jyIgCAST0nTvg87IVXI6h2
	 2sQPckLy7iwh0wT35nSVoqWdty7PKNw3fzOOj7evesWFEOrt2cUXi+HsT5P7Q2gCRt
	 JfMGoupTzSe9w==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20230713112112.778576-1-thomas.petazzoni@bootlin.com>
References: <20230713112112.778576-1-thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ASoC: cs42l51: fix driver to properly autoload with
 automatic module loading
Message-Id: <168961769002.448315.10905813350142726607.b4-ty@kernel.org>
Date: Mon, 17 Jul 2023 19:14:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: K7JFS6D7M2FGDJKZ6TVPFWFGLMH2ZX5V
X-Message-ID-Hash: K7JFS6D7M2FGDJKZ6TVPFWFGLMH2ZX5V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K7JFS6D7M2FGDJKZ6TVPFWFGLMH2ZX5V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jul 2023 13:21:12 +0200, Thomas Petazzoni wrote:
> In commit 2cb1e0259f50 ("ASoC: cs42l51: re-hook of_match_table
> pointer"), 9 years ago, some random guy fixed the cs42l51 after it was
> split into a core part and an I2C part to properly match based on a
> Device Tree compatible string.
> 
> However, the fix in this commit is wrong: the MODULE_DEVICE_TABLE(of,
> ....) is in the core part of the driver, not the I2C part. Therefore,
> automatic module loading based on module.alias, based on matching with
> the DT compatible string, loads the core part of the driver, but not
> the I2C part. And threfore, the i2c_driver is not registered, and the
> codec is not known to the system, nor matched with a DT node with the
> corresponding compatible string.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l51: fix driver to properly autoload with automatic module loading
      commit: e51df4f81b02bcdd828a04de7c1eb6a92988b61e

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

