Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 381612CEA7D
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 10:07:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEE041865;
	Fri,  4 Dec 2020 10:06:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEE041865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607072850;
	bh=T1Z4QdweXvmGrl7hnLoIpR24oY4IZCSfZhfCI7A3ky8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ge99wBNeMkP9R3iT88SeMgVI3g1sEYgcKzAFD2vim9Vir5WcOqiqHc5RG1REbDUaV
	 swzZPwLEDniFs6dr3qsfiyvNEhv4sFMFKzsSPQEPENRbQ2I/ISW4YUa4hpgCBbwlXZ
	 DUjdDzeGTtNm7gHb6VC6r6zkBQh7O5SEKPYABuIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F647F8049C;
	Fri,  4 Dec 2020 10:05:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEA2FF80278; Fri,  4 Dec 2020 10:05:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23C43F800E2
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 10:05:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23C43F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="dzICL31j"
Received: by mail-il1-x141.google.com with SMTP id b8so4523012ila.13
 for <alsa-devel@alsa-project.org>; Fri, 04 Dec 2020 01:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F1RmuEV68Av+Jl3JWjgr3+X3fYbRBbmHI7a0zzv/YsM=;
 b=dzICL31j/yQTqpa3dhgoFeea4k3Og7voZFG9iHf8AlL9Tgpc1EfSkpb7HcLrTEMxQN
 0GIBZTuN64aPg6+oWAtPgrD4LFobjNzvzAkFf5ND3SUnBR/2ovFABeu6vmOpsgAznOJz
 zrVE5noCioneaQT98ii1SJ+sLMz0WhYs4K8CBcgJ29mntCZnWjzx9BSijQJLVeyFXVBH
 4qrmOsyP0c6xYz/y1bNdkC0Xdo4ow5HXlWE5ejw/StL6LbX+xWDXblHTJ2Kxpb+KHsT9
 Khe7779CkKWeljJhVlqDzV6/lrqiyZysjLtSmHsQCz5EnZxjVy1hNBhs6dXzzyKEX61o
 ThtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F1RmuEV68Av+Jl3JWjgr3+X3fYbRBbmHI7a0zzv/YsM=;
 b=Wg8T4rekheFsIfGVH4qxOB0656dlPNRmLFwoYDwEki89SO8SJ9Vzv3FjRKCtZOj1dU
 weRNVcYGqZB4/q+Y/0hV6h4ETmW7vNUqC/+fOvUdS4GbmPTlX9qUNSPE6+iwoBWSG4ip
 TZYaFsBTfhcSyk1eYx2hZmbQqGXegSe9FtNG8jORg6DOGvekPgFHnIv2dQ52pn5CI82t
 SEoWtZsFEzr97N/bPph2OsbyTRPnfDRWrwrGjxJM0IEmCjG2c4m570Vaga4S2aciG4NH
 TV1/ZlT+LzUO3dUjlVT+HlOYmnIR8ueou6fUXKSwC/ooqsqU/aC2Mu/WeoR1igORU82H
 0Izg==
X-Gm-Message-State: AOAM533ipWw9UjuIRxGoZVg6vfeyuQOW8JDLZ0WM2/wIqR+OsN1knWKm
 qVly8XpGnks948GiPyio4pRd05D5IpCqg7PgfaJinQ==
X-Google-Smtp-Source: ABdhPJyO9aVs0TQtsNIvxVmZHsGTvt3KxuOmuUt+h110gvMMY8SU7EhopLlz5PLYT919Ze9LJsY/JQW6nY2xm2SvPXY=
X-Received: by 2002:a92:6403:: with SMTP id y3mr5165041ilb.72.1607072748632;
 Fri, 04 Dec 2020 01:05:48 -0800 (PST)
MIME-Version: 1.0
References: <20201203225458.1477830-1-arnd@kernel.org>
 <CA+Px+wWmJrS46TzWgKWiufJH7ryB+mOH7H4xfGZex2j=NutfLA@mail.gmail.com>
 <CAK8P3a3qrPa0Jue-eLrXn+ufBsvY4+UQr7SQ9ZHxuEMtvoYMhA@mail.gmail.com>
In-Reply-To: <CAK8P3a3qrPa0Jue-eLrXn+ufBsvY4+UQr7SQ9ZHxuEMtvoYMhA@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 4 Dec 2020 17:05:37 +0800
Message-ID: <CA+Px+wXi1eUf2xS0NB2-fnGi8G7h8ugiD4dPfW7ZPYRqC3uxzw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: cros_ec_codec: fix uninitialized memory read
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Guenter Roeck <groeck@chromium.org>,
 Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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

On Fri, Dec 4, 2020 at 4:28 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Fri, Dec 4, 2020 at 3:56 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
> >
> > On Fri, Dec 4, 2020 at 6:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > In the case in i2s_rx_event(), only the "cmd" member is used.  But it
> > is fine to please the compiler.
>
> I wouldn't do it just to please the compiler. I sent this patch since
> the code clearly copies the uninitialized data here. If only
> one byte is meant to be copied, then we should change the
> function call to not pass the entire structure. I'll send a new
> patch for that.

My sentence may confuse you.  But I mean: the uninitialized data
doesn't introduce any bugs because it only uses the first byte in the
case.

Instead of your v2
(https://patchwork.kernel.org/project/alsa-devel/patch/20201204083624.2711356-1-arnd@kernel.org/),
I prefer this version v1.
