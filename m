Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8B4853301
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 15:23:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ABBD74C;
	Tue, 13 Feb 2024 15:23:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ABBD74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707834219;
	bh=MLO0eNfubsVaZ3+NJ0NwxvzUo8z9vzkOQ/E+hy/RX9w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=lNlOOzwkEdn7XywzvjO+bceipAmniHVZqumYlVdVyhYGwzRv9/XBY6KtIRjaGk5rJ
	 taTA+B3iOk81clmO/loLolyr/DwPGHS+gLMj/VBNkMMdywJu2uROpvEhFI4Zfw+JHF
	 0VCTToV8oGcjI8Erp524PjABJjHMeXBDpwhyT4+M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC28DF805D4; Tue, 13 Feb 2024 15:22:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E44EF805CA;
	Tue, 13 Feb 2024 15:22:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16B67F80238; Tue, 13 Feb 2024 15:22:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4D7FF8016E
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 15:22:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4D7FF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tDoOvZka
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8FC18CE1BD8;
	Tue, 13 Feb 2024 14:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46611C43394;
	Tue, 13 Feb 2024 14:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707834152;
	bh=MLO0eNfubsVaZ3+NJ0NwxvzUo8z9vzkOQ/E+hy/RX9w=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=tDoOvZkavXJ2LFx03CzHfgMW3Swnt/rBeFpIem9eB9Wjdx7m6xxbT3fANKkR+s29z
	 AgKNEYnIeSYsr0s5FO4i8NZ3soCnTCJpi6hhnbFQdTdx3mDr1yl6qsnbJAwBpDNP0M
	 CLmDu+EHr4kaKnyIa2Qou3RcGN0AZgyLffQFOH7jmmp3L5ikOQRadHHRStZ/WKQ3QN
	 x32j1JePN9+bi31ZgnbhtBDixZ2E9UXSDgxo12PZl2i/qD88mgcYi4fh+2xm5n8CPQ
	 GX8GzZgXnVkRiC887oe2EJqjb7jEURzlbgnVdymRwlBhIG8w9edDnSRHmb0UGMvk9/
	 dQMHnV0uJDW3w==
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240212183800.243017-1-krzysztof.kozlowski@linaro.org>
References: <20240212183800.243017-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,sm8250: Allow up to 8 codec
 DAIs
Message-Id: <170783415002.38232.15876437530916950935.b4-ty@kernel.org>
Date: Tue, 13 Feb 2024 14:22:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: GCOXXFDEM45AAJOBAUQQJRBG4GQGP4TP
X-Message-ID-Hash: GCOXXFDEM45AAJOBAUQQJRBG4GQGP4TP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GCOXXFDEM45AAJOBAUQQJRBG4GQGP4TP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 12 Feb 2024 19:38:00 +0100, Krzysztof Kozlowski wrote:
> Sound card on Qualcomm X1E80100 CRD board has eight DAIs in one DAI
> link (for WSA speakers).  Boards with older SoCs could technically have
> similar setup, even if it was not observed on mainlined devices.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: qcom,sm8250: Allow up to 8 codec DAIs
      commit: d4a00d16f8367e09e8b8fb03028f22333fc368a5

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

