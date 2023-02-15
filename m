Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD45C697E15
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 15:10:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C298A82C;
	Wed, 15 Feb 2023 15:09:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C298A82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676470243;
	bh=MYhOAEbjlmEV72d4Y+wbUnJSCyy31d4OR9meqpFLgMY=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Sm+7n6kLpzUTrHVvNPikv/VYnuYumBYgDq1xEnpc9NYVpfGefN42MjSS6zSYADb6g
	 FDv1j/rMr1Q9cQwAz/XA8TjDnlkC2K2TprvzzbJKk9bJoOclT0SeClBFNUTM4lJBv3
	 l6jSpEyWa+TW/yApj3keyzS29Bzw/fJW/TDfQIVw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E1E2F801C0;
	Wed, 15 Feb 2023 15:09:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A448CF8047C; Wed, 15 Feb 2023 15:09:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E891BF80083
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 15:09:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E891BF80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OyTRxe7V
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DDF42B8223B
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 14:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86CD8C4339C
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 14:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676470180;
	bh=MYhOAEbjlmEV72d4Y+wbUnJSCyy31d4OR9meqpFLgMY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OyTRxe7V4vdQUFAlReUDb2pTJwiqN1iOeTpFEjTo2yVKKgpefOtoM9e4BsgjHYzDg
	 d4fIIFTzmxWo5/nb32KTzS2eeJaNKLrlGG6gll66+V7qYxBPzj6us4+rgUnnAaOaW1
	 G2K+tGSz5zIRIR60TupiIqGUQSI3oTB4DG3ETv5D1bI7o6PG/+dPouzACJaYn5RPHu
	 NlDVkZMiIQ7+Tvyusc5BbRf9x82tr0gJ50AOP+a+n+3do4o5PDIG5FAwqoqHWMOWaP
	 nqU4OihiVDbKSqPUsUxB8VY/BKfpg8FaqaAwODE/Ivof8U9FYbp7+bd2V0paR22Wzb
	 1Am+A1snUaPkw==
Received: by mail-ua1-f48.google.com with SMTP id b18so3592321uan.11
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Feb 2023 06:09:40 -0800 (PST)
X-Gm-Message-State: AO0yUKXcQwa17Fejk2oNNe/NOhEKmlaZ+eEkJjOS+0n7OWq6n79TkVCS
	xOu1/4moivD4d8+weJSWF3B/Pmu7S9fele6yUw==
X-Google-Smtp-Source: 
 AK7set8eUNQpS7lJ5nErj1IiR33ZGzYaWTVPtCM5cZxTLKp8Gtd1AHcNI6ym2Cxr2WOkM6UTp27i5UTovF6FcXK2BKw=
X-Received: by 2002:ab0:2818:0:b0:68a:5d77:362a with SMTP id
 w24-20020ab02818000000b0068a5d77362amr266020uap.61.1676470179519; Wed, 15 Feb
 2023 06:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
 <20230208101545.45711-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208101545.45711-4-krzysztof.kozlowski@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 15 Feb 2023 08:09:28 -0600
X-Gmail-Original-Message-ID: 
 <CAL_JsqLdrpwJ4VhH4MK+RDjZZtWWosXOC48yW+STwtJR6QCAjg@mail.gmail.com>
Message-ID: 
 <CAL_JsqLdrpwJ4VhH4MK+RDjZZtWWosXOC48yW+STwtJR6QCAjg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] dt-bindings: mailbox: qcom,apcs-kpss-global: drop
 mbox-names from example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: CPQ4C4TTZRNNFXCAYEM4IRRGFIW2V4CT
X-Message-ID-Hash: CPQ4C4TTZRNNFXCAYEM4IRRGFIW2V4CT
X-MailFrom: robh+dt@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPQ4C4TTZRNNFXCAYEM4IRRGFIW2V4CT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 8, 2023 at 4:16 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Qualcomm G-Link RPM edge bindings do not allow and do not use mbox-names
> property.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Changes since v1:
> 1. None.
> 2. Previously was sent as separate patch.
>
> There are no strict dependencies. This can go anytime. The next patch
> (glink-rpm-edge) should be applied in the same or later cycle (could be
> via different trees).

Except that without this patch there is now a warning in linux-next.

Rob
