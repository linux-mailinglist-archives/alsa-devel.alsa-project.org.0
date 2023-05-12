Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8023A6FFFA4
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 06:20:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0185AA4E;
	Fri, 12 May 2023 06:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0185AA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683865220;
	bh=ZT00TaH5yteNvbFSoG2NguTfXRoQzCVVxtPo3JI7BwE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BY5LMacoqC1cUuFc0QiuP37fcCG5UhaixFD6LIH0JtF9qMVE3lADyHQbSN7doLTpA
	 p+Kg8AAXov2JoaO74Ks+ZyjSJLkZTvaVfN6RAI3K+rZ4aHAZCpECzuaGLsFZuZv56w
	 +eoYAQLiPd5P29vrl8xpIoGU6OIq7JAPpeIjWLTI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CBBBF8053D; Fri, 12 May 2023 06:19:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AABF5F8052E;
	Fri, 12 May 2023 06:19:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A68E1F80534; Fri, 12 May 2023 06:19:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB19DF802E8
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 06:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB19DF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=llZ894fP
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D3FAA61445;
	Fri, 12 May 2023 04:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A23BC433D2;
	Fri, 12 May 2023 04:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683865150;
	bh=ZT00TaH5yteNvbFSoG2NguTfXRoQzCVVxtPo3JI7BwE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=llZ894fPQJSmNuAdgy6nOUD0+GNdRpSNw4b9nCxygq5PUYM1Q2BrpcMdqyMFwkfPS
	 n5Bn1whiNTzkrBmAdKLh7HVdThggtiV9BpyKUS9Yj6Gix0aIMyBWHyRPRrb667moIu
	 Gy47XtFDddUOKNt65TnA2xxyc5ePFxXE3njzMYXjc1oy5+lP1ua+6QzQ7U1ISbqECU
	 vr2j0qfn1eCmopN8cqgEBndDMW3mk7TqUJnlgDT/zjQbZYKGl2nEB8gE8rpCNSbB3Q
	 B+EROqJHEt5R9bq4mi8tDFn2tib8WZLlkGALZKoTT5t+rGLICuJWi/l8hEceUVmOnt
	 xOMQb08LHDDDg==
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
In-Reply-To: <20230511113607.595184-1-CTLIN0@nuvoton.com>
References: <20230511113607.595184-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: nau8825: Convert to dtschema
Message-Id: <168386514706.352974.7432872441818177751.b4-ty@kernel.org>
Date: Fri, 12 May 2023 13:19:07 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 3Q54IWAAAOMRSEMJRKJPB65ILZZCAKOK
X-Message-ID-Hash: 3Q54IWAAAOMRSEMJRKJPB65ILZZCAKOK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3Q54IWAAAOMRSEMJRKJPB65ILZZCAKOK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 11 May 2023 19:36:08 +0800, David Lin wrote:
> Convert the NAU8825 audio CODEC bindings to DT schema.
> 
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> 
> Changes:
> V3 -> V4:
>   - remove the description from interrupts, clocks and clock-names properites
>   - add sound-dai-cells property and update the dts example
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: nau8825: Convert to dtschema
      commit: 35bccf467cefc5ff9c71f10def6279bb974fcd99

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

