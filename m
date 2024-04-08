Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF81089CA7F
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 19:12:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FF2A2341;
	Mon,  8 Apr 2024 19:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FF2A2341
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712596321;
	bh=3u24Gp54KTkQPBz1rIbYby/tHKVAqzkP2OKqWiCDgbI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DO8lQraqCHd0f2X/X1HXbHnRsgAc6n2GurBH8cl6TyMJMkx6pIiwa0O64tlrnIqNp
	 xgc4MpTiPxdQTGGX7azFcD6knR1fE05MUyFChnaPg8YZN/goZ9fE3uADhy+qFQzDyW
	 6xc36VGdxAnGDKfEemwO1/Uon68g4R/L0uWN4g5c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80023F805A0; Mon,  8 Apr 2024 19:11:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 359CBF8058C;
	Mon,  8 Apr 2024 19:11:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D560DF8026D; Mon,  8 Apr 2024 19:11:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E85A5F800C9
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 19:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E85A5F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NwGn9HL/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C3CBFCE18C0;
	Mon,  8 Apr 2024 17:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB1FC433C7;
	Mon,  8 Apr 2024 17:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712596274;
	bh=3u24Gp54KTkQPBz1rIbYby/tHKVAqzkP2OKqWiCDgbI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NwGn9HL/eGZJSbGzjzJd5AVMdstkb/GKuAen56ijpgCscqDqNRO6j/7L1c9SiAxjg
	 YUKAhQ2hEVO2fBWtJ7C8ZpG6Mi2d2/XV7TKxvkFNYPH2DQlZExD7vPOFJuB93YRfx6
	 mkOxtgJldkxsI93d4QJId1nNeEOwMLyN5wtf4197Cv56FAB89KDTLkjpKYQ5XovRye
	 NPT6YLEpGThCr01s9b0MiQJwwaKda02V6ZnGZEBbZ/i+mnSEIkthRg+Kh5rY98Y4cA
	 JW4M8xpXJDKGWpZHyhg8CR1WBKBmRFYEPEcgTiVvhEKZcynAN9ZrzeGRfU41en7w7c
	 6P/1L8Ka3kTRQ==
From: Mark Brown <broonie@kernel.org>
To: Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240406141454.45529-1-animeshagarwal28@gmail.com>
References: <20240406141454.45529-1-animeshagarwal28@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: ti,pcm1681: Convert to dtschema
Message-Id: <171259627163.102594.17933281575225480570.b4-ty@kernel.org>
Date: Mon, 08 Apr 2024 18:11:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: W34TWLPKQG4VSG5N5OPWKS4WPSJQLW2U
X-Message-ID-Hash: W34TWLPKQG4VSG5N5OPWKS4WPSJQLW2U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W34TWLPKQG4VSG5N5OPWKS4WPSJQLW2U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 06 Apr 2024 19:44:49 +0530, Animesh Agarwal wrote:
> Convert the Texas Instruments PCM1681 bindings to DT schema.
> Make bindings complete by adding #sound-dai-cells.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: ti,pcm1681: Convert to dtschema
      commit: 8167bd1c8a45c289316417cf938bcd8ceec24fd5

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

