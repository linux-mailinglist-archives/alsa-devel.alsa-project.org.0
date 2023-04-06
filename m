Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFFF6DC414
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Apr 2023 09:58:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3321F32;
	Mon, 10 Apr 2023 09:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3321F32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681113512;
	bh=Ig2j9q3aAOVCQfCvRLVncYPX5OlaQ38a/pqikiP3erg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OOZnICI1ykDgML3OqwYc24WJ4wH0m4IiQuSu4b3Dp4mH1Foe8ijZ4aBYx26JQRUD+
	 orlwsAo1PHXo7yiuIsoCA+jmkYFC0R935jX4jG5pZaz+I4W5JLneGmGPLfKTxJDeJs
	 +f4jFPXUfPwwyVluks8+zMUwv2oZfvcewbw9ZEyk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C0B1F80533;
	Mon, 10 Apr 2023 09:56:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01509F8026A; Fri,  7 Apr 2023 00:11:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5A5FF8015B
	for <alsa-devel@alsa-project.org>; Fri,  7 Apr 2023 00:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5A5FF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=prRcBOFL
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2448f0ac512so40072a91.2
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Apr 2023 15:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680819103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ig2j9q3aAOVCQfCvRLVncYPX5OlaQ38a/pqikiP3erg=;
        b=prRcBOFLuhcVEr+EkDvmh+OFhD/AyqbYOIlvGjcd7mQeDdD6G8gW8jHthX+oGEsj6s
         rueRKX4peZmKCkhf6Cic1mbIKytP4G+Iha+tzUMYGGqo2MEbA2Weu5/KMKGcBvv9HjKh
         U7ScrG2oLRVo2d/UiFoIYWJ/q1jufkdkg6foumJ6lIC4vqYCfulYDK98FTR8miN4eC1k
         nsoVU/6rlQxwqvnmiSYgxY17zQMUbXY3ZX6zaFkKQKCQwikUSFMGf87aBEsuwTIH+m4n
         v1SNUki0G2EZsrPd0DOZ9LNDiAg3bIjFNzVUzyx1r3lbOj2Pv1Kjv8iCZqi+0R89WdbQ
         HwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680819103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ig2j9q3aAOVCQfCvRLVncYPX5OlaQ38a/pqikiP3erg=;
        b=BFg/ysXhIfC8gBOJYyeMn2Ots9BX9ovNpQuSJIa2Tjzw/eq23jFnOFFyCZi84rkEn4
         wni5/vGP3Q9ZQR4xc5Q+QC0GlPnHfNr8UCf51Gyx8lTJQdlAImn6tPqyoot7QJCGAM3X
         aidfNt21xBd8+pS4Uf/EDU8jikG+H3TeNyWLM0XFR0wDH4GMWQLmrG6Ehgx/okaOWXMO
         ZSbOSd7WPc/qTwO/eVlQhPcDzYQZjdG/d7K37AGOLXDOOQRS67WGSwI3Rlrl1A49cP18
         JX+Fif1d0wlqh0Z+SRe+c71EKZgo9Ap5OoETwxOphQyHPEsOaoMcacH9zSj+i0/JwHf+
         3XuQ==
X-Gm-Message-State: AAQBX9e4PomAm9c8UNfY7FnfIbxr/Xr633kra9cdd0qDYplAP0fo/v2H
	8qOJKV+hUQtBSN0HLlNh0P8=
X-Google-Smtp-Source: 
 AKy350bb+gVIZ1rG4JJ3Lwm3aJIH0FKn8eOKdwz5o2qclXtCgbefVfJWkWCvM1Ebe1vooe+xyxlNpw==
X-Received: by 2002:aa7:8f02:0:b0:625:7300:5550 with SMTP id
 x2-20020aa78f02000000b0062573005550mr303434pfr.31.1680819102651;
        Thu, 06 Apr 2023 15:11:42 -0700 (PDT)
Received: from pavilion.. ([2402:e280:218d:82:a082:a1e:6444:f6a5])
        by smtp.gmail.com with ESMTPSA id
 t23-20020aa79397000000b00627eac32b11sm1788849pfe.192.2023.04.06.15.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 15:11:42 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: broonie@kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: wm8523: Convert to dtschema
Date: Fri,  7 Apr 2023 03:41:35 +0530
Message-Id: <20230406221135.4761-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2c32b1e0-20f7-4d9f-9dbc-8725562e456e@sirena.org.uk>
References: <2c32b1e0-20f7-4d9f-9dbc-8725562e456e@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MVYHLR3RNXSI4T2SSYT5AWIHKTKAFF2T
X-Message-ID-Hash: MVYHLR3RNXSI4T2SSYT5AWIHKTKAFF2T
X-Mailman-Approved-At: Mon, 10 Apr 2023 07:53:29 +0000
CC: alsa-devel@alsa-project.org, danascape@gmail.com, daniel.baluta@nxp.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 krzysztof.kozlowski@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MVYHLR3RNXSI4T2SSYT5AWIHKTKAFF2T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Having a single file for other manufacturers, wouldn't that might cause issues with finding them?

Kind Regards,

Saalim
