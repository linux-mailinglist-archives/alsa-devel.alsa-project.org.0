Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E58F30C9D8
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 19:34:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F22211774;
	Tue,  2 Feb 2021 19:33:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F22211774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612290869;
	bh=TGOza8iC1+uMRIpGAom4g/JjEn9GnbvEdfaWhQQ5K2U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M92qDBUNeas5tdYtbIsTWEzfiLuwI4KhFv7M21uvJLHgpCracmPVHdeMbyovm0BOj
	 MSpvpT59vbkWCsz9KgP1D36AxkX1l1tXc3chTovvg+uAd02xDGWfPeBzT+rsyo7/7y
	 aES+UiatZ91OXYHw/NfYeqsQRg27qhKxn8YwfS/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C9C2F801F7;
	Tue,  2 Feb 2021 19:32:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E48BF80171; Tue,  2 Feb 2021 19:32:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAD8AF8013C
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 19:32:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAD8AF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bertschiettecatte-com.20150623.gappssmtp.com
 header.i=@bertschiettecatte-com.20150623.gappssmtp.com header.b="OhVtSieG"
Received: by mail-yb1-xb2f.google.com with SMTP id e132so1580919ybh.8
 for <alsa-devel@alsa-project.org>; Tue, 02 Feb 2021 10:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bertschiettecatte-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kbf5B8iw4bxIVaACNxHl+0aXCHZ7VIRabBPyPfaCyzI=;
 b=OhVtSieGVpi8EzMu3ZTu5Q66BpFRKGpXKqubinGll0Eu+2ih3OO3NAXohXil2ZXyqn
 qyw0PhGDhNTbgiDZmDsRWdBCLUQPt02e2aAQI+DOTW04Jp2VnCSMOM5rw/n8skCRhKxt
 hh0hTia/WmYl/EWmXQtC7FcZSdsTJj8Ae7XuA4oC/4DQw0j0ydra7L205yDzWwG27aaw
 BIKNSP3Uc5Q+llHXzwFYpPxu1BALbpodi4wmrVo71rpHzQY6UWt08MqfRWJb2vHTH647
 L4phMN0hkyvDHc5OEp0+xN5UfMFy2J3z4fO4WRer7t7iQCOWhhJlcCwVKMuPF9AOz805
 9Skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kbf5B8iw4bxIVaACNxHl+0aXCHZ7VIRabBPyPfaCyzI=;
 b=FPflV1UAwLZ3d1GuN4wh8nxxj957tL6Ua8qYcfJyyRj6hiy1UllVIHzHHpTsvsra63
 RQNDwGjlaqUM1URxkBNc4g0kuAel8KdOmBRc/OvLP502Ee07U+JC1FOPNJrLx3+9qQII
 uLqrFJxIF25t2D1YtXvXNCIM9CL+M03kZfA7AEtLMNQ16M4wB1VMiud2h3EzgEeA+0te
 DmAZg7+CyNOuhDdDTO+uJbD/FRFEAZqHEfEavR+DWRUrtkpcva0VWQSMNxhxGifVxoZv
 8W034cSAcA3ltiCCuFF/0VJyOp95/m3NP15fpODII3NEbFsFX1sSQ/GIC4smj9v/C6cD
 tk9Q==
X-Gm-Message-State: AOAM532c9uSw9d7mHXIr0JfaWzGFMWdN4Yk14qS/tYH9axKkykwWTrKe
 CQKVJJt6TC+zWlG34E41jfPvYY54jueyv2rXoZlqKA==
X-Google-Smtp-Source: ABdhPJyGbuTGLmcA8z86TUaEgIl8fVmgjkykAXqDmRHPl8ZoAKQ3AEdT/f1vanAjBH4bdrz1cUNXCzqfzIEcNH8EPK4=
X-Received: by 2002:a25:d24b:: with SMTP id j72mr12768267ybg.475.1612290760421; 
 Tue, 02 Feb 2021 10:32:40 -0800 (PST)
MIME-Version: 1.0
References: <CALd3UbT7DcXSmLO2VEDReY5aft5shpeEBS_wg7bWpoC6Q3qxzQ@mail.gmail.com>
 <9b19b22c-b096-2ba9-8323-5d3fd9a9ef49@ivitera.com>
In-Reply-To: <9b19b22c-b096-2ba9-8323-5d3fd9a9ef49@ivitera.com>
From: Bert Schiettecatte <bert@bertschiettecatte.com>
Date: Tue, 2 Feb 2021 10:32:29 -0800
Message-ID: <CALd3UbQjJL194sJMy0nrjx6J7RZ3L44hm4OH4dffhpmSNNBaGA@mail.gmail.com>
Subject: Re: question about ALSA devices not showing up in buildroot build
To: Pavel Hofman <pavel.hofman@ivitera.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org
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

Hi Pavel
> Do you have the /usr/share/alsa configs?

[root@rockchip:/usr/share/alsa]# ls -las
     1 drwxr-xr-x    6 root     root          1024 Dec 21  2020 .
     1 drwxr-xr-x   24 root     root          1024 Jan 23  2021 ..
    10 -rw-r--r--    1 root     root          9876 Dec 21  2020 alsa.conf
     2 drwxr-xr-x    2 root     root          2048 Dec 21  2020 cards
     1 drwxr-xr-x    2 root     root          1024 Dec 21  2020 init
     1 drwxr-xr-x    2 root     root          1024 Dec 21  2020 pcm
     1 drwxr-xr-x    2 root     root          1024 Dec 21  2020 speaker-test
[root@rockchip:/usr/share/alsa]#

Bert
