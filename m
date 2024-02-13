Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6318532FD
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 15:23:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E29D3B70;
	Tue, 13 Feb 2024 15:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E29D3B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707834198;
	bh=yqTyD/OjND337wp33t22PMtWJVzfs0J8AnORHF+7GG4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g3IWuazULLoa9Q1lls98+GaCH2LKCIesURXTUiTSMqJUgT0U8c51SxbpXS1YVkOYn
	 ynzaFd5TiEsr+Zs6HfH6Bfb3CVkWvSLEgKSJ9eI8WMlzxaQif9BZA0k5rZ7OGe/A05
	 mQ0qPIuyHa4AZ/o6U9m9JOJtyf7Q91oMxHiwS6YY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BD09F80579; Tue, 13 Feb 2024 15:22:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F267F8059F;
	Tue, 13 Feb 2024 15:22:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFEE2F8025A; Tue, 13 Feb 2024 15:22:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C330F80104
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 15:22:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C330F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=j26fZM4J
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B4FD613F9;
	Tue, 13 Feb 2024 14:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8057CC433C7;
	Tue, 13 Feb 2024 14:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707834149;
	bh=yqTyD/OjND337wp33t22PMtWJVzfs0J8AnORHF+7GG4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=j26fZM4JKyiZxhBok+sG84VvBt/MqBNn/AAUNCtYmbLqbII24bzx0mocMC/hifs26
	 MymKA4NA/GocKd74u3tAEK7Wo9LnGSc2NrCM5ikCaVbclHgMJYLXvK2yEfhVsqzKvV
	 0GDasPHFiXxHI9hYg2qlI2S85z6a82kZaKQKII1EvxtfTNoCMlNpv94hCVRoRhR12s
	 rxpE6evzJqiHsg9zZMDsGEefXZBAOQCeyIqtWGm5GzikcW8lRXVH9ncgTgcJECZCaE
	 PlamdIcJGZCTw1yV7lpCJ9+xs3FYwhkz1wGjrQklAGjP6wYJef1s6Yxq9rkzHWHsdy
	 B+jkLkhJftv4A==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org
In-Reply-To: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
References: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
Subject: Re: (subset) [PATCH 0/7] Xperia 1 V support
Message-Id: <170783414525.38232.9788370045735417740.b4-ty@kernel.org>
Date: Tue, 13 Feb 2024 14:22:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: VJ2MXBHBQX5T7MWCJ5AEQBTFQJ7JO5GS
X-Message-ID-Hash: VJ2MXBHBQX5T7MWCJ5AEQBTFQJ7JO5GS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJ2MXBHBQX5T7MWCJ5AEQBTFQJ7JO5GS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 12 Feb 2024 14:10:08 +0100, Konrad Dybcio wrote:
> DTS for the phone and some fly-by fixes
> 
> Patch 1 for Mark/sound
> Rest for qcom
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] dt-bindings: ASoC: cs35l45: Add interrupts
      commit: d0611f617d823a87f04186ad165e2990208c040b

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

