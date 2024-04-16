Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A31078A612E
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 04:45:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7115914E0;
	Tue, 16 Apr 2024 04:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7115914E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713235539;
	bh=peXN1Y3UTbxhL5DXVIpUyA5+Cwu3ZFb+d4Y1g3j1jog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZRi8lCD0RDE+XOqqemUMfP160gV5pWDAxfpsRW4HP/lOYlty9jwUbZhqkkGIzzM0M
	 TVPrL6o7OwSCCQf74+GoMaHKlBAoX2rM5osYrfMgEQGgjrZJupM+kYqdqlnUqQDE6g
	 eSPrwiEujjzOdkJURDxE+ZM4hQJ/XfYYmfCqQ/iA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B36C9F805A0; Tue, 16 Apr 2024 04:45:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3268DF80587;
	Tue, 16 Apr 2024 04:45:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80543F8025A; Tue, 16 Apr 2024 04:37:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 824E1F80124
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 04:36:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 824E1F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Sa8+G+iF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A1A761068;
	Tue, 16 Apr 2024 02:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A84FC113CC;
	Tue, 16 Apr 2024 02:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713235016;
	bh=peXN1Y3UTbxhL5DXVIpUyA5+Cwu3ZFb+d4Y1g3j1jog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sa8+G+iFhBQ2A/8agFVKgaPwlRMuIxDa1TwYHlSuojIKgYua/IHWbM9PceBGhZHU7
	 0P/NkOXqkDFfMVZCKtlTAYGfAV/6jjMHwBRe3TaaRZ5+tHWuKC7ivTAUARsLFIkdVr
	 ywOiUvLHG2gCrlxLUNM5q6mkbLQJwV0WAXlfhZcRksZT8EYm4RY0aikPjkGGtiRV6z
	 o1KzNu3cO78hug2Siy1Q/yQbWVR2bS7PuPglTc3d6obj+DqLYT//heDcwpbJmA64Kx
	 9R8vimREFoxGC4GOZCSYUru+dOvbGkYwYDjBgtAvUbZhULCM95quA/8cyAxgcewYM6
	 2Eqa+YQwzGshQ==
From: Bjorn Andersson <andersson@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: (subset) [PATCH 0/7] Xperia 1 V support
Date: Mon, 15 Apr 2024 21:36:53 -0500
Message-ID: <171323501053.861898.18063006393453475946.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
References: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OGOSUTKBH5MUT3QRAZFQUR36ZNWE5KLI
X-Message-ID-Hash: OGOSUTKBH5MUT3QRAZFQUR36ZNWE5KLI
X-MailFrom: andersson@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OGOSUTKBH5MUT3QRAZFQUR36ZNWE5KLI/>
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

Applied, thanks!

[2/7] dt-bindings: arm: qcom: Add Xperia 1 V
      commit: 212729551c4186a1a1cbd80379375b1b54488369
[3/7] arm64: dts: qcom: sm8550: Mark QUPs and GPI dma-coherent
      commit: 91fc74458d833dbc999aa04ca34c2a197711a0b6
[4/7] arm64: dts: qcom: sm8550: Mark APPS SMMU as dma-coherent
      commit: 93395f9a8d52b89868d75e278adaf002f99dec22
[5/7] arm64: dts: qcom: sm8550: Add missing DWC3 quirks
      commit: d18b5477dcea7775a562b3ba7aaa68772c8980ba
[6/7] arm64: dts: qcom: sm8550: Mark DWC3 as dma-coherent
      commit: 6e4f7e53991ca7e70dc7d5d9d66c833091e1f6ae
[7/7] arm64: dts: qcom: Add SM8550 Xperia 1 V
      commit: 39c596304e44781c1950ea0cbf178d6433ff9c71

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
