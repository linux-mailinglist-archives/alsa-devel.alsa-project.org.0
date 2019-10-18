Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D77BDCEB1
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 20:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2258A9F6;
	Fri, 18 Oct 2019 20:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2258A9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571424609;
	bh=BBlseYKUqrBFWwsuTvpipbU+nVuryoxuh0evNT+knBQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bv2Bm8T82OR4uKgl789QiX24S5JDHPbAqpY1Mb4Mz+LtptmlBwhxJu9bOCz4FRyEe
	 gWzdU0ZakzXUbCZYhLizLT5eiav2BiHWEclTwdzhJMjE9QLOW6ExduNVivHeQY+KvS
	 wdnM1JcK/y13nwFhLv5WFpeiuD+cX6Cy+4bdSBrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64C06F80362;
	Fri, 18 Oct 2019 20:48:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40671F80362; Fri, 18 Oct 2019 20:48:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBE50F800D0
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 20:48:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBE50F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nq7ifkSW"
Received: by mail-pg1-x542.google.com with SMTP id p1so3844566pgi.4
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 11:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GhekFAP9STOj7Nck5xlc736VlW5iBvMLqnVMOxCxKvk=;
 b=nq7ifkSWIToa5I6g+4rLSg8PHDlLTw6sVriPzMqwLyL1U5F8+028XAzlRa/udM37u2
 IhA0UyYp6F+7ywfOdfaNWxQCMTMOWuL8HtxDQEhuCxw2TfjeU/1gdW7t93bK+VDfAcTg
 pfo6iiwkuaTPalYjOaazTni3qU5XLRdsfiyDPqItneeA0bQXnbaHtFuw8iRGNjF39B4W
 lt5QbWDbHM+8WrHSoEaeDZEsnNjlqC5r2UARp1vfD9y8vj6/yXwpuuBlqOTTfDzBXDs9
 +FfX0SLtOMSWhq1Ah85J0QQWGmRg77zVUbZGDPG1IKY0ugY8WtqD7mvAONygnf9oMrZb
 NTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GhekFAP9STOj7Nck5xlc736VlW5iBvMLqnVMOxCxKvk=;
 b=FOz2fKaKOaHLeusNIykK8A0h2Z60n6TYo0wr556LuLhaBolIcSIYE9r5tNBw4iMSQz
 CGYWDbjcTCOySutRZQyN6ybQCEefRkwF3mYYM8UTFwuVyH9okA3J6ri5kWbPRthidHm3
 8ENDbgky3Xvni5CPw7Q98LvhBrRcMTGWqAIIUDBi0Mks+dWXjZ8wcYJlsIL+3CGbUOcT
 FRpVcRkZsOyEl/Ib50YV/ypuBAHX59IambMi5BJs4Hfm7rqUbGZj5bveh0TRUYPHV1Gc
 TnGszvquvYIpNpC/1NfLtW8gFp1YnYt4fH4EzD+F2dkyhCQKwpprrrr0H+azI4CYp3qE
 pRwA==
X-Gm-Message-State: APjAAAWb5ggc5P3WoQJJxebP5ZrXZWFUTZHj2KNdX50ExdlB3fdf/afU
 SFEDX0nXCiyVU4uGIB1bLIM=
X-Google-Smtp-Source: APXvYqwsgKLXB40xjU+zPd0jglpCieWEDSonZkG9+b++J833wiGysvtehr/Wkf0Gua652wYqwRTXxQ==
X-Received: by 2002:a63:1511:: with SMTP id v17mr11529604pgl.34.1571424498309; 
 Fri, 18 Oct 2019 11:48:18 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id u5sm8212572pfl.25.2019.10.18.11.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 11:48:17 -0700 (PDT)
Date: Fri, 18 Oct 2019 11:48:15 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191018184815.GP35946@dtor-ws>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-29-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018154201.1276638-29-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Daniel Mack <daniel@zonque.org>, linux-input@vger.kernel.org,
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 29/46] Input: touchscreen: use wrapper for
 pxa2xx ac97 registers
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

On Fri, Oct 18, 2019 at 05:41:44PM +0200, Arnd Bergmann wrote:
> To avoid a dependency on the pxa platform header files with
> hardcoded registers, change the driver to call a wrapper
> in the pxa2xx-ac97-lib that encapsulates all the other
> ac97 stuff.

Not supper happy about adding module dependencies. Can we include
mach/regs-ac97.h from include/sound/pxa2xx-lib.h and use static inlines?
Someone needs to include mach/regs-ac97.h in the end...

Or there is something later in the series that needs it?

Thanks.

-- 
Dmitry
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
