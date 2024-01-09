Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A466E828385
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 10:55:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 409EE822;
	Tue,  9 Jan 2024 10:54:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 409EE822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704794106;
	bh=ZzK6Vp42TEIsfIyJQNP28NhtlMFkU94Dmq0D+Z7QDdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SQzBvvFDsC7fazbLRMPbte/g2uaguiuGsLpeAvJOj8kHvDN4Zu7/3bsUDGXYAlkEC
	 kvRdVTHXYSGA08THl6iGClYFawaoSWfHmR7tpvX1zUGxBTBk83abjpDtlvOdlZQ7ED
	 0HQZbjp9a77gy/NvQuO6eKb6XB53xGdp+EHgn4io=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F7DFF80589; Tue,  9 Jan 2024 10:54:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66F0BF8055B;
	Tue,  9 Jan 2024 10:54:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D6CEF80254; Tue,  9 Jan 2024 10:53:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECA94F80086
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 10:53:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECA94F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WcXXsHyc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1A4E2CE17D5;
	Tue,  9 Jan 2024 09:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED03BC433C7;
	Tue,  9 Jan 2024 09:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704794020;
	bh=ZzK6Vp42TEIsfIyJQNP28NhtlMFkU94Dmq0D+Z7QDdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WcXXsHycg7s8ZD808aEB0IuRC/Bag1Sc2v1jQ1iPEZTISo/tm2USeZdeUBa8t5M2T
	 KR0d4J4uyeFP46pmE8UD79VBJoFRzYRScKZ/BAgt+0ukv1CPzT+2ZtirRFupNTafW9
	 3xg0RMGDRU0b8/Ni3Ftj6CXsGn/jlyG+x6z3pVtf/V5lUC0Sfd0I1qi1vfTmuJyjPB
	 d+UKsA0AYpYGPUmpYC30JvsItCj+vccj4sFO7bTVWw/RdrRWAPpRlvXTHUte7IRFmq
	 wJBvfO2EfGZIkIt8AdooIFeMvU4GM3YFBmdw/XCwuirYcdqr+/NfCoFVeKhnPZkiFG
	 EtXgf/VEpHetg==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Jaroslav Kysela <perex@perex.cz>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>,
 Rob Herring <robh@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org
In-Reply-To: <20240108204508.691739-1-nfraprado@collabora.com>
References: <20240108204508.691739-1-nfraprado@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192: Check existence of dai_name
 before dereferencing
Message-Id: <170479401767.23951.13089659929333674161.b4-ty@kernel.org>
Date: Tue, 09 Jan 2024 09:53:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: PLSFZ2HCJXCP2YNKUDGGGBPHNDLR6WUH
X-Message-ID-Hash: PLSFZ2HCJXCP2YNKUDGGGBPHNDLR6WUH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PLSFZ2HCJXCP2YNKUDGGGBPHNDLR6WUH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 08 Jan 2024 17:44:58 -0300, Nícolas F. R. A. Prado wrote:
> Following commit 13f58267cda3 ("ASoC: soc.h: don't create dummy
> Component via COMP_DUMMY()"), the dai_name field is only populated for
> dummy components after the card is registered. This causes a null
> pointer dereference in the mt8192-mt6359 sound card driver's probe
> function when searching for a dai_name among all the card's dai links.
> 
> Verify that the dai_name is non-null before passing it to strcmp. While
> at it, also check that there's at least one codec.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192: Check existence of dai_name before dereferencing
      commit: 4d4e1b6319e5c4425ea3faeaf9a10b8b4c16c1e1

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

