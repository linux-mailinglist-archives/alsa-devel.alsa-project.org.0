Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B13991595
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2024 11:51:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C86E883E;
	Sat,  5 Oct 2024 11:51:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C86E883E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728121886;
	bh=wUQjLZzpHEAHwW5NYCB95sIsPmmiGfq1M5ccwnjqYcc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gnMhS294JnZUavhdUmgXW1e0yo3qOxzEUKGtQZRnb8q0zFOAtOAjAID14PLhKtahq
	 JGncU/pkb8SLQ+o8kKS7rUpwUTg2VfQOaRnDKDQDBFkmx7C+WaTfsN53gycB13kqBn
	 aPsiwiibWc7h/2oOaplObFsRBQFC5wun+83FM9Bo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99826F80579; Sat,  5 Oct 2024 11:50:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06DC9F805B2;
	Sat,  5 Oct 2024 11:50:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE6D2F80517; Sat,  5 Oct 2024 11:50:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A365EF8001E
	for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2024 11:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A365EF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GaVYUAhI
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBC785C5450;
	Sat,  5 Oct 2024 09:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9972FC4CEC2;
	Sat,  5 Oct 2024 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728121840;
	bh=wUQjLZzpHEAHwW5NYCB95sIsPmmiGfq1M5ccwnjqYcc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GaVYUAhI+bKnmfCoaBMuc8M05yXqaDC4sXcuvXuJDBS5yOdV/CKkEcHImislnzgF4
	 vOu2dKkr+K+Qf5BfAy0uoYVbsB8YsuNKMCajV3BaBbhydc6U4nqU2xkDEnXt8WcpEE
	 QVrgnKeiE2MVo6oIxc8nsI+X+yb7eNl4IXHUgBEWHvRWvziK17GLEM/iIWmbls/x1M
	 dT6+WkQ8/530Fnu6I8UqjbPjG4vL/oUVg+cvAIVpATPKjtfQqQgqxZVVm9FlCK0F5g
	 nP+Xm9Voqi5gxgd+jnAytypKLyveK3mFYN2OfA6oas06qEknaatVi7gMI0tRoe++D9
	 KfiqWSRpw+CDQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Adam Ford <aford173@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mips@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <cover.1727438777.git.geert+renesas@glider.be>
References: <cover.1727438777.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH treewide 00/11] ASoC: Clean up
 {hp,mic}-det-gpio handling
Message-Id: <172812183435.891737.5699490340500862525.b4-ty@kernel.org>
Date: Sat, 05 Oct 2024 10:50:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: QNB7U7STMQZ46FFI3WL5M3V6XLIGWCUG
X-Message-ID-Hash: QNB7U7STMQZ46FFI3WL5M3V6XLIGWCUG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QNB7U7STMQZ46FFI3WL5M3V6XLIGWCUG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 27 Sep 2024 14:42:15 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The "gpio" suffix for GPIO consumers was deprecated a while ago, in
> favor of the "gpios" suffix.  However, there are still several users of
> the "hp-det-gpio" and "mic-det-gpio" properties, in DT bindings,
> drivers, and DT source files.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: fsl-asoc-card: Add missing handling of {hp,mic}-dt-gpios
        commit: cfd1054c65eefec30972416a83eb62920bc1ff8d
[02/11] ASoC: dt-bindings: Deprecate {hp,mic}-det-gpio
        commit: e58b3914ab8303a2783ec1873c17b7a83dd515f7

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

