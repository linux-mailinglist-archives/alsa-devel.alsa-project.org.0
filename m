Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B29E9C1155
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2024 22:53:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9920F54;
	Thu,  7 Nov 2024 22:53:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9920F54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731016397;
	bh=pZlXXjMp+LvTEKn+ZGAIRGqWWu4Sh8kXSZp6RNBri/k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jyhCTzcXcM+ds8CyBKAN2AULgAN4rIgHx5ThbK43in0SFDLBGa7G6c8s5c1gidvbt
	 LXcH12I7iEL3fEBKGmTcyqNLXx3GSnna8rPYr1ZqJ7v6MtDjmHApDyCTaViyoboYRs
	 rsOyJpYpB118pjNdtR2XHP4IFe2RqKOpeVaBlz5w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C5F2F80588; Thu,  7 Nov 2024 22:52:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7683F805D9;
	Thu,  7 Nov 2024 22:52:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8456CF8013D; Thu,  7 Nov 2024 22:52:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4565F800C8
	for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2024 22:52:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4565F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G7l5vIRj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8FAE4A44525;
	Thu,  7 Nov 2024 21:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48144C4CED4;
	Thu,  7 Nov 2024 21:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731016341;
	bh=pZlXXjMp+LvTEKn+ZGAIRGqWWu4Sh8kXSZp6RNBri/k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G7l5vIRjpvvfawjV8GngNJYHsxSaBnDSrmFbDYm39RmmwQ94nBlmAElADp++6vAq3
	 /2EVs8wcf8gEWATrHFR7YO9UNnvBrSAut22PHLYdA05o/GEU1FHN7aGTf2fb0o06MH
	 RRKT4FyHQi8QutrNr2w/FMShT8KGOqdSOhssnbB2oHc4Q6XyO/GMFX2RlbMQLKbq9e
	 RL+hzz2omZsWrbWPQDRgEbkvDRbhADuFs6i81G4mm9kPegO46Uf5LeYUaLhUtkbEbj
	 1aaKIG6QqN5BnAJp6uRlpFMtxhSCDN6YSOjGfX1wWvMob+CJSoxcsget+hgEzbhfha
	 qW6+vVHXEfE8g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Kiseok Jo <kiseok.jo@irondevice.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241106005800.7520-1-kiseok.jo@irondevice.com>
References: <20241106005800.7520-1-kiseok.jo@irondevice.com>
Subject: Re: [PATCH RESEND v4 0/2] Add a driver for the Iron Device SMA1307
 Amp
Message-Id: <173101633902.271800.3646827162492611433.b4-ty@kernel.org>
Date: Thu, 07 Nov 2024 21:52:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: PVOWVRNHCPTRXWLH4G57HL7DO37VVP3W
X-Message-ID-Hash: PVOWVRNHCPTRXWLH4G57HL7DO37VVP3W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PVOWVRNHCPTRXWLH4G57HL7DO37VVP3W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 06 Nov 2024 09:57:58 +0900, Kiseok Jo wrote:
> This adds basic audio support for the Iron Device SMA1307 amplifier
> 
> Kiseok Jo (2):
>   ASoC: dt-bindings: irondevice,sma1307: Add initial DT
>   ASoC: sma1307: Add driver for Iron Device SMA1307
> 
> .../bindings/sound/irondevice,sma1307.yaml    |   53 +
>  sound/soc/codecs/Kconfig                      |   10 +
>  sound/soc/codecs/Makefile                     |    2 +
>  sound/soc/codecs/sma1307.c                    | 2052 +++++++++++++++++
>  sound/soc/codecs/sma1307.h                    |  444 ++++
>  5 files changed, 2561 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
>  create mode 100644 sound/soc/codecs/sma1307.c
>  create mode 100644 sound/soc/codecs/sma1307.h
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: irondevice,sma1307: Add initial DT
      commit: 82a1ccdf616d396c99f535febb6c997781c5c26c
[2/2] ASoC: sma1307: Add driver for Iron Device SMA1307
      commit: 576c57e6b4c1d734bcb7cc33dde9a99a9383b520

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

