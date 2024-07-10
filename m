Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A5192D782
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2024 19:33:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85B9982B;
	Wed, 10 Jul 2024 19:33:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85B9982B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720632822;
	bh=EiksLOAaR1h6v3xrh4/4fRtC36Iw+GB1jm/EDk0JfoA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oUNy86rXyI4/Pjwzq1RkcTO/Sb69ItKXbKkXrkq0fv2YVXWxGMkvORw2h62lyLM0p
	 CeeCl7DR3UaGZvxvR+V3BHn17CEY1SIMewljRkTaADNmAEnI3aLxRF0hcXQzNju5m3
	 arBv/oOIrhrAcX35UUUVGx/4lydiKQjvfYAnhmoc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFD6BF805B0; Wed, 10 Jul 2024 19:33:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 553BEF805AF;
	Wed, 10 Jul 2024 19:33:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECEE8F801F5; Wed, 10 Jul 2024 19:30:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E4F2F800FA
	for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2024 19:30:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E4F2F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eVQgOzk9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C4799CE0E38;
	Wed, 10 Jul 2024 17:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA00C32781;
	Wed, 10 Jul 2024 17:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720632632;
	bh=EiksLOAaR1h6v3xrh4/4fRtC36Iw+GB1jm/EDk0JfoA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=eVQgOzk9hfJedk1BA8ccP7L4Fram1XErnxU3vSVe+NDJyPRcG7+hXr0trNCw6ireR
	 Xa4eeIS64MlFSXeKANSJ0HORIp+XFgG1dRYW96cRzfkwhtRIXpIGeJJEx5ZmpAVx2W
	 ndSzyS2kF4CWVFfWv4XMU99pofXcehJrNb9q523FQArPhJnKwhkTF10FOHXlYKZnHD
	 PTdHo2xiGUBeCATAoT1FSNiDE9OqjwKep2+1xZDOuPfE3+zVfs8sOEhEO48Kk+KMdl
	 z2TaacVQanJXWaFQED2P31RqCXASZKxcjX10vuI6HoFcaOD+i8BFkXW0II5JdBMO6L
	 6SpmBKXoVceaQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240701171917.596173-1-krzysztof.kozlowski@linaro.org>
References: <20240701171917.596173-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs: aw88395: Simplify with cleanup.h
Message-Id: <172063262990.22653.3673550348945714885.b4-ty@kernel.org>
Date: Wed, 10 Jul 2024 18:30:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: GN4MLSKC27Z3DVPHNG44X3CNBAQTH4MK
X-Message-ID-Hash: GN4MLSKC27Z3DVPHNG44X3CNBAQTH4MK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GN4MLSKC27Z3DVPHNG44X3CNBAQTH4MK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 Jul 2024 19:19:16 +0200, Krzysztof Kozlowski wrote:
> Allocate memory, which is being freed at end of the scope, with
> scoped/cleanup.h to reduce number of error paths and make code a bit
> simpler.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: aw88395: Simplify with cleanup.h
      commit: d0f4ce8a28dd992579949b8ea2df810c4b5fe9b5
[2/2] ASoC: qcom: topology: Simplify with cleanup.h
      commit: a8915e2fe86c29304a3038f269f4667b371b87d2

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

