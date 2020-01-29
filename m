Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A29D014D396
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 00:25:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E5AE1673;
	Thu, 30 Jan 2020 00:24:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E5AE1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580340336;
	bh=ayMdIgu8iTe+5yZYo95rAGIPA6+L3XU5xr0MXjezaQM=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qYRYpeUHhDg8VgAWQRXz44o4PLCobKFW3OcaQVLeKQI2RAWHhb5DUIfR08Rv80GgB
	 0q8oqNHTbNRmXAUH3R8Rd3s5iwDRH4/vI/xV/5bMdZNgKJFNo9NE/3U7vi307F9qW7
	 9zZr0hv2mgVQXvZlexgPJ2YetEqHNqSD5r0wdxYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B864F8021E;
	Thu, 30 Jan 2020 00:23:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99927F8021E; Thu, 30 Jan 2020 00:23:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26515F80082
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 00:23:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26515F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YWP2dPS+"
Received: by mail-wr1-x42a.google.com with SMTP id z7so1565321wrl.13
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 15:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=UCwuUIZpJdWWIJQBKrqeQeynQrnrN7oA/3I8ZIUP2R4=;
 b=YWP2dPS+LPTNBCA277T8ATpcpuXofvVGluK/wPBRCUPZoS3aIR5kMkDxEJAB3kGflV
 1cZj8Y5mPAJJswyyXYPgVG/xASHlE5UeNxBUqOenjzjMXHKEaum6nUh3qLXIPmvcnM00
 Rj32Cq7I4B+/gQXmnQJFUg9oL5ehMyGCrI30y3mcsIK/dIpgPqxkc5WYRXC8/c4ljWXJ
 9Q+3WXvdLfFJldBWdeZsA2Tbq+5262g+xAr/Ef6jNi+pTYXJbPHIXYJjzkiem7zOZ+NY
 use1ATB6BwCPvsj3BTPRIxln/IXmX2/pQBLNtVWrHsLCsvBFu43rYPG/pR6EikHEErMR
 GGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=UCwuUIZpJdWWIJQBKrqeQeynQrnrN7oA/3I8ZIUP2R4=;
 b=p5f746DaNj9UKnfrjZd+mfur61JB6Ay1Ei6dZhcfFxHS9Thkxsinp312CAmiJNriof
 2vwIaAQYscRDNvy43G8+XIQQ7T7jfAmNczExaNZj7dWPngqxerRVc6htmgGuySIKou25
 y9vqf7vwZFnaST05sZtY7plvYFymPvhmllWJZOxsBP7QaUJunNBBgjyYTY1wpp+OWqSf
 Nq7TLj5/XtNkrZ7O22p0ozD7h9Rcb+ONWIx/HvO8XUpggsr9qxDvbcRW9Uh5ememnM/z
 nqCLx4ljW26mvleEXIpVy4G7pF/tcMAnVGD/RmMCZ3XKEoE0938yLmTlXzcc5EYPd2Tf
 lOmQ==
X-Gm-Message-State: APjAAAXvFkP04yzNz82aUI5W3TSc5YIqRpkE9127nAEe3xCrg5OjGa51
 F8kwc6Gu2THeCQO/9X4eJCbVUXtn
X-Google-Smtp-Source: APXvYqzXctPRfjfKSORFM4G9ZXz7dQcOD8QDpTGpZinCw+DLUeBKqZB5ImHaxEi1mfTBKCjOIQ2q+g==
X-Received: by 2002:a5d:510f:: with SMTP id s15mr1308562wrt.408.1580340230013; 
 Wed, 29 Jan 2020 15:23:50 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id x21sm3888049wmi.30.2020.01.29.15.23.49
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 15:23:49 -0800 (PST)
Date: Wed, 29 Jan 2020 23:23:40 +0000
From: sylvain.bertrand@gmail.com
To: alsa-devel@alsa-project.org
Message-ID: <20200129232340.GA23769@freedom>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/ (2018-04-13)
Subject: [alsa-devel] no period wakeup support
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

Hi,

Nowadays, is this reasonable to consider disabling the period wakeup as default
instead of expecting period wakeup by default?

regards,

-- 
Sylvain
(sorry to post here, but sourceforge mailing lists are now using the google
braindamaged javascript _only_ recaptcha)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
