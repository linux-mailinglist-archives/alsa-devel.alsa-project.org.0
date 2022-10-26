Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 837D260E581
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 18:32:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F3F21FF3;
	Wed, 26 Oct 2022 18:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F3F21FF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666801966;
	bh=yqcoqkaDgNCIB6nqsHgUvksNWRWJ+5V/ncqNqLCew4Y=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SBo8xcI7cRNg4x0DoUYXFtHvGsfrTExEArDVUUjK71w102Uk7ob7FxVLK8LvQva5s
	 Ymw/pyff1MtBEtqJXaUGZl+HbH7fSXS3r0r2HtYjfj5qDXWC7BbCXzhUFy4h3ozQJn
	 P3fvOIrDe7tsHYXwWn0YsWNcQrNdHGGreS4KH9r0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EFC1F8027C;
	Wed, 26 Oct 2022 18:31:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20AD3F8027C; Wed, 26 Oct 2022 18:31:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEE6BF800BB
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 18:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEE6BF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="gCRfbxTz"
Received: by mail-qk1-x729.google.com with SMTP id l9so8418224qkk.11
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 09:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vZroYCfLP4kV6yI2SRRkLF4nBxcg+8GdvFiXm2KAN+0=;
 b=gCRfbxTztxyAglTagJ90CBhqnus+JgUzmKoYY9/0MsEP0wUYumGlms0kroMz2tdy+0
 dQ7pwGFr2FC+Lh9NYSXPBYWx4UU8Mc0j7g7zmepKBf/T6NaMqH5pF2xFsOJdfBydH0w5
 EPgU1WDnWu0/PTDgoPCBiO3R6FyU0a1LdvwLJMddT6qZtWWPn3KHjF1NZ6skR0mcjZSN
 LsIe9HA9Z7bTvXz3Oi+qV6PKu1fNrohSeUrtCEPTEXxCILDGbe0U81rP2Xapzv3OVKpD
 pftWQCvFA+6xejk6uMiNDVHpwXWQk6JJOa34wdV6Y3MkiWsomuo5PZpq/2u4/6z2X/8F
 m+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vZroYCfLP4kV6yI2SRRkLF4nBxcg+8GdvFiXm2KAN+0=;
 b=hkomhrlu+w3S1m7iLWOoaFaumjLPyqnADuwz6yDLICAKRb+NKqPRDKiIR55qh5xgeI
 L3qtnZJdrl4zbE/PRudok5DbbAs+yzCoHhkAjmivmlOZdGXYdebr7WrxKMHDG9Mt3qoi
 Z+YzgqDq6YPvI2KJSR9QNZG97Ts9Zw9orvZqHdvrZS8jZUTUdY7us/8XbX7ohJwp9CcP
 UYRZA3obqnAgXxn8lnshnKMJbEf8Lk/fupmlcXm79cYvbygUqCPCNvQyBywhQiQYsYup
 FGtfMZXHJbKwkmA6Gd1tNQcsNVKxyjFrW3GPF57+8gU0mrjLfnVegeoPINxo7L9jlZVz
 +Urw==
X-Gm-Message-State: ACrzQf3T4AGSdX5HRWzFVniGvdghht41pQQ1wmm3M5ENog08Kx2StcDW
 pV2PkTQNbj7Ji2A0HCbE+GdLLYgqvsjrOA==
X-Google-Smtp-Source: AMsMyM7zb0Ad8R3XGxlHoD3MmtUEhan1tNmdrsbjDd8I1m15K/nuONOXPqL7vgs0BM6lGAVY1R/VKg==
X-Received: by 2002:a05:622a:4cc:b0:39c:bfb1:8a45 with SMTP id
 q12-20020a05622a04cc00b0039cbfb18a45mr36998426qtx.647.1666801889584; 
 Wed, 26 Oct 2022 09:31:29 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a05620a294c00b006b8e63dfffbsm4239476qkp.58.2022.10.26.09.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 09:31:28 -0700 (PDT)
Message-ID: <f3148a5a-2424-8589-684e-7d759bb08bb1@linaro.org>
Date: Wed, 26 Oct 2022 12:31:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/5] slimbus: stream: add checks for invalid
 unprepare/disable usage
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 23/09/2022 11:57, Krzysztof Kozlowski wrote:
> slim_disable_stream() and slim_stream_unprepare() are exported, so add
> sanity checks preventing unmatched/invalid calls.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Hi Srini,

This patchset is also waiting for a month without comments.

Best regards,
Krzysztof

