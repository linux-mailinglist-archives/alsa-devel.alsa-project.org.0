Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A72099376E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2024 21:35:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 971F1B70;
	Mon,  7 Oct 2024 21:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 971F1B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728329701;
	bh=U+ShpJu9O0Fvtw6u2A/LZMfJXLssFHQ3MtemmKkAHe0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F+FgnNTgO1KOzdHn5w89sEAtWjzrLb27O8iSwul0HX4TGXKibvgXjwTt2QI/N3m3X
	 xYq9s/3Fs7J7qAqyYBjyW6+f0o9VoYcAkOaN3N+yZDvMONNYRs+/qWftQ/rkNN1f7P
	 W/NavkHLCII1HzjuHqU2elPb9weg0mfryOj9VUbg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFAB7F805D2; Mon,  7 Oct 2024 21:34:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B11BF805D3;
	Mon,  7 Oct 2024 21:34:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24614F80528; Mon,  7 Oct 2024 21:34:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DE45F80496
	for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2024 21:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DE45F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QnXhvzKI
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 68810A424FE;
	Mon,  7 Oct 2024 19:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE9BC4CEC7;
	Mon,  7 Oct 2024 19:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728329649;
	bh=U+ShpJu9O0Fvtw6u2A/LZMfJXLssFHQ3MtemmKkAHe0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QnXhvzKISUvrus18xoh0w4GkZHMELC4Z/q61h//wk3lusmAXsmBOjrqOyrG16va96
	 bMSH+dX40jPfbfcXB/gZZ2b3t0kRggk1sZ86jhVGd8M66cT4nuC0ZAgGml4rDegblp
	 NxAe9tjlpTpFoamns6swmC5s1IVqi3Ly6yWpPvaIR7V51CpH3573xfnrg1wuHULhiy
	 vvqs5HphwNV9lMtD91/3PAynptzBEk4ZmAfHDLMNDz8ViU8Z0wIAj2H421BEctGp/s
	 GPUxVHA0ksFsWujFl3/Uj4gmei9lHbDQM7nd/C9jWDjK/acTlK+cttKaPqkASIQEBa
	 FjjfS+W5wXgug==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <d18b35f8b6934fc6a2be6c4458a63fe5@realtek.com>
References: <d18b35f8b6934fc6a2be6c4458a63fe5@realtek.com>
Subject: Re: [PATCH v3] ASoC: rt721-sdca: Add RT721 SDCA driver
Message-Id: <172832964696.2482031.1005096071987114084.b4-ty@kernel.org>
Date: Mon, 07 Oct 2024 20:34:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: 76OANP3FIMQFEI7ODDQ4KPBU55R5VAVU
X-Message-ID-Hash: 76OANP3FIMQFEI7ODDQ4KPBU55R5VAVU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/76OANP3FIMQFEI7ODDQ4KPBU55R5VAVU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 01 Oct 2024 09:17:38 +0000, Jack Yu wrote:
> This is the initial codec driver for rt721-sdca.
> It's a three functions (jack,mic,amp) soundwire driver.
> 
> Signed-off-by: Jack Yu <jack.yu@realtek.com>
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt721-sdca: Add RT721 SDCA driver
      commit: 86ce355c1f9ab943bbe099ea7d0b8a3af2247f65

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

