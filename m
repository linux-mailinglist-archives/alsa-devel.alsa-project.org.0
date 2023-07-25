Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB16761838
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 14:25:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A3A91531;
	Tue, 25 Jul 2023 14:24:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A3A91531
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690287935;
	bh=xYLKNNf8Q4oEz+gG5+vPutrOal+CLGfXv1UQ/HXrqUI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N48i6g6vRY5YdFA/GK1R8lofQ9pczWIMdTPaFaUhbreXMLuoVhkbPlgPJVzrAo5r7
	 ibcarCcWlVREMRhgAIqmcjIU3z93ToerRmIprI9EfSPXT7BgZS6eU/dx4GyRigpIlo
	 Dbk/kxMmWD79p3ZF6dTFvlVXqP1qIk7gSAtdQEA0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E457FF80163; Tue, 25 Jul 2023 14:24:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90B1DF80163;
	Tue, 25 Jul 2023 14:24:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCE60F8019B; Tue, 25 Jul 2023 14:24:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C34C5F80149
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 14:24:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C34C5F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oG/p44ha
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fdddf92b05so8105588e87.3
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jul 2023 05:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690287876; x=1690892676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ks3nUOn/9qR1jrhxbqY2QCJrSfWExHFhLwuG1z7B3TE=;
        b=oG/p44haSlMMr+HRlqE79VaQqZhwEwmSo8ZjOOxune3yqh629GMwSMWSfjhBRB6e1N
         Ty+ROSaV6OoS+5cfAdwcbR95051XyeG62lmnXUG5w3qZ+zOQtg5qQjfL+4WJDxj78FFu
         OFMo5tqWAXhiRMT6YtLLFlxatsASqPfnU0ENTThzCY6Wm9Ojz4JrWgVquG0QToNSLubx
         121/JSosd5nylMRCQ8nabStMWVBxe4A8MnsaqCqMH5g+9cQJ3S9SQ71cnWg/XON5GSny
         MIphdr8uB18GYn4a7e85ZU/DHzuPYZ/d+rNC/Xlmh/E7Z11Vls1o6jQny4kJnAcuS+/Q
         jXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690287876; x=1690892676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ks3nUOn/9qR1jrhxbqY2QCJrSfWExHFhLwuG1z7B3TE=;
        b=euVq+w5afxT/5ndenv6RWbhusAmHpLiVq3URVWp8X5xYbcBi+sCkKqZfZmel+PPqy3
         U/Q/JLOLNIIfBAmvqHaJgsnC+wsOiiSk6DLlHnRyAqvgpNKf87jwBS7E/jRhP29dl0xp
         avGvTqCqiWKxouXXN1id/J7BXeWuZsekQa52pnR341YXPq7v8Iyo8eXC6n6ho9aX3ytD
         BQZ8yq40PyHNp0PRi7G+UavE8wn2UyHmVnKPXmTps/bVrr+hiqnbcGFXw4aUHo/g/HRf
         RhIT3OBdXaG9ID+vmYcCcoxo8+ox92hAaYFcvBhu+8QC92F3BaxBUMU1/eYVz2fVYvOE
         B1aQ==
X-Gm-Message-State: ABy/qLb4RWUmYsdKw4Nvd8HQL9hE7U7J7+LrkSZSXPESgKdb1fd484lT
	tPeg0udYVS3IjaVqz+Uhz+yEow==
X-Google-Smtp-Source: 
 APBJJlGqYyD2TAEiCN22VeSTnnKHBifqwY0pQj3pRX2YJUU6lNpsvdxSXZzil9Y7DBLk3s87zMs/hw==
X-Received: by 2002:ac2:5e2c:0:b0:4fb:92a9:cbe8 with SMTP id
 o12-20020ac25e2c000000b004fb92a9cbe8mr6559105lfg.18.1690287875901;
        Tue, 25 Jul 2023 05:24:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 j11-20020aa7c0cb000000b00522274c3775sm3771264edp.68.2023.07.25.05.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 05:24:35 -0700 (PDT)
Message-ID: <c6e8c950-9d1f-099a-b48a-2b838ed04ac7@linaro.org>
Date: Tue, 25 Jul 2023 14:24:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V2 1/4] ASoC: codecs: Add code for bin parsing compatible
 with aw88261
Content-Language: en-US
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com, rf@opensource.cirrus.com,
 shumingf@realtek.com, povik+lin@cutebit.org, 13916275206@139.com,
 herve.codina@bootlin.com, ryans.lee@analog.com,
 ckeepax@opensource.cirrus.com, ajye_huang@compal.corp-partner.google.com,
 sebastian.reichel@collabora.com, yijiangtao@awinic.com, trix@redhat.com,
 colin.i.king@gmail.com, liweilei@awinic.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: zhangjianming@awinic.com
References: <20230725115649.67560-1-wangweidong.a@awinic.com>
 <20230725115649.67560-2-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230725115649.67560-2-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2A3EGZBIZ737DQCGVRJ7B5H2W6DPKNTJ
X-Message-ID-Hash: 2A3EGZBIZ737DQCGVRJ7B5H2W6DPKNTJ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2A3EGZBIZ737DQCGVRJ7B5H2W6DPKNTJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25/07/2023 13:56, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Add the awinic,aw88261 property to the awinic,aw88395.yaml file
> Add aw88395_lib.c file compatible with aw88261 bin file parsing code
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  .../bindings/sound/awinic,aw88395.yaml        |   4 +-
>  sound/soc/codecs/aw88395/aw88395_lib.c        | 194 ++++++++++++++++--
>  sound/soc/codecs/aw88395/aw88395_reg.h        |   1 +
>  3 files changed, 181 insertions(+), 18 deletions(-)

Bindings are always separate patches.

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof

