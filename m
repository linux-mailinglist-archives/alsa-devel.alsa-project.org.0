Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B5F14CF2D
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 18:06:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D19E167D;
	Wed, 29 Jan 2020 18:05:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D19E167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580317566;
	bh=eAu71s2DiaGpmJrwwZ3VqANZu3GSAkVTsAEhfqPlMpk=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Chj5E+zj83u07G7VthOX773c1oNDEZ4dM0/7Dtebv6uXCQBMFz0zlUNC0EN8uWisS
	 iym+r7TWu8XO4RfkrzEbTa1CHLENH3XZ84Oc9fEELB0WRjLtkptYTwUwljRjuFK6K0
	 6pxIBGpoMzd9vahjNNTz9GFUwogogFo1ZqSCccdI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6496F80218;
	Wed, 29 Jan 2020 18:04:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC8EFF80082; Wed, 29 Jan 2020 18:04:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DB8EF80082
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 18:04:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DB8EF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="dkwuBgML"
Received: by mail-io1-xd30.google.com with SMTP id k24so529559ioc.4
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 09:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=1VKz16bGFD5JJCHCpvd/xZmlj1D7yt96LGZlRDYsxS0=;
 b=dkwuBgMLt6+DXnNVk7j6in13L9Oy+KEm2O31Midm+rTbTOhYNakkGekZRSFn/ICtoG
 /FNmQsxhJ6gaiTOwV+fd4/e0A0G685jICDiGua4Qkp4+XAqsA6pplqT9yCaqpdB+OTeL
 PP2HfdMo3/Qi8z4ZH78A0Ynt5TVkiMW9ewllfzVuHyzKPoLcWsQnHLcomO4ye3SjYiAE
 te60N9rdoV7eeYywD8GWnP1hsyhVBPqvnfhKEhN2nfABfK6yg5kHLkrBp1UE4lzZ/o3g
 KtWb/GxYGaWuG88T2rngkRub6wrkhAsacRT96t6jvXmVvrYjX86VTbHhr9irzNq3PasL
 G1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=1VKz16bGFD5JJCHCpvd/xZmlj1D7yt96LGZlRDYsxS0=;
 b=ZVzfjOyXet2F2HEtaNHga7zon2OW0GEyLuFSKkcFvSkcPa7xKVKX0nSyNyfNJamJlO
 Va5QM4BIDxCSmsRCvJ4hduXWw9Is+b/2WIvEJkXRUASxdl9nvYHXdLvlA7inUprkHpqa
 5fADaJnCXFN7BA+W87di4VVAxDmv0VN3kZt5okyxZTVJd1ow9FBjVs416JbtAH5SZg+0
 sqiF+ucnhDXEqPOm1MCndw88AyeLGW6RCv8lLpEbSlHIU+6NfqAC0g4AdT0jsNgZ09JZ
 BMKnbcTfbAczEf4ZTI522ceSlsTs8TYhMBRdLBnY1R0V/xtUiykrtDqPh1PAxLJ1difo
 LP2A==
X-Gm-Message-State: APjAAAX+V1tghql9Jo5aXyz7rB3eaabxeYbSv5Fku4cXBcbpyipoTZ+E
 anaKoJYYs41flefXkVZgUep1E5INAgqW8QWDRXKVNg8I
X-Google-Smtp-Source: APXvYqyPjfz7y5qFmVXiBVHJXRUJH9g1Kvzlj9paBhkFLViui0xeS3pUymW2OafIeYFGFttmkYjgDF1xbKIYj2DZoKs=
X-Received: by 2002:a6b:5503:: with SMTP id j3mr390064iob.142.1580317457182;
 Wed, 29 Jan 2020 09:04:17 -0800 (PST)
MIME-Version: 1.0
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Wed, 29 Jan 2020 09:04:06 -0800
Message-ID: <CAFQqKeUnT=QHkBWp3ZDeuBtYCS=f7FLa0+eS9sRo8reK0N6YWg@mail.gmail.com>
To: Linux-ALSA <alsa-devel@alsa-project.org>, gregkh@linuxfoundation.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Pierre-louis Bossart <pierre-louis.bossart@intel.com>
Subject: [alsa-devel] Question about the correct license to use with debugfs
	in SOF
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

Hi Greg,

Can I please bother you with you quick question about the right license to
use for the
debug.c file in the SOF directory?

Currently, it is dual licensed with GPLv2.0 and BSD. But Pierre brought up
a concern about this conflicting with all the exports in the file being
GPLv2.0. Should this be fixed to change the license to GPLv2.0 only?
Appreciate your help in this regard.

Thanks,
Ranjani
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
