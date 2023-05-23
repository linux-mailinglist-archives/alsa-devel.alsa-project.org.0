Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE32570E2A6
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 19:14:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2A98207;
	Tue, 23 May 2023 19:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2A98207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684862068;
	bh=KleJvOcuNB65vqzdP/lVt/paUiLP19OaPWVvtuQb2JI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=twxbsKh0YEcFNH8vBPWZSOm8JEI/oxX6O3uGbpYEwrZUo+8JRyZEgP4R3ywIKV867
	 L8bAVsOrv1o88zcPzZ+o/L8ZDff53tBx/Vi+KVHpo4T4T8Vhbvg4ypxil056RecsrY
	 8cu8fuhOsLPU8xxVe8KZG3jmel9RjQyAJMxYzhjU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B1A6F80549; Tue, 23 May 2023 19:13:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA868F80249;
	Tue, 23 May 2023 19:13:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54E30F8024E; Tue, 23 May 2023 19:13:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BA8FF8016A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 19:13:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BA8FF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JTmAXusT
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f423521b10so1061445e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 23 May 2023 10:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684862007; x=1687454007;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOCz9RmdVTOhhgpghZZJPcHjAiJmOglm8+PVBiqiJ8M=;
        b=JTmAXusTTWbezv+kPsqc/VpadaF11BibQj/KIeC96y9uQq9onicO38T4JD9dwJPb2q
         ZH7lOkREYl3UKh+dvdB9buIxpLqZsrPl3NQ4DP5rRWPfWHUHfnDKRsj7SjSENgxjGG2V
         JCBY3qvDGHvDRexp1ap9XNwVujjRZ4XcqdaKyuDRRo5y8tuPHQVc2zu0/7/QQ/G0GkX/
         s+NzAXQU4P8GP5b8d1Qtlj7szLyrQfKHsqHlXp0/jy4hjmHIVxUg5oJ/TfBewcJUD5AD
         4vGxVDKTvz8vN5AMujK+A2ZoW1+5Fv6zxrzFWipcousRaGPwmWRHlaOmPwHnt+FO4KfN
         THYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684862007; x=1687454007;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LOCz9RmdVTOhhgpghZZJPcHjAiJmOglm8+PVBiqiJ8M=;
        b=NT6HxXyl9UUyP2VeCEZ+FNO9Ym8sjk+3Cn7cnuHV5YEiEDJm7Aziczy4Y5K4dqF4Wq
         faGNXNeizYor83pqTQApqLfh0rq6KmcZHJia/5bH6ulRDUwy7WdaOfMjDPtI2t2GQtgb
         nKiKqV8qE3NxD8zkjvopef83fz0ruT9Jhrzoz52kvLOcZvunxBA14zxlucW7kHgpvBSi
         1A7TH/zzcN8SNvfcTMOKUU865XHufLxzPP0swuPhYcO9ivOD4Hhzpp+QSY5x699if7yF
         e2SDA4xD4rtQVeBHchXehhb21CWv/pRWGafDY8kQDauZI0uZBDCf8qZ3LnSwOU6rphUC
         SZjQ==
X-Gm-Message-State: AC+VfDxexZdfQAC2oso3KO3/+/C5FLC2aB6EokgL097S/2hyaqz+bfk1
	JeYUr4IO+If04aZ21+B2tVZqpw==
X-Google-Smtp-Source: 
 ACHHUZ5WSgfukiscV+11TkJVeTmzV96VC51JBJR1AfJN9Q4/xg4yAEFQ1pBpwNuiqAnOJ217YowYmw==
X-Received: by 2002:adf:f8c4:0:b0:30a:9cb2:badd with SMTP id
 f4-20020adff8c4000000b0030a9cb2baddmr2525866wrq.46.1684862007071;
        Tue, 23 May 2023 10:13:27 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 a9-20020a5d5709000000b0030922ba6d0csm11587461wrv.45.2023.05.23.10.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 10:13:26 -0700 (PDT)
Message-ID: <1f34ca48-75cc-d824-2230-7375146ad970@linaro.org>
Date: Tue, 23 May 2023 18:13:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] regmap: sdw: check for invalid multi-register writes
 config
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20230523154747.5429-1-srinivas.kandagatla@linaro.org>
 <dd2d2484-13f9-4fa6-85d2-5a540f137b3a@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <dd2d2484-13f9-4fa6-85d2-5a540f137b3a@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OF2VEZJXULS5ONTPCJV3VPR3QZEUPTVK
X-Message-ID-Hash: OF2VEZJXULS5ONTPCJV3VPR3QZEUPTVK
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OF2VEZJXULS5ONTPCJV3VPR3QZEUPTVK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 23/05/2023 17:58, Mark Brown wrote:
> On Tue, May 23, 2023 at 04:47:47PM +0100, Srinivas Kandagatla wrote:
> 
>> +	/* Only bulk writes are supported not multi-register writes */
>> +	if (config->can_multi_write)
>> +		return -ENOTSUPP;
>> +
> 
> This doesn't seem like the right fix - I'd expect us to simply choose
> not to use multiple writes, with an additional flag/check for bus
> support.
Is there a way to check if bus support multi-register writes?

All I can see from the code is that regmap can_multi_write is set based 
on regmap_config from device and write callback from bus.


--srini
