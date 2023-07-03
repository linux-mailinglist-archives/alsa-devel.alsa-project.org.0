Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F03745FF3
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 17:37:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3628D1DD;
	Mon,  3 Jul 2023 17:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3628D1DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688398652;
	bh=PbtXTIJMyOGUJ5dY0n/KIAu/bd8TKKvRXGSl1gUJZ/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KcC+gMUuax6rPxSteaeSI8ljxydBVnirSfmqRSQ+Abaz7EXGRMbYsascIE6dNrG5Q
	 nAiFQwTMIUhNpHK+QRVH/aZxLyCrH0JOjJ/BRbQEI08MmF4TM8XY2bQihGRwtmiLJn
	 9yycJhRPAeoTwfsUk1vfyWICyejGIv51/fxK1x9w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93C7CF80153; Mon,  3 Jul 2023 17:36:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37315F80124;
	Mon,  3 Jul 2023 17:36:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73E35F80125; Mon,  3 Jul 2023 17:36:37 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 414FAF80100
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 17:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 414FAF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WRY10ros
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 527B060F6F;
	Mon,  3 Jul 2023 15:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84EBC433C8;
	Mon,  3 Jul 2023 15:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688398586;
	bh=PbtXTIJMyOGUJ5dY0n/KIAu/bd8TKKvRXGSl1gUJZ/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WRY10rosc1ofOxSiQyb4cviBwN8FjNjE+SVshqFUXdmADEm/S9iv+6GmB/ox2tUE7
	 4XFA/f8wH3zp/hno3oqBbGWZ4gpBB9Cbe0qQAfVS5tmkp6xdR3XmyOHASi99YrgoWk
	 UKCFl5L4kFotr0uL8YBArCh3nyEuNQiZl/fRnUgvOceoL1VexGehq5HNvPnYQY2PFI
	 PIOAPtYdftQ6TWsmj97cDEa3iGla2w4LW6BJU0x1Mz/9rSgDFrIACF7DWiju/V5x6W
	 Jx3Q+5lPgX00bPD8QRuDv7lwPSYwzTNOMMb75Sm6yXbtorcvXHnhjSMGArYVk32/0I
	 5nXyeMvJcno9A==
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20230701094723.29379-1-johan+linaro@kernel.org>
References: <20230701094723.29379-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] ASoC: codecs: wcd938x: fix soundwire initialisation
 race
Message-Id: <168839858467.114514.7415760102411123285.b4-ty@kernel.org>
Date: Mon, 03 Jul 2023 16:36:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 6FV2WDUK2VFN7YMSVOD7BY6K7VLV2LWW
X-Message-ID-Hash: 6FV2WDUK2VFN7YMSVOD7BY6K7VLV2LWW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6FV2WDUK2VFN7YMSVOD7BY6K7VLV2LWW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 01 Jul 2023 11:47:23 +0200, Johan Hovold wrote:
> Make sure that the soundwire device used for register accesses has been
> enumerated and initialised before trying to read the codec variant
> during component probe.
> 
> This specifically avoids interpreting (a masked and shifted) -EBUSY
> errno as the variant:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x: fix soundwire initialisation race
      commit: 6f49256897083848ce9a59651f6b53fc80462397

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

