Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A170873669
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 13:31:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C045F86F;
	Wed,  6 Mar 2024 13:31:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C045F86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709728274;
	bh=ACUqgCjJo7JEYLM2xMAXxnYe+kdtRCNrTmewwyMHvIo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gugd7nho/JwJIYo1MKF7ad53ZmwHZLyEfbBhA2K2Yk/KaPrK69IGGNF00X1CSWNvD
	 DDZcEy4DIrrLaa4+G/bNIOlYZ1aXP0EgLshTmbtItQf6sAQKItq4dVAhGHG9nvYcLk
	 UL59ZO379tOpSsEgw7PFHXGV32Pc+joA0qzRJZ0k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEB1FF80589; Wed,  6 Mar 2024 13:30:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DC3FF80563;
	Wed,  6 Mar 2024 13:30:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9AA3F802E8; Wed,  6 Mar 2024 13:30:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77C65F8014B
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 13:30:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77C65F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AbKfW3Kw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EE237CE1F0B;
	Wed,  6 Mar 2024 12:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC44CC433C7;
	Wed,  6 Mar 2024 12:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709728225;
	bh=ACUqgCjJo7JEYLM2xMAXxnYe+kdtRCNrTmewwyMHvIo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AbKfW3KwXVau1tZKRtk4dTZqLMIni8jAZU6sSVyyD5lvbvbdSuJxNSWpZxFL3CT5l
	 XjjrA8Oy6r2VEHOuF8oYS4K3h043WAbSh+3cs90AC4NuljJHavAwhqWSD2+Zea7+Ei
	 +1ukRKSLTe4eeyzs6WDVByizOhxlWy16HmuMOb1U6TlHk+VKKJFU8XzPLEPRsIX0eR
	 0S8LzPcfgcOe3GwW7+sKpcCRmELmV0p9ktkZctM1nptGbZPryszHWHhq7jmvPFehwN
	 xz4AvGc3tTle2VILWYwcMd82nHSKI3uxmItLtBHdrV6agzbQMS/w1enUALVBH/J1Ok
	 QqBeMwChC5BHQ==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Javier_Garc=C3=ADa?= <javier.gar.tab@gmail.com>
Cc: daniel.baluta@nxp.com, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240304142315.14522-1-javier.gar.tab@gmail.com>
References: <20240304142315.14522-1-javier.gar.tab@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: rt1015: Convert to dtschema
Message-Id: <170972822252.17598.17751393697250368989.b4-ty@kernel.org>
Date: Wed, 06 Mar 2024 12:30:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: J6IUCLNLWBSJDAM7TN5VVK7TZE673WI2
X-Message-ID-Hash: J6IUCLNLWBSJDAM7TN5VVK7TZE673WI2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J6IUCLNLWBSJDAM7TN5VVK7TZE673WI2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Mar 2024 15:23:07 +0100, Javier García wrote:
> Convert the RT1015 Mono Class D Audio Amplifier to DT schema.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: rt1015: Convert to dtschema
      commit: 2ca703302a7f9dccdfb69f5a385f7828288b42e3

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

