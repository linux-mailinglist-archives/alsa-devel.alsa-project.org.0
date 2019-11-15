Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C642FFE8A5
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Nov 2019 00:30:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FC701679;
	Sat, 16 Nov 2019 00:29:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FC701679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573860614;
	bh=Znyy1AaRW+TNho9gP2SLgVBBD6RdmL8iW0k6o/YhfBk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e3NkXwsBon90AxvAwM+3xG7doEgXdJcTS0OtpZ5jMaXkCglA9ZB46UTnLnJFfsjiJ
	 tlt9ODWe++vnSDuP/mWLk42ZTUknZ8bcYKnipm+mIe/eUWfzFu2XYXGeJb+1DKxzRB
	 xyGTurFN8N9pkCD/bos8tr1IkIywM3LxUskn8jhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A4F4F800CC;
	Sat, 16 Nov 2019 00:28:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB103F80104; Sat, 16 Nov 2019 00:28:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,HTTPS_HTTP_MISMATCH,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE468F800CC
 for <alsa-devel@alsa-project.org>; Sat, 16 Nov 2019 00:28:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE468F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org
 header.b="Co2QuJ7k"
Received: by mail-ot1-x332.google.com with SMTP id f10so9466793oto.3
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 15:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieee.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1S+5AAijxPmowvKY3xdX13aSIUjpVHHhk9dA/hvM50Q=;
 b=Co2QuJ7km02YoRxq1SKwwezQbRTDaRmt2AT/+V3dm7GJCVC6tDpFn/Hg+Pl8IbQIen
 q9JXEgBIbs1nevjrRrpDeM3vhDnhzj4L+joUurXaVVSPqtAxVo/C+6HAL7XhTYcIbh1I
 m+qW83ur791d1vQ1UQWlsnOW3+IyyU1O0KlBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1S+5AAijxPmowvKY3xdX13aSIUjpVHHhk9dA/hvM50Q=;
 b=cDDRDNk4rd+H2NZDUSvNujEsrtQjoYdolrng4Z90UGVLs+Drjk35weVzzf7pWYnzOH
 24tymJgyrf83GoCLXs7HJfzAh7/l7wK0QDXw9Sg104xUWm3wTaGP9tMWEIF7Nv1J/AXF
 m3JWQuhgKuxbdzGYKy1pHIcwBXaz7ml46LD17ciNniI7yt4gjClixMb2x3kooMU3sJSd
 jURd42RAnHxxlM5DWue7rUusM0EF9fBQvZFB4ZmWCvgfpMeMnDbYvR5ANHBQrNOxJ/nu
 pP/bpcZaJNgVPr2qUJ7ECJ/7bra1a5AxLngSBopOcWcMQAeGS8X51SZDRFPBMqV3rKZm
 W3Mg==
X-Gm-Message-State: APjAAAV4R+r3zT2ov9T+DQ52EFbCkJDnb9pzpv8mZrG95e+nmlp1MQdL
 07LfBux07sMV9FkQIKt/17RvfslRTPY=
X-Google-Smtp-Source: APXvYqyaNSBWiFIaRCeTyVYTqDqSQPW6lT3G5I6VjqWaeBUxMpaIDu6dSy7MMv0zsE8zEo2k7WcIOg==
X-Received: by 2002:a9d:d76:: with SMTP id 109mr12062247oti.73.1573860497530; 
 Fri, 15 Nov 2019 15:28:17 -0800 (PST)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com.
 [209.85.210.41])
 by smtp.gmail.com with ESMTPSA id b12sm3415448otl.34.2019.11.15.15.28.16
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2019 15:28:16 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id w24so8980193otk.6
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 15:28:16 -0800 (PST)
X-Received: by 2002:a05:6830:1f28:: with SMTP id
 e8mr1655491oth.173.1573860495926; 
 Fri, 15 Nov 2019 15:28:15 -0800 (PST)
MIME-Version: 1.0
References: <20190904164706.gwjbcywbj7emnwvr@localhost>
 <CABsjGHJFZD6r7tUKDd17NrAs56O0hypW6MFzJq6m6bWH7ykkPg@mail.gmail.com>
In-Reply-To: <CABsjGHJFZD6r7tUKDd17NrAs56O0hypW6MFzJq6m6bWH7ykkPg@mail.gmail.com>
From: xinhui zhou <zxinhui@ieee.org>
Date: Fri, 15 Nov 2019 15:28:05 -0800
X-Gmail-Original-Message-ID: <CABsjGHKpQvojz5UmnKKdkD-8dU9oHtiQ76EEZwWR7D3mYw6OdA@mail.gmail.com>
Message-ID: <CABsjGHKpQvojz5UmnKKdkD-8dU9oHtiQ76EEZwWR7D3mYw6OdA@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-user@lists.sourceforge.net
Subject: [alsa-devel] Number of PCM instance (pcm device file) for one sound
	card
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

Dear all ,

The tutorial below states that ""Each card device can have up to four pcm
instances"
https://www.kernel.org/doc/html/v4.19/sound/kernel-api/writing-an-alsa-driver.html#pcm-interface
<https://www.google.com/url?q=https://www.kernel.org/doc/html/v4.19/sound/kernel-api/writing-an-alsa-driver.html%23pcm-interface&sa=D&source=hangouts&ust=1573928998988000&usg=AFQjCNGmZgiENmLej2aBTQvp-tspn3u8sg>

I am getting confused with the number '4' .  I thought we can add 8 pcm
device files by default.  By setting  'CONFIG_SND_DYNAMIC_MINORS=y' , we
can have more than 8 pcm device files.
Does that tutorial  mean only 4 pcm devices running at the same time ?

Thanks a lot,

Xinhui,
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
