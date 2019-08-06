Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8BC83876
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 20:14:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D81A857;
	Tue,  6 Aug 2019 20:13:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D81A857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565115266;
	bh=YmfKpR7guZJxcSgBlcvKiWJ33hDweZbZw5LY6p/4cAM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aEaDpLDWRta0naIcxnuHKTnjaOVPqo1yhKlBhooaWHbTiqftiFfGnyoWg0UaLWmn7
	 K1TiEu3TgKCjHjeE1oYAklpom8XmbeojCB6ZOfjdfzPqTl+U51YgWDIFOdbFZ2FugJ
	 w9TVaE6yesh884LrjIejujWBkhhv2KEFXFax+mJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DCAFF80483;
	Tue,  6 Aug 2019 20:12:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA487F80483; Tue,  6 Aug 2019 20:12:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEE61F800F3
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 20:12:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEE61F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vVQDnBPO"
Received: by mail-wr1-x435.google.com with SMTP id n9so63732015wrr.4
 for <alsa-devel@alsa-project.org>; Tue, 06 Aug 2019 11:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BL4osUCDyr2SZCCsIcEGm0ifDoTT1UVVR8TW6tJT3ng=;
 b=vVQDnBPOjoGgoDrCCIVEG1MiTWIl98Xta+Qu6PJZtzK/u4LnojbvTBUmYZ+waKeS9Q
 3M9fdSYwgYG6Qxx0ZX3FzLHxE53BJvctDmhDOJScKUCbhiIWqRWjDD7DJ0F+eUepCaoS
 kS4UOVkMffTeELWOaDyPZLqwhfZAGrFJcyRUJZ9o1RtyDrEYcSleDhx6GnCbhtdpqEpM
 9JxYYze0corewnVkuePG73nZftobs10C2zVhAJPy5i2Ut+uG+8BjEihk7MKsSCV/OMao
 fwaNZs4kU0smGl/y2I5oLltCZwiBYmNIwR1R1JSCU4EGRbERYDA8qFjRutzgOwJ3PZFA
 6YZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BL4osUCDyr2SZCCsIcEGm0ifDoTT1UVVR8TW6tJT3ng=;
 b=LayGxudyRYqfIFWIut4G/rpezaEexYUwIsyJJpY6OInv5q/7DSb/V3ZUvUFoo2Atgi
 NwgRImBo12cuIMVvmtz2a+6kGE1aLk1GIRK97klMcrpbNr9CUWMY6oGe28rauPlgGJNx
 Cur4nFkekEOC29PMajfcfPLSogvUVJYLuiUkJKRtWJ105HbXZbZlXETp2jw1jTP4Z5vx
 7CMe7HjKSVyvzh40f1Ofmy702QpR80etpqNnjbFF/iH89JFwjvCjq3qPDmoXODKDCh4C
 /DHgxfsiY448uOGoQjV7oIAvZZ50QNBTwEHAJOAgydS9iSewY3Wn25UreiBxsfQ9XGiN
 YC4w==
X-Gm-Message-State: APjAAAUlUAZUH4HDKQYgT2Dsua2AJ31/sUrQIXTJOr4M41T5Qsx4yReT
 Evp0WgWOhn2t8HenCEX78wg=
X-Google-Smtp-Source: APXvYqwFgeCCGiLSP1J1+nkVSw6Bkc/yEWXgk0UVdPfITrHUoo1q0w/GQ4Fj78rxh28eE9iSQwJU7Q==
X-Received: by 2002:a5d:630c:: with SMTP id i12mr6061307wru.312.1565115156636; 
 Tue, 06 Aug 2019 11:12:36 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id b203sm130200018wmd.41.2019.08.06.11.12.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 11:12:36 -0700 (PDT)
Date: Tue, 6 Aug 2019 18:11:35 +0000
From: sylvain.bertrand@gmail.com
To: karina filer <kafiler0911@gmail.com>
Message-ID: <20190806181135.GA5625@freedom>
References: <CAM+cExGffwFD7U--tZqd_PxFwgdy6YA_tZHvw6B3au9KNygEhA@mail.gmail.com>
 <CAM+cExEBpgWctFLKcVej9UnLS2VVx9CoaOigu9y3BvYGNOi1zA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAM+cExEBpgWctFLKcVej9UnLS2VVx9CoaOigu9y3BvYGNOi1zA@mail.gmail.com>
User-Agent: Mutt/ (2018-04-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Alsa-Plugin 1.0.25 License
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

On Mon, Aug 05, 2019 at 10:44:25PM +0530, karina filer wrote:
> I am facing difficulty to understand the Alsa-Plugin Licensing, Could you
> please help me to make understand?, Is it under GPL 2.0 or LGPL 2.1 because
> after extracting the folder I can see 2 copying file one for GPL and other
> for LGPL.

You don't need to care, except if you do use open source code in distributed
closed source programs (aka windows and macos).

-- 
Sylvain
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
