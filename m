Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0174A698463
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 20:20:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24F64DF0;
	Wed, 15 Feb 2023 20:20:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24F64DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676488855;
	bh=U0XX3CZxvqHoARBipoL3LbLMRv1s0v0bLv6CUnxmXKs=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NckWMEug2wzAOh7Y/sTt8PAcGbzd8fXtazJQDbbhw4ugVG2vX5zn1DKaqag0D5Hiz
	 F3OOV8Lv6tTbS/gJpUsbj6I2Wh+CF7P1KFAkSuLc81Ur+nUAPtQu5ZqUzX48thtJXx
	 k6s41i8LsLGOKy/+St1hvxuElsKIp1THPO62tJew=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4942F8047C;
	Wed, 15 Feb 2023 20:19:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34A2BF804B0; Wed, 15 Feb 2023 20:19:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6034F8047C
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 20:19:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6034F8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pymbhp4m
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 28691CE26B0;
	Wed, 15 Feb 2023 19:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7E3C433D2;
	Wed, 15 Feb 2023 19:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676488761;
	bh=U0XX3CZxvqHoARBipoL3LbLMRv1s0v0bLv6CUnxmXKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pymbhp4mtQx3V3Tbl+rydba0C9B6JoQi9AfaA36EWkhGQf2+JpENAwSw3o5ttdCu/
	 XeDIZPg/HGKIMf6i1t1nX2U+5MFE4Az07h3i5QYLD18qfs91LFqDecaCHWj4FaAyUc
	 fiYBuxw+MfXuXcMStRwErTiTa7m+mtCHf50Wo1ybqfMqhC+CfyLzTUwrRFpZ5EhzQq
	 1vxl9p1Npet+H3q9pVXyMFkPOQ66pZ04d6OK+83OaWLDw3TNsg3RzlHY/pn/xLnBZf
	 thiGyP9xM0FKhUCIVuqnYwQ1pn65ql7fStPSYw11Mdbmmi+TysTJeq1TV76aJl2rl3
	 sk//Xsf3PXdkw==
Date: Wed, 15 Feb 2023 11:21:23 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v2 4/7] dt-bindings: mailbox: qcom,apcs-kpss-global: drop
 mbox-names from example
Message-ID: <20230215192123.4ore7ac6tnedrsyq@ripper>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
 <20230208101545.45711-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208101545.45711-4-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: DT4KXAKDFIN76D57BYOHDF2DLO7AIOLT
X-Message-ID-Hash: DT4KXAKDFIN76D57BYOHDF2DLO7AIOLT
X-MailFrom: andersson@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DT4KXAKDFIN76D57BYOHDF2DLO7AIOLT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 08, 2023 at 11:15:42AM +0100, Krzysztof Kozlowski wrote:
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

Jassi, I missed this note and merged the following patches, introducing
the forecasted issue in linux-next. To remedy this, I took the liberty
of merging this patch as well into the remoteproc tree.

Regards,
Bjorn

> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index 943f9472ae10..56b386b688b3 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -155,7 +155,6 @@ examples:
>          interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
>          qcom,rpm-msg-ram = <&rpm_msg_ram>;
>          mboxes = <&apcs_glb 0>;
> -        mbox-names = "rpm_hlos";
>      };
>  
>    # Example apcs with qcs404
> -- 
> 2.34.1
> 
