Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF718417927
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Sep 2021 18:59:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A89E1612;
	Fri, 24 Sep 2021 18:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A89E1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632502778;
	bh=lYRkqc9XXjasI0NhtoQeZ0yzasxb/iuAHAZUZjyyUCY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TOjrhCE5XmVnid1MpSnR2QoJO8+iyN63zPgAAsnkEoJv++r2eTsM4KxUzt5SvcpL7
	 tV+S5w/rf9yBiypWkbxeH62MW//5pXPWxsfAATIW6CrYKrr5YgqcbJpPZWCUFJ67X3
	 ua8MJWtRtjWxIDYrnmB7XqbfiGnWsnoPx2djZ8Es=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96524F804BB;
	Fri, 24 Sep 2021 18:58:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEA92F802A0; Fri, 24 Sep 2021 18:58:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59030F800BC
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 18:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59030F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hxU2GvOg"
Received: by mail-lf1-x12c.google.com with SMTP id y28so42438969lfb.0
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 09:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lYRkqc9XXjasI0NhtoQeZ0yzasxb/iuAHAZUZjyyUCY=;
 b=hxU2GvOga022gDA3IYR8NnxBCuhDV7AciobbgQZSRZv5eJcfL7KTdHR4iSlqhYjhTY
 +HhNCihYVW1/TPAoyQXArhFRDTE4oTwZmEHBJjcvdKTEBpuzcD2vg+TUfBZnPDvpHhmC
 kXEEvtcF3RI6a8uYaitRpBpRK0vW6fDNys+Dz3iXVYdIG9sXvLlyENNZ4kWpPbIRFWqg
 dFaIqZ8vxgd3DDkh3Cv/HNKvwARjQJ1lNkwkVedR/tAbrk0r9oXagFUs47NUWFPRSH+0
 Xt4ecTCYv/fEfMY3kk9LjyjK+iL8L7kiJjT9AsE0qrcfczMZdg+/343tEfEa3wE+gqY2
 Qvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lYRkqc9XXjasI0NhtoQeZ0yzasxb/iuAHAZUZjyyUCY=;
 b=pwUsX18HvHB/H+INC0on06/ob9GlUu54Lam/N2eocVxIGhAWZ0oN4FCW2D7zohfvao
 NmweiZqvfMDTWJF9Pa7ujjxi3aBd5xLBZUgxQvfWXuoqWpZzRe7YRjSlibjw/XZJfGM9
 vBlzcedwmPMD3vAEuwSAuPKOu9cloGOJn9FU2W6woYGv87xUcUQv7Nkac/qvK/WHfjAJ
 z82I0kERm9YjOYar3QeHN8Ld2XGaopmVLktMccTAneA5MQSI0zaowjazv/eg4scMR5i+
 707Mpl2AoxCsDSuANvhdzc5FyomOhs8EK9XjIuGrgQ5bupT22QrE1jSZdeMJaXUbKZCV
 5vTA==
X-Gm-Message-State: AOAM531R6psFl240keRUONjCbB8THe6KC5OjwN7Eht4uHYZuCfZhic3k
 5Go9Uqd0YG6DbeXuuYrknb9iAQbynvW23+nv0v4=
X-Google-Smtp-Source: ABdhPJy8iNodtBNkS/YlNB19XVbKjUSiplC8swBWr6+/pMC8q2DsHwZCPq3RtKg8Wha1SAiR57L55MaoDlTalw6D3WA=
X-Received: by 2002:a05:6512:3a83:: with SMTP id
 q3mr10044353lfu.215.1632502692633; 
 Fri, 24 Sep 2021 09:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAHhAz+i=3NDuxK2rZZY6N18=OTbkna3VMVpx4nNgF0vyq3JmQA@mail.gmail.com>
 <324112.1632501120@turing-police>
In-Reply-To: <324112.1632501120@turing-police>
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Fri, 24 Sep 2021 22:28:01 +0530
Message-ID: <CAHhAz+jNCd=cw-bohcoiAA2UhNZYSFLX07qEV-T2p+KAsVHhAQ@mail.gmail.com>
Subject: Re: ALSA kernel projects - for academic purposes
To: =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org,
 kernelnewbies <kernelnewbies@kernelnewbies.org>
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

On Fri, Sep 24, 2021 at 10:02 PM Valdis Kl=C4=93tnieks
<valdis.kletnieks@vt.edu> wrote:
>
> On Fri, 24 Sep 2021 19:34:59 +0530, Muni Sekhar said:
> > What small projects would you suggest to a novice with the ALSA
> > kernel. The aim is to develop a familiarity with the ALSA kernel
> > source code, and also to submit it for academic purposes.
>
> A good place to start is getting a good handle on what the phrase "the AL=
SA
> kernel" even means.
Basically looking for kernel space audio subsystem projects rather
than its user-space library(alsa-lib) and utilities(alsa-utils).
>
> There's the Linux kernel, a small corner of which is the ALSA subsystem f=
or
> sound.
>


--=20
Thanks,
Sekhar
