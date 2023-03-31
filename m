Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF1C6D1CEB
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 11:49:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FA521F9;
	Fri, 31 Mar 2023 11:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FA521F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680256155;
	bh=5O2+KUYnz3YBKFAptfERJ1ZI5E1evPXSDCoSoigq++Y=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DTDKZq5wiDyFTDtt1KXWEksxJDfu7HP2K+dGZdwh0GPFHAyrqv17B1Hbh8dQkCf0s
	 C1S3cGZaeOtTIbLfF+gXPXhpd1gx2sX+MEEBq1mIWvwPwJaXvpk17qUSgHF06ElX1X
	 z+htO8CTAO70xrRcqfGkZxi73KPJbc7Jnog+IZCU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71A28F80423;
	Fri, 31 Mar 2023 11:47:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC24BF80482; Fri, 31 Mar 2023 11:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8118F8032D
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 11:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8118F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ezQU1fwl
Received: by mail-lf1-x136.google.com with SMTP id g19so15024426lfr.9
        for <alsa-devel@alsa-project.org>;
 Fri, 31 Mar 2023 02:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680256070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+FVjc7Vr5u63Aky+QFc4CNm5/6VJEJaY0PE/oQ5V5Y=;
        b=ezQU1fwlthlnLkzOKfjJOlU8Vs5/eSnmr9Kp1S6uvV/QCN0zH9rfO/hE5raTnlebbz
         b25EcCa/+TCWFoGRjP+iRjdvnpbdE9nd+x5F6YWd2m/CK4a5+LdFtF9MbsNpgKQUgKSD
         2nW5MmV09cZ4wU5rIWYaP3uQJ/euxqQJ4ZTlsNxlPb7YVK6M0ip6KC6uApjtvLRrwAaH
         twUNIusSdJ929h36uDlk6TNck720rAkxa/pPqy1a+ATahXn7qOiVG20zFoiOJCSUgnU3
         twvqifPVC5JGcCdTqV1GjyLLQYer1PLjPvbgENYNu//RXfB5JnFrfzTwlBrbwN+dWYI0
         x9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680256070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+FVjc7Vr5u63Aky+QFc4CNm5/6VJEJaY0PE/oQ5V5Y=;
        b=ZQLmRPthi3eT7FFFvOVgpqpk8xs2SG1h0c1UB4HUl0vp6q1S1OM1wHP/9WW4Hv9BOM
         ulGWXSmrf1BXHNGpJlTlRx2e2WIvm9EJ/BFwlpZndI5c3FgCMUHcd/Y+RIIoq0FLVMVz
         Cwq3nZ+qnhSJBYBQBuWVAgKqMW/6DlwU3hDGzsH+/LEv41kpuxCAfFRPdtIAM4aeymsK
         TkJLRuM0K8FkqBFOdwQVdryGGX01VoGMcpc0caqIR3t8dklRBFU70FwtqIBOJL+noZ90
         QB3jRBTkEe/QM9Dn38THpGSvw4ut9qTYbdz8Z+EPYi3t6gujPlIaolDzJc1fze6pVgTp
         QbUQ==
X-Gm-Message-State: AAQBX9eT6v7vuwjxk8JP4I59QhcLqCssKjKra1DgiN6GeSxsOLOmkEl4
	3o+5BdsMVOkcE/PWCSc1vH58Vw==
X-Google-Smtp-Source: 
 AKy350Yfe7vvDbdX5/m31I+n1dQH9YM3t6uIDyBc+99lpi+x0QXmahT38KoUxCALt0/tRmw5I5ybGw==
X-Received: by 2002:a19:ad46:0:b0:4eb:1527:e29d with SMTP id
 s6-20020a19ad46000000b004eb1527e29dmr3764702lfd.52.1680256070447;
        Fri, 31 Mar 2023 02:47:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id
 m14-20020a19520e000000b004cb1de3f487sm310397lfb.104.2023.03.31.02.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 02:47:50 -0700 (PDT)
Message-ID: <08c18374-5d1a-7407-07d3-151bc5ce2511@linaro.org>
Date: Fri, 31 Mar 2023 11:47:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: maxim,max98371: Convert to DT schema
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Morishita?= <andremorishita@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 anish kumar <yesanishhere@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230331020527.482991-1-andremorishita@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331020527.482991-1-andremorishita@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RPDBAJISRB3WK75QF3FXC72TI7MVRBWK
X-Message-ID-Hash: RPDBAJISRB3WK75QF3FXC72TI7MVRBWK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RPDBAJISRB3WK75QF3FXC72TI7MVRBWK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31/03/2023 04:05, André Morishita wrote:
> Convert the Maxim Integrated MAX98371 audio codec bindings to DT schema.
> 
> Signed-off-by: André Morishita <andremorishita@gmail.com>

Ahh, and missing ASoC subject prefix.

(which you can get for example with `git log --oneline --
DIRECTORY_OR_FILE` on the directory your patch is touching).



Best regards,
Krzysztof

