Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B80D17A95C3
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 18:33:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F319E87;
	Thu, 21 Sep 2023 18:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F319E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695314015;
	bh=4TOdbF8l/304dwcAhwcVC0kD2LlC74WELZJDqevjAtg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y9H80fzTc4AyE+ih1/UONNbXsbtLKKlmFzLYThjENXOrvehztuDttXn3glcZVffpI
	 JX6BZHQph5KS//Cfb8KQlrEKGk7d4MLiSRvLlc04k8/VnWldAsMRdgZLpFQHtQ+CB2
	 iht7OlEv/Pa1f+GqfalW8C/AX5R9cVfY+I9Kwrxc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6655F805F5; Thu, 21 Sep 2023 18:30:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB135F80589;
	Thu, 21 Sep 2023 18:30:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB943F805B5; Thu, 21 Sep 2023 18:30:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A277F805A0
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 18:30:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A277F805A0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pzKP40uM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8058861F32;
	Thu, 21 Sep 2023 16:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74599C611A7;
	Thu, 21 Sep 2023 16:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695313824;
	bh=4TOdbF8l/304dwcAhwcVC0kD2LlC74WELZJDqevjAtg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pzKP40uMk2PnSGVC37hBO3pBIvqSKE5VxA+srEht945WhaPp6sxt5vNQ+nYzj+efD
	 Kzw4a4qE7Y2yHXvBO2ucniyFThULlU2oGtlf98WfizKhXqVkMG7ZAR2NSJOr5kdqqv
	 EOGbLt+2XB9B0Pz9d5F06wuyE9aV49etx8WyBiJxusavudthHQf20KZL+FV15NJAWQ
	 UPcnNm6GuuSU9gKhk5czAMcK9VCyCt5QQjb6m9uEZfVOTSt/YOEeLWP0thkgkdLpDl
	 UhO7izP1Yh2vVtGMCbLH+uVcgeUqD77MJkPHEqORoYA/9h3FCAN7Bn4NSQli0jnkON
	 JBnRw9Y6jYI2g==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20230919103116.580305-1-ckeepax@opensource.cirrus.com>
References: <20230919103116.580305-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/5] Minor default jack pop performance updates
Message-Id: <169531382312.61074.2547458325115379067.b4-ty@kernel.org>
Date: Thu, 21 Sep 2023 17:30:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: 3MUFFKGIZ7C26ZPENMZHOBQ7LZW4TE2L
X-Message-ID-Hash: 3MUFFKGIZ7C26ZPENMZHOBQ7LZW4TE2L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3MUFFKGIZ7C26ZPENMZHOBQ7LZW4TE2L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Sep 2023 11:31:11 +0100, Charles Keepax wrote:
> Some small updates to the driver defaults to ensure a good pop
> performance on jack insert and removal.
> 
> Thanks,
> Charles
> 
> Charles Keepax (5):
>   dt-bindings: ASoC: cirrus,cs42l43: Update a couple of default values
>   ASoC: cs42l43: Lower default type detect time
>   ASoC: cs42l43: Enable bias sense by default
>   ASoC: cs42l43: Move headset bias sense enable earlier in process
>   ASoC: cs42l43: Extend timeout on bias sense timeout
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] dt-bindings: ASoC: cirrus,cs42l43: Update a couple of default values
      commit: aa7627111c689f9dc2458c7dd9c1fbb554502664
[2/5] ASoC: cs42l43: Lower default type detect time
      commit: 686b8f711b990d895d39dee3fab88861917d2dc4
[3/5] ASoC: cs42l43: Enable bias sense by default
      commit: 9c0ccc9f8e3be79ab44f5f8034ef90c367caf06f
[4/5] ASoC: cs42l43: Move headset bias sense enable earlier in process
      commit: 1e4ce0d5c023e8d8663f6b79b98b9f8026776127
[5/5] ASoC: cs42l43: Extend timeout on bias sense timeout
      commit: 6388a0619c83625214e98377c32bcefa4fffb9cd

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

