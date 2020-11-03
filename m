Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F472A4B6F
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 17:28:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DCE316C9;
	Tue,  3 Nov 2020 17:27:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DCE316C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604420925;
	bh=gcSYX9NYAoTMc6mkGyoM2SDcdY75tBG3AsiLN/4Z0VI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tAjP/kVl5iFSyELYat897wXjc72spRHUulE9Pi3DrbKhuiryITAVI14bLDdwNixRo
	 ZkWLSHzmtaseVEfkXgIoQFf3DhlOQAmBQr1f+/dl2ib8+euZ7MJeN19dMzdI2ljG+a
	 F5Uz7qA/yH2MUpsAs0nocJeWZk6GAwDv/OgOHk1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FD33F804C3;
	Tue,  3 Nov 2020 17:26:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7461F80171; Tue,  3 Nov 2020 11:54:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42755F80083
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 11:54:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42755F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Z1nxH0jD"
Received: by mail-pf1-x441.google.com with SMTP id 10so13864896pfp.5
 for <alsa-devel@alsa-project.org>; Tue, 03 Nov 2020 02:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pr70uaXWQ5V9OEnpZUw1+PkE5bFME26YS/kMKBh3/j4=;
 b=Z1nxH0jDHYEqq8hm0bVNqvQCGIZiEpIpb3zSwcYXQieBLtra1nCwDJgpu5pP89uJzE
 AkhrBgNlD6HCyN456iYZGK8zXMn2VqjNio/0ngfT65e6vFKeH9P/k+YNx0fz0NX90SQM
 JId+N9RTHwMw0LwsVjrJ0K/iWTlm+/5RRX+O/Qjs6Unhw7bP80fuwGuRg+eAD4HDASkn
 xBbZ2MPC8C7aomhpP8xQDtCO64OoJw54a0Ax1nTLubP8Yh2DLws0e+6UO7/9eRpRrt3U
 p4wJZFBQok7bOE/bbaJc+Lng79kYbok1iizF3WW9gFugdQUddODfxMzleDA0d88pCHQj
 0aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pr70uaXWQ5V9OEnpZUw1+PkE5bFME26YS/kMKBh3/j4=;
 b=ZUMbnXkJsqRF5UxSzpbq1DXeycRbWOmrsK3dFGv/JkcvwirSTIarFeyJaBZArDS2QA
 7U24G2V9/ci0ClqfprATM7k7A/OJqGWWdwwlIWG11YPX7VzRM9idTS5sgBfj4aJwFYNm
 YgLinhtsCQsg7kY4azGA6KVsUeQoYicnSEz3Nn2k2G/fwZ2oJIe+g0FC5uMM9m9pCNxC
 x/ZCuo6O2WNZqxooWMGQRSc66LCH/qyU8QGDmD6VnTPcsUuRHKrVIOYi/dC12poL8Pcd
 x3/tGKX+RFwWu1P3RUARM9JpeEhO0GTAb7HKC6C/mV9JL2hiIgeoqNfwiOJd7zeR68DU
 Nd9w==
X-Gm-Message-State: AOAM530Mxscnq6VFLMOp+bCnAC4b11c7PB47+e0fY5Z25cfGhXLTV8kf
 UISO+j26SEFpCSiN1sPukEQeFtTXjqpt0o2CVoI=
X-Google-Smtp-Source: ABdhPJzFEjyEEdc+kSmf/T1nHeNhjOJHPnuC+7t9Znx2RJFmaAHHYOf4fCTxwiGuX4v/1cJJtqmJw1ySNSiuUS5bxLE=
X-Received: by 2002:a17:90a:430b:: with SMTP id
 q11mr3222009pjg.129.1604400865170; 
 Tue, 03 Nov 2020 02:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20201102152037.963-1-brgl@bgdev.pl>
 <21d80265fccfcb5d76851c84d1c2d88e0421ab85.camel@perches.com>
 <CAMRc=Me4-4Cmoq3UdpYEEhERP6fvt97bEJsZYhrcFSQf+a_voA@mail.gmail.com>
In-Reply-To: <CAMRc=Me4-4Cmoq3UdpYEEhERP6fvt97bEJsZYhrcFSQf+a_voA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Nov 2020 12:55:14 +0200
Message-ID: <CAHp75VdpriwuktGrMpcXXQuHgfDL6SzqmQTsGFNKLBb=QiKuGg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] slab: provide and use krealloc_array()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 03 Nov 2020 17:26:07 +0100
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Gustavo Padovan <gustavo@padovan.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-mm <linux-mm@kvack.org>, Christoph Lameter <cl@linux.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Robert Richter <rric@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, netdev <netdev@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pekka Enberg <penberg@kernel.org>, James Morse <james.morse@arm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Joe Perches <joe@perches.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

On Tue, Nov 3, 2020 at 12:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Tue, Nov 3, 2020 at 5:14 AM Joe Perches <joe@perches.com> wrote:
> > On Mon, 2020-11-02 at 16:20 +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

> Yeah so I had this concern for devm_krealloc() and even sent a patch
> that extended it to honor __GFP_ZERO before I noticed that regular
> krealloc() silently ignores __GFP_ZERO. I'm not sure if this is on
> purpose. Maybe we should either make krealloc() honor __GFP_ZERO or
> explicitly state in its documentation that it ignores it?

And my voice here is to ignore for the same reasons: respect
realloc(3) and making common sense with the idea of REallocating
(capital letters on purpose).

-- 
With Best Regards,
Andy Shevchenko
