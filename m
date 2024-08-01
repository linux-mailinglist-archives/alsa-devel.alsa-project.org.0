Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 996CC944D16
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 15:23:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D52703E8F;
	Thu,  1 Aug 2024 15:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D52703E8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722518606;
	bh=9eBP+R9XsVnTmNq7U7lgMOReH2V1pGYxX7nDPUjhJT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jr7l8q24pV4xkqCFcJBMTm8zCd30EW40pS4XJ13NrLHC0jjF406XhNSWuzTuYq8Aj
	 fYI86aY/JgzC5otppzGKXrzSNwxgM0UUDXa67FF+IFwlI3bfqg29oRlAGLo700vUjl
	 4n1a4NhwT+ioeEARVmqeR9UxMjzIIw5TGY4yFJ4w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3B6AF805B0; Thu,  1 Aug 2024 15:22:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36D86F805A1;
	Thu,  1 Aug 2024 15:22:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFBE8F8026A; Thu,  1 Aug 2024 15:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 360AEF8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 15:22:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 360AEF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kACf9SMh
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-369c609d0c7so4768149f8f.3
        for <alsa-devel@alsa-project.org>;
 Thu, 01 Aug 2024 06:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722518557; x=1723123357;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLb1qLgoWsW+gImJGbk5D6V8pIq+tCt6QWx4J0PTTdI=;
        b=kACf9SMhFHfTgqycUGx760EOr6JR9m0LEeMFQ0PEPe03EocAh7B1p9tLvIlbUWnF34
         0XV1qYt/mQ14PwkoGmvLnBvfXI3BSvPvHaCx3tQsxfXYjABWpAZOF8goh3yBIkHKZ6Ox
         DlIOUbGXF274hoMT0OGij1NhGb8cMfZ56d5HAlborPy29DcrmgeJhMgXV9x/sK+u2kTr
         p7d0FNLl8IYLxhig+FI1NHOZkrCxI5u9r1kmgI4AMVOQC5Op8G7Rl/gydPFIXq03OyfE
         YsCvc6VGnjLsajL518mNQJA+CeimWQ8ARFJO2yd3OnWJ8UOtdDt/HY/Vjl37wp3/wHGQ
         5Hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722518557; x=1723123357;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLb1qLgoWsW+gImJGbk5D6V8pIq+tCt6QWx4J0PTTdI=;
        b=LRN5gOy0S7xRxHVpAGfO5ouCLlLiYJNZfyLHoq8RBQz6/YkFoez81g8RmJAAq1c3Rh
         Zt0wXcoDm5/VIT/ooKbqIPZpYTQWlaeKDgQ2fxW9e8Z7Fz1/YO78WfNtxP5EpwF/t2lH
         0ooje3P2QjS6ep/rRg/hUvBlX8niy5g4YyJH4CLfNaOy/IcCJ1OJ4m2lRyXs0kRdaKqv
         bk1Emf/K1296w5IefZfqBmdDww77F8l61brFlAUhMFSTcWqmdKnamchpoaDKZiZcornD
         4uuNjwF/cn2U6yvbd7I8KEkPxEZHjwQWLBQX2LdAZKd527iKeZeMplXk09WQPcPnpiQk
         aJCg==
X-Gm-Message-State: AOJu0YxUuz8+OGytqjyVMdp/NPOqFnM2x3KKbzUD7BXQFqWs+P6vtX3m
	0japtt4HZZ75hxM5Xu2UEdCUkXwbfcMr70eUFzvrTPtCFCilK9SxLosg/zv0vCthmlT1Bj47XZD
	P
X-Google-Smtp-Source: 
 AGHT+IHdTYeZX9njsSBlMwhSuCCo533pJKpUTj72cVr421XYQxWRKflFBRYYw+B2+9i+EmUm4OKw/A==
X-Received: by 2002:adf:f107:0:b0:368:7e54:baaa with SMTP id
 ffacd0b85a97d-36baacbd019mr2170850f8f.4.1722518556920;
        Thu, 01 Aug 2024 06:22:36 -0700 (PDT)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282baccae2sm59558925e9.30.2024.08.01.06.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 06:22:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: alsa-devel@alsa-project.org, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
In-Reply-To: <20240606133615.986035-1-masahiroy@kernel.org>
References: <20240606133615.986035-1-masahiroy@kernel.org>
Subject: Re: [PATCH] slimbus: generate MODULE_ALIAS() from
 MODULE_DEVICE_TABLE()
Message-Id: <172251855614.319902.436135083925671177.b4-ty@linaro.org>
Date: Thu, 01 Aug 2024 14:22:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Message-ID-Hash: HEVKV6WKADI46V5ZPNJ5VNLBV7LWZFE7
X-Message-ID-Hash: HEVKV6WKADI46V5ZPNJ5VNLBV7LWZFE7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HEVKV6WKADI46V5ZPNJ5VNLBV7LWZFE7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 06 Jun 2024 22:36:14 +0900, Masahiro Yamada wrote:
> Commit 9e663f4811c6 ("slimbus: core: add support to uevent") added the
> MODALIAS=slim:* uevent variable, but modpost does not generate the
> corresponding MODULE_ALIAS().
> 
> To support automatic module loading, slimbus drivers still need to
> manually add MODULE_ALIAS("slim:<manf_id>:<prod_code>:*"), as seen in
> sound/soc/codecs/wcd9335.c.
> 
> [...]

Applied, thanks!

[1/1] slimbus: generate MODULE_ALIAS() from MODULE_DEVICE_TABLE()
      commit: 9b6e704955fa8db55d11f2e7be5d723c8186ffc6

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

