Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1512A694C50
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 17:19:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A56E884B;
	Mon, 13 Feb 2023 17:18:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A56E884B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676305182;
	bh=jTHm/4ykwEJ9eDqHDCB2uHcKXEGZgh285sd6r6Jztq4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=eGNdkf6PHdIvNNLXSZOcXaDdnB3RufDsZ9PXENxXe6CFmpBBKz/xA3Qtb3iAmkD7B
	 SvDq2Tk39szsv/o+ejmqz/3BtOClbuq/8pGKnqvaoOQH1XJZuMiwNbzAcehb5LbNXY
	 767yr0GgZqJVjCb0Hir25O/mzv8fPNWle0ZXux6c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FEFEF804B4;
	Mon, 13 Feb 2023 17:18:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3F0AF804D6; Mon, 13 Feb 2023 17:18:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23D0DF800B0
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 17:18:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23D0DF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=X58wAKg8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD48960F66;
	Mon, 13 Feb 2023 16:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9130C433D2;
	Mon, 13 Feb 2023 16:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676305121;
	bh=jTHm/4ykwEJ9eDqHDCB2uHcKXEGZgh285sd6r6Jztq4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=X58wAKg88Hma4ARlnmkcyNvFHTWSaJTuMAh8/AY0nzXznGtDhS20ws2Q/1Mqn0KxY
	 ANgnl6UZ5Z1FXP6PNu6244hRGRb2zkwI9ezlxu2DIhB3jAypgBzboPO9kl6lQLKYNQ
	 BHB2hG9omkOk6YDSmbsYqAiI6bZOzGidm/s3Y6fhbx3rj5DnNG0MnYrbaSl8BOhk+G
	 tHPwLG3nqxecULze/Zw4QzGF0hx5i5pNOBpfVusj6v4KkrDhIMKGCr5CGdVXwR+QUw
	 RA5KzNqrnnv+X0Zd4TRPaeRS0MY/CJK7xH3ErkadJ/LdnhtW9KXwBm0whDnO5n1x/V
	 RNCLJOBnfacTw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230211134755.86061-1-krzysztof.kozlowski@linaro.org>
References: <20230211134755.86061-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: maxim,max98095: Convert to dtschema
Message-Id: <167630511939.2770751.18419134199965979310.b4-ty@kernel.org>
Date: Mon, 13 Feb 2023 16:18:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: XGCY7SGQ7NFVNN6IDAXJC546ALBY3XNU
X-Message-ID-Hash: XGCY7SGQ7NFVNN6IDAXJC546ALBY3XNU
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGCY7SGQ7NFVNN6IDAXJC546ALBY3XNU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 11 Feb 2023 14:47:55 +0100, Krzysztof Kozlowski wrote:
> Convert the Maxim Integrated MAX98095 audio codec bindings to DT schema.
> Add missing sound-dai-cells during conversion.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: maxim,max98095: Convert to dtschema
      commit: 46f5c98e158449a1ddbf9b22e046810184c92d43

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

