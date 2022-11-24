Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCB86377C6
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 12:37:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7925716EF;
	Thu, 24 Nov 2022 12:36:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7925716EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669289832;
	bh=b/jJ/b2IcDjdu3R7FGNacN4TNVecYpdcFNvFPYff80U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G1Yga1wIV3jg/EJDxUTid5yV5agCzL0jGSi9WkDzxTtLqrjywRvowCVdowNmqj/vD
	 2OWp3evAiFv9GTSGq4Gjroj++2/66+EYVq5YCFEuwlRjtHFOvF9nRmh+MD+u8mvg03
	 zd+mbknn8JvLp0QKDPac1fHXcmAuhCUgVThC++1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08676F80245;
	Thu, 24 Nov 2022 12:36:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EF6CF80115; Thu, 24 Nov 2022 12:36:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4DE1F80115
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 12:36:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4DE1F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LbypaNLt"
Received: by mail-qt1-x82c.google.com with SMTP id h24so869309qta.9
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 03:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R8BPplO7UlHzk5yo9FOzqotniwR7y6QrBugM8+AwrSQ=;
 b=LbypaNLt3I8EKendSm8Ba65FJIvtubs5gAuW3xGDHqOAfoeX1Hmk9OZI2F/7FEDdYx
 Qcc3c6HfKuCzbn6ji+HsvkUbLRLMpB5hP3nnKRBNPuUdJtrc28TJ6MLZH9f7o06NUlbi
 Hvl9kK7N9VGCdb5n6/VNxsXgF6XcfTmWZ3IMf0s4umGt194DCudkY16GlJeUmIXtrfqA
 lyvZ6pkAVWUXrom3u+RuIxme0er08h5UyHGiawIAMx1ydF7++Jz/R9JPMQINCUbBaKkP
 hD28P+tFhj5TfQr5dzL7iDwFXG9htX+S/N/B2n2nwUBKNMWJ4sdsMdeA7iGZakXSlKaJ
 jcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R8BPplO7UlHzk5yo9FOzqotniwR7y6QrBugM8+AwrSQ=;
 b=HZ9Qu8VHbOxPghiC2ICvfxdT8tiPqcG7tooTVHAcEZh4jv5aY12isuRaN1fw1BPGlA
 9jssI/1vDk260lKn1ndZVOtet0NvTlRrS0zY8SpWU8yXK5TWDcDVhCFwZeUBs5xFnMDQ
 WDUkuCwTFtbpCJ2+PPORmcONtlSVicrIqEqlZM4AUSQVEELJAvQ/+kAmE+y5dK3nMbLG
 DEfzey1yRd9bygUfWTA5uwTpFWkJ8EU1ge3xZguvfFLd29yu0oNxiqt/SddQl2+Vh4ny
 tIRvkwRAMhfQz7oPhBu2kkOf6PN7RPHphYqbmXKnhFmwfi3cVhtVWpUCKVnPJxWleJGU
 L8xA==
X-Gm-Message-State: ANoB5pmB7gSvx/VcX5V6umaUyK7Kt1GwFMjn1KQizfu4+WmxOdHx63uj
 MFgbKp3bIWdWp2aLYhJmNCRfdIoALJGhnvThZKI=
X-Google-Smtp-Source: AA0mqf7M/JAbmhM35ZrYv+M8CxU6vmyIv6WkHYgF71vj9U14wRfDHw8RbyhLhPBoGOyOO7XlkK+mIf89b1QuhD8s71c=
X-Received: by 2002:ac8:4cd1:0:b0:3a5:1940:a027 with SMTP id
 l17-20020ac84cd1000000b003a51940a027mr29417932qtv.195.1669289766424; Thu, 24
 Nov 2022 03:36:06 -0800 (PST)
MIME-Version: 1.0
References: <20221124110718.3925934-1-sbinding@opensource.cirrus.com>
 <20221124110718.3925934-2-sbinding@opensource.cirrus.com>
In-Reply-To: <20221124110718.3925934-2-sbinding@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Nov 2022 13:35:30 +0200
Message-ID: <CAHp75VfUqkxyB7J8fbfQKCMaSa55q4zqt7btNb_n5E3-NWhQyg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] platform/x86: serial-multi-instantiate: Set fwnode
 for i2c
To: Stefan Binding <sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, patches@opensource.cirrus.com,
 platform-driver-x86@vger.kernel.org
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

On Thu, Nov 24, 2022 at 1:07 PM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> This allows the i2c driver to obtain the ACPI_COMPANION.

As far as I get how it's done in the SPI case the real fix should lie
among i2c_acpi_new_device_by_fwnode(), right?

-- 
With Best Regards,
Andy Shevchenko
