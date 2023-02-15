Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 870D1697E1D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 15:11:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F5AB82C;
	Wed, 15 Feb 2023 15:10:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F5AB82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676470308;
	bh=DH4FUCFelIwcOz1OdcH5C5gJ2pv9hdKWARuNwh3qNf8=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZWptF5n73xNTop7LSv9XW2rMxNA9/MiPQkQ5wajgl+u10p5xACL2TIvAzkP8uGe9b
	 zmB6hHc2/kLVwqZbNfTW6LD0t2UlL6MH0tjb5ILeyhvkDvg1/S/o+qdlRy+ws8I2/5
	 jqtnCN6axKRBM1YkcSyLUe1/jfH/4ySReSTJ4/0A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1D91F801C0;
	Wed, 15 Feb 2023 15:10:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71761F80496; Wed, 15 Feb 2023 15:10:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9496EF800B6
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 15:10:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9496EF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O62MQzlZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 187C661C27
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 14:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C268C4339E
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 14:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676470247;
	bh=DH4FUCFelIwcOz1OdcH5C5gJ2pv9hdKWARuNwh3qNf8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O62MQzlZQVSRwF8JNJvyNoW/vWClJ1QmggGzwoWb2HLHePLVAQa+KhvVcHC+Zpz7x
	 DhT9BriMs//wHDdsOj32fsGRuJNQGWrPSSIXkZSmmfS7wLV7II1Jqogfd7L62CUyqk
	 Ze8+wl6kUzeDMLnSBKHieZai9Y0sk+syXleyYu20gFAsxAdPxl+wUt7Br//AVF42GF
	 4U+l1SMQa0Vt25hiqO93G0uyQHtjoeHXMDJXele6Roo72G4t1qnj/X+zmn8pap++js
	 S5/vnNi0EzCywdffkTVC98Q1X5I6beTTyiF0IxqNPahJRhKqK6LqEGKdPKuR1oQkI1
	 pwJCKeBJCjT6g==
Received: by mail-vs1-f52.google.com with SMTP id e20so3756456vso.6
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Feb 2023 06:10:47 -0800 (PST)
X-Gm-Message-State: AO0yUKULOwZN5O+WK/wws9NFx9Lb3JeVGLhVl9iZOQDH2BmtE8p776Mc
	JuovqMxwyYDfXzOXSKzjhmdxMjbhHMP99nU9gQ==
X-Google-Smtp-Source: 
 AK7set8FnCBbdFH5FS8uz/h537D4O/PkLn8ucaYp0tl88XAE8QbZciEJDn4ZrAQ8MTmxXSdd9hcSaq5R87m25bM+WaQ=
X-Received: by 2002:a67:f5da:0:b0:3d3:cb5a:df05 with SMTP id
 t26-20020a67f5da000000b003d3cb5adf05mr345658vso.83.1676470246464; Wed, 15 Feb
 2023 06:10:46 -0800 (PST)
MIME-Version: 1.0
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
 <167639581474.996065.4144950480631659648.b4-ty@kernel.org>
In-Reply-To: <167639581474.996065.4144950480631659648.b4-ty@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 15 Feb 2023 08:10:35 -0600
X-Gmail-Original-Message-ID: 
 <CAL_JsqLpsiermwLON5B8Z99XQMAaK36Nv_GKLvRFQQokEwKY0w@mail.gmail.com>
Message-ID: 
 <CAL_JsqLpsiermwLON5B8Z99XQMAaK36Nv_GKLvRFQQokEwKY0w@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 1/7] arm64: dts: qcom: ipq6018: align RPM
 G-Link node with bindings
To: Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: IPIYBRQVULZECKELX4X47VEXLJLLUN5U
X-Message-ID-Hash: IPIYBRQVULZECKELX4X47VEXLJLLUN5U
X-MailFrom: robh+dt@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Banajit Goswami <bgoswami@quicinc.com>, Mark Brown <broonie@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IPIYBRQVULZECKELX4X47VEXLJLLUN5U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 14, 2023 at 11:28 AM Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Wed, 8 Feb 2023 11:15:39 +0100, Krzysztof Kozlowski wrote:
> > Bindings expect (and most of DTS use) the RPM G-Link node name to be
> > "rpm-requests".
> >
> >
>
> Applied, thanks!
>
> [6/7] dt-bindings: remoteproc: qcom,glink-rpm-edge: convert to DT schema
>       commit: fdafdddf7b2f5cab8d233ef97f1fad8ec7d2e7a0
> [7/7] dt-bindings: remoteproc: qcom,glink-edge: correct label description
>       commit: 6f9c2f19a8743c880903a031c7f3f3c534d4b813

You need to apply patch 4 too. There's a warning in linux-next now without it.

Rob
