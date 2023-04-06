Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4946D9EFE
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 19:40:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F5ECF6C;
	Thu,  6 Apr 2023 19:39:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F5ECF6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680802817;
	bh=yVpnQ+dQBJ3fYadgfaolKFwSOS9ax+46kGWVyhSifb8=;
	h=Date:Subject:From:To:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XaIjNE7n/Gzxr64TUFCg6dm3Rp1j1zw5Fw8P5WWooGvIn3dWFZjIu7l+j6sP2Y2i2
	 SyKNX5uMbwNd8yDPJ/uHzMCmFhVGC/EavxmbhXxvICP+iihN6TghIz6LbPK8BjNnus
	 9gu7UGdzFXPk9mb+BOc4FlxSKcRCkjstomJdt74Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDF05F8052D;
	Thu,  6 Apr 2023 19:39:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDD92F8052E; Thu,  6 Apr 2023 19:39:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3BFEF80529
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 19:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3BFEF80529
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MrnltUbO
Received: by mail-ej1-x636.google.com with SMTP id by26so3223806ejb.2
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Apr 2023 10:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680802741;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YLr/157pDr+V63ARgidHtbEbDJDZaN+vcg4GWMu77Rc=;
        b=MrnltUbOhbxKlsGbj2Z20Wo+gnrLhLq/+dRUzjDW0BsRL2/M6Gs4XS60EtVYrG7vzB
         RUwYJq/m9r1lcP/UBbfPiCKX9ZBheMS1k4UaZsOHkNHBYsxwxDVWqf3xwxHDuLSSClwP
         +wkDxNajn2L7/OUMjq1ohvJfMmbCGGsjNLCwdiNb7WhQ/R3jtP1EtpA9+eKSE6+UxwPN
         K+KlNciIV6yMc3L2e3D0N9WfBQvYxWe3rKl2DmWaaz+2Hx+yWP0TbSkWhaiGd3ZbjlX3
         BAwUpOOiow4moOGqFiLdciqnJtoI6eHf2PrCy2B+WyJzRqNzHgcdYwHxsT4zwsyb82Ly
         PqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680802741;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YLr/157pDr+V63ARgidHtbEbDJDZaN+vcg4GWMu77Rc=;
        b=cGwpRUhEAce7+aQMf5GOQakWksfSouVIFL3nK9x3eJ/BtHzOqqc9yRXQdRlkTnlDR+
         7uHYlqJQEfP/8yua+WTX8/olw617FSSPT5xtiB/fk8g/BiCDMLxbGDeNe2r3JAHlBBhE
         6nVxu3ujw557lBke0kHddgiPRx9rx5NXdpF2rp9Ps4frYSp/d3Lm8quW9C2le0kPK0vl
         1IxAE1QMg3cyw9S21+h5eiv444uHIaZOCudUj3Q00V7+BVS4h3mc6sQPvwZrd99UDJxp
         AxafUiV0vDXD1it6oha9F+LxynCjyy2WIlciTggPlP5nAlf6v0ZVJhrlCdSxVtKtGWtH
         I0DQ==
X-Gm-Message-State: AAQBX9cetuYi2HixwaAb9qyxEtsvxxfK4vcGlwcQwVDhO72BeJRmKVYW
	wwyI5/90dUvy3gKCrOalWoE9nA==
X-Google-Smtp-Source: 
 AKy350bUAKfSDPCFnkHvtg2+71lCEHWPAyIRPaWuaKdCd6RyLlB34GFlG96RVwN5DwOH9pC+pXWDdg==
X-Received: by 2002:a17:906:4555:b0:932:3d1b:b69d with SMTP id
 s21-20020a170906455500b009323d1bb69dmr6893960ejq.47.1680802741214;
        Thu, 06 Apr 2023 10:39:01 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed?
 ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id
 qp4-20020a170907206400b0093048a8bd31sm1076086ejb.68.2023.04.06.10.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 10:39:00 -0700 (PDT)
Message-ID: <e778a869-6aa6-a38a-45c1-6e932a583169@linaro.org>
Date: Thu, 6 Apr 2023 19:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: wm8711: Convert to dtschema
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Saalim Quadri <danascape@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.baluta@nxp.com
References: <20230405205820.6836-1-danascape@gmail.com>
 <24c505df-9145-a515-4b68-aa5806916430@linaro.org>
In-Reply-To: <24c505df-9145-a515-4b68-aa5806916430@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: O2HRW4YGE75E45FZUXGYVGTLFPEEPPFK
X-Message-ID-Hash: O2HRW4YGE75E45FZUXGYVGTLFPEEPPFK
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O2HRW4YGE75E45FZUXGYVGTLFPEEPPFK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06/04/2023 19:35, Krzysztof Kozlowski wrote:
> On 05/04/2023 22:58, Saalim Quadri wrote:
>> Convert the WM8711 audio CODEC bindings to DT schema
>>
>> Signed-off-by: Saalim Quadri <danascape@gmail.com>
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

And a bit change of mind - please make it one binding (as my comment for
wm8523).

Best regards,
Krzysztof

