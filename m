Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4C2FB5BB
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 17:54:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72CCA1655;
	Wed, 13 Nov 2019 17:53:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72CCA1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573664051;
	bh=ykGsgx63zd0TJMe3qqfAxMuBehZuiclz6fj667VwbN8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZHiKQIUeJSyJ7yNUFkQynXrsoVq6pVvReotatQYEdC1YvfLFUdtc0OGgQ9ZeXKHya
	 n5VQx+4r28lUMuRl/vN9IklZq9SKBxYwXrsqNXjT5fD2DoLxfagF8cfMUbo/9M0oYl
	 XkFKPKni2GLR2Of2Oe74/kj/kkVzKGuCVmJqfPZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D146F80086;
	Wed, 13 Nov 2019 17:52:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2604FF80086; Wed, 13 Nov 2019 17:52:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B18BFF8007E
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 17:52:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B18BFF8007E
Received: from mail-qk1-f179.google.com ([209.85.222.179]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MowOm-1i6H9V0JtW-00qQoT for <alsa-devel@alsa-project.org>; Wed, 13 Nov
 2019 17:52:15 +0100
Received: by mail-qk1-f179.google.com with SMTP id z16so2328300qkg.7
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 08:52:14 -0800 (PST)
X-Gm-Message-State: APjAAAXtdFM4v6sxjphWug9dXt4XIu/S7pfrla+CrekWXfDQQqAv7t35
 JBArGYOHrhbIAr4Sgl8ox2pn8C31rKHKwJJVD9c=
X-Google-Smtp-Source: APXvYqxBmbGTEswmh4hjOplNI/MC4WIdMJDNv8/77Lo6sjoh34WwHy8gB4aUKN2y/UnSZ06SRm4X0OiPwCzQXFXv/sg=
X-Received: by 2002:a37:4f0a:: with SMTP id d10mr3426187qkb.286.1573663933766; 
 Wed, 13 Nov 2019 08:52:13 -0800 (PST)
MIME-Version: 1.0
References: <20191112151642.680072-1-arnd@arndb.de>
 <s5hk1847rvm.wl-tiwai@suse.de>
 <CAK8P3a2TMEUhzxH7RKvAW9STk33KrbCriUaQawOMffoFC6UTQw@mail.gmail.com>
 <s5hzhgzn304.wl-tiwai@suse.de>
In-Reply-To: <s5hzhgzn304.wl-tiwai@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Nov 2019 17:51:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3n9hrb-qfAYW9=eYApSX=pkOK5p6iGe0T29-KqGuh0tg@mail.gmail.com>
Message-ID: <CAK8P3a3n9hrb-qfAYW9=eYApSX=pkOK5p6iGe0T29-KqGuh0tg@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Provags-ID: V03:K1:qI4V83EkWHBp1SW58NR6IRISHWOyfeGnvn6sSW4V6Kzr4MMuHnu
 vVSsMDc9Z38moQip2U3eJiKE06tIwM3VPV+GB+Q8sPcH9qgFuQKGTyxcBrrUIfLCu72wbMw
 QIhTjKuOtGVkbeetZ9Dxys5GlK5nHUg776q0ubHIxzOtVdQp+4tOG1zIZUq4uJx0vpxKHDs
 32/b2oF8Hdx4rsWL9tkzw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KuMQNYz7qyE=:2XaPN7zqaBmeWdnHFLUVnM
 HWmo+5fmbapZFqLQyunv8fRB0vMvAxs91AQsd+sPdspnoPD5LJ4RK9QyFjJVH3ZpQBU0cN/DC
 SlI2cRqV4coSa87uY7liO0Ab30kHwGOzGnigIZuYKuMuYPZEx1aIndVPGDTxwTzfuI4PrjmXn
 KXq3n35IIZ7qhD05VAo8XdRFXEh2RpKfcMehksUnKwEP4FHfUvF1ZYq4pAs7X2zl0owbYEV4c
 DWaOBsJp8fR5VUM3LeibBIiDanpMThWpYeSi9eokExitopU6QLyjC1T9e9Njtk/GBr9DTVk+H
 3bglONQpcVvMfqxQlwGpSomPBZe6Jz/i29+J2TUhkmxCntykgCpCYKMXzoofG3cYT/9H2x4yY
 3RY2pnBzI5NspAutuw4BwPJk5RoPf3dAptECjwvTQq4ehEdXwaAa8u52OQFRil0StFRLyqk3S
 aRgi/Dgxh9fjSz2dXYxNyDI5RY84yDzVqZ5IP3neC18R3GFhRtKkf/FeXvnbNaXXw6pY9NZEg
 PPoH3WReYw6wLj2FLKJhG3GDm8ACGYleQFF6xEp6tLYzLpo9kcHYudTEulwRGG5bJSuuNenAn
 aILFFvvot7xNOrOzBL8Zt1xYPXHwB3PLsiulghqMF2lbPpl5ApTOml/eCw1EObLz1nJ03Yc7k
 98TnCv4TR37j01wpZ2+JBPm6IsthXuzet9Gc80LCyRM8YHNpSxjgTPgIWHe9AR8JtnSrd0tlN
 KOS6luraq1Ev5qTLTM2aN6W4IYPtzKbBDaeprc4FvjZsapdE4ASes/KXAm9KJ4ICdPKyODITA
 SNQZriOZ13dRa0zlXTEuaJ74FX0eBOe8zrRHTDMFGVGKiRpmvzjwg4Tvu5xz5b+ZyskNnkRYe
 V3lPobVgaCUa5qvCRrJA==
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang7@gmail.com>
Subject: Re: [alsa-devel] [PATCH v6 0/8] Fix year 2038 issue for sound
	subsystem
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

On Wed, Nov 13, 2019 at 5:40 PM Takashi Iwai <tiwai@suse.de> wrote:
> On Wed, 13 Nov 2019 15:32:44 +0100, Arnd Bergmann wrote:

> > We had discussed alternatives for this one last time, and decided
> > to go with the solution I posted here. The main alternative would
> > be to change the 'timespec' in snd_timer_tread to a fixed-length
> > structure based on two 'long' members. This would avoid the
> > need to match the command with the time_t type, but the cost would
> > be requiring CLOCK_MONOTONIC timestamps to avoid the
> > overflow, and changing all application source code that requires
> > the type to be compatible with 'timespec'.
>
> Fair enough.
>
> One thing I forgot to mention: when we add/modify the ioctl or ABI, we
> need to increment the protocol version, e.g. SNDRV_PCM_VERSION to
> indicate user-space the supported ABI.  Please change these in your
> next patches, too.

Just to confirm: this should be a simple one-line patch at the end of the
series like

diff --git a/tools/include/uapi/sound/asound.h
b/tools/include/uapi/sound/asound.h
index df1153cea0b7..72e8380c6dcd 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -154,7 +154,7 @@ struct snd_hwdep_dsp_image {
  *                                                                           *
  *****************************************************************************/

-#define SNDRV_PCM_VERSION              SNDRV_PROTOCOL_VERSION(2, 0, 14)
+#define SNDRV_PCM_VERSION              SNDRV_PROTOCOL_VERSION(2, 0, 15)

 typedef unsigned long snd_pcm_uframes_t;
 typedef signed long snd_pcm_sframes_t;

right? Most other kernel interfaces have no version numbering, so
I don't know what policy you have here.

        Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
