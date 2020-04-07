Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7F11A169B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Apr 2020 22:14:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34F1B886;
	Tue,  7 Apr 2020 22:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34F1B886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586290499;
	bh=Eg1+KrZa9/gAeLKATnV44tLbO0NLFMjlqF12GbZWbHw=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g3h5VR9YZJVlncd2RX0oMhiepsijBud3HtguFVm6ONc32p2+j5r8ajpykey4bsHSl
	 gDTmoWTdG3GtuksbwDgbw0OfFLPJBB27Ijdeko2HZvSAz+G/1zD6SE5fK6xdOYZr25
	 5sczEUvF/kKND63trA9rNa6M2rDDfdrINSCRkJUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 302B7F801DA;
	Tue,  7 Apr 2020 22:13:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FEB9F801DA; Tue,  7 Apr 2020 22:13:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from gateway36.websitewelcome.com (gateway36.websitewelcome.com
 [192.185.186.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B59AEF80121
 for <alsa-devel@alsa-project.org>; Tue,  7 Apr 2020 22:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B59AEF80121
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="key not found in DNS" (0-bit key) header.d=gmarqu.es
 header.i=@gmarqu.es header.b="J7HJx4u3"
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway36.websitewelcome.com (Postfix) with ESMTP id 7268F400CA057
 for <alsa-devel@alsa-project.org>; Tue,  7 Apr 2020 14:21:42 -0500 (CDT)
Received: from br760.hostgator.com.br ([50.116.86.55]) by cmsmtp with SMTP
 id LuSZjmGM91s2xLuSZjREww; Tue, 07 Apr 2020 15:04:35 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gmarqu.es; 
 s=default;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eEZoi2YnIRGDSxoLoBiK/wOZpeYPwis28Mt6pX7UvcY=; b=J7HJx4u3MXpLGEiLnQnAwQrQhL
 mN/R7HOpWZ5icpC5RXO5uqLnsbsoVzCV8jS+4QbVOjHRmcxKP82+tsesKUrLQ7VaFqd7ArY9lHCUY
 xUgSgKQgBYCzidR+72xitBAh3DOEEvTENuagy/l75daW66WlInJQHhoLL0SoU0C6tybK+wy3SoFmA
 ut87rh3bYY10YA9Ha5pzKZEYeZ2KfPCQSKYvXl0+hYmEhqhxUhWtOyhYtYU/TO7MKjXBfYWZ6Q3Zm
 2Kync9HMlytvWacOaj1aUbMH65EjvPcvsBducU2YGAY/cRGcgurC7V57pc9Mq8vOks0IQc2MLZbPH
 WKenSh8g==;
Received: from mail-il1-f181.google.com ([209.85.166.181]:35377)
 by br760.hostgator.com.br with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <george@gmarqu.es>) id 1jLuSZ-003Mvp-0T
 for alsa-devel@alsa-project.org; Tue, 07 Apr 2020 17:04:35 -0300
Received: by mail-il1-f181.google.com with SMTP id u15so4262418ilm.2
 for <alsa-devel@alsa-project.org>; Tue, 07 Apr 2020 13:04:34 -0700 (PDT)
X-Gm-Message-State: AGi0PuYt4qnE7yRfHGCYCq5uI/4xQoT32GPLxaxmAUIqUA8QzIsEKpMg
 hRkEPDTmZ1HVO8Jxve0NAYRT0nmG8pcibHLay0c=
X-Google-Smtp-Source: APiQypIsO82zwQk5s7sxksF7outkOiCIwaq6UWXTcfS4Zy2kAfpN3lWKNv346WhlgnGmpqzvCrk2N7U8DmjTbIbTGBg=
X-Received: by 2002:a92:8659:: with SMTP id g86mr4411045ild.267.1586289874551; 
 Tue, 07 Apr 2020 13:04:34 -0700 (PDT)
MIME-Version: 1.0
From: George Marques <george@gmarqu.es>
Date: Tue, 7 Apr 2020 17:04:23 -0300
X-Gmail-Original-Message-ID: <CAHWuuHnFKgbZicK-3YADXoKccZZsEsZk4fM4OJMe7cV36ZwZdQ@mail.gmail.com>
Message-ID: <CAHWuuHnFKgbZicK-3YADXoKccZZsEsZk4fM4OJMe7cV36ZwZdQ@mail.gmail.com>
Subject: M-Audio Fast Track Ultra S/PDIF clock source
To: alsa-devel@alsa-project.org
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - br760.hostgator.com.br
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - gmarqu.es
X-BWhitelist: no
X-Source-IP: 209.85.166.181
X-Source-L: No
X-Exim-ID: 1jLuSZ-003Mvp-0T
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: mail-il1-f181.google.com [209.85.166.181]:35377
X-Source-Auth: george@gmarqu.es
X-Email-Count: 1
X-Source-Cap: dmVyc2kwNDk7dmVyc2kwNDk7YnI3NjAuaG9zdGdhdG9yLmNvbS5icg==
X-Local-Domain: yes
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hello, I have my trusty old FTU audio interface and I've been super happy
of how it works well on Linux with ALSA.

Today I finally found some use for the S/PDIF input, which would allow me
to free up two analog inputs in my setup. However, I found out it's not
possible to change the clock source using ALSA, so I cannot use the S/PDIF
input on Linux.

This issue was raised by Felix Homann back in 2011:
https://www.alsa-project.org/pipermail/alsa-devel/2011-June/040846.html but
I couldn't find any new development, even though other issues were fixed.

On Windows the proprietary driver naturally has an option for that, which
allowed me to verify that the input is in fact working correctly. Changing
on Windows and then rebooting into Linux does not work, so either this is
not persisted or something on Linux is unknowingly changing it back.

I actually want to help add this option to the driver, so I can use it
myself but also make it available to others who still rely on this
interface.

My questions are:

1) Was there any progress in this regard? Most of work has been done around
2012 for what I could find, nothing newer, so can I assume no work was done
after the concern was raised?

2) If I were to develop this option, where could I start? I can get myself
around with C, but I have no idea how to debug and test my patches, nor how
to find the exact control.

I know it's an old card, but it works very well for me so I have no excuse
to just replace it at this point.

I hope someone can help me.
