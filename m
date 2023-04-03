Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2C36D4C11
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 17:37:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7C131FA;
	Mon,  3 Apr 2023 17:37:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7C131FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680536275;
	bh=01YW6j9QbsBH60bpsALo7q/4eL9AmWqz/jdrOcUPAps=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VaKqcCfm17wVBIX4DJ8auWw4Qq2IGLRasL+EZHQKarevR7oVX2T+8/Unij4Z6qm02
	 jxSKS5+UCdnpSxd5q0NTsjDab3IcPp+QFTuxTns1zjpm0kCdM9+hctw6F4xYpYSWCY
	 oodJEllrfy1sIlEf7vZCv4MQWNDu1XPIQOd3Bzwk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BD0BF80551;
	Mon,  3 Apr 2023 17:36:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13661F8024C; Mon,  3 Apr 2023 11:55:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8B65F80171
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 11:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8B65F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NIUhHe6N
Received: by mail-pj1-x1032.google.com with SMTP id
 p3-20020a17090a74c300b0023f69bc7a68so29901492pjl.4
        for <alsa-devel@alsa-project.org>;
 Mon, 03 Apr 2023 02:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680515729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01YW6j9QbsBH60bpsALo7q/4eL9AmWqz/jdrOcUPAps=;
        b=NIUhHe6NfhPqX4cy71+HFM2TVzxSeaWJarnlnPOjmtZb/lle4mr7/aMYuQJhv6L4g1
         j7orGjNNt2CPsu/Vtm8w/LJURydxnJNfVYw8x2iu5LMRIn+rftKkICWjPvhAE7T4Pxte
         HuxHILEfCLuFJR67dTl3t5QzZ6Xwj78P1WH30QfXecjmOPGmIzFjsrA0SySwWWlXseyu
         6ZcvaMcSB/Qde+jiEw/7XRL+18EZZ+HZLgQzV8L+7vqpoginpfoXo3TmUdT6alkgJrKT
         JV07C+MQofuqUVRk+KlRw49ArXhm417uRCCq1EmZVMITu3pqBiWgp3vOU5c8vbadlmZy
         XzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680515729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01YW6j9QbsBH60bpsALo7q/4eL9AmWqz/jdrOcUPAps=;
        b=T6PQXjTWjzA6Yh6vmpoKZYqxjd32iy8ScxykZz3ekDN5TvpJG5pXBFPvBBPLjp3oB/
         BZf3GG5DOq5hrI9exaXvOyWOtre/NkYGP2aI3mDhxfmNzuY5ztUgohz4Mkq66sJGQIoZ
         urnWhuNURO80wEzg7cW1JCasKzwxakZlMHQ0UAnatkDpxoUzcZ6oO3R0PjZpwAq9Qvls
         hBt+ia/GjNy6tmptakQL8gzUtNP61ndJjAqtU+p7VW9NEAFOg6h+A1WvoS7u2u+fis7L
         nViGLu2Y1Rl2baJASaGzYKtldienpMQxR0bEy62dbR2yU04U3hMxXw8fpBayyHZvmPHN
         5AAg==
X-Gm-Message-State: AO0yUKV7uZ04IiOvL7Bdac/qZippCQNVAFzN5BOTng8DzY4spe7yYxuN
	jtT7McY/sSpktIH+hIzYrIY=
X-Google-Smtp-Source: 
 AK7set8Ttkwf/6RsLkHaQufq9oMn7ZWpapgHzwfOcKUajDBBaul5M+vpZ/Erll/wVWd9sDqik3wl+g==
X-Received: by 2002:a05:6a20:e13:b0:d6:7d3a:c6e with SMTP id
 ej19-20020a056a200e1300b000d67d3a0c6emr30476305pzb.44.1680515728864;
        Mon, 03 Apr 2023 02:55:28 -0700 (PDT)
Received: from pavilion.. ([2409:40f2:100f:dc7:7de5:f2e3:4932:541])
        by smtp.gmail.com with ESMTPSA id
 p11-20020a62ab0b000000b0059085684b54sm6729798pff.140.2023.04.03.02.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 02:55:28 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH] ASoC: dt-bindings: wm8510: Convert to dtschema
Date: Mon,  3 Apr 2023 15:25:20 +0530
Message-Id: <20230403095520.3046-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <9acb38db-bdef-bfc0-5de0-c248d45714ae@linaro.org>
References: <9acb38db-bdef-bfc0-5de0-c248d45714ae@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JVBGJDO5UVW5AUREI6SSFI344RGQMLMU
X-Message-ID-Hash: JVBGJDO5UVW5AUREI6SSFI344RGQMLMU
X-Mailman-Approved-At: Mon, 03 Apr 2023 15:36:13 +0000
CC: alsa-devel@alsa-project.org, broonie@kernel.org, danascape@gmail.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JVBGJDO5UVW5AUREI6SSFI344RGQMLMU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> This should be rather someone from Cirrus or their regular contact -
> patches@opensource.cirrus.com.

Alright I will do so.

For I2C and SPI description, is it required to add it only once? or just not required at all?

Kind Regards,

Saalim
