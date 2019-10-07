Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A85F5CE7C2
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 17:38:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FD931685;
	Mon,  7 Oct 2019 17:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FD931685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570462727;
	bh=Xv9IlC2MW5YBqIKtd74ABfeF+ygYl9kyNowkVBgNfjc=;
	h=In-Reply-To:References:From:To:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VliL9UBS+k6VU7gkPqtT1Q+IEtdJQCgpii2TixI4tVXZoXsunaN6qzuxI21SvSoLP
	 xt8h8TKZN8IWbutVRWUL4jw0r3UUjQef5GvA+qUmZr0sxqhma6SJW1acH2+JqdQo93
	 Nk1lqcs4RidfU0G5cL0VoQ75VC7a4Cjd5g9lFu4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B671F802FB;
	Mon,  7 Oct 2019 17:35:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AFC0F802BE; Mon,  7 Oct 2019 17:35:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9323DF80137
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 17:35:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9323DF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="aMLKJPZS"
Received: by mail-pf1-x444.google.com with SMTP id q10so8931878pfl.0
 for <alsa-devel@alsa-project.org>; Mon, 07 Oct 2019 08:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:from:to:cc:subject:user-agent:date;
 bh=9grFCI4XfO/P0ws+W1hJ+qqcKoeFDoYdqOk/sFE2nys=;
 b=aMLKJPZSjvPLIvvPUOcLneGm6UxCTtoLtzu9ffcLbVXvDidM8JuF1e+MVb3sIS65Rq
 U+WAA8O0CjIgP1SVdukQJ1n7LhU5IDHRkmgOsXRbwgbLurkHtpICBk6CDY5zOBvJOuKG
 Uk12yc1LHvoAeGZUh/7hlz1jJKzEGxP+syK4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
 :user-agent:date;
 bh=9grFCI4XfO/P0ws+W1hJ+qqcKoeFDoYdqOk/sFE2nys=;
 b=Leb4+hst/bIkRxS5i+ITPw1oM/GlLTpdT5uXbF2+KdlTstl4pfYlIma6N6pL1qXSRB
 6d3nGz7yTxgoJ6izNCemdyv3CPZI5QCHBMqBI/Qxu+qU4wcRnIMVshZC7j9x8UeDKerk
 8L1JYgy0z9eLnEfJ9g24Y7AA3IszlcRiFww2mLDtx9m34svHRyyvVy8BbfmrB31/SASN
 d2kOL/7Q4N/b3LEMMV7pJz7IxMie8n+3GBBuo0Odu8Q79IGI2g82YrznBMgRf5hngDn8
 nWkemU0ssDeAUOCFdb64UDGimAvmdnUAeYJsxc5ajUkwZthZ3ZAzO+RVQA6/oXPpbDHl
 8OXw==
X-Gm-Message-State: APjAAAWCVpHS7hjZxS97trdaEHZDIQKz0kSYsSyrNSd3cstQqNo5HJio
 lEk1QQvqRqdDEUiGEWIa6L6ytA==
X-Google-Smtp-Source: APXvYqxI/+jk3P66gPY4uMBlG8j+Wudd2oTqEZlZdOkg+hiDgW6/L1ArOedrtmf15tLgJKc8pMlAUw==
X-Received: by 2002:a65:6644:: with SMTP id z4mr4897044pgv.208.1570462527521; 
 Mon, 07 Oct 2019 08:35:27 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id i1sm15674482pfg.2.2019.10.07.08.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:35:26 -0700 (PDT)
Message-ID: <5d9b5b3e.1c69fb81.7203c.1215@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <CAFv8NwLuYKHJoG9YR3WvofwiMnXCgYv-Sk7t5jCvTZbST+Ctjw@mail.gmail.com>
References: <20191007071610.65714-1-cychiang@chromium.org>
 <CA+Px+wWkr1xmSpgEkSaGS7UZu8TKUYvSnbjimBRH29=kDtcHKA@mail.gmail.com>
 <ebf9bc3f-a531-6c5b-a146-d80fe6c5d772@roeck-us.net>
 <CAFv8NwLuYKHJoG9YR3WvofwiMnXCgYv-Sk7t5jCvTZbST+Ctjw@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
To: Cheng-yi Chiang <cychiang@chromium.org>, Guenter Roeck <linux@roeck-us.net>
User-Agent: alot/0.8.1
Date: Mon, 07 Oct 2019 08:35:25 -0700
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hung-Te Lin <hungte@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Mark Brown <broonie@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dylan Reid <dgreid@chromium.org>
Subject: Re: [alsa-devel] [PATCH] firmware: vpd: Add an interface to read
	VPD value
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Quoting Cheng-yi Chiang (2019-10-07 06:58:41)
> 
> Hi Guenter,
> Thanks for the quick review.
> I'll update accordingly in v2.

I'd prefer this use the nvmem framework which already handles many of
the requirements discussed here. Implement an nvmem provider and figure
out how to wire that up to the kernel users. Also, please include a user
of the added support, otherwise it is impossible to understand how this
code is used.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
