Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 084048A0CCF
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 11:50:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BF7C2235;
	Thu, 11 Apr 2024 11:50:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BF7C2235
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712829039;
	bh=6Rtgkt8tWqoIigwBFijC9Y1w00fEx3L8QiXMXAulxv4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=olGhiffzc4IExhskJudPgAXeOtQctPMhzFJvm7MCGrKgqggUhDxU1YG1wJaVFbe7P
	 5weuQnFdMhT9sYjT8FxZSEHALUDW6lgt8LkhoIILJ60yNmEq/lccCHRmd1zc8xWyTl
	 3PC5GVtFgsAN3uIBhUgdxDP73XUxqlAR6+tAjieA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B71CF80578; Thu, 11 Apr 2024 11:50:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32586F8057D;
	Thu, 11 Apr 2024 11:50:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE814F8028B; Thu, 11 Apr 2024 11:50:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64FEFF80130
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 11:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64FEFF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ASfit2ui
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-417d029bf15so4545045e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 11 Apr 2024 02:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712829003; x=1713433803;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPQJJp/mQ3ASEgmyqn/FrA7Op/MFUN8aZ0h3ZId51G8=;
        b=ASfit2ui5xTnwQZAfhX93fYzxGlHBciarNMtMZbGdd1RuX1bP8zwtcw7//j5uhGjhk
         keZqMc6gOsxlZvCPtK8oEdU3M0wNg+WXJKfhPoCtIcsi347xaSWnRWpC/ZLGNLmmUbMA
         l5gb4+0aDASI0n5VASWHf8vQk1iYLpGPDQJQNMhxVbzuFwi1O7+z8m7tqsyfdh86YHsf
         bVPK7iVVvCJP9qCkf4kwPy8/MRc3Rx/REDpn3PN5Jksex77yVtmdKGnWzLn3EAw5Ss49
         gEMf4bZR+svpmv3ITdJCvQ8P4lE1yfdRPzMoKDBFPBIgC+keiF37i/i8ZL58SF4maTIA
         NUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712829003; x=1713433803;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPQJJp/mQ3ASEgmyqn/FrA7Op/MFUN8aZ0h3ZId51G8=;
        b=AdPlhAoV6luZrvnSD0ya5gcvFiq1W6M6FMYC2Ihi4343ykJ4+ZaQSqdElG/BJ6pb2S
         KyV/Wb11hfp043qBfDC/92/bXNItOkU74ek3wMSF1AmN7SK9qGGBE6HFbf1uBhqUc8rQ
         IFUnqj/zj1p/Fo7RLrOV7TDbzkdIfSe6DrVGp85XRyaHIzgbjADgzLx4JXV4Ftk/NfWp
         epHmOEEPkGcGOVu/CQ94oQ+Jg8fN7bTKm8hjDAU2DSZ22grjnS+ma9KfVdCZ7w6Ghf1v
         Lbfq6Uh9eyRGRu9yJJaSFcgbF4ZoMLN9QaGGE50X0TDgHkz7mMfCRRC4UqfQYkYTNeE5
         TtgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPSp89dXaXI0mxFmlgePFb4/yq9uhamLn4EKKkWGfUZD9JikbMoGxtZgTOZw4nl4lUPFfhWNuO7toxrnoKc5Dtg3S/cQwP+esebc4=
X-Gm-Message-State: AOJu0Yz4iUHpl3I3YW+Jw16e74bMo1/Fvsj54YZlzJrJ4l+25TgG7MXs
	GL4cXsFJGuAlJnPCLVkrNijPmvdhl+uZ8nW2kbAmK8lJ0y5vmmaGG0XnCmccn0XwmnRBZ8TCo7x
	m
X-Google-Smtp-Source: 
 AGHT+IH0e0UOosGzS21RgtNIpgSEjndqk/+zayFytBbkrbw/3YvQelBToR5Os8Vg8YpzKMjd2b3EiQ==
X-Received: by 2002:a05:600c:2494:b0:416:3478:658c with SMTP id
 20-20020a05600c249400b004163478658cmr4416146wms.27.1712829003248;
        Thu, 11 Apr 2024 02:50:03 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b0041638a085d3sm5047666wmq.15.2024.04.11.02.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 02:50:02 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20240410170129.248361-1-krzk@kernel.org>
References: <20240410170129.248361-1-krzk@kernel.org>
Subject: Re: [PATCH] slimbus: qcom-ctrl: fix module autoloading
Message-Id: <171282900257.158197.5427243198462918285.b4-ty@linaro.org>
Date: Thu, 11 Apr 2024 10:50:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Message-ID-Hash: YVB2NXIUGNUFSOZSUNJRE6MBFL2RPTSV
X-Message-ID-Hash: YVB2NXIUGNUFSOZSUNJRE6MBFL2RPTSV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YVB2NXIUGNUFSOZSUNJRE6MBFL2RPTSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 10 Apr 2024 19:01:29 +0200, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.  Pin controllers are
> considered core components, so usually they are built-in, however these
> 
> 

Applied, thanks!

[1/1] slimbus: qcom-ctrl: fix module autoloading
      commit: 772be93c1c247d006bac1a7fe967864d90a34415

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

