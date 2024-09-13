Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF9E978550
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 18:00:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A41CDEC;
	Fri, 13 Sep 2024 18:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A41CDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726243219;
	bh=2THK3Qa5hpEcl3liEPlYzjlcVVBqTpMJPQbdU/7/h9U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gIIF6mnItL+Swp5vzKGj+N/4ECY/b+pektZgswtTfef5XE1aITnFHO6Y3nCTpOc7v
	 oMfjsIhJjPNJ9fpcv9feXGi2VK5uLxyNNXR7eumR6rr6zj3Qjb+9yF44si5qYZ3Jv0
	 ue5NmlBRHjOjRaRus+6MFAWSuvwKq1gva7gBjzGM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A850F805AE; Fri, 13 Sep 2024 17:59:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A373F805B1;
	Fri, 13 Sep 2024 17:59:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33B0FF801F5; Fri, 13 Sep 2024 17:59:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4755CF80074
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 17:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4755CF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AnObwBVf
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 70CDE5C014B;
	Fri, 13 Sep 2024 15:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70384C4CEC7;
	Fri, 13 Sep 2024 15:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726243175;
	bh=2THK3Qa5hpEcl3liEPlYzjlcVVBqTpMJPQbdU/7/h9U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AnObwBVflScon9QfWYEcU32GDZMJ/dBFoVVdVeTuCUEe5Q+wc0fft7Z8BToDIrAXc
	 JQCl0rYbrZAmjZElmSKpq2icTT1ELjl4ilB/O+K8yc8CO7Ce0DFPZPiYHuhFgX518Y
	 GsYLNttJWk0A25LjyxO0/9nNo7aRWhZHRR0TnouG9z9HDeTFiNWvA+Faok6rE37s1s
	 LvgqZ3G35/yltWXmiwzZpe1F1vJUz5gL3XL9A7IAeAc3k3s1cG0zTJ936Wa/ISalmY
	 mIiS6FomPAwVYA7XMHe+J+7cQ5NP6QAdkkxUkD72tfeGxrc8XRG2EdZsFp5aYdbdgf
	 GDCZcA9W+3A8w==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 Andrei Simion <andrei.simion@microchip.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
In-Reply-To: <20240913120621.79088-1-andrei.simion@microchip.com>
References: <20240913120621.79088-1-andrei.simion@microchip.com>
Subject: Re: [PATCH v2] ASoC: atmel: mchp-pdmc: Retain Non-Runtime Controls
Message-Id: <172624317318.45716.11241819837265266294.b4-ty@kernel.org>
Date: Fri, 13 Sep 2024 16:59:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: D6JJCS4J4QYNC7QV7CWVJJROD7CIRGHU
X-Message-ID-Hash: D6JJCS4J4QYNC7QV7CWVJJROD7CIRGHU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D6JJCS4J4QYNC7QV7CWVJJROD7CIRGHU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 13 Sep 2024 15:06:22 +0300, Andrei Simion wrote:
> Avoid removing these controls, as doing so can cause issues if the stream
> is initiated from another control. Ensure these controls remain intact when
> the stream is started or finished. Instead of removing them, return an
> -EBUSY error code to indicate that the controller is busy, especially when
> the audio filter and the SINC filter are in use.
> 
> [andrei.simion@microchip.com: Reword the commit title and the commit
> message. Replace spinlock and busy variable with atomic_t busy_stream.]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel: mchp-pdmc: Retain Non-Runtime Controls
      commit: 2ed1a4a5c0058dfd78f5037576d668a37d0ec609

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

