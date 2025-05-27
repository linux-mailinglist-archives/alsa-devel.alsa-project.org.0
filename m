Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E1DAC5AC1
	for <lists+alsa-devel@lfdr.de>; Tue, 27 May 2025 21:33:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B66AD601E7;
	Tue, 27 May 2025 21:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B66AD601E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748374412;
	bh=5jz4HFaUMvpIkhkCjh0oU+CBO8bypKOzGpHT/HpHhoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ltHhnK63/IkjzaGAscdaEHrLOTxWeOIL1WCoG421m7blFXWS2QwEj6JYbufkgc6TW
	 WA/q1ZfOwOUN1KCPfT8Lv1LAFROZtZ+YLjBCx5vcTdICjDwOQ6vu2X8cAZm8QMt7WJ
	 sCh/4M8a9BB52dYiQPvj1yvLpC/dZeLlXR7uqLMw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FBD9F805BE; Tue, 27 May 2025 21:32:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56A21F805A8;
	Tue, 27 May 2025 21:32:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12E53F800F0; Tue, 27 May 2025 21:32:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org
 [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2011CF80038
	for <alsa-devel@alsa-project.org>; Tue, 27 May 2025 21:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2011CF80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PV57t7U+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BBD7614B3;
	Tue, 27 May 2025 19:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EBCC4CEE9;
	Tue, 27 May 2025 19:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748374369;
	bh=5jz4HFaUMvpIkhkCjh0oU+CBO8bypKOzGpHT/HpHhoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PV57t7U+5CGrTcva5S6HTedYOFKznlWYtkGsTc4qa7ZcBk8SAuskmxP3Xjwvj0CH0
	 45aATBYY83i6IMqMFy4tVkHt3VhkzQddxZmtakcoDuXfvn3XeKXJh+zLqtb1Oh4VE5
	 bV6v5beKlZnja6Cvc96cwoJrJEy/8pEHz6AFhcWRGEyToCRoIaE3q95zTSra0LFCBe
	 yyWvF8aW5IuFpnZ7FO/pRC9Aa1Ab4SW4w86+Mav9J9hpLBIuNIQBpbALZ1V40TPJ1p
	 9q0KtuD8zHAdS4719DLTrrB1+tbth3+qW1+zyXj2pz2Mm59fZZIzQhVxImKI6UYFae
	 J9gyjd0UTAq8w==
Date: Tue, 27 May 2025 14:32:47 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5
 sound card
Message-ID: <20250527193247.GA1074247-robh@kernel.org>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
 <20250507-fp5-dp-sound-v4-1-4098e918a29e@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-fp5-dp-sound-v4-1-4098e918a29e@fairphone.com>
Message-ID-Hash: RD7O6WISNUOIFR3IQWUNHYMCAWJRSNDU
X-Message-ID-Hash: RD7O6WISNUOIFR3IQWUNHYMCAWJRSNDU
X-MailFrom: robh@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RD7O6WISNUOIFR3IQWUNHYMCAWJRSNDU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 07, 2025 at 10:01:37AM +0200, Luca Weiss wrote:
> Document the bindings for the sound card on Fairphone 5 which uses the
> older non-audioreach audio architecture.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)

Once again, QCom .dts changes merged without bindings...

I've applied it.

Rob
