Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99650242474
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 06:02:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40D1C1675;
	Wed, 12 Aug 2020 06:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40D1C1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597204932;
	bh=yXNs8VNA9uBE3jj70UrlcVw6fiX/dSyYxmk0s3FYysA=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YyN7zUZKQBmHYJb3CZW4SA7AwZiIyhGJmMn8wLHDoWxXtS8qoENf0vFfRFA7OaK4w
	 ZOMTGpV89khCpDDJ+C4u59rNU6oj9xghKC+A1pcJ8NsQxzQUwCNUpA91nEh6Ffx229
	 e4UKJU00DHlttB4Li2gSBOIlNwetBBD4NcKVnKTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC3A9F801DB;
	Wed, 12 Aug 2020 06:00:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1248DF80245; Wed, 12 Aug 2020 06:00:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02FD7F801DB
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 06:00:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02FD7F801DB
Received: from mail-pf1-f197.google.com ([209.85.210.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1k5hwB-0006yO-Dl
 for alsa-devel@alsa-project.org; Wed, 12 Aug 2020 04:00:27 +0000
Received: by mail-pf1-f197.google.com with SMTP id e30so856318pfj.0
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 21:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=KpQMClX0m0IvhtHYcrsDtlKBf40K7zJ3etomTW9/OoQ=;
 b=eXOHsnPllmkoJUb3oghV5w8x13CG1zIwcsrVQFD5q/8yP7MYquTHUP9w8K7eDNOvny
 /wRnrJgwPyfQ0hK3P9Jq3MredOIR4r6WEo7AiaY1vgYeo4bTbdFbtG3imRAm7fjM7TyC
 2OZBTkuwtYK+fB2n22MJBgLf0bHf23q7FKRy1lMhAYJQXGElvIgbvSI9r1Sg8eAsiXLe
 tLeC0Q0X7xQuf/CtsVYCcPffjbGswoI+26K66BHngT7hwnPMgkHlO3QTTWE3G/syUoP/
 LcG4zhfomyQG53ZHVMABpSNoS1x/t1UxnbJIpsswSKGy5mzPTPNBGxVU6ugz6dj08LMu
 mVpg==
X-Gm-Message-State: AOAM530ZEobYTarSS3HwHWpovE9cNSsAgplcVf2mfUsBifIVsaSCizgA
 9d9hZ8bEV3wZLQllxXVzmEgvwP5YReqUfpjjgexqKzn+ElyP+DBggM9numNxFP8gPj6w1+GqIUZ
 uS8btPUqGqyJKS5m3NWbK35MhFu4pNs3/pH3RVqL8
X-Received: by 2002:a17:90b:138a:: with SMTP id
 hr10mr4092349pjb.161.1597204825994; 
 Tue, 11 Aug 2020 21:00:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykse1r526gUQQqLbNz5OMhbZPtsbLpwy4J+UPa0mlnYR8aByJSoCtZul478Oo5SL0TQZ2tew==
X-Received: by 2002:a17:90b:138a:: with SMTP id
 hr10mr4092319pjb.161.1597204825544; 
 Tue, 11 Aug 2020 21:00:25 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id y19sm609691pfn.77.2020.08.11.21.00.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Aug 2020 21:00:24 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] conf: USB-Audio: Disable IEC958 on Lenovo ThinkStation
 P620
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5h5z9p2zz2.wl-tiwai@suse.de>
Date: Wed, 12 Aug 2020 12:00:22 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <C17B75FA-61F1-4646-8C24-249170FF3829@canonical.com>
References: <20200803155745.18082-1-kai.heng.feng@canonical.com>
 <7626CA68-F198-4654-BEDE-59E4DB0D9B48@canonical.com>
 <s5h5z9p2zz2.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>
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

Hi,

> On Aug 11, 2020, at 19:17, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> On Tue, 11 Aug 2020 12:00:54 +0200,
> Kai-Heng Feng wrote:
>>=20
>> Hi,
>>=20
>>> On Aug 3, 2020, at 23:57, Kai-Heng Feng =
<kai.heng.feng@canonical.com> wrote:
>>>=20
>>> Both USB audio cards on Lenovo ThinkStation P620 don't support =
IEC958,
>>> so disable IEC958 accordingly.
>>>=20
>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>=20
>> Should I use GitHub instead of mailing list for any future alia-lib =
patch?
>=20
> Sorry, I overlooked this since I wasn't on Cc.
> Applied now.  Thanks.

Thanks.

Is mailing list or GitHub preferred way?

Kai-Heng

>=20
>=20
> Takashi

