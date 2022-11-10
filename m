Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BE7623F4E
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 11:03:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04CB51638;
	Thu, 10 Nov 2022 11:02:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04CB51638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668074602;
	bh=VU3oEISNUYg+d9wlGb/h98JkMGsEQ9ti4i8WQ+4TZ8Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HJDW3jSbA5aWpfeChj2SG9r1kyVKtuAulM4S+5NCOSwEqhamSQZ9W1nBwPWrTTaWn
	 KgubuuBxg51pc0Z7LSHhY3e8yiQQh4Bz65L6UvHLpmI7E0VNVbYtAMUWy51XKUZ4Yf
	 JLA2Hf5TUSVEoeSizJen67KaaGdgPm8qyttBsbrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AD1BF802E8;
	Thu, 10 Nov 2022 11:02:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A31EF8021D; Thu, 10 Nov 2022 11:02:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54B1FF80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 11:02:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54B1FF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="l+2q3EoE"
Received: by mail-ed1-x529.google.com with SMTP id v27so2310838eda.1
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 02:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VU3oEISNUYg+d9wlGb/h98JkMGsEQ9ti4i8WQ+4TZ8Y=;
 b=l+2q3EoEkmW8KGxjLUAosaPRqu2QuiS97YcetdfBswNY2l1mTPG41tKL/97tNx2aqd
 7mSqpF6EUPeU2jC3TP48/iKnJqPBF5FE2P6AjYJZGIu56KfW7qJL3cmD08aTmnBO9lVE
 07dTococsvCklATL4SyE1b/aEr4+0J06VUIQYMJyDglGDouF0LJI4htyQq8QwuxsUsyo
 w7oHSV75DAvKrCuBRg1V+HMXwXlBMcPYYy1GwTQXuMfSt+qEFbOJz2ST/Akt2O71n796
 mpvHe1TqQ2cvW+5JN36H8uHw/pkQ/k8tQPO/FF9mBxquofw6+JXnXMMGJ3aOa1/7hOxc
 aV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VU3oEISNUYg+d9wlGb/h98JkMGsEQ9ti4i8WQ+4TZ8Y=;
 b=2cGq2b2aWZasQyXJO3hzodH8qN1lwZRSxF9qa8zVrtOJOfXloT0UB6tuVkly7TrLt/
 xC0rfpGTcpnEB28HV4wiQfgMZ3LALoa4OY0aZk9ssNBhz4w2CMKAS8mB96TOFyyoiMF1
 e2Ft4KgD4Zwkhhk7pBUh5W5jVGr36Qhh9CnlIH3OsPtDK3Q3a96ly3Ig8IlFwIR9L2eP
 vWoCQDMo1YAMP99LWq+AAfBx58c/2Vu+WcearhBjMHlSfcRc5USfPLEJa6GKyFgsz6fP
 Bk4tZB4Gt4efBMAYcROMqcXydpkV894I8IDXCg1hZ6fGXwfTueNLVqtfPxhBndJ/y5Yb
 Bw+w==
X-Gm-Message-State: ACrzQf1P/9RjW9EcQepn4K9tKiLU6GC8OH4+FocKmMVj94Ug8Ds9P6vv
 vjdSVpAnxlqZz1NoaOUoOlDkFv9RifPVedNa0BmAlw==
X-Google-Smtp-Source: AMsMyM7KfumBAxq1O0Hu284/fJyh87E4kMzRSpVWatlLqnsWvCWqK/Oe0aeHJFcUG6KvsBG6hLjUYXOuJ/9EBvQNA3A=
X-Received: by 2002:a05:6402:659:b0:463:a83c:e0af with SMTP id
 u25-20020a056402065900b00463a83ce0afmr1914987edx.158.1668074536441; Thu, 10
 Nov 2022 02:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
 <20221109165331.29332-6-rf@opensource.cirrus.com>
In-Reply-To: <20221109165331.29332-6-rf@opensource.cirrus.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Nov 2022 11:02:05 +0100
Message-ID: <CACRpkdbY7W2rDZ4knkrRHBSTn7MKYV3LYh_r8Wkn1Hh=j+oL5A@mail.gmail.com>
Subject: Re: [PATCH 05/12] pinctrl: cirrus: Add support for CS48L31/32/33
 codecs
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, maz@kernel.org,
 lee@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-gpio@vger.kernel.org, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, patches@opensource.cirrus.com,
 tglx@linutronix.de
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

On Wed, Nov 9, 2022 at 5:53 PM Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:

> From: Piotr Stankiewicz <piotrs@opensource.cirrus.com>
>
> Codecs in this family have multiple digital I/O functions for audio,
> DSP subsystem, GPIO and various special functions. All muxable pins
> are selectable as either a GPIO or an alternate function.
>
> Signed-off-by: Piotr Stankiewicz <piotrs@opensource.cirrus.com>
> Signed-off-by: Qi Zhou <qi.zhou@cirrus.com>
> Signed-off-by: Stuart Henderson <stuarth@opensource.cirrus.com>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

This looks OK.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Does this patch have compile-time dependencies on the other
patches or is it something I can just merge separately?

Yours,
Linus Walleij
