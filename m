Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B7FFE12D
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 16:26:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57DBC1655;
	Fri, 15 Nov 2019 16:26:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57DBC1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573831615;
	bh=8J57N5iUHQviAZUjg3TtqMG8JEPlkS4iJlGhT4gddfo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KLua3KFxTpYHb2nxJ0ncH96DkEK4hnqtY2ZLOnhv249Pui4xRYBV88PMNuEMN9XrY
	 PM4DEUHKRhupWVJGusmT8xBB0l8OERV3JPxj6y4RvgXv74jlqMNZIJtqcuYBvVid+H
	 hmdlME1P3CeRXmj+4AO1eKRm1PKUUl42knrohItc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFFE8F80106;
	Fri, 15 Nov 2019 16:25:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 315AFF80104; Fri, 15 Nov 2019 16:25:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76054F8007E
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 16:25:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76054F8007E
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MrQMz-1i8B5u3aDP-00oa3G for <alsa-devel@alsa-project.org>; Fri, 15 Nov
 2019 16:25:02 +0100
Received: by mail-qk1-f169.google.com with SMTP id 15so8373841qkh.6
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 07:25:01 -0800 (PST)
X-Gm-Message-State: APjAAAXyWUj2DpjYflMc95au04NPc3pZgLrnHY1oddBU/Ts83HwlsZLD
 rne3GuB5T4nVbkswL6U/pwg5QLugT3QnQdd0K1o=
X-Google-Smtp-Source: APXvYqy8dMVukKj8OZlWxjuWzWZMk1KwdHT2dkvcKDjQCzPCanUtmwdZnLb2X9QPsxj5Z4xTa9r/kW0G6wcFxWdz6Mk=
X-Received: by 2002:a37:58d:: with SMTP id 135mr13036950qkf.394.1573831500565; 
 Fri, 15 Nov 2019 07:25:00 -0800 (PST)
MIME-Version: 1.0
References: <20191112151642.680072-1-arnd@arndb.de>
 <20191112151642.680072-9-arnd@arndb.de>
In-Reply-To: <20191112151642.680072-9-arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 15 Nov 2019 16:24:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1FERLEZq3BFUJ9Hi6GP3rGKazJX9cbEQAw0O5tSB8H_Q@mail.gmail.com>
Message-ID: <CAK8P3a1FERLEZq3BFUJ9Hi6GP3rGKazJX9cbEQAw0O5tSB8H_Q@mail.gmail.com>
To: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>
X-Provags-ID: V03:K1:rfypwcNYc9+ePHQwVSKQdCcKrP7C5y1rNpBj3RWNP5/UghmIzBE
 cZqxapO8klbMLmkMRZ3cbWcL/LU988qNrLdDOxRuIdm5hOIGSlCJReVYQDGIMUQ1MlMsDjH
 Qo9PAhlETYSXHx+awQU7qvVWF1DIPs4zcrB93DUdwUgYpnvnk6WWCbhYjNlpeS1cMDzqEFQ
 d3O1AqPYMQcbF6FdatbUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HqBHVPNd+N8=:R98IXS+3hGiXuxjYz40dMS
 IPECDXtliI2p7XM1vGM3yMA0nayUnhFKEb6RiIhZoXLJFC55om7cseROOMm52eTgPi4mFEkYl
 EtT8rJxj60Octju4YbXALOAh0N6WCnT+ecrq97JF45+FvsBchlkNTCldJ9MsVlpBgzZ+Nykp3
 ySlbslRxBoWs3j4rq7Q/xI/u7VWwGUYPDbFhcZD57P9KSikTq5ieotgtEdVqjyoNtQrA1/Dkx
 qSF0MmQhsYH5JrxutMSZl+n26Sgc5wdUGh+Ewe2iTDlCLhG7zL6mO+A/WwioDkHUYZpCe/WTh
 maXXNa+HOWV/82SbhK3YyHcjwQRkiVtSX4zIDB264b+i66LBz1o4DOdFqCaYkicAZ0u1RyhTi
 Sydkd0XwnfZiOZ8kfNIkPVK0P6HC0AbFSaZtr3VghZqut0z649h6MtniulPBU5xv3NCra0Cox
 FFrZ8iMuSe5LqAC2WuHFk9ehOrmmDPS3dhXTtUjpwBMGG6c+QG6T9IQy4D4NI0wMgwiM8+NFr
 UPN6u32iboVFdw0pnZRj1nDcJXD5jdDHpg+WL3zoaX9rtUv8e9buY8t5YVzZOsIGAw87BHajJ
 MHZbrl/Mu2fXseOHbox/6TAHnxmjraReXgYsCDRPIbm2JZ5IE+F/0xkWOSvTJzZzJ+gIu7+Nk
 z+Sd00P3/apTYx4KiOYNhVau7fLZZS3Aq8NmMcHhDxCMXVeBI+dc6ZBCM/W/7bz7CZn2t7Xv3
 gfM+CWndMsokgFOsosGvdeqesh/T5yUsJDmNTtAL1t/0WdeTqw+V2wivLoGwrlLc4EwiDVMLI
 Gmx+8zV9+X/Xvrvw2TjnbOUO0cnMr50rCiZmJk2u3ek1MeYE7emz2PnfB3XONyHrf1Iwv/Gj1
 dD8IhDLQERlk6XsT3T7g==
Cc: Baolin Wang <baolin.wang@linaro.org>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>
Subject: Re: [alsa-devel] [PATCH v6 8/8] ALSA: add new 32-bit layout for
	snd_pcm_mmap_status/control
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

On Tue, Nov 12, 2019 at 4:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Co-developed-with: Baolin Wang <baolin.wang@linaro.org>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/uapi/sound/asound.h | 106 ++++++++++++++++++++++++++++++++----
>  sound/core/pcm_compat.c     |  30 +++++-----
>  sound/core/pcm_lib.c        |  10 ++--
>  sound/core/pcm_native.c     |  39 ++++++++-----
>  4 files changed, 143 insertions(+), 42 deletions(-)

I found one more use of 'struct timespec' remaining in there, and have amended
this patch with a small change now to hide that as well.

       Arnd

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index c5d8e7f134d0..e6a958b8aff1 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -502,7 +502,11 @@ struct snd_pcm_status {
 #define __snd_pcm_mmap_status64                snd_pcm_mmap_status
 #define __snd_pcm_mmap_control64       snd_pcm_mmap_control
 #define __snd_pcm_sync_ptr64           snd_pcm_sync_ptr
+#ifdef __KERNEL__
+#define __snd_timespec64               __kernel_timespec
+#else
 #define __snd_timespec64               timespec
+#endif
 struct __snd_timespec {
        __s32 tv_sec;
        __s32 tv_nsec;
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
