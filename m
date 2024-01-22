Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FF98375A3
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 22:55:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6B87A4B;
	Mon, 22 Jan 2024 22:54:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6B87A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705960502;
	bh=BRieAgJwMkt/iTyWFI9nEq4QZqxLiCR6cBex9CyHfOQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NFBsA1bRtsfJzACjseogEvOpW3b9fBwmzuLCOMYRQh5gZXiU3dLYm7sx8hM1NJoPD
	 HAz/FQYmn3ItCc+7BW4XgPji6rX/NDfpIFo/eVZ+olS3IE8y0IJ5UWgLQ6TEFMQR66
	 FERdugduEoxtiUN5lhSWrPoSHgBe9VsMsX2HXS3U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7B0AF805BF; Mon, 22 Jan 2024 22:54:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C618EF8057E;
	Mon, 22 Jan 2024 22:54:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05FC2F802E8; Mon, 22 Jan 2024 22:54:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD276F8025F
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 22:54:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD276F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mFMxYfJE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A504ECE2D36;
	Mon, 22 Jan 2024 21:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2FAC433C7;
	Mon, 22 Jan 2024 21:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705960452;
	bh=BRieAgJwMkt/iTyWFI9nEq4QZqxLiCR6cBex9CyHfOQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mFMxYfJELjYH5Dlj+tft8baT0xvFrRJVwfz0ukzOX3pvbKCTV28CI3Ol5niEYon+A
	 gKyGCuhxwmoHa/Jtmb9+Bns5pfwI4YHmHwSy6K0IeeQaGDqAXo2Mv7oLdgBl7hGYjH
	 fqfeWZxyk0Tg9H4kPNFc3NOiP9rUww4f1R2zURmeEmR98yufIF+/nB6bHIhrwZfYuo
	 0yQ9N4FwpENh0C3wQ51rm2/aE2bCcpd8Pv1flgmhz3RPtenVJ1Gl2Yo5aNVYYlECIo
	 12nhCRM+cpkGCVnFaRIALO3DJsenrFTM6SrSK1/GRNncxXbD3p4FTLR3VkHP73eAiW
	 cau/apoTscqUw==
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240119112420.7446-1-johan+linaro@kernel.org>
References: <20240119112420.7446-1-johan+linaro@kernel.org>
Subject: Re: [PATCH v4 0/4] ASoC: qcom: volume fixes and codec cleanups
Message-Id: <170596045016.161959.16318695944363636291.b4-ty@kernel.org>
Date: Mon, 22 Jan 2024 21:54:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: XD23ZDWYHUXLNQU5RQJN2LBWYSZKUE5Y
X-Message-ID-Hash: XD23ZDWYHUXLNQU5RQJN2LBWYSZKUE5Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XD23ZDWYHUXLNQU5RQJN2LBWYSZKUE5Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 Jan 2024 12:24:16 +0100, Johan Hovold wrote:
> To reduce the risk of speaker damage the PA gain needs to be limited on
> machines like the Lenovo Thinkpad X13s until we have active speaker
> protection in place.
> 
> Limit the gain to the current default setting provided by the UCM
> configuration which most user have so far been using (due to a bug in
> the configuration files which prevented hardware volume control [1]).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: codecs: wsa883x: fix PA volume control
      (no commit info)
[2/4] ASoC: qcom: sc8280xp: limit speaker volumes
      commit: c481016bb4f8a9c059c39ac06e7b65e233a61f6a
[3/4] ASoC: codecs: lpass-wsa-macro: fix compander volume hack
      (no commit info)
[4/4] ASoC: codecs: wcd9335: drop unused gain hack remnant
      (no commit info)

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

