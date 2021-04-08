Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B180358F1C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 23:23:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 123EA166F;
	Thu,  8 Apr 2021 23:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 123EA166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617917021;
	bh=OwRZQtOj+mefxfQCT2REeFjIEpxosZdixcnXPOqjTg0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pTFvK7LkH7if+0ElceAd2/MtLMpP6ZJ7iLkCR2nLIcOXOUkVGR6qhYcJrZ+A9xKXm
	 n3ORFYiM+kC8c5nj5/CELdcCDivtBewZurgKU3/6H338Zg7bll0AzsTclenhDePabx
	 RpjmjUfWri9hG+9DfEYvwzer0CDG5Uba01Yuww7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 774ACF80246;
	Thu,  8 Apr 2021 23:22:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA8E7F8020B; Thu,  8 Apr 2021 23:22:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28402F80162
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 23:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28402F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Hw6cAWqP"
Received: by mail-ej1-x635.google.com with SMTP id e14so5349980ejz.11
 for <alsa-devel@alsa-project.org>; Thu, 08 Apr 2021 14:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VnTGne30abh5lj6OwiRslNw5OzBilSX0D9++w1yZy8Q=;
 b=Hw6cAWqPSmZLymuWRFL7Gsdsm0KnEIA/OHJoOEyxjDnAls8YA+04AE95bxQrc+wGil
 7qUtzuL6qhtJqxh0PpEoVPQrq/EMagGNBly8oI/k7SjwiLv7dek0eHvioZewK/UMNuor
 L3s33zLCCjszqGvBIoYbBQLH2yCE2qy34pCX/327+6DoOvKo1Djo54B3+/0C7sldUoUa
 lW714GTyBOxZJnWHY5WDH6IJb6XLk358iFPsKWWNOr7T77obKMF0rUT15muAk09ZOWs7
 XKbNPkri7ZplaeApan6nLe5Rwl5G0An8Yx44styI3KthjhP8ljK0Xbc6PvLKzy9jKyKz
 I7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VnTGne30abh5lj6OwiRslNw5OzBilSX0D9++w1yZy8Q=;
 b=sKyYyEeyguu8bjSUwTTWCfGxuwdaIsxFjH6fkBfTVEeNLYAc2DMilz4Dp43e8tr/xQ
 T6lVpZuFLu3HPU8fN7TuDeocplLp0ZARAj52ybvcjYAdQnEU9Ei+JZ+7sHuUZkv5Coou
 NcygmOF8aNUk+LHfvX3decLZyQerHNDExZlk/gnd83FDpb2/mETl1ZVLSpkDQd/aucNn
 XMl8D70AVOATGPxxo568k+qrmS/f5dK2Y9hZ/D6juJFk8cu8lSXjA/H4Jz1znMDSf+IJ
 9iz3Vn5NdFf9up0lPoRIDARwhxvxD7mc+AjnO0AszBh3h/wJbuOUmk+UkMdY/Q2+KvGO
 AEAw==
X-Gm-Message-State: AOAM532g0Il/9kptTczCs8GI7XuosXLQBGaPWVlYuX1jtyt0Ny9CrP/j
 TjFH1x4nOllrxNA4rU0/oJo45VTsbGAt3FTHzwQ=
X-Google-Smtp-Source: ABdhPJwKIBLm4m9VPAlm6X1Z0bt6vhDVsT6do9Mg5F5ljikWwPPTUth+7NiAiKFVHofBXlFA7IuAZqNcEjPzLkINv64=
X-Received: by 2002:a17:906:a51:: with SMTP id
 x17mr13165855ejf.25.1617916927715; 
 Thu, 08 Apr 2021 14:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
 <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
 <CAHXb3beRycUteezmWRqO0u3kZnV8TbCNAqfO3ksjVoJ6WSrdBw@mail.gmail.com>
 <CAEsQvcuBYnY_k1Rd8US5qrDKcJas62Q5kA4P0NSEJODBCcZMuw@mail.gmail.com>
 <CAHXb3bfD_YivP3r4wOeb8bcXmAU+_+eeZwudW6f1pxfYtpnq1g@mail.gmail.com>
 <CAEsQvcsCJUi8eP_t8MGUKf0zSf7Zmqiof8b0fmk-XhZtUScbmg@mail.gmail.com>
 <CAEsQvcspNZFS4gbS=dQ1enkshVnG+-=xvoc8kskmoweTQjQhRw@mail.gmail.com>
 <CAEsQvcurb3s_W47f3N1h1=+oW4rX8tUSfQKv+_zyMMXXqJCBVw@mail.gmail.com>
 <CAHXb3bf4estasrkRhyME9w2hO6UmwUPAY+Vg6e4kvCnZh=R2zA@mail.gmail.com>
 <CAEsQvcs2Ov71mpSCXgefEFV1QQeqND871nu4+BV5KfT3kXtu+Q@mail.gmail.com>
 <CAOsVg8ooWOafVv-T-hVsekO3tuPPe=AhTHZ1qzjbf1X5astXXA@mail.gmail.com>
 <CAEsQvcuUtKRvvzN3Jq75apFkcH05C3qxKLsRRhJK7VcpVBF9PA@mail.gmail.com>
In-Reply-To: <CAEsQvcuUtKRvvzN3Jq75apFkcH05C3qxKLsRRhJK7VcpVBF9PA@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Thu, 8 Apr 2021 16:21:54 -0500
Message-ID: <CAOsVg8rWbwFCYYZPWTsqqPL5LeyH1txyc568_cacNRpXgrYXyg@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Mike Oliphant <oliphant@nostatic.org>
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

Thanks for the tips Geraldo, but with an effort to avoid anything that
might be forgotten or is more difficult to undo, I've been building my
kernel the debian suggested method of "make deb-pkg" (with -j4 added to
speed it up) in /usr/src/linux-5.11.9/, and something like "dpkg -i
../linux-image-5.11.9_5.11.9_amd64.deb".  The "make -j4 deb-pkg" command
runs "make clean" first, every time.  To make matters even worse, my boot
partition is too small to hold more than 4 modern kernels, so I "apt-get
remove linux-image-5.11.9" each time before building the next test.  Each
build takes about two hours...  :)  I'm not complaining, though.  I'm just
trying to explain why I have been doing it this way.  I'm sure you're
right, though, that your commands would be spiffy. ;)
