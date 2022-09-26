Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BF35EB403
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 00:01:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C808822;
	Tue, 27 Sep 2022 00:00:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C808822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664229688;
	bh=vCrDXyZgrDvpI0pCkgfHdqYhitVnQAJTiAYoUYAUUUE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jrVC5iOCkVvMf4m5go9lNkEhlfmVmMbgzm1qOvQuDQVn4gLHFGn0w8CXa/2Gy85kW
	 hynuHf3UPKhRySC/vdqkAf/TQ7553pxGvSJtDVBKPhTzeUQIym2EwUTCa/oYs1nlRu
	 xF7cDkNxEn28HqC5qkPZ/0yc7lzYXeJ6dVmlMag8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 929B3F80134;
	Tue, 27 Sep 2022 00:00:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F38BEF8027D; Tue, 27 Sep 2022 00:00:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A47DF8011C
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 00:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A47DF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="kdUvjIZk"
Received: by mail-pf1-x436.google.com with SMTP id y136so8036527pfb.3
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 15:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=Z+V9HKEzE/RCD+QuWbpkWnuj/UNSjdfJYogyydpcU5E=;
 b=kdUvjIZklCh7p0dy2cbAnFPWMnaQ9KU6pSVxgIsJWiq+Rg7+dTzBAtFdhyUWV/brDb
 IpNU0HceJCKIFZWASfKOAiuYPFrkk0Borpnr6U537aRJejJsQ1FDpSlMfPthP5MEWXSa
 tH5lEPrVqifpJ/Q2B8PMTZfLFiNA71z5Vn/X4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=Z+V9HKEzE/RCD+QuWbpkWnuj/UNSjdfJYogyydpcU5E=;
 b=w6gbvx0r96EYknUl9aHU2QQGj8q5nfynwMSYg9RCafJEeWGXTTAbTiP2givtBFT0O3
 7ySKUm9d9Bj/zGDCL65gHRM9xxLuYsjpEaKv+yWvBV/PZ/+AIJT9yP7Xd+P43I1McYuB
 THaMM2pn4s56hcZLsQ6xJ+LrLQ8AZumFh5uWLGr91j95gOUHAsT2bal7kvKWiVSxIFO5
 /6rSG2S/YWUDDhKCkhO3P5/ZMecXfMGMyRRQZFMlF96Opaw12WC7gp9MbhzNf4Zfi8dZ
 9TH+HLMpSgg/72xxrRFIYMUDBxwW5BM7bTFDw+5qeGY54x0L6ukMe+KoJhZmr8PwfniT
 Wc5w==
X-Gm-Message-State: ACrzQf12CvXKpMdV9cMKVL04YdmwPHe6GKWurhzKnjb1C8WBcH7QQnOh
 lddNKzJXal2TcmVq4oP77+jMiJfa0f5IoQ==
X-Google-Smtp-Source: AMsMyM6EH3TLoP5Ab4HNfRJxhe6hu7QGEmIFxPc9r5Y3xSUNCHlUgH+CVhBdd6e51YbiFdKv0fGl0Q==
X-Received: by 2002:aa7:9e12:0:b0:53e:27d8:b71b with SMTP id
 y18-20020aa79e12000000b0053e27d8b71bmr25834865pfq.46.1664229619477; 
 Mon, 26 Sep 2022 15:00:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 a24-20020aa794b8000000b0053e6d352ae4sm6408pfl.24.2022.09.26.15.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 15:00:18 -0700 (PDT)
Date: Mon, 26 Sep 2022 15:00:17 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] ASoC: SOF: control.h: Replace zero-length array
 with DECLARE_FLEX_ARRAY() helper
Message-ID: <202209261500.B594CC10@keescook>
References: <YzIcZ11k8RiQtS2T@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzIcZ11k8RiQtS2T@work>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-hardening@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Sep 26, 2022 at 04:40:55PM -0500, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated and we are moving towards adopting
> C99 flexible-array members, instead. So, replace zero-length arrays
> declarations in anonymous union with the new DECLARE_FLEX_ARRAY()
> helper macro.
> 
> This helper allows for flexible-array members in unions.
> 
> Link: https://github.com/KSPP/linux/issues/193
> Link: https://github.com/KSPP/linux/issues/211
> Link: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
