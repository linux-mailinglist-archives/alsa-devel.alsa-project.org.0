Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 435CE1AAAFF
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 17:01:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E79511669;
	Wed, 15 Apr 2020 17:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E79511669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586962880;
	bh=0t99Q1f/N/zmsEp8uCh6vG3OKb1kxkYhbkNPmJvw48I=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C4jpBQI4KbzZ7dbZ0VKfUyPQAOZtuuuUEAtlTH4Wcbmt9w9KEDsvKowMUKiQHGHCb
	 IWmZnyBKA9YN6hTT8fpc274DWgzACrP5QcE9mtqWTIp3Vtok6ix5dh617ag5hWIZZ1
	 WMa+uHXI1HEAwej8rZIlRshwE/GFJRC8vMLtW6M0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CEA3F8028F;
	Wed, 15 Apr 2020 16:58:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04B7EF80245; Wed, 15 Apr 2020 12:10:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36C43F80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 12:10:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36C43F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HgJ7sm1u"
Received: by mail-vs1-xe35.google.com with SMTP id o3so1866618vsd.4
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 03:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=kUOyQBNGIOYS6YObZzMg5DeXN/7ujUUM8WPLG0eocdc=;
 b=HgJ7sm1uic6CbrRm+DLnVQK3dg3gSDAaEffLhFeFqniLeZMQHBkI0Q7Gst9uv7q6Jp
 sqH4w9zBmMmzKwnj44VS2E0e87MVOXO+LeMUC0gXupeskEqb3DEkXVVYnL2PAf1w/OHc
 +zAvpzAcuawOqZ+ZCH//JnSZuczbWNAWKSfCiLgIG8xMkK6nlISK8Mcxht2OjCYd9gya
 VaTH2oG6Di2+QG3al3qd0u4OchSRe9ugxj9EdA4bxQ4dI+PV9wCY1DXxUy/DuFFB/D/B
 NlkA8cc5seADl8WHivZe6ePxnpuRAF9K5T1Ms1pjA/KwOaLSDNt9NOA2mM7ZFgRZVv1v
 izWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kUOyQBNGIOYS6YObZzMg5DeXN/7ujUUM8WPLG0eocdc=;
 b=Macnbnu1xdwRHL6QkzL2vQIIN4x7Rpb8+7P/KeZhhD0stnKqmK2sEotPGOMzIM7IW5
 9xIa87fZvwwjqCeKL3hzFArTtvxqAg2OoNOCmww1WQUWOYrlxSeXIcVBx4vz5zXz4GbN
 Gg1RTayytdyN2z+rRtV+5F0pWQjl9Rv0dts2LF+t2NwGwr5uo1pArJ86rOVFGDrGe05m
 IDp1sA//ACWZLnXpQjkdiB9oDNxtSWGnYgQpsg9XssYJ0v1RbKHrXcijC3uIF9ymdmNy
 rtdRoBOMb7mk0tkr+zAW7DImK4Xny7eM9pAQ0ll1F1M2iY0yqvArx71xyMati4KFjASQ
 9LdQ==
X-Gm-Message-State: AGi0PuYcViWgLtDuPSA8vegqhP2MbDJXgYvbBY0yAOoo7xHMgDckYAa9
 6hIDyGRN0WFD0T4UWGHojmhHtC+n52hLsEPjxG9UVSK2OWs=
X-Google-Smtp-Source: APiQypKr7cxxNU6DlWlwDaVVVFbUheCmwJxUlLARRunMShW04OONLVrv2/94qUz/yb9Pc8E6KJ8AYEOSCffYs1/gc8o=
X-Received: by 2002:a67:3344:: with SMTP id z65mr3569292vsz.236.1586945418769; 
 Wed, 15 Apr 2020 03:10:18 -0700 (PDT)
MIME-Version: 1.0
From: Jaime Perez <19.jaime.91@gmail.com>
Date: Wed, 15 Apr 2020 12:10:07 +0200
Message-ID: <CAM2dokvhFWfXev+JMfKnCxCPdLrFgG7xqf=8Dt5N92BPqOGKcA@mail.gmail.com>
Subject: Baytrail audio not working on next branch
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Wed, 15 Apr 2020 16:57:55 +0200
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

tested 20200409 20200413 20200414 tags

maybe related issue
 https://bugzilla.kernel.org/show_bug.cgi?id=201787
