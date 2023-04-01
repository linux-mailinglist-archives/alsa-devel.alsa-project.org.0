Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 069D76D3335
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Apr 2023 20:42:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D6E21F4;
	Sat,  1 Apr 2023 20:41:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D6E21F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680374549;
	bh=YSy1++343dLI0IPsYtSIR7tv1RI7t9o7KnKAjI501Ec=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=htbP/xxsBLNzC8FIjTrdWZxOimQBgBtzVBpBqx3eJSDXce55g6F4Ad0V3dMqw7U96
	 hcBNspvyvABd3Fdja1/uyHLDWuUU3GQ9W8hgMUiJHtpf5eip/yE5GLOnH2cGyk1M1o
	 OPHKTj66PY10g0KAaporwCQKltXisvsK5bh9L5f4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 866A9F8024E;
	Sat,  1 Apr 2023 20:41:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71428F80272; Sat,  1 Apr 2023 20:41:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EA73F80114
	for <alsa-devel@alsa-project.org>; Sat,  1 Apr 2023 20:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EA73F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mHydUQdL
Received: by mail-ed1-x534.google.com with SMTP id eg48so102184812edb.13
        for <alsa-devel@alsa-project.org>;
 Sat, 01 Apr 2023 11:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680374485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3CX0tphHwucVQy/XBMHzMB2OpwqIu91GQKmtAUHW5M=;
        b=mHydUQdLtrrja7rpwWgXxy5mypWihyqXUP8jESwZXYQ+UMo6cyf4ARIpqPZt9seg3I
         viD8SINsrNFJTY+slyuegQUNoXoyUgGWNqNVbcgVwIxihQmrdkXVXvGZpaqvQ4qtGyhn
         ZaTg1OeZqPsnFvfI8KPO2vXotEmS84P8VD/aowhwkz4zu+Gs1dEz5PvvBG0+IBWouKmw
         L9yNjPA4eb8unexMMTlJIKBjfLSGvMAEBV5YJysQGgz7iV0MwdSCRo2BfI7N8tG2RPXh
         lG0tgpCZrnrW6gB1CVl7u9EUrxINDXJztBVjy4PIQQuPu/r7NvVibcJma2TtbIX2gDp/
         sApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680374485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J3CX0tphHwucVQy/XBMHzMB2OpwqIu91GQKmtAUHW5M=;
        b=Vw75k0K8a6xgdEWvjXrt+ABDajhv7ROzaY2Oys6t6gXJhytv3sF3dkyyTWMaX4koBw
         llf4zO96r7tqaQq/Jx04O4ZWVR6lJ2YAbEnWWXdHzKtQgHnuAxuMov158aqnG31knO8A
         vHZkNkVhLF5i0a80dqQXg/FWcOSWbGRuE+QU8vjwLh5cL91ZZ6bOpOeTRaGWv4XH1dWg
         9tLbrU0Tx4shWG14/Bz8quY7JK+n+rdlWV/glWVgyBOJm4lmPfVAGf0fD85xI34EWzur
         2c6qC78Ff/bf7FnkE3l6CkXonOnWXLeuTnJbjfs4dqx0fDkX2pZQj83Ik4fsIlg+mnFR
         MvlQ==
X-Gm-Message-State: AAQBX9cl7IrMmAdUqMWTENQoIjDcW5KMHOAreaXNEx8jhQyCqrJZ02Sk
	k7Cue1nh2H+ZFApaUg2KeN1i/g==
X-Google-Smtp-Source: 
 AKy350ZiZuxr3nGNpPlOhGyuV5/ZXciTT5jaK/TheV5lAt/QXLE6MfBHCobXTB/i0A5limdD5B7WdA==
X-Received: by 2002:aa7:c94c:0:b0:4fc:eee9:417 with SMTP id
 h12-20020aa7c94c000000b004fceee90417mr27190427edt.18.1680374484789;
        Sat, 01 Apr 2023 11:41:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ec00:3acd:519:c7c2?
 ([2a02:810d:15c0:828:ec00:3acd:519:c7c2])
        by smtp.gmail.com with ESMTPSA id
 p9-20020a50cd89000000b004c0c5864cc5sm2389927edi.25.2023.04.01.11.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 11:41:24 -0700 (PDT)
Message-ID: <5b0f9fc9-45ef-e501-6840-df4b03d9dab7@linaro.org>
Date: Sat, 1 Apr 2023 20:41:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3] ASoC: dt-bindings: maxim,max98371: Convert to DT
 schema
To: =?UTF-8?Q?Andr=c3=a9_Morishita?= <andremorishita@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 anish kumar <yesanishhere@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230401181930.533067-1-andremorishita@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230401181930.533067-1-andremorishita@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N2W5RDHRUFCJUQTDRWZ4TV6RBNRN6JSU
X-Message-ID-Hash: N2W5RDHRUFCJUQTDRWZ4TV6RBNRN6JSU
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: mairacanal@riseup.net, dri-devel@lists.freedesktop.org,
 daniel.baluta@nxp.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N2W5RDHRUFCJUQTDRWZ4TV6RBNRN6JSU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 01/04/2023 20:19, André Morishita wrote:
> Convert the Maxim Integrated MAX98371 audio codec bindings to DT schema.
> 
> Signed-off-by: André Morishita <andremorishita@gmail.com>
> ---
> Changes in v3:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

