Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B8D913D32
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jun 2024 19:22:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C66209F6;
	Sun, 23 Jun 2024 19:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C66209F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719163357;
	bh=hqHsU/ytros7zlMhVXXRaDb8uWaZIiY2BwlJTdGlQi0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f5sPldadkSNQBG5tueGnyBc/+GZ0rKgIH4CZ9Mrvx84dTQMD9Bgju/cKYY11emH3W
	 fmE3tI0j+Vu2i11InuWSMdGqLfWpa1b/vUG95qP36LkowXAiziSNVyStZRWVk6W297
	 Jn8Y7bfyVKS9R+xYoj89ZV8XCZ68rTB3kLeLCCtQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49F98F805B2; Sun, 23 Jun 2024 19:22:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE7C1F805AE;
	Sun, 23 Jun 2024 19:22:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BF1EF804F2; Sun, 23 Jun 2024 19:21:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98F43F80154
	for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2024 19:21:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98F43F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RUDRwJn+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A1C562446;
	Sun, 23 Jun 2024 17:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84CB9C32786;
	Sun, 23 Jun 2024 17:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719163309;
	bh=hqHsU/ytros7zlMhVXXRaDb8uWaZIiY2BwlJTdGlQi0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RUDRwJn+ir7NGPEFmk3ra3S/+A1uMRkOSuavbEo0zJkzbZxXb1VAHprHB27Si7t51
	 L4R971MZWLsJJ6iUBzx2GujCIHLVjstNoboNvuaIGUzWBdZtFhWkRDPvVBhDk1EyGW
	 nf/FJXkq9+00ewfzo09PuoNRTRWkYOKx1T93cer79rlvuBkJyiKaUDrfgWgXDEZEcD
	 MLnW0NZNgGfEFS+s5npUEDR4oIMI3CA37tR0SBZfWi/b35wifp8x6MsbP2uLQyxXA2
	 H99H8s8RvcQEvf3MQ6C/jP0qF5yY5V8Z81JP8SPsZn0sTEi01hWcEwCmXFwaIlYlDl
	 h62TZT4NUxfLQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ricard Wanderlof <ricardw@axis.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@axis.com
In-Reply-To: <20240607-tlv320adc3xxx-micbias-gpo-v3-0-59dbec8b98f4@axis.com>
References: <20240607-tlv320adc3xxx-micbias-gpo-v3-0-59dbec8b98f4@axis.com>
Subject: Re: [PATCH v3 0/2] tlv320adc3xxx: Allow MICBIAS pins to be used as
 GPOs
Message-Id: <171916330513.350242.3221156381590082355.b4-ty@kernel.org>
Date: Sun, 23 Jun 2024 18:21:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: VWRO35TWZHZTNU44ILLVJNDA3XXP3EPK
X-Message-ID-Hash: VWRO35TWZHZTNU44ILLVJNDA3XXP3EPK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VWRO35TWZHZTNU44ILLVJNDA3XXP3EPK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 07 Jun 2024 17:22:03 +0200, Ricard Wanderlof wrote:
> In some cases, depending on system design, the MICBIAS pins on the
> chip are not needed as such, but a couple of extra GPIO pins would be
> useful. This patch allows the MICBIAS pins to be configured in the
> device tree as general purpose output pins, controlled via the GPIO
> framework.
> 
> Owing to their originally intended purpose there are some limitations:
> when the MICBIAS pins are deactivated, they will float, so will likely
> need a pulldown in many applications. When activated, they will
> assume the voltage specified by the micbias1-vg and micbias2-vg
> properties, respectively, meaning that the resulting output voltage
> will be 2.0 V, 2.5 V or AVDD .
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: tlv320adc3xxx: Add MICBIAS-as-GPO properties
      commit: 4e617f0cb2dd9675a3b2707c10d89f0f5303ad1e
[2/2] tlv320adc3xxx: Add support for using MICBIAS pins as GPO
      commit: 6c01001414ce477311d872c40e23dfec4866d608

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

