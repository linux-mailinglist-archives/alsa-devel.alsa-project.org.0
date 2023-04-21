Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0906EB2FD
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 22:42:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5547EA3;
	Fri, 21 Apr 2023 22:41:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5547EA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682109728;
	bh=G1R1R+9y/Vq4EK4Jc8fmWPCSV6N/m0ufRfE2EE6ej5s=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ky9lodwykIECD0NesBNlnwG4as3HFFK6buze/z2KfU6SXyk5a0QnWQOso2gQjmtPj
	 MhMa31wH+nc5BBeWRcnf1FmOxzUt4+CT6VUJ9uqiNkSiDxyzg9skOWZI6PdKvYsQb9
	 m4zS/kpwMUTfc+HUrrEf9lwaGbdeQkQBXMBHlNBw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B3BF80149;
	Fri, 21 Apr 2023 22:41:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B55F9F80155; Fri, 21 Apr 2023 22:41:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 974FDF80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 22:41:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 974FDF80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=P48xrX2E
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94eff00bcdaso355942866b.1
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Apr 2023 13:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682109662; x=1684701662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G1R1R+9y/Vq4EK4Jc8fmWPCSV6N/m0ufRfE2EE6ej5s=;
        b=P48xrX2EVQJgRPOoOg5ZNX4OmKvt0dQYizL8tus7WRPeVlcN7j6rqUAbMTU19+3Qji
         B4mGhcA+ktyz02/O+NjqI+RAOTuI3FLm2quy55FC6KeI0jNJ1DTiQ3Rylf9+OQB36tDZ
         sOMY0pgclccSFQ1IuuLoZumBGhR81Pdxf+dBaxNb647NAtmkiWOWqXUavpynEKckY8Od
         N4JqNogFSTWbVnXbxH0u5MNm1aQU8aQJa7PMAURiHCSOMU//ehk9fnCe6qY85CMaI+9t
         nsK2VoebdgM++jntqoprluf1h/LyC2sts4coXvaq1BLyoRJ/CQubaa+32Ys+ETPL86up
         0q/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682109662; x=1684701662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G1R1R+9y/Vq4EK4Jc8fmWPCSV6N/m0ufRfE2EE6ej5s=;
        b=CkQFPPg2KD4ptklJh1AVK52TGNYzNZjallMhixZxyazi3f5zOn7DV0w60e8EfReZug
         Kkxpd3f02M/0Rj4NT66MJkhzh1rWtk4vQYH5AVI5w12+ZSGUydPcg2ZDCoiGiWXpsLoI
         bT7jlLRMKjcvKK6+vEQd1Fy/Sl5hjaqe0m0v9/4g5AXQr1JlvDZnoYJeYeDih07vcaNm
         fFKw+ADK7C+rOc48pLYlAM69OaT6GIbVZw7OGEddijr25Uq1le/zk+v9auJxrOaFWSSg
         5Lz3P2uUUtuEs1+W1eu/itJD5qCiJkHQh4xicGRkxSDJxANIoK5lAM8Es69BhIEyWh/q
         B25g==
X-Gm-Message-State: AAQBX9cUrmcphSvqSZnWILJh9I8GvHwIV44Y1cmWGagW65ErCWruPXpe
	TCRkyelL3xkmeXfI9LLFZbQcCw==
X-Google-Smtp-Source: 
 AKy350bnToJH7lQt7K/7Qb9kWu1UwhV68J2McdD1c2ZI/FBg/2DdV6/1qEc2wvpC8gBvGELKSFRC5A==
X-Received: by 2002:a17:906:15c:b0:953:42bf:9917 with SMTP id
 28-20020a170906015c00b0095342bf9917mr3312588ejh.70.1682109662584;
        Fri, 21 Apr 2023 13:41:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:687d:8c5:41cb:9883?
 ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id
 g21-20020a170906539500b0094efdfe60dcsm2423513ejo.206.2023.04.21.13.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 13:41:02 -0700 (PDT)
Message-ID: <aa022833-2380-6a6f-6d7e-47b0098ae18d@linaro.org>
Date: Fri, 21 Apr 2023 22:41:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: max98088: make it selectable
To: Maxim Kochetkov <fido_max@inbox.ru>, alsa-devel@alsa-project.org
References: <20230421200127.16234-1-fido_max@inbox.ru>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230421200127.16234-1-fido_max@inbox.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GEMOYM5ZEYSI2IHBXEZ2RSF566QSGL4W
X-Message-ID-Hash: GEMOYM5ZEYSI2IHBXEZ2RSF566QSGL4W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GEMOYM5ZEYSI2IHBXEZ2RSF566QSGL4W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/04/2023 22:01, Maxim Kochetkov wrote:
> There is no way to select max98088 from menuconfig right now.
> Add a Kconfig menu description to allow building the driver standalone.

Just like many other codecs used in embedded designs. Why exactly this
one should be user selectable, but others not?

Best regards,
Krzysztof

