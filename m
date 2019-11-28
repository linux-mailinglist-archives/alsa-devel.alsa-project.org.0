Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9B310C5BF
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 10:14:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04A8716DC;
	Thu, 28 Nov 2019 10:14:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04A8716DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574932496;
	bh=ly2T4bHpkOVcRuLcSj6S4P6lnoWadxuZmuTb1Zp2Lqs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TQP1B+YW1G1FNpTizs+kAXaGo2IkkdmupTumnbdIF1AVD7M75mPdVFQNCxUmvZ3J1
	 1mjEoZPBZ8oV2xdLD21/rNsgVHjevX8YzHUl1q4XnOigjKRFAWKPenJSyo6k+LpFC+
	 NK33tzZYoQuqj8ZUk73562PkvSecV+7HBZRELVw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E74BF80106;
	Thu, 28 Nov 2019 10:13:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E48C7F80149; Thu, 28 Nov 2019 10:13:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.ab3.no (mail.ab3.no [176.58.113.160])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D69DF800CB
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 10:13:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D69DF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ab3.no header.i=@ab3.no header.b="rF/jBokr"; 
 dkim=pass (1024-bit key) header.d=ab3.no header.i=@ab3.no header.b="WazuoEUr"; 
 dkim=pass (1024-bit key) header.d=ab3.no header.i=@ab3.no header.b="agt9Qho1"
X-Virus-Scanned: amavisd-new at ab3.no
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ab3.no 17DF92A338D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ab3.no; s=default;
 t=1574932384; bh=X4zfm5Tf+sota8/ygXwyQDguOKOsZ2g+rAMxbLlNg94=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rF/jBokrMJACtNgOf/oZ3J984tbbChzG3+oHANl5FKxWLOvXoUfjjA4HIQ1zA91eI
 qKfxNvvGyaBwFYXH5LxYRWX8tclDe80tO/sjBqDp+R5xxydajDU2iJVua8v/oLyRdl
 8dBBgHajo8RXMSkreqzevqGgPe/9PAsfSXWje+l8=
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ab3.no D7F592A338E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ab3.no; s=default;
 t=1574932383; bh=X4zfm5Tf+sota8/ygXwyQDguOKOsZ2g+rAMxbLlNg94=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WazuoEUr422zFd0IpPXHxXS5qF07Ue/Nq5tagXXQMWslo+lY2qMWtodLE9f0n4b8s
 Z+zX/D9y7CqiuJYMU814tQzpqG0KJkrAKs6QiZjolbn3ZZxVM0yLNvylwDMbbmp6x7
 nOZLWt0W0IBSPVjgizOXKxUxRevQy6CYAh+DcnCA=
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ab3.no 51E3B2A3336
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ab3.no; s=default;
 t=1574932382; bh=X4zfm5Tf+sota8/ygXwyQDguOKOsZ2g+rAMxbLlNg94=;
 h=To:Cc:References:From:Date:In-Reply-To:From;
 b=agt9Qho1yfuXmtUjfKKgWYkFxjV2JVQcFmoHeEdlDQ5oOi8fuJl947Nu+9vdtgLsL
 6i4E9TZCZZzY7GUWXXHGoPb5y3zGlBzIhlztlqNH4mk4/18p6LDd1FDoyNYPU6Sy+E
 KIZh3pLqlB//T5BA3FltOtsrDj45Z15IpqY9l9Rs=
To: Curtis Malainey <cujomalainey@google.com>
References: <CAOReqxjFaWhYCzzyZ90Pc5EvzUky6kCYqakz2XBwSOii9d3maA@mail.gmail.com>
From: =?UTF-8?Q?Mads_L=c3=b8nsethagen?= <mads@ab3.no>
Message-ID: <6b310509-212e-b887-5e3a-483a740d2d1c@ab3.no>
Date: Thu, 28 Nov 2019 10:12:58 +0100
MIME-Version: 1.0
In-Reply-To: <CAOReqxjFaWhYCzzyZ90Pc5EvzUky6kCYqakz2XBwSOii9d3maA@mail.gmail.com>
Content-Language: nb-NO
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Dylan Reid <dgreid@google.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] Headset button mapping in the kernel
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 25.11.2019 20:25, Curtis Malainey wrote:
> Hello ALSA Devs,
> 
> I am looking to get some feedback/ideas on a possible change to
> headset button mapping. Locally we are carrying patches that implement
> the mappings in the machine driver (which we understand you do not
> want upstream.) We are looking to see if we can add a new API
> (something like a sysfs path potentially) to have userspace pass in
> the mapping, if it chooses to, so the mapping can still be done in the
> kernel. That way we can carry just the config locally and remove some
> of the kernel patches we are carrying locally. Thanks.
> 
> Curtis
> 

Sorry for the top posting in my last mail.

I just wondered, do this have anything to do with headphones that has 
physical buttons on the headphone wire itself? E.g the Bose QC25 is a 
pair of headphones that has four buttons on the wire, and as far as I 
can see there's no way of getting those buttons to work in vanilla Linux 
for now, but it works in Android and Windows 10.

I asked about this on this mailing list before[1], because I don't even 
know which component should be responsible for generating button events. 
Should it have anything to do with alsa? Is the button mapping you're 
asking about here about the same thing? Do anyone know how one should go 
about supporting these kind of button events on desktop Linux?

- Mads

[1] 
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/157702.html
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
