Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4006210DBE3
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Nov 2019 01:01:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF07A16CC;
	Sat, 30 Nov 2019 01:00:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF07A16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575072062;
	bh=agevoKx+xiBBetrCTAjlA6Y5AzFoxL5F18A0T69gqK8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rcsh5Yp1sHWnFyPxN/B+O9RwIzYcjg/q8jrqqzpxVLDxVQC6JX3pMVlItmhttTw9U
	 pZulGDSKSURPA0JnBpv8qZvFvGNfj92sNuvHVYu6sRILWFbcbvgW7amDiCnvI6zMph
	 Sw7vrNZDprWeIx79TagW4haMRf5ET9Ge+SUY6gmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22EECF80171;
	Sat, 30 Nov 2019 00:59:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2738EF8016F; Sat, 30 Nov 2019 00:59:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67D49F800B3
 for <alsa-devel@alsa-project.org>; Sat, 30 Nov 2019 00:59:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67D49F800B3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GqJS+351"
Received: by mail-pj1-x1032.google.com with SMTP id s35so703108pjb.7
 for <alsa-devel@alsa-project.org>; Fri, 29 Nov 2019 15:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=7sy8AwBmsWAWfICJMdk9fSd9ZsSzM5G6QOuzYudwg5w=;
 b=GqJS+351supO4DYriXxXJ648axVZteQfeutL9wglkdv5m13ki2hQkhGoKoD2QjXshn
 Kltv13MskKfzc/4m4I3KE1WSfOLVb89u/ExZuPQPh4DBfPUmw+ly2ZUhINjN8sRw5nam
 VniuGrGVPDbY3BflJV0HTo56Q69g22E5DzRpBauELYmVqvYzQDWlo5fqmxu8U7CMYCAw
 oBlYZUusOikxI/iV2a97U5QdgjDtu2Thg7rDk2vkaZsMXwad9lJSqoRLA8DHr0OXxtAd
 WsE21FzdJP7LCRYQ2POFoQ8U4/NtDRvWW64klfnZaTrFpAzFiULeAnR/dI4vCul8e7Gc
 PF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=7sy8AwBmsWAWfICJMdk9fSd9ZsSzM5G6QOuzYudwg5w=;
 b=IOSz7OQoGSrDrmOK7cDaiIvJFGQik2Yx4I/hnUAeEIVhaz0qTApl2g7gLEL5gzX7Z2
 Pd8tJnanP1rSdsQviwu7WWkw4pdPZc6OUR1QEDCLAjTsoSlim7zHacQZUtOYxCoVme5h
 nanlaKdWFisyFolvz2f1aiHdqO9WIlm1QDG0sg5ULdysv7OZgnVwSBFbRru2DQpoZdQu
 un8rOvwTCgdQQUmbHoQUJkI2IJj/yjgfXg4Lv8Upa7vqsUK0B/jsk9q9RsWUppjH419y
 wk1PRCqxiExn6FwiarcM7n2cubbGW32NA/GjqM8LznWJRalQ9aDkNkqRYsxuVMuIzCKS
 1D/g==
X-Gm-Message-State: APjAAAWFctJm1TsEXUkpBED/oe/MHIc1wSIZ2aqE8Oy6UlroFuH1KxsT
 PAudX52w93Lms3O2Ah7b1lYqbt+X
X-Google-Smtp-Source: APXvYqyndsET2RQrjyNACdg21ML+Afg+tn0TVeKnX05rlZSvciu6zyj/E8NWe7KMGIypiTfKNkbkag==
X-Received: by 2002:a17:90a:7781:: with SMTP id
 v1mr21693193pjk.93.1575071951905; 
 Fri, 29 Nov 2019 15:59:11 -0800 (PST)
Received: from [192.168.140.2] (14-201-185-176.static.tpgi.com.au.
 [14.201.185.176])
 by smtp.googlemail.com with ESMTPSA id s11sm25461965pgo.85.2019.11.29.15.59.10
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2019 15:59:11 -0800 (PST)
To: alsa-devel <alsa-devel@alsa-project.org>
From: Damien Zammit <damien.zammit@gmail.com>
Message-ID: <fe767b69-9786-b1fe-cd10-2670a1db314e@gmail.com>
Date: Sat, 30 Nov 2019 10:59:07 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [alsa-devel] More USB audio quirks
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

Hi all,

I asked on a forum for people to post their lsusb -vv output
for usb audio devices that were not being detected correctly,
and I tried to write some quirks for them.

I don't know the current status on whether support has been added,
but please someone take a look at:

https://discourse.ardour.org/t/providing-assistance-to-devs-for-new-alsa-usb-sound-card-support/90029/10

for some more output and my attempts at writing new quirks.

Apologies if this is now out of date.

Damien 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
