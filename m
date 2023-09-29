Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FC37B3A76
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 21:16:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1481DEC;
	Fri, 29 Sep 2023 21:15:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1481DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696014970;
	bh=Rm6JXdf9+lBE8RKAJuQjOMxWnCKPnrSEMwlnxiPGaiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CJ0RvJm7hMLgN61zg4Mr3UG4mW+G6516ALqdO045vF45kRTbsFtS7+jFkdm8dUv25
	 mqIFIsgppBrmCYYyhZtKmJfwfa5vAqy/uopAwtbMfapVlu8rBCV7nXRhTmg6VPGm5t
	 tmjZXJ/BiVFW6DcjoTUiO9Vt20716udPte3wdtS0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83755F8016A; Fri, 29 Sep 2023 21:15:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A7F0F8016A;
	Fri, 29 Sep 2023 21:15:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1D49F801D5; Fri, 29 Sep 2023 21:15:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7C52F8007C
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 21:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7C52F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=NNp8jjo7
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-692a885f129so10432124b3a.0
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Sep 2023 12:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696014905; x=1696619705;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGE+mhT2J6BxwaI8MX/iLRb/F1GWPeFnuoGQKhDB53k=;
        b=NNp8jjo74VydLQrJDC3b2e12mV1JNY/d0MjJNW1UhRgD1wJLMXTjxceRTg5u4oqUqR
         QG4gPtq4tmDPdirVPONKLOcQ+Cp8gEC4XKCIpt2J2NN9RAqvBibU207sUhpZE3vPX7OK
         xnhvaWZwpJf9xkKY1SbFSrq/tv4dh7oMfR87o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696014905; x=1696619705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGE+mhT2J6BxwaI8MX/iLRb/F1GWPeFnuoGQKhDB53k=;
        b=wNxVgE7V6OjhcJo2AmnE7Y0BJCeWBy786vgXcItfUgcWCWicQT8zhZFaEA3Ae/YlMS
         0K2ZV7NjcmFAZ0z3B7Z0FcC0CvRoCMXQgxxyuneGL2z0CWhHv2k4r7OPKZh9XhUv3nzz
         SXo0KxKHOl0ZmdvP7lLEYmqNEbPEr+Z6KGOv7xVVVNnTlfLtq4P8CcYLzcxfuYxssq4w
         pZKD55Lh5mlx2JtCgP0dQlmG2Iam6g25GiE5vEE6TbU4jEcdHRpTfbDFPaOONSoi7dTV
         eL7TmvtsNalaAUuykjegHZ4pLChkm1aIqslvjAfuwMcXEeYp06RYmaDYVEDIBx2dUR/i
         jf5g==
X-Gm-Message-State: AOJu0YwxyWbq1OI5+Co8/48557oknLDYxOyYP0oZntNS5angBj1Cu7va
	xDykcUNz6WaymyXMstEXorh12IEsRHPKYyQ7Z7w=
X-Google-Smtp-Source: 
 AGHT+IGdWrWALlMstgZLw0gTzX8sPC+R7tbZh2lrWw0eupjJZhVRje8lP169zMl1usYEXoSsJDs8vg==
X-Received: by 2002:a05:6a21:4985:b0:140:c838:2b2e with SMTP id
 ax5-20020a056a21498500b00140c8382b2emr5182838pzc.22.1696014904595;
        Fri, 29 Sep 2023 12:15:04 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 e20-20020aa78c54000000b0069337938bdcsm4816734pfd.125.2023.09.29.12.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:15:03 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] ASoC: SOF: ipc4-topology: Use size_add() in call to
 struct_size()
Date: Fri, 29 Sep 2023 12:14:59 -0700
Message-Id: <169601489953.3012131.13922425518082792309.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZQSr15AYJpDpipg6@work>
References: <ZQSr15AYJpDpipg6@work>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XGYMMJUNUAZB3CTDBY2PXPTI3S5J2TZS
X-Message-ID-Hash: XGYMMJUNUAZB3CTDBY2PXPTI3S5J2TZS
X-MailFrom: keescook@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGYMMJUNUAZB3CTDBY2PXPTI3S5J2TZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Sep 2023 13:09:11 -0600, Gustavo A. R. Silva wrote:
> If, for any reason, the open-coded arithmetic causes a wraparound,
> the protection that `struct_size()` adds against potential integer
> overflows is defeated. Fix this by hardening call to `struct_size()`
> with `size_add()`.
> 
> 

Applied to for-next/hardening, thanks!

[1/1] ASoC: SOF: ipc4-topology: Use size_add() in call to struct_size()
      https://git.kernel.org/kees/c/93d2858dd630

Take care,

-- 
Kees Cook

