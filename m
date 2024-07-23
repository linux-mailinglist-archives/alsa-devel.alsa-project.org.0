Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC7B93A8AD
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2024 23:27:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 187A4E9A;
	Tue, 23 Jul 2024 23:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 187A4E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721770045;
	bh=E0QRWyEOg+q3RsGsACmKO7O/WolLMK2r0fCiHo8RaxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YaR6h87dSkrKngZx3KKyRy0wiJgMrTyhjggrjib2ly2dlztmGKnU4vfuBC2zNERCR
	 Wqa+v/r7E8JYKqhyThAyaC3PWi5IBjgEmgPLC13j1BveBn84Se9uZbzamgZjUADhQh
	 z0YCDKnHmH/5y1WjkhX88AbzL162+okaTinW2enc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42AA8F805BA; Tue, 23 Jul 2024 23:26:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EC10F801F5;
	Tue, 23 Jul 2024 23:26:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94CAEF801F5; Tue, 23 Jul 2024 23:16:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F4040F8007E
	for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2024 23:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F4040F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=os21XhD2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 942CECE0EB3;
	Tue, 23 Jul 2024 21:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0F1C4AF0A;
	Tue, 23 Jul 2024 21:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721769389;
	bh=E0QRWyEOg+q3RsGsACmKO7O/WolLMK2r0fCiHo8RaxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=os21XhD2dJ1OEzOS2D14CZNvSdA6qglHT9HSK8JRS5uAvkT7+2kAMTCZ1cnIUsYWa
	 iOPNccsEMVNRrPWcI/qxPSoHcJEKBiU4IIrLXJUFPuc3If2iof+Uyn6RaIa06GyjPj
	 qzm4M3YxuOByow+vkQQtnqCDIH17r1f6uoPdrjnc9NjsFyEZlv7vuWBUKf/sYEJiTQ
	 IqbR4N3AIMFjnuHcl+kw7fqiwxjHUE/6xORrVqdBTR9l4nBH43vpxQZ8fLqiCVug9k
	 5ZG2qzGPZczzikV4SHmbwyb8yo5ffH7OcIi5g14QVCySgwZwEJW/p1N7eKCxbOLaQ5
	 URMe9Vn/9iEuQ==
Date: Tue, 23 Jul 2024 16:16:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-sound@vger.kernel.org, Banajit Goswami <bgoswami@quicinc.com>,
	linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Adam Skladowski <a39.skl@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,apq8016-sbc-sndcard: move to
 separate binding
Message-ID: <172176938796.1119753.6821794654577391825.robh@kernel.org>
References: <20240723083300.35605-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723083300.35605-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: A7VFKW7QOES4FFFFWUAZXJXM4YWXITT2
X-Message-ID-Hash: A7VFKW7QOES4FFFFWUAZXJXM4YWXITT2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A7VFKW7QOES4FFFFWUAZXJXM4YWXITT2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 23 Jul 2024 10:33:00 +0200, Krzysztof Kozlowski wrote:
> The APQ8016 SBC and MSM8916 QDSP6 sound cards are a bit different from
> others: they have additional IO muxing address space and pin control.
> Move them to separate schema, so the original qcom,sm8250.yaml will be
> easier to manage.  New schema is going to grow for other platforms
> having more of IO muxing address spaces.
> 
> Cc: Adam Skladowski <a39.skl@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../sound/qcom,apq8016-sbc-sndcard.yaml       | 205 ++++++++++++++++++
>  .../bindings/sound/qcom,sm8250.yaml           | 137 ------------
>  2 files changed, 205 insertions(+), 137 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

