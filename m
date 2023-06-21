Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA79D738737
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 16:38:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC026851;
	Wed, 21 Jun 2023 16:37:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC026851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687358290;
	bh=Qq2KHkcMJKRKaKjKmOwJn99Gn1sK4YSpy6al5GmhGps=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f1GQsfpEOqdbRxXeVGu0U8RNWF4fScsFoJVpgAhhd6hh8evbtIBa/vDrYxVNeCkoT
	 ENS4I34DO7O/DjeBYbQ99d9wM+yA7Yc23Z2vwwWNQN81jGRyQ6BD5SSCg4GYmRZYSz
	 2MmeSmRpowJWhVvj+ALyM2OPVO54BpXmh4DtFoMI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7C2CF80549; Wed, 21 Jun 2023 16:37:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9E88F80549;
	Wed, 21 Jun 2023 16:37:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42555F80553; Wed, 21 Jun 2023 16:37:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 483D4F80132
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 16:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 483D4F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Mco0oP7h
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F26161570;
	Wed, 21 Jun 2023 14:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB120C433C8;
	Wed, 21 Jun 2023 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687358226;
	bh=Qq2KHkcMJKRKaKjKmOwJn99Gn1sK4YSpy6al5GmhGps=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Mco0oP7hIYN5nOEGv1m+pjXJQf6U5ZskFQY94jgtjWzHGVX/Pr+OuVIGya7vKKky3
	 99PvIohOx1GpNymZ3myOYmG4HMt4jvK4aYz/3KfnedQbdeDoqTteQsNHnvrBg+mbyK
	 yhWkK14QjbuNLOuhGuJP4nYuTxdVPf4arPXMoa5cvvAptDLAnGYZlxpnLIF/ZAdpu/
	 C/6rZxgM07sv+dYRihDvtQL4vWL0uv5tjztbSfQlE6ghl07ZxRyltYYdQNfLbj+i55
	 D3MGRwpQ5n4p32SFc5U78+5bI9GWT/eJtm+7D88cD+11dsWOMdFQb1Xs6S8zIs3j7k
	 uTBFALAWMUC+g==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Patrick Lai <quic_plai@quicinc.com>
In-Reply-To: <20230616115751.392886-1-krzysztof.kozlowski@linaro.org>
References: <20230616115751.392886-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 1/2] ASoC: dt-bindings: qcom,wsa8840: Add WSA884x
 family of speakers
Message-Id: <168735822238.116117.14550188364140535964.b4-ty@kernel.org>
Date: Wed, 21 Jun 2023 15:37:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: T5D2HW5J44HCIQDJLAG3NMNPDSNIONYM
X-Message-ID-Hash: T5D2HW5J44HCIQDJLAG3NMNPDSNIONYM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5D2HW5J44HCIQDJLAG3NMNPDSNIONYM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 16 Jun 2023 13:57:50 +0200, Krzysztof Kozlowski wrote:
> Add binding for WSA8840/WSA8845/WSA8845H smart speaker amplifiers used
> in Qualcomm QRD8550 board with SM8550 SoC.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom,wsa8840: Add WSA884x family of speakers
      commit: 97ae6f4e5dd3bc7873ee70c864ab2ba2e8bff0c3
[2/2] ASoC: codecs: wsa884x: Add WSA884x family of speakers
      commit: aa21a7d4f68a0a5067578cbb93c136ab5ac09cfa

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

