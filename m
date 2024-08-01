Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F83D944CFA
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 15:17:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAC81308D;
	Thu,  1 Aug 2024 15:16:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAC81308D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722518204;
	bh=FezWJcZXSPwa0miMtXWDpnY7+lW9+mivzkVuebZLtNo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OqrrRjBIfr8c/F6iSHfPaTjoea+6sjNP9JFkz78w8jk0PF6yC6OUheYqYn8kQz79l
	 t8+s5U/n3Tg8cZY/r6cqZQ5Mhqblxgou/d91aJPjpzhTmsQGJyDhrIJL/JBBg+1iU4
	 c5rHquoLyUXy1IRN82Bu6cinAS+9FOFT8uo9U9GE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7864F80589; Thu,  1 Aug 2024 15:16:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 181CBF805AF;
	Thu,  1 Aug 2024 15:16:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6828EF8026A; Thu,  1 Aug 2024 15:13:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A06FF8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 15:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A06FF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yA3xgCUb
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-428e1915e7fso5204245e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 01 Aug 2024 06:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722518021; x=1723122821;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CjZ1vC0iCfySEQd58xa7MVFn+Ocb6KZ4H4l2GwIiZ0=;
        b=yA3xgCUbCVjmbj6cyNc0OcUekhW6E4hkvT5noeCCqbH4foMxV5Z/yC6Sd4TSDoJEmo
         wf7t9LSoeFnBh/iGLkovm6gP1LtvsqFBMwbipmRuZ45GlKvrNFtMW9+pXTd8amZiPj4n
         wiqwxmrd2pWHH8N43o7JZe/Q9yCtfPxOGwqXSRNztXZxAJ8jLRtIBK9yn6ioymPrvozL
         W7NrZIwgEHylsKlVku+MmngciMSj4f3fQz2JT16yQgPRLkCQa38B7/J/9YzKZd2AATSV
         9PlZ1va0CTcq04Ea4+Uug1WyLqEN7QRf3GsuInrqx0u/t1oamD5l/P9PhfIfjcmZaEGv
         +q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722518021; x=1723122821;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CjZ1vC0iCfySEQd58xa7MVFn+Ocb6KZ4H4l2GwIiZ0=;
        b=ZVGmcgO+EQ8ntn67x+++ECiij7wQvJ4U5lBZOJ9QwgcD7ZFFrySfqN3ukkgB+3Zh7y
         o3oO3twCMfI6EsQ/gf/OOKUbLJI0cKRJKbsACp0fDWMRnu+e0A1FeG70uYz8C46tqqut
         h3FVBe4T+DliYMxSohkL2csg50/rDFpc4xaJI2HZ3lfROudJihecNke0Nm03AanBfW+f
         elML22gsuBiTBagKhtMBbqkrvAU/5dky1uNwxPCPq07CwPk0REt/lUmL5FJu5GVaxED4
         s09Bp+QwnKTEhCsejfrbZGPIAPBZv1dzSyZH61mYqS74tfbvpwx+9K90ghbdlHyYMfz4
         Huyw==
X-Gm-Message-State: AOJu0YxtyzGQzJuIfd6YcD6KRgy6/Jq4J7g2FAqRkOGnzROR4hwuZvYj
	o6y4PUcxjUauuPWocaq3jq+h+pU4gCnBOnD9R28bPBRcirQnZcVtmAbApldtUDY=
X-Google-Smtp-Source: 
 AGHT+IGpqlB45WprqN2tuAckVnZRyymO8xvVzzQaIkU2QYCs4LdKa54Xf4WOIU+bYrEKoop3GYUomQ==
X-Received: by 2002:a05:600c:4450:b0:426:5ee3:728b with SMTP id
 5b1f17b1804b1-428a9bdba7amr18876685e9.13.1722518021316;
        Thu, 01 Aug 2024 06:13:41 -0700 (PDT)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e08012d7sm27435235e9.22.2024.08.01.06.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 06:13:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: alsa-devel@alsa-project.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
References: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 0/3] slimbus: use 'time_left' instead of 'timeout' with
 wait_for_*() functions
Message-Id: <172251802018.319423.11632499569902946244.b4-ty@linaro.org>
Date: Thu, 01 Aug 2024 14:13:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Message-ID-Hash: 4V3X6GGTIPQCH3HL6S6QAAO2YPPNGXJB
X-Message-ID-Hash: 4V3X6GGTIPQCH3HL6S6QAAO2YPPNGXJB
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4V3X6GGTIPQCH3HL6S6QAAO2YPPNGXJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 30 Apr 2024 14:00:58 +0200, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_*() functions causing patterns like:
> 
>         timeout = wait_for_completion_timeout(...)
>         if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> obvious and self explaining.
> 
> [...]

Applied, thanks!

[1/3] slimbus: messaging: use 'time_left' variable with wait_for_completion_timeout()
      commit: 0eb9dda9d1db40acbabe923fe22c002e13890d39
[2/3] slimbus: qcom-ctrl: use 'time_left' variable with wait_for_completion_timeout()
      commit: 7d317b95d0334371481ec00ca31f5bf76bae8a82
[3/3] slimbus: qcom-ngd-ctrl: use 'time_left' variable with wait_for_completion_timeout()
      commit: 9f5fd5e2aebf06c37355cacc7f4b4410bc0ea233

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

