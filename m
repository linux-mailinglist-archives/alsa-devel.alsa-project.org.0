Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBED17E9E25
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 15:07:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50D3D844;
	Mon, 13 Nov 2023 15:07:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50D3D844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699884479;
	bh=vTMYffes98zdDzbW5PW6PMn758Eh1TJV6fxNVpAjtjo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JolHQeAqN+2fIz9wYmTlkHz6J1Ck4Oq5tg+CVu5h9XO6BAosNfNnXnvZDv70ylLdf
	 TXEbC24gdq4Ov1p6YBHzpzGAp8TbbaUeWNemBVgdiUvQnC3g7hhetqzt60OkIvK5Gj
	 Tx20xQNXysoYZ+XYjVp/x0P8KwHXlzJ/qNmI+suc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA111F8057F; Mon, 13 Nov 2023 15:05:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C40B1F80580;
	Mon, 13 Nov 2023 15:05:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 266FBF8055C; Mon, 13 Nov 2023 15:05:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D3D6F800ED
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 15:05:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D3D6F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Rn9Aq9fX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9CBBACE138F;
	Mon, 13 Nov 2023 14:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B4BC433C8;
	Mon, 13 Nov 2023 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699884318;
	bh=vTMYffes98zdDzbW5PW6PMn758Eh1TJV6fxNVpAjtjo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rn9Aq9fXICUwKhugQRtPzzZbtIuCL67Jd/ESWpboiwsmI8SnebWLvgnt26IaT+hbW
	 l4yFrAh/DXE3sBPvawFCFSCQ4SlHqgTN53pL+PmLh+ax7WJZjqcq29Q9TKIg5e7mN7
	 Ytt0vn15BlGQJ1CBAkfRsDE5O8e8w2+CNpt0MD98AYGoykn+n7zoasFWjf6EOq7S4Y
	 68Jah3/Nc1R53kr8hYAFwh2GFPal8V13XK3nzVjfiJ+6jRrUpcrtUhAGNLpMRBKYLU
	 MjSAFRsJXISdYTZNS1trHsbS9Lv8cBx2ukjxONjAkhtWTREq0rVRqqeUEEAZumTtKN
	 jjlFulqF28htw==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20231026113549.1897368-1-amadeuszx.slawinski@linux.intel.com>
References: <20231026113549.1897368-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: dapm: Simplify widget clone
Message-Id: <169988431615.3280890.12635214679835055069.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 14:05:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 7HEYY2CNCS5H3R6Q5WIVPYQ2BRFNFKYS
X-Message-ID-Hash: 7HEYY2CNCS5H3R6Q5WIVPYQ2BRFNFKYS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7HEYY2CNCS5H3R6Q5WIVPYQ2BRFNFKYS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 26 Oct 2023 13:35:49 +0200, Amadeusz Sławiński wrote:
> New DAPM widgets are created based on a provided template. When cloning
> the data, the name and stream name also need to be cloned. Currently the
> data and the names are initialized in different places. Simplify the
> code by having entire initialization in one place.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dapm: Simplify widget clone
      commit: 79323dc80318aab6c2d05abdbcf88f09b50522c5

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

