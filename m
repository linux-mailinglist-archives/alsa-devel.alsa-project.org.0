Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8B17FDBDB
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 16:47:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B3DCAEA;
	Wed, 29 Nov 2023 16:46:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B3DCAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701272829;
	bh=81ncXv3FOgRAUVXX00kkWCrx3GmkGUHC7/9F7iblTDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rffP8KCynl2Pv+LMx2rXBCX2PQ5+/5LQpc/lLbDnxTFpzxAbFfpwVy9xgmJ7wZOfF
	 ++T0jGGL0rNN852Q43OesmGwRgli99SGqy3pU7nkpCq+y6Z3qzbMLZcjlrR17KnEW7
	 1LVfOzJBfPQSOGCCPd8uKOVGv8J10hnAwOX/v9WY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EDF4F805C5; Wed, 29 Nov 2023 16:46:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3B89F805BA;
	Wed, 29 Nov 2023 16:46:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44FC7F805A0; Wed, 29 Nov 2023 16:46:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C856F80588
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 16:46:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C856F80588
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-6d7e51638e7so4099764a34.1
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 07:46:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701272781; x=1701877581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8jMtEURiNzR4V3tdQ4vuSuj4P0isAcJrjE2/UNfHDQ=;
        b=XpgcgP4UmvcY58rIvw/SAL879iWNPkv4RioeJKtEpnQJ1SQihzLGTMb8Vi7iVlUIxx
         08wPFfWEwlIASQRpZ6m/7YnjozpdQRPNgmMzytZYwxFIbETvuonXM3C3SkJK80QwdTC8
         hsDYzNCfpylUtth6AgphF82qrUmBBdeZ6+AZwpOHFQQtGqZvij6RtRRw6RrBWpQSxKU6
         tVSLecLC67IZbdCBZ0H5/w5caC49lWKHsJVXYPBLLKd3RdYSHgi+1kKQFZu/HHwSJDxo
         iVMoigM+xIW86SX67zgjRg2/vbmCoz9wzr/0LHYGr5rGFoXY/EOWhGUZa42K0PenTnPn
         Uakw==
X-Gm-Message-State: AOJu0YzfYXhgey5TOFec+l2sruV0CluiI68VO2RLU9JgXc4PVKwSfRWN
	Tb0+IrSfVLUsCM4ZmkrzFQ==
X-Google-Smtp-Source: 
 AGHT+IGE0FmftmamTD2bgVIC10iZESFjXyDwF9aWF/EtRfooeilxapLNar/m/IJCblrGuTRSzRLwcQ==
X-Received: by 2002:a05:6830:1bf2:b0:6bb:1629:ab44 with SMTP id
 k18-20020a0568301bf200b006bb1629ab44mr20743883otb.7.1701272780883;
        Wed, 29 Nov 2023 07:46:20 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 k2-20020a9d7dc2000000b006d691456571sm2007686otn.64.2023.11.29.07.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 07:46:20 -0800 (PST)
Received: (nullmailer pid 2541343 invoked by uid 1000);
	Wed, 29 Nov 2023 15:46:17 -0000
Date: Wed, 29 Nov 2023 09:46:17 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 Banajit Goswami <bgoswami@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8650
 LPASS TX
Message-ID: <170127277741.2541304.17955532974724492715.robh@kernel.org>
References: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
 <20231129113014.38837-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129113014.38837-2-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: J2F52THA2HZ2XSDKHK22AT4OALBZEBDW
X-Message-ID-Hash: J2F52THA2HZ2XSDKHK22AT4OALBZEBDW
X-MailFrom: robherring2@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2F52THA2HZ2XSDKHK22AT4OALBZEBDW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 29 Nov 2023 12:30:12 +0100, Krzysztof Kozlowski wrote:
> Add bindings for Qualcomm SM8650 Low Power Audio SubSystem (LPASS) TX
> macro codec, which looks like compatible with earlier SM8550.
> 
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-tx-macro.yaml   | 23 +++++++++++--------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

