Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA2E8A68B6
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 12:40:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26728EC1;
	Tue, 16 Apr 2024 12:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26728EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713264044;
	bh=hNctvS/WLFpY8f2jueQ+vJMsiRhGdgQTThlnjXrGA70=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=D1k/+fn+JRq3Lh5/fAApVKhAE5Xj6hyATzWU97XLKOjXFiMCDqZZ/rH/tE3G4tHH3
	 Py9oiJN8KLgCJQ+ea7rQLg8p4o6pgiUOjPCdifAynkqhXQlvr9Moulcg7Lq//MtlFG
	 sojpouFQMAvm4tywVphJUDUW6c5vLRj3f72lkBaQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB9A9F8057F; Tue, 16 Apr 2024 12:40:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E371DF8059F;
	Tue, 16 Apr 2024 12:40:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1C63F8025A; Tue, 16 Apr 2024 12:39:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E13C7F8003A
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 12:39:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E13C7F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZVPLla6S
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4CDC6119D;
	Tue, 16 Apr 2024 10:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09477C2BD10;
	Tue, 16 Apr 2024 10:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713263944;
	bh=hNctvS/WLFpY8f2jueQ+vJMsiRhGdgQTThlnjXrGA70=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ZVPLla6S9+Tm1Fb+FVhWPDVKcuu+6k0rW8chZ8aT2kCKbVqG5LrvJTt9RKRoTRWhe
	 v6i9WRn8wbd2K+AwPMonuYOfSG/rReMCZD0Z++Yx3f34NkGPAqRyiFZvZ4tOq6XKpF
	 h9x+cEYVU9e9C0UWqfnE+CFL3rYOLabGy5JMr3Q2Wjg/4zfK6IIxFXprG3VUuxAaGC
	 SDnxyILS5AHGbqwUC7iC8948jrTjpaIXw1Mv5m2pADi6d7+aysqrdufqU0LP+m81RA
	 rmZm7QR+lO1q3BXqo6/hr++Mnt8qpZJSoW/noANqQAz+QRVtdl3ZBp8aig/sEtAopa
	 IlrBn1zWSHrXQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 shengjiu.wang@gmail.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1713165456-3494-1-git-send-email-shengjiu.wang@nxp.com>
References: <1713165456-3494-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl-asoc-card: add wm8904 codec support
Message-Id: <171326394076.1668526.17357841814427298563.b4-ty@kernel.org>
Date: Tue, 16 Apr 2024 19:39:00 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: ICC52RNCTZMJHQGWM7IR65RZVXAJBJWI
X-Message-ID-Hash: ICC52RNCTZMJHQGWM7IR65RZVXAJBJWI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ICC52RNCTZMJHQGWM7IR65RZVXAJBJWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 15 Apr 2024 15:17:34 +0800, Shengjiu Wang wrote:
> add wm8904 codec support in fsl-asoc-card.
> 
> Shengjiu Wang (2):
>   ASoC: fsl-asoc-card: add wm8904 codec support
>   ASoC: dt-bindings: fsl-asoc-card: Add compatbile string for wm8904
>     codec
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl-asoc-card: add wm8904 codec support
      commit: 51f67862ea6ea83f9fa4cda2e59d7bfd4387f63b
[2/2] ASoC: dt-bindings: fsl-asoc-card: Add compatbile string for wm8904 codec
      commit: 62c48dd33b4f2e037554d1322ae4f9f60e9461ef

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

