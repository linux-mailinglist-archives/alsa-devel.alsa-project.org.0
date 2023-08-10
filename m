Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 157A9777687
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 13:10:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98BB7822;
	Thu, 10 Aug 2023 13:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98BB7822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691665841;
	bh=z/4JA2KQYoPL4g/5RRnfTdaSTIjNjiecvS4tSeZNkWE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mvCOQlmxRiPFNsopiJ0LMOwY0zzDffz/13O7s2tgBFu+b1fOp9eZtscW5bKz8iwAY
	 /coTQ9twAYDU8MgWyAyLmDK4U8JiXODkPYBD76mvF2Qz5NHseYm2nQOyizfnhcXg7F
	 p2baL1vnHNvnbEApPAijTF6DA7Rbsdez1l573f8g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6286F80166; Thu, 10 Aug 2023 13:09:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C82DF80166;
	Thu, 10 Aug 2023 13:09:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4EE6F8016E; Thu, 10 Aug 2023 13:09:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6BAEF800FB
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 13:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6BAEF800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mqLUcZGA
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-d62bdd1a97dso716732276.3
        for <alsa-devel@alsa-project.org>;
 Thu, 10 Aug 2023 04:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691665779; x=1692270579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrCDrSaxkOnoskPLNX6of9fGrq30kSTTjPQNs9alzXw=;
        b=mqLUcZGAdm5yKSkxr9BjWFd3B/wUgzQDxpBtajmOQByxwqT23HnyN/9GslCSZdK1fl
         XPRSPd86ZfFgTeyzaFb+TWwfQvH/OcUU3cOb8JJxV0aszhV6F+Gygl3giB9wR7/22vQd
         fr96lqsvFYBLfMFQj74BJc8X+ujWkyxK3+IT6vhsagBTakO1UTJBPLQ6pwlqp+29R80Y
         +7P9PmZVTXiu2+pjGX0M8OzvxA+EGEtXmt740D8gvDJmHbs4fxAfV4rgABNkOha3fB0j
         JFdZEXCtBXJj3rmY3JLWWBCdyQoJsa5OrLis8hsudww1mKFZVGQ4+l3g2MByzHJphERJ
         Eorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691665779; x=1692270579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrCDrSaxkOnoskPLNX6of9fGrq30kSTTjPQNs9alzXw=;
        b=IYf9gDEYFzGhjFA7vUUTJCiHivEy6NbjitVWamdmWtDm3MBRiReby/bS7sedj6Cr8C
         dsyGYeAzJa3vm2r1W2ubDPuE72Z0ThWviYy958O46i/FeMuMiDX17z+BnG0oXyWQb0w5
         FuguZ5QUS3lYVp+zOl4IxPysl/LV5/jJNBEgxGqkqQSM1NeGzR0kQDPN6oKf/sQrkbvW
         54GgPcPyjUI2q9AQQMQ4ZJHabxNG+RpHybkmCz7vjlzwF9j60JacprUpSjqZxy6XkRfu
         thdxd9Bxc55bzYZ1dBjMlScljpG1R+guFP2iL8pPSKYxzUVwUg0QNob2ezppLiAaQ0SL
         Q0Qg==
X-Gm-Message-State: AOJu0Yzdkb+ecH2+o+aatYQZFVXt6U96cQiEMe9py82XFIEkuCKHt1rn
	ueAdYuj4T0PYIaHyDcfbdqKSU+Vc9uLPeQiXWiX4Uw==
X-Google-Smtp-Source: 
 AGHT+IHZFiJvDdRFwWsv0IC08dq5P2mWN3KmjsdIo4AKS3FUz9cw2DydAD6qCbnSHw/Inw5OMg6uQe9d0pHzlI0Agpc=
X-Received: by 2002:a25:734b:0:b0:d4e:f64d:97bd with SMTP id
 o72-20020a25734b000000b00d4ef64d97bdmr2277019ybc.63.1691665779441; Thu, 10
 Aug 2023 04:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691606520.git.agx@sigxcpu.org>
 <d7a0be6a2688a9829077cc21ca4a5bf9528f9eb1.1691606520.git.agx@sigxcpu.org>
In-Reply-To: 
 <d7a0be6a2688a9829077cc21ca4a5bf9528f9eb1.1691606520.git.agx@sigxcpu.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 10 Aug 2023 13:09:03 +0200
Message-ID: 
 <CAPDyKFrhBqvkqnJngSBSx+nqnNwo9BXjfiUjt2uk_TbCsd95Ug@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] dt-bindings: mmc: Fix reference to pwr-seq-simple
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, kernel@puri.sm,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org, David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 6HJIXUFFVEJRBMQZMFD3ODJ6H6KROV35
X-Message-ID-Hash: 6HJIXUFFVEJRBMQZMFD3ODJ6H6KROV35
X-MailFrom: ulf.hansson@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6HJIXUFFVEJRBMQZMFD3ODJ6H6KROV35/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 9 Aug 2023 at 20:50, Guido G=C3=BCnther <agx@sigxcpu.org> wrote:
>
> It's a YAML file nowadays.
>
> Signed-off-by: Guido G=C3=BCnther <agx@sigxcpu.org>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/=
Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> index 86c73fd825fd..58ae298cd2fc 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> @@ -269,7 +269,7 @@ properties:
>    post-power-on-delay-ms:
>      description:
>        It was invented for MMC pwrseq-simple which could be referred to
> -      mmc-pwrseq-simple.txt. But now it\'s reused as a tunable delay
> +      mmc-pwrseq-simple.yaml. But now it\'s reused as a tunable delay
>        waiting for I/O signalling and card power supply to be stable,
>        regardless of whether pwrseq-simple is used. Default to 10ms if
>        no available.
> --
> 2.40.1
>
