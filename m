Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 271307D5AFA
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 20:56:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7939B1F4;
	Tue, 24 Oct 2023 20:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7939B1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698173759;
	bh=Q7AQ8oRrcdeG+H+90jdi3d1PI7uSdUbtZvihZFgYw2Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=N1gUtohokJ/Aktl7QyzoRgq6i1ET2cObJqFXGtEP8SDg2MzuTzZMANvuq9iAYW8GS
	 8ulqBflMgRnbN9GXmz3UpKRiB7Z4jJtLjWSYtZ1m8tqlJJ/9X0lRffdqAeQUeDe31T
	 2fW1ElhFzlP3qyk1QFDGg+wLn3OvsBzQHIQpMuKA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69B29F805B0; Tue, 24 Oct 2023 20:53:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD692F805A9;
	Tue, 24 Oct 2023 20:53:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE11FF80578; Tue, 24 Oct 2023 20:53:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75021F80157
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 20:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75021F80157
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DhD9CmR9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E27CF61470;
	Tue, 24 Oct 2023 18:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945ECC433C8;
	Tue, 24 Oct 2023 18:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698173617;
	bh=Q7AQ8oRrcdeG+H+90jdi3d1PI7uSdUbtZvihZFgYw2Y=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=DhD9CmR9cubugRb44Rs4NUYR5/idllTmfjVSEheguSSbt/3VVJYgdZtKzONNdhwTM
	 qC5+d29qkLvZm79zotQxiYd+JOMeiDwHmbtEqAr6UphPOUS3bxsPdKv6RENTs7V+17
	 2Nivw8KuvYtYO4M9r2kJsrqoo7kZsft/TuXEYMKf5Cr+FJqeAXml2wjHgJP/LjxDwn
	 2TpTfAnWlmYMbS/SQyy4zxSZle5auGVN4/Av73i4XAk3NhU1FSZEYVqit1Lt3DbkQ4
	 erLNTMcUa1MV4tMt4SggyUqcQjbyphc6ELGXOzUOAZOjIpNRE62t0f6J5annN9NoDK
	 SbbKfl9H6qtvw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maso Huang <maso.huang@mediatek.com>
In-Reply-To: <20231024035019.11732-1-maso.huang@mediatek.com>
References: <20231024035019.11732-1-maso.huang@mediatek.com>
Subject: Re: [PATCH v2 0/3] ASoC: mediatek: Remove redundant code and add
 sample rate checker of MT7986 SoC
Message-Id: <169817361532.82257.15939611846447961034.b4-ty@kernel.org>
Date: Tue, 24 Oct 2023 19:53:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 4JLAL22YJOTSKEGJJC3RZ5N3WUPBW3YF
X-Message-ID-Hash: 4JLAL22YJOTSKEGJJC3RZ5N3WUPBW3YF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4JLAL22YJOTSKEGJJC3RZ5N3WUPBW3YF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 24 Oct 2023 11:50:16 +0800, Maso Huang wrote:
> Changes in v2:
>  - devide v1 patch [1/2] into v2 [1/3] [2/3] with appropriate title and description
>  - refine error log based on reviewer's suggestions [3/3]
> 
> 1. Drop the remove callback of mt7986_wm8960.
> 2. Remove the mt7986_wm8960_priv structure
> 3. Add sample rate checker.
> Patches are based on broonie tree "for-next" branch.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: mediatek: mt7986: drop the remove callback of mt7986_wm8960
      commit: 3e92ea2a460bc410789b24f328de9985ddc3eea6
[2/3] ASoC: mediatek: mt7986: remove the mt7986_wm8960_priv structure
      commit: 0f10adb0ed0c0d74f8bc5facf2c70bc515210295
[3/3] ASoC: mediatek: mt7986: add sample rate checker
      commit: 0e20929434080aa87614fa0135c97bb9337ece27

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

