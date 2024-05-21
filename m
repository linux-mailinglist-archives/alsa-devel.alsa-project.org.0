Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 863698CB0AB
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 16:46:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2A6084D;
	Tue, 21 May 2024 16:45:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2A6084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716302761;
	bh=tNZZ7UbqGFi99eQF7zZneciQh6sIOV77HiXIpo+ovP4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=evu7VH8TKIJAHLmeXVCNe8cJU57g8JbgjgxMV6lemPONw/MmiTuza8OXwojmPDT8I
	 KuHEvTYjf+BEu3NWyZ62XUYhdAK6FstGGh0w6ytepZ7LflvN5zWwh2dGzGkaM9HO9b
	 FXrbMIUnaK/bKiy9WV0TzS9hCaqO7yJdjXXdTzSM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C308F8028B; Tue, 21 May 2024 16:45:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFD99F80589;
	Tue, 21 May 2024 16:45:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2EB1F8026A; Tue, 21 May 2024 16:45:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B56CF800BA
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 16:45:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B56CF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gnk7g0ab
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 72A4DCE0FF1;
	Tue, 21 May 2024 14:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE386C32786;
	Tue, 21 May 2024 14:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716302705;
	bh=tNZZ7UbqGFi99eQF7zZneciQh6sIOV77HiXIpo+ovP4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gnk7g0abzwCR7AADNUdIueOb9ERBfsgKWSi8Feu47T7UxVxXWRVAaqQ2oVZ2R+Kj6
	 caude00KUsLhOgZzjkgssfQRrdL7G71XxZpV5NApfb4+cY5zItiJxeHosXcOf5oV5c
	 /kvVoxJXRJ3jdnH6EMrsIVfEfdsqeM0Z0K/BfaFLweLPbb9/2xFZ3UCtSDTL7Jn+7q
	 ksYmdgiPG6+DRdp73WUOGuYXYXyxzJhR8su7p37JxnOGAYS+O6CWf7w+mW/qka3eQf
	 ILHRaRYBg6QQSWdp7S9N9Lxks8nMFWbliGBVbLdlhUxDEzFe25Fvygd16ZopMSBkJA
	 O5ZkWAxEG0vxg==
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240520222705.1742367-1-robh@kernel.org>
References: <20240520222705.1742367-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: stm32: Ensure compatible pattern
 matches whole string
Message-Id: <171630270256.58467.9560399752329823941.b4-ty@kernel.org>
Date: Tue, 21 May 2024 15:45:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-621fa
Message-ID-Hash: XH7U2NFF7BY7KGPITU2V5KB2YRICQD4N
X-Message-ID-Hash: XH7U2NFF7BY7KGPITU2V5KB2YRICQD4N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XH7U2NFF7BY7KGPITU2V5KB2YRICQD4N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 20 May 2024 17:27:05 -0500, Rob Herring (Arm) wrote:
> The compatible pattern "st,stm32-sai-sub-[ab]" is missing starting and
> ending anchors, so any prefix and/or suffix would still be valid.
> 
> This also fixes a warning on the example:
> 
> Documentation/devicetree/bindings/sound/st,stm32-sai.example.dtb: /example-0/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: stm32: Ensure compatible pattern matches whole string
      commit: 737ce4fb96206f999ddea7530145fc0e8abd5d31

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

