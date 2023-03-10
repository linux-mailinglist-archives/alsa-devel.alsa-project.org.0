Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D78E56B3943
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 09:51:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA0217A7;
	Fri, 10 Mar 2023 09:50:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA0217A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678438287;
	bh=4NF1Dq5AgjWRK5e6zPzAnelu/82rp80+M8aZAC5SYoU=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WaoesHThlptyKt+qqV0W/cm4XRKOWgoKF9zCWRHFOLB+wwG4FyBulx6bhNyZ5jgpA
	 0Pc1Cf1j2Q0BoIwlCBBCE7go2igJBo3OXOTJ10K/dM3FuH3DSsAFLX/rmvSkJj5c5Q
	 CCmKCN6Zc3N/jb36vsHfRiWR0bn2W+O3aTPhokfM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C42BDF80236;
	Fri, 10 Mar 2023 09:50:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BA82F8042F; Fri, 10 Mar 2023 09:50:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 619F9F8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 09:50:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 619F9F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CWyJs+HW
Received: by mail-ed1-x530.google.com with SMTP id ay14so17420495edb.11
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 00:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678438226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ipfX94R9wbmrYkXyBfnbFGquCgHOanUWP3JAxF36ZcA=;
        b=CWyJs+HWQi1vX3RPNnm/J6gE4kcyoJbjzCVEOr5t+k6oH1rq9W3mljVyz2njWhuMu5
         gUCw6m97KV6iRT101NgZRNtiRFiDbz9U55ShEvv5dWXno7YmYWH7aRLy7SlAqpPIkPPt
         DshBMRc7B0KKO93e0ndoTfQueqnPIE6RZPwvH8zGvU2yLW3/e3/3sZugcpFDiGvKn97F
         GvPgx53wUbuCPxQ7ATQQPenbXkM79AXzK1ev1axdgKPHV4wVwBi1uZaC+7PnbQc1Qt8/
         a/cWJeoQHup9sAQHHKBiA3CyFERBbQDdcDuFgpbmA8PhRpXONoGSsyjYW3Y1ckTLR5ir
         blqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678438226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ipfX94R9wbmrYkXyBfnbFGquCgHOanUWP3JAxF36ZcA=;
        b=enWHT5H52YncHWXL6K87nwle/wuWoSHlY6m/bFxjGZc1B7rEqNFUxxnrQned7ynAs5
         3sqLniI/oS3fwQTgBeg555n+sNBt4c04jSC07wR6d1ocnh0U3Q4yyrAF600YuNqxr/BK
         Y7luyxFooI2FkR/R39R8PY0MSKR9GFhNMpuL/ATa9inPOwno9Jo92fmMp2Ep+aVgh5PD
         9qLRUk2cagzlT6o6X+cmFLPqEzgyCOIVwDS4ibCmUN6eH900xrrB6icax/Wjug3+cKCr
         xhiksRbE5KA0yiqKDUNBLT1URXDcFreRlzRzCwYUC3LjXWT4diQWqwNmVixQU8O8R4SJ
         0YFA==
X-Gm-Message-State: AO0yUKVAJlJOXHWFxOrHhhW1qOqDL0vZsMnW3IIXIhP8glEtXoLaB9J9
	BQLT9OAhQXsZhXcw/SxGID98Hg==
X-Google-Smtp-Source: 
 AK7set+E/4fAteq3rh76C+cieesyxjxboaO7qVk8PaVAPoe5+SoyWke2NX6ryFSI3UcOSVu5Y66lsA==
X-Received: by 2002:aa7:d7c5:0:b0:4ae:f496:1372 with SMTP id
 e5-20020aa7d7c5000000b004aef4961372mr21528108eds.36.1678438226060;
        Fri, 10 Mar 2023 00:50:26 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974?
 ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id
 e5-20020a50d4c5000000b004c0057b478bsm562719edj.34.2023.03.10.00.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:50:25 -0800 (PST)
Message-ID: <7f0fd384-936b-02f9-c067-1e680b04ec95@linaro.org>
Date: Fri, 10 Mar 2023 09:50:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 11/28] dt-bindings: usb: dwc3: Add
 snps,num-hc-interrupters definition
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, andersson@kernel.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, tiwai@suse.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-12-quic_wcheng@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308235751.495-12-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GUH2TMLS5S6QGGF7T322YANAE3BNQCZ7
X-Message-ID-Hash: GUH2TMLS5S6QGGF7T322YANAE3BNQCZ7
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GUH2TMLS5S6QGGF7T322YANAE3BNQCZ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/03/2023 00:57, Wesley Cheng wrote:
> Add a new definition for specifying how many XHCI secondary interrupters
> can be allocated.  XHCI in general can potentially support up to 1024
> interrupters, which some uses may want to limit depending on how many
> users utilize the interrupters.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

