Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25070813CB7
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 22:37:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E75BFAE8;
	Thu, 14 Dec 2023 22:37:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E75BFAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702589834;
	bh=ovVVMU8E8yXV3Ds1ifruC1fVHIL8MLboBHLyUCuvLfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g8wF7W0Tr0gCgD3z1ljWKJlKlHBMQoe6eKM1IwFrP1XXzmCLPpa1TxF+F9ylx3zvW
	 axgSvtHRkgHK1030FGliE/XgrFtuPI5q+O8GXq8YwyrW+YN5vC/7aKxEzcOnAbGAUg
	 xfwGcMw7dWH4hvkdMmgIq4qNun/YPxe/Yj44Gvsw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB999F80166; Thu, 14 Dec 2023 22:36:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B504F80571;
	Thu, 14 Dec 2023 22:36:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33981F8016A; Thu, 14 Dec 2023 22:36:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A20E5F80114
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 22:36:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A20E5F80114
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-5913e3a9e05so33870eaf.1
        for <alsa-devel@alsa-project.org>;
 Thu, 14 Dec 2023 13:36:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702589763; x=1703194563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOfIXMQdmVXtw/LaT+kEhtAy+i/QDIyW7XZdUFyrkYc=;
        b=TteU4b/47FKIKcd/x7KNgL7m1TbQJdtzgMpS4Pxybi4aO0t+0rZ2T6EizhdunG8r+b
         wun1oOm0RVzx7SCosxcv01RVwpmmtvnU83EoOFMWrfGrlBB78+s0j5oV+UNsE+OiuoC3
         71Cr/4rfXNqFnViyJdYwfJey+ACwZaPqduv5Dq7CgYNJZEwtvhIOjX5zliVdDF9qc7zy
         U1fDns4aoltj848YyzpwanhPesm7dth7+7bgTR2Nu+Tc5bVYhNQFbWGUZGfuGu1FRfJV
         p8fQWR6ZRvqs91k+PDHGCTPiRYKYdFwXyDN4GZwgAF3d9Q0VRIHhf6GhZPPw5xZam/zE
         JpTQ==
X-Gm-Message-State: AOJu0Yw2wVl/OzGEi/+UdvvMZREgyH1RCaoxNkxr2rLvak0Z3TEOCg3/
	88O3kMqzzsqZzCjpq0ttSQ==
X-Google-Smtp-Source: 
 AGHT+IGQwAEAEsXKwPod/9C7p+UERtNGBRBhXv6kCpyQfnL61ttM0xzFs0wx/qtEEGJNigaSx/FJbw==
X-Received: by 2002:a05:6820:1c88:b0:58e:272a:7da1 with SMTP id
 ct8-20020a0568201c8800b0058e272a7da1mr10570842oob.2.1702589762638;
        Thu, 14 Dec 2023 13:36:02 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 az2-20020a056830458200b006d87b9d84bfsm3359255otb.12.2023.12.14.13.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 13:36:02 -0800 (PST)
Received: (nullmailer pid 978584 invoked by uid 1000);
	Thu, 14 Dec 2023 21:36:00 -0000
Date: Thu, 14 Dec 2023 15:36:00 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100
 LPASS RX
Message-ID: <20231214213600.GA975481-robh@kernel.org>
References: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
 <20231211-cardstock-elevator-3e19f9d41ac2@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211-cardstock-elevator-3e19f9d41ac2@spud>
Message-ID-Hash: Q5G5F3SQFFJ5YH2PNP7RE2S3ZZZBSJFG
X-Message-ID-Hash: Q5G5F3SQFFJ5YH2PNP7RE2S3ZZZBSJFG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5G5F3SQFFJ5YH2PNP7RE2S3ZZZBSJFG/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Dec 11, 2023 at 05:29:50PM +0000, Conor Dooley wrote:
> On Mon, Dec 11, 2023 at 01:31:01PM +0100, Krzysztof Kozlowski wrote:
> > Add bindings for Qualcomm X1E80100 SoC Low Power Audio SubSystem (LPASS)
> > RX macro codec, which looks like compatible with earlier SM8550.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I wish you'd send cover letters when you send series of trivial patches
> like this that could be acked in one go.

Or just one patch because it's basically all the same changes and it's 
all going to 1 tree and the same set of people that will care to look 
at it.

Rob
