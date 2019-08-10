Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6E28AFE0
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 08:25:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E9241665;
	Tue, 13 Aug 2019 08:25:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E9241665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565677557;
	bh=9HN8wTcISUg3Kq2CbI3FV9wq050S+4wwrTtFMDQf0jk=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KNZPUyNNlx64eJz2xk0R542s40VSWVjxbuapVamdXmxRWyDtpkZF5PzyWNWFW2AfA
	 hygVur9djSx9BOgZuxX0QkebjU7dDC0udBrOGxC0ZF4Aa1celusJE9P1wauAS7tvv/
	 Q03Kt4hmqSFqxjFFNKh7bIZp47yw4UK7AED+EQYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98842F8026A;
	Tue, 13 Aug 2019 08:24:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F5DDF80506; Sat, 10 Aug 2019 17:20:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA36BF800E4
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 17:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA36BF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MaY7DTkB"
Received: by mail-ua1-x941.google.com with SMTP id b41so890153uad.13
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=EjUN+G7/ldoljuzBV81WBRc3z14xphld9AUM/n7du80=;
 b=MaY7DTkBxMKVQOXqlPR2JjLYTPi5O/HXmGkeb/XBXHFvX5CrQP5FsxmZIJv6mGM+Dm
 9Gse/l/zuA5T5H+ydg4ErUa1Rtw4jgoOoBcZ3SsgFm/sX9XEZ2+To/B3NGJ3Fn6uEsGe
 NcTA5P6JRBbjZ9SwWeEo3yU2YiD2UMtIimvRjeb9ta/1OfrWvQ9WXb6XofZJ3R/L92r5
 Doir/m069OWEXWjkWWToDkLeVEW2alOaLNaWn1CmlZBCxXeARwCH41RJI/fze/Zuokov
 yj8JaCEwZurUANlR9knLmTllIA7Y7vBIyYF3fo3/OKNM6Joj6C6yLLxUdze8gd94s6WR
 n06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=EjUN+G7/ldoljuzBV81WBRc3z14xphld9AUM/n7du80=;
 b=huOApuZTGb+lh/g2gJDbtrn+6LHK6CDWFxEPrh5qbKaTJm2qpPfQl+wYzBIM7aPPZu
 GTVJxUTEANga/bpQ/c5kx3Oo9ZbRu0DbBze0nYFcTK3ZXysQZzv6wYZH2i1SxHOIo1xU
 laRWEOvaiz63lXdluBhc95t+TartpqdOuz+mmWcqjZ0sG9LjIeWO2US495xRhokgMZlc
 +VlnRrtaXDIkobgiUr/j/phXamzWXSs88ET/YBcg6a4MWc+ybiMRDZ1jh8onC9GGu7t4
 a52zcV63fp9xlWzQOCB665r2YPYtkr0wgUqUNOgrOJ3VaXaSNLnOAemjCj5G3dZyJFjW
 MB4Q==
X-Gm-Message-State: APjAAAXTTluklf+/gRVKXVsU0T34j/7cyajBHrSwxMxlsV/A8LGUNkDA
 iaTuI0k/HKDqNXrq9vdCW7mxmi1A2/kvoK5uVH4fCzXx
X-Google-Smtp-Source: APXvYqyxccYR0GwaUjJ2rLeDE/j2ElmFTHoROXn6O7GBROSAuOMQk6++b2MjaZ2ZE2wxxgiELe9cW+0NWiwmdlG/LRA=
X-Received: by 2002:ab0:28c5:: with SMTP id g5mr15777075uaq.16.1565450413126; 
 Sat, 10 Aug 2019 08:20:13 -0700 (PDT)
MIME-Version: 1.0
From: Nilesh Kumar <nileshcool@gmail.com>
Date: Sat, 10 Aug 2019 20:50:43 +0530
Message-ID: <CA+=sdFyw9eR2VoOrU4cnzRrEsa0pNT4S-=7VJNcyvNNFucW+pg@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Tue, 13 Aug 2019 08:24:11 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Unable to get sound out of Laptop
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

Hello all,
I am unable to get sound out of my "HP Notebook - 15-bs180tx" laptop, the
output of alsa-info,sh is been uploaded at
http://www.alsa-project.org/db/?f=5b015c625cef0cc14b0c0551cb57bc1e35d4b40a
so, I would really appreciate if someone could see the log and help me out
in configuring my sound card

-- 
Nilesh Kumar
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
