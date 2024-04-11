Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9791A8A0CCC
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 11:50:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 930DC27AB;
	Thu, 11 Apr 2024 11:50:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 930DC27AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712829012;
	bh=YljiLEM+2502rDhcPH5SPGgvCOflIAg75YCzejRyOxc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qgzA3s3gIJJBa1QHFJD1C2z3tKUHxk/BGvt10F9bLbaFIfck0GhJvP4W7RmO0kNbx
	 ap6QvpzT7lXo+SYQ4Kx/WGQa9W2rdby+KchIbT1NTeskwxTnLGevVnAo83xAxmZQKE
	 au82LUoXMX+zKSqh1LWhf2RM4KzUw3hhaEfB+jsk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A19BF805C3; Thu, 11 Apr 2024 11:49:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF10EF805C4;
	Thu, 11 Apr 2024 11:49:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7D31F80423; Thu, 11 Apr 2024 11:49:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFF8AF80578
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 11:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFF8AF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Vq5jlkE8
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d87450361fso70048071fa.2
        for <alsa-devel@alsa-project.org>;
 Thu, 11 Apr 2024 02:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712828968; x=1713433768;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0Ot7Mdt2VD94EglEUw0Txp6mp1b/ubctfzlEme5QGA=;
        b=Vq5jlkE8aM8380vLJrTZr8MHNmNauInIDTKW9k3KFfHcBfw98XmjN8MDHcvZlQHmZF
         Sc5Jrk5RIrN5UlApXsXQXSd6Z1yOrQhO9p5B/lXxn1I+zeDoUWtiTUp/LtiDNOkO0tPF
         iyq1l9S0xw9H8MHeenoiEHTHFbBnYPZL3mnGMSTFIKpdtpUQaSx9CMFe3ZcW399vrfbi
         AsGFJVloFOwHZqAUyIOTrCPNbPOCA7ksPWDxI+jxd5bD4ck5jMTAkt13hRqt/lQ8IKfQ
         N2VB6kW/RB4HTFUR4r/jNFiTJYPaglTbrQdykDA2/rBEO4gk08T8AOdRmiIM8M+VuUof
         Cdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712828968; x=1713433768;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0Ot7Mdt2VD94EglEUw0Txp6mp1b/ubctfzlEme5QGA=;
        b=A1j8N+aWI3pVsUDKGOrqNG/AmVjvhdPdiNAAqEPQ7Tk5gjB37XauhKlDHGjfgpj9ql
         XC9jeRZWzNwf84TS8rEp6EGQ9WBFz3H5Lbsr2DhnbuYud7j9t3wI4+Nw5p5Nbjr8ohVc
         F/spfZSrIEesrdNsE5ArqPDhVQne+xpRoQWHu7Ge7scmaEmjX7eHN5xlZppsrVvM+0cr
         Ltfj+v42DCNlXILoMD7BLSMUKacoR4EGPAKGM/Pcque8Bhd1M81nPvYN6XWvWroyc+Ey
         NoCjyFPw/sueuVluCZqHUi5fwdTONH+H+mjEz6tRz9Qs2667mrfcnfNlS8eaEfxQvQUo
         2RVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN2X4IhzaL9lBxB9UsFpLxb0lSSSMmZes0WQxyCsFmmSG38asq3PpKEDbuxy/ASMWmHh+XI+MppB8TonOpgM6Ly6Hy+g0GRPVio5I=
X-Gm-Message-State: AOJu0YyL5V4lkIcSPFcORauv3isWe5a0Tt8AGi2ayEO1o1twtE+J9MFD
	MWZkyvsisY6ri/voW9SkZqF+nl+Uc5q48uzBPsGb7ZBL1T5hLvLwfpcoRwLcgls=
X-Google-Smtp-Source: 
 AGHT+IHmv9BSzH8SzRers7OY2UQV4cLJI3NNIheWaBTAk/ZLpUWaujEKBeOt+Mndy28v4BrrcjLXeQ==
X-Received: by 2002:a2e:9b0b:0:b0:2d8:e978:e38d with SMTP id
 u11-20020a2e9b0b000000b002d8e978e38dmr2048890lji.10.1712828967797;
        Thu, 11 Apr 2024 02:49:27 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 be3-20020a05600c1e8300b0041632fcf272sm1792905wmb.22.2024.04.11.02.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 02:49:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel@pengutronix.de
In-Reply-To: <20240225001911.46196-2-u.kleine-koenig@pengutronix.de>
References: <20240225001911.46196-2-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] slimbus: Convert to platform remove callback returning
 void
Message-Id: <171282896694.158118.17443154512490212488.b4-ty@linaro.org>
Date: Thu, 11 Apr 2024 10:49:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
Message-ID-Hash: NH66WNC6FBWU5EFMEAXGHNRGW2O37TRD
X-Message-ID-Hash: NH66WNC6FBWU5EFMEAXGHNRGW2O37TRD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NH66WNC6FBWU5EFMEAXGHNRGW2O37TRD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Sun, 25 Feb 2024 01:19:12 +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> [...]

Applied, thanks!

[1/1] slimbus: Convert to platform remove callback returning void
      commit: f6c637ffe528068f5470551a1424f173a139d0c7

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

