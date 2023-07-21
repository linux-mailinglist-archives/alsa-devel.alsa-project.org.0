Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3198975C08E
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 09:57:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ECC31EF;
	Fri, 21 Jul 2023 09:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ECC31EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689926223;
	bh=W/RkNM0LA5FIGb1qUz9Yr77W0ObcTph4orlH2jwmqyY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lLAIyNazBx9HA8KhyHYi41YJ9xJn0ekJedAaAlRie0U6l7bUHrz7MKEmiMkgp9NuN
	 dSusUjG2XqO0rM54dIprLBruS62sgztrYdqwSmQuRrluPS3asiaAFhj/1vtEO2KVK5
	 6QvP5it/jVEAUux+LM18e9Wmjf0IH6DHnWxVHk8A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0756BF804DA; Fri, 21 Jul 2023 09:56:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C334F8032D;
	Fri, 21 Jul 2023 09:56:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66181F80494; Fri, 21 Jul 2023 09:56:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E24DDF8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 09:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E24DDF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=e+57HDZH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 789A16157A;
	Fri, 21 Jul 2023 07:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD3DC433CB;
	Fri, 21 Jul 2023 07:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689926154;
	bh=W/RkNM0LA5FIGb1qUz9Yr77W0ObcTph4orlH2jwmqyY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e+57HDZHTD0q/GUnjCakwBVBoc+qFkkhXjO3myoKj8mt7VlEBpr9veGJJlqhtofYN
	 XXs3rdUG5Xy1EHVmlcSlCkVGihhAoOitrpKUDcaxJyYxkm0EhtmHKgL4KYnbFCHvCz
	 bMhhDAJ5E1GCToR+vFk0vHL99MPim78UiOvv2Evt/FwRtDhd8xRjfl3gijXBA3b4mn
	 vUZjAXPshYhaWLWl49u6IsZmhMnDjnrk6MoH4WN5UipTsX7WmXd5RSCny7arzN4429
	 TBsm4TuZ1cANfF+00lhIH5cQ1ZGSxtkqL035SfvTvnW3Bnk1ZAUWUtPNXqJFqIB6V1
	 zVeBLZfaVOwfQ==
From: Lee Jones <lee@kernel.org>
To: broonie@kernel.org, lee@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linus.walleij@linaro.org, vkoul@kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: robh+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230619095623.1987742-5-ckeepax@opensource.cirrus.com>
References: <20230619095623.1987742-1-ckeepax@opensource.cirrus.com>
 <20230619095623.1987742-5-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v5 4/6] pinctrl: cs42l43: Add support for the
 cs42l43
Message-Id: <168992615117.1924396.3669045288825154363.b4-ty@kernel.org>
Date: Fri, 21 Jul 2023 08:55:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
Message-ID-Hash: JU3KHJVJKY3CNLQ2IAZESNRQDHVUHJ3G
X-Message-ID-Hash: JU3KHJVJKY3CNLQ2IAZESNRQDHVUHJ3G
X-MailFrom: lee@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JU3KHJVJKY3CNLQ2IAZESNRQDHVUHJ3G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 19 Jun 2023 10:56:21 +0100, Charles Keepax wrote:
> The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
> (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
> for portable applications. It provides a high dynamic range, stereo
> DAC for headphone output, two integrated Class D amplifiers for
> loudspeakers, and two ADCs for wired headset microphone input or
> stereo line input. PDM inputs are provided for digital microphones.
> 
> [...]

Applied, thanks!

[4/6] pinctrl: cs42l43: Add support for the cs42l43
      commit: 85f034dd7ff0a66aded653cc91dbc406fba7cf1a

--
Lee Jones [李琼斯]

