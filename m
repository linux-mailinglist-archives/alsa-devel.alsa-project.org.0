Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E76916EB32B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 22:56:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41B1DEA7;
	Fri, 21 Apr 2023 22:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41B1DEA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682110607;
	bh=75S3R1MZgJ1BWXvGEOTxIIVjvwCh4d+zaVEJ3Tw9F2w=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d5StxuNr+1VldOLol8vbTOULK3buTWUrN1LR27YzBTjstIWZkDpFfo6EQaowMHWLK
	 OGtEQsBdMskjO9i8CUKenwJJqh9hKifvbyrEaQ7Yntcj9X+m8FWYHn9GYBzcY10A+0
	 FB0DxNctnj6xKY6YfJ0ky0bygN90WwkbFmPBiOaE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04253F80149;
	Fri, 21 Apr 2023 22:55:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 625E8F8019B; Fri, 21 Apr 2023 22:55:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F91EF800F8
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 22:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F91EF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=p3ngnf0U
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94a34a0b9e2so287510666b.1
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Apr 2023 13:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682110550; x=1684702550;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=khs5bZkJAYXjt9vS4P+tpl40XbU3Mhb6NOImvtkmF6Y=;
        b=p3ngnf0UVJyIhHVlLHYTAH5NwB18WRvV26hEAYitrH0vKX5Hg2VSaukUyWOgQzCCL1
         RyLJTXyHJSc0t28ovIsNPqolBMP3mAGE3iT/kGgFSK/77nUMLmJ+roDKW0iR+HuS7Ial
         gUqvwKZzda1jlaK2iiyQvXOaS0hI0UEOzzUcEhdJCR9ZqboJ9tzVoTbPUGh7TAeTT2x7
         yoqHpKtWC0F8KNiIsw3V5IqD55BZ9r2y/ao132utpFSm7ik0hYrqM/SWydVZO6BMXwXG
         CuLLpl1XwRVCJKiIKE7R2nYLQvZJoLRJWkpt81ovnoRBn1xa+PStp+tFVomhZAODD+Sv
         yn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682110550; x=1684702550;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khs5bZkJAYXjt9vS4P+tpl40XbU3Mhb6NOImvtkmF6Y=;
        b=YRIbjAzT75ZGsrS24KJb/pck3TEYjctNBux+yfkCHmDeb9Ad9vICrCddtLrv56MoKM
         XHHlaNSQITcKKmzbNAcW4kq+1RBMUBfZPrMpPQZqxbOXx16DJoL3nZt3hyxwxkfGJHZ0
         CCNpJUl/HyPv+1988Sk9DPfBxnwSuWG5pyofuIe6BydGfm/A4ikx43vjViXJjsl7gTjF
         qM7AQnzRWD8uNCjy0av1dA9/gehV2/qeBiCVDHvOmVPA6cb10QQfTstt7D5YLVROyb+F
         rceuqYJZl36Dwe0XHssq1B0J39kmYDEf2Ydq/JglZ65iFGGHkTKBBFSieoADqxBt2T9Z
         RvJQ==
X-Gm-Message-State: AAQBX9ejrWsvsMvWI586nl10d929GSyxO1CM887CYjJecVwLHF4eChTv
	YP1gEVVcC+wYPCc03K3uOg2d7BDfgKYEWzFOdVvCJA==
X-Google-Smtp-Source: 
 AKy350aZ/t54QQ5DE7tfSHFOpMpmqCblzW07florEaLy/nbHdG1wyioI8uOBq+uTIddqWaEbGqN7KQ==
X-Received: by 2002:a17:907:2ad1:b0:94a:937a:58f1 with SMTP id
 fm17-20020a1709072ad100b0094a937a58f1mr3014677ejc.1.1682110550370;
        Fri, 21 Apr 2023 13:55:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:687d:8c5:41cb:9883?
 ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id
 x10-20020a1709064bca00b0095334355a34sm2474521ejv.96.2023.04.21.13.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 13:55:50 -0700 (PDT)
Message-ID: <d0301d8c-8428-7c2f-1d4f-87879927d4de@linaro.org>
Date: Fri, 21 Apr 2023 22:55:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: max98088: make it selectable
Content-Language: en-US
To: Maxim Kochetkov <fido_max@inbox.ru>, alsa-devel@alsa-project.org
References: <20230421200127.16234-1-fido_max@inbox.ru>
 <aa022833-2380-6a6f-6d7e-47b0098ae18d@linaro.org>
 <cd7ad36a-49b5-6093-f2b4-419eb6b52dc1@inbox.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cd7ad36a-49b5-6093-f2b4-419eb6b52dc1@inbox.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WV2TQLXMX3CZPKM6MCZ45K3CT2U2CVMJ
X-Message-ID-Hash: WV2TQLXMX3CZPKM6MCZ45K3CT2U2CVMJ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, rf@opensource.cirrus.com,
 ckeepax@opensource.cirrus.com, shumingf@realtek.com, ryans.lee@analog.com,
 herve.codina@bootlin.com, wangweidong.a@awinic.com,
 ajye_huang@compal.corp-partner.google.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WV2TQLXMX3CZPKM6MCZ45K3CT2U2CVMJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/04/2023 22:51, Maxim Kochetkov wrote:
> 
> 
> On 21.04.2023 23:41, Krzysztof Kozlowski wrote:
>> On 21/04/2023 22:01, Maxim Kochetkov wrote:
>>> There is no way to select max98088 from menuconfig right now.
>>> Add a Kconfig menu description to allow building the driver standalone.
>>
>> Just like many other codecs used in embedded designs. Why exactly this
>> one should be user selectable, but others not?
> 
> I can tell nothing about any other codecs. But this one has no external 
> dependencies. I just need to enable it and assign DT node to bring it 
> up. So we can let them be user selectable.

Why your sound-card cannot select it? IOW, what is so different in your
design from existing upstream sound cards and choices? Commit should
answer to "why" you are doing it and in current Linux sources I do not
see the need for it to be user-selectable. Commit msg does not explain
it either.

Best regards,
Krzysztof

