Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B780184A01C
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Feb 2024 17:59:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD147201;
	Mon,  5 Feb 2024 17:59:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD147201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707152366;
	bh=d3MHcE60+aEolo8yoxGkE+jYHNZc2enKn6A6LrbJtfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O/otJK/AQ9v+BeSkSnjm0Xd98OcRK9Q+jD1Ulu01ePR32/rSE47ZzyI2I2DjSwt2V
	 IMzvREaUFP3x5XrOm+jKDtBQtB0lKdxZtujRRcpqGviZzzCSUDtx5J3YIqVUPJEvj9
	 RyTGvg4B/dzSbIFB3GH088YhisT5QyUL4qJGjlkI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5BA4F805A9; Mon,  5 Feb 2024 17:58:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C1BCF8056F;
	Mon,  5 Feb 2024 17:58:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E2B1F804E7; Mon,  5 Feb 2024 17:58:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F4BBF800EE
	for <alsa-devel@alsa-project.org>; Mon,  5 Feb 2024 17:58:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F4BBF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BxLNYSsg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 68038CE09E9;
	Mon,  5 Feb 2024 16:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E628C433F1;
	Mon,  5 Feb 2024 16:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707152315;
	bh=d3MHcE60+aEolo8yoxGkE+jYHNZc2enKn6A6LrbJtfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BxLNYSsgyWXjOQlBq/UM1PQu9D8GiKu7jgV85Pbc7gZldree/qIejh3lw0cGvR3rG
	 mjHGNXTRMV7oftGNdv+wz8bcIhV57ysafTzHPN5+uAUO/G0DsgqW0+mDH5D7ITHeri
	 5Jq5ddr6NJ0P2KUdljd8c+Cfjw4rgTCL/JWAISw50RsQLVSb3xaZdNHdXkCxktD9dE
	 y5Gk+QYbq06q/JWMe+h3p8z3fg5mw4uVihCMXI1tzis15RJqqCK6vDRGLBXkOhVGLa
	 3FQyi0Wj++Neairf9Y1DSQjlqgqHqBOqsmK5V0gIotRxkJ11WBc8zoHYMa4heTyCr1
	 xSpriaNwY7XkA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
In-Reply-To: <0c254c07-d1c0-4a5c-a22b-7e135cab032c@moroto.mountain>
References: <0c254c07-d1c0-4a5c-a22b-7e135cab032c@moroto.mountain>
Subject: Re: [PATCH] ASoC: cs35l56: fix reversed if statement in
 cs35l56_dspwait_asp1tx_put()
Message-Id: <170715231128.801804.92834537524909316.b4-ty@kernel.org>
Date: Mon, 05 Feb 2024 16:58:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: QK2S6VKIYM4UKMH5A6YT4YL6IMV6YT62
X-Message-ID-Hash: QK2S6VKIYM4UKMH5A6YT4YL6IMV6YT62
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QK2S6VKIYM4UKMH5A6YT4YL6IMV6YT62/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 05 Feb 2024 15:44:30 +0300, Dan Carpenter wrote:
> It looks like the "!" character was added accidentally.  The
> regmap_update_bits_check() function is normally going to succeed.  This
> means the rest of the function is unreachable and we don't handle the
> situation where "changed" is true correctly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: fix reversed if statement in cs35l56_dspwait_asp1tx_put()
      commit: 4703b014f28bf7a2e56d1da238ee95ef6c5ce76b

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

