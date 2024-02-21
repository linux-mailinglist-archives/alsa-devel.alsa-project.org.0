Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BC885D5C2
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 11:39:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C328846;
	Wed, 21 Feb 2024 11:38:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C328846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708511945;
	bh=zN3CUjyqFa6s+ccG3j8jMp2uTOIsTEDMHBCEpbfZTso=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p1B1UhnuqGCK/ASY7+19fdQwu5sVa4pQFVFNy4+f0aSoL3aeBr+DfIhqPleHSxvVT
	 opkWTwqyg+t47so9UultoGaKrxKvpyvWQljUBxSPyGC7OVVUG6nDaw/69q0tDay2Tu
	 tcvuJ/ThoKaUsLUDmHOySK4irvlnvCc0Yzekx8BA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BA89F80588; Wed, 21 Feb 2024 11:38:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8621AF8059F;
	Wed, 21 Feb 2024 11:38:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 851E4F8047D; Wed, 21 Feb 2024 11:30:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0F90F8019B
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 11:30:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0F90F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EXTiPHb/
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-512b4388dafso3814457e87.2
        for <alsa-devel@alsa-project.org>;
 Wed, 21 Feb 2024 02:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708511401; x=1709116201;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+mM4r5l6LdT+myeKsizMxXaYG6u+Ya5ehvtYFAaVog=;
        b=EXTiPHb/WIXjE787l62+ciP4uICO+8oEan5Z1MGbil7hXb9IMU+8QfLgIYEZpZCkS+
         GDcOlkN5ZarbIkPhaD1QVvVU7TquZYK9u5tfazgxnh4uBCwLbWGwe1RjTBPcKEUFDFkX
         6hFhG0wqt1ot7wC4KyvjhRJE0KshqHDwU3wssN2JdB+rhRa7lt3hujOiCeQb7TT0m/3U
         3a5nyGpO99t/6Zue4IL1C9hHogkw6tOqNLFTSaYxIpVChUMA/81kHEw+lLWSebto8Bvw
         JKaZmtPKmQ4Dr1OsOSDp+xKtQVL8OVusxxKqAJDxAtGw4AfNrg9ZyvP/69ZKibyCi8VY
         /vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708511401; x=1709116201;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+mM4r5l6LdT+myeKsizMxXaYG6u+Ya5ehvtYFAaVog=;
        b=Gh+/qX8oEiCDYlEZ4cTaLLKnyqkqBlz8JOtsY3Y0KWcJ7niXZqBLDwS8lWFnxjwH6G
         Ozd16MuGaSqnBH+rOuVKcLAgGHEGmCRrksvVx3ZHSkglEwjhVOJ2yT1s+s4tPQnhCS4Z
         zESA5hLvvOn4e/sQK70mmC994YmzIPPW9QjgZ8eGU4thcFex7PypSj5tVopRECP46Y+C
         1bCegW3FRXErXeJPeIL42WBqXsNywEHupIfl3QkgsuYUr0Pah0BXq6KM8aelVCy7sBvq
         I9ZvJVcpFa2U0e2npH18oJAz8esgfxUsH3/bYecku2Pn93AqvdtCAZARuWfx9z29h9kS
         38fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrFLTBDYkLyUhn94fOSKLwRFaYXQccBEAJC7Sxlv6IP4zl2fwMlGT7rNyNjV6SkEIR1fNcjA8hW4PcQPRr9gDgS4X9zOHGzfXFBr0=
X-Gm-Message-State: AOJu0YwnkjvWBWEiKd3Di6w3OSzKDFyhE5uzjIX0MIQy8izsyL20H+sy
	Mv6d7yJW8IzkEBip9zzjZ23Chj790Z8Rr0KkipgeTxuZzFeIQ9SXGtPiET+QN94=
X-Google-Smtp-Source: 
 AGHT+IFFL+ABu8gjgfDs2IgE7A6VsxBjDJ7JgNFs6fxZ2tfP6QvuaXN9LjhLHtJOCqL0CyKELz72vA==
X-Received: by 2002:ac2:4834:0:b0:512:bda2:7bd9 with SMTP id
 20-20020ac24834000000b00512bda27bd9mr3913100lft.64.1708511401064;
        Wed, 21 Feb 2024 02:30:01 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c4fd400b00412590eee7csm14681095wmq.10.2024.02.21.02.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 02:30:00 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org
In-Reply-To: 
 <8402a9a8a45937fe2e62617ff0c7408503692b20.1702745212.git.christophe.jaillet@wanadoo.fr>
References: 
 <8402a9a8a45937fe2e62617ff0c7408503692b20.1702745212.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] slimbus: core: Remove usage of the deprecated
 ida_simple_xx() API
Message-Id: <170851140025.26081.6374799105426333526.b4-ty@linaro.org>
Date: Wed, 21 Feb 2024 10:30:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Message-ID-Hash: 3YDWFIMDW3YKY4MNZV4YWECVRYOMV3XL
X-Message-ID-Hash: 3YDWFIMDW3YKY4MNZV4YWECVRYOMV3XL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3YDWFIMDW3YKY4MNZV4YWECVRYOMV3XL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Sat, 16 Dec 2023 17:47:34 +0100, Christophe JAILLET wrote:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> Note that the upper limit of ida_simple_get() is exclusive, but the one of
> ida_alloc_range() is inclusive. So change this change allows one more
> device. Previously address 0xFE was never used.
> 
> [...]

Applied, thanks!

[1/1] slimbus: core: Remove usage of the deprecated ida_simple_xx() API
      commit: 6e8ba95e17eede7045e673d9e1b6b8ee1055a46c

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

