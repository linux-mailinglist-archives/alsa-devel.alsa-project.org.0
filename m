Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE2165D6B1
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 15:57:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F9C3B555;
	Wed,  4 Jan 2023 15:57:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F9C3B555
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672844277;
	bh=q6fjb3lz1zYr4EJ9c0V5iz6lIpdS4SjOViw0sFEjECM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Br/H/sKYoF4X/vAXb9Mb/o6aK7RmGp+pGi+DaMUmbyJ2wdGVnUx9NYVBDUtvIvhK3
	 g5dSg2G1G8kLP1dta5Zo1nWCTkZSLr5qMqi+yi9+5SYUenuyek1lCPBAJlAwMOy5JD
	 Saqz0jqpzgShI9BKIZoJlMYzX8L9Yn8PCZBnMv28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4D74F8024E;
	Wed,  4 Jan 2023 15:56:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8619DF8024E; Wed,  4 Jan 2023 15:56:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2F87F80238
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 15:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2F87F80238
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ralston.id.au header.i=@ralston.id.au
 header.a=rsa-sha256 header.s=google header.b=L/nIXdSX
Received: by mail-oi1-x232.google.com with SMTP id c133so29717069oif.1
 for <alsa-devel@alsa-project.org>; Wed, 04 Jan 2023 06:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ralston.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ofz/y3FhP6VUDywdGg5+DJeyYF7KJW5MeQOUiXDEaj8=;
 b=L/nIXdSXduxZ/CNHNbtBEPIlDS8BzYT2DeIXy3mW2Pt/OM21X1+fcLV/lCxGmORHIk
 VXn5hZpuZkSydB4qvfGjQezIK48g6AZBJpMyFtQqoCU0MzC38meMDqPPrew7Vv1OtrO3
 TWAhVm/iAcQApq/25z0ekru/NK5WAtSj1XeRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ofz/y3FhP6VUDywdGg5+DJeyYF7KJW5MeQOUiXDEaj8=;
 b=CEAZ+DxZxLWxt/zjYa/fBCVzQhKE37J22GuApN1i9BOmQUSP7jh/5IK4QsXIdZMAK8
 D0BNlbGF4bTh3G0uRwVdj6skoStHveHCscPr+CdndwYGLx9L3k6PO66ja4pZGonJY5l8
 RllW+yv4EhxRUvo4C0ncxocd1tHqzkwz5Zkv3aziKwpMhix2ZfcsvagXd8di/Nwf6fIr
 SVMb6Oa78QztGB7DsFLR2Tcwt2IzOv5j11fGX0ugdgX7VofEb+FYhL0EkeUIks24Ks29
 3tH2sztqBRmUllN1A0LHFMBVi0r9UCESNI19q4JboXAebtTc56TgGQBjhHhGqTN2cNC3
 mkvw==
X-Gm-Message-State: AFqh2kqTIMLEUtfaI/TUuF//iaP5LVn/b0SK3uhBWVaVXWxp5pZuBG4i
 W8OtOrbZWYxmDiHn5miA0KU5ZRw1mRWobrENOd7qAw==
X-Google-Smtp-Source: AMrXdXuQzlkjEsymLTUFsBgrJPzGoYT2zReCDRWDPCTePLIEVE1m+BDYNcJFe+60I5hy8VdLVN3u5MqJx+87kHBXUJM=
X-Received: by 2002:a05:6808:48d:b0:35c:3327:ecf0 with SMTP id
 z13-20020a056808048d00b0035c3327ecf0mr2487333oid.220.1672844211273; Wed, 04
 Jan 2023 06:56:51 -0800 (PST)
MIME-Version: 1.0
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info>
 <87zgb0q7x4.wl-tiwai@suse.de>
 <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
 <87sfgrrb5f.wl-tiwai@suse.de>
 <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
 <87bknfr6rd.wl-tiwai@suse.de>
 <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
 <878rijr6dz.wl-tiwai@suse.de>
 <CAC2975+Ybz2-jyJAwAUEu5S1XKfp0B-p4s-gAsMPfZdD61uNfQ@mail.gmail.com>
 <87zgazppuc.wl-tiwai@suse.de>
 <CAC2975+476CHDL3YM=uExHu96UB2rodAng9PVYHX+vGnSCppGA@mail.gmail.com>
 <CAC2975Ja-o6-qCWv2bUkt3ps7BcKvb96rao_De4SGVW1v8uE=A@mail.gmail.com>
 <CAC2975KFqvTitbJHJZ6a4Tuxsq=nPGvW3vjAAtkQxw=sBgeDqw@mail.gmail.com>
 <CAC2975Jw63j26DhvDjiLc7dXwaRz=eK0aWNuErQ8dkEn_Gemjg@mail.gmail.com>
 <87ilhmpvdt.wl-tiwai@suse.de>
 <CAC2975LFWnK6f05j5my4=ebmhS0bVhigz8VH6cbaUtVT+ADxbA@mail.gmail.com>
 <87zgaymkcx.wl-tiwai@suse.de>
 <CAC2975LK6xuQ_PaD9vk_5Uwi4ZmZa30TZKfstyAhx2tv0YU9xQ@mail.gmail.com>
 <87y1qimjsw.wl-tiwai@suse.de>
In-Reply-To: <87y1qimjsw.wl-tiwai@suse.de>
From: Michael Ralston <michael@ralston.id.au>
Date: Thu, 5 Jan 2023 01:56:15 +1100
Message-ID: <CAC2975+dBD9ox0qu0Km_5g=7zifH4GCACdWMh=kXSgGimmyO7A@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, regressions@lists.linux.dev,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Thorsten Leemhuis <regressions@leemhuis.info>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 5 Jan 2023 at 01:54, Takashi Iwai <tiwai@suse.de> wrote:
>
> OK, thanks for confirmation.  Then we should revert this, as it was
> meant only as a minor optimization.
>

I'm glad I could help find the issue! Keep up the good work.

--
Michael
