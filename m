Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 527BD2AEAB9
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 09:01:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E80F216FA;
	Wed, 11 Nov 2020 09:00:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E80F216FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605081706;
	bh=TRtX8baRaCtbeDJjWA3IRYfdgtIW44Wdj4Sdz3HfZMA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sOLEgRSQK5aAxVdrOwDHpX1YY78gAz/P/1CG+rRHIfl7IaVNHz2/pSiCfRn4yw/9q
	 9pqYRrqYddCDz+qVJ/neOEOuLUttNFhUvf6tgPNV20s/zCKZEbJeWu1BBApt7vTVHX
	 gk2Dxvoh9ZyHiWg8fAd61vwmp/kqCZZuUz+2I2W0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7705CF801F5;
	Wed, 11 Nov 2020 09:00:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E581F801D5; Tue, 10 Nov 2020 15:48:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C401F800AE
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 15:48:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C401F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="An/Ddk0H"
Received: by mail-lf1-x141.google.com with SMTP id z21so16593167lfe.12
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 06:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TRtX8baRaCtbeDJjWA3IRYfdgtIW44Wdj4Sdz3HfZMA=;
 b=An/Ddk0HLR+91xPRpInCFnfZ9o+5szjLSy+NtnyMq7UJRY1S3pi1mcTpeSPq8yWGO7
 +hYo5dzW6PHxmv0YE0x63sDphTthBePQ7rc/OdTTaSn1XaXPVNTS2Qj572/59VtqdnSE
 ADq1kQeLGgCPetyHlz4LQ8E+f4lA+tewwA3JqwJikM3iaVmfqn+lcqYRQW/wE7ooEhJ+
 bUglFTYdPjIL+R6utnbfqDb4IhOZ5rx4bucFlRBZmrj8DrD8Mjij9VzBx0YIKOoIC2Nb
 AA/x0kRUOLLFfqW7r0bkOIMPkR+YoHRBgD+4KlQ2b15e9/I5sO+IMBiDslv4L69nF3h/
 5YMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TRtX8baRaCtbeDJjWA3IRYfdgtIW44Wdj4Sdz3HfZMA=;
 b=LjOMM8TLkk6rTFOA/wFMDm0DgTrY3SK16Q5TMZZhkpfFSFR4VEt+fch6NBTf2ABmbG
 H416vTelr+pETuTyUwq77Jnx1JupidrULo/8T3uIya2PmUm+t+lCN1iBMbAl9UKRIpG9
 l1J4qXOtsfPpkglt+UgKX/jFcsjGjBVd8LK+Cxo0ggVe+kwGvcr93xHV9WJVvXKfrFiH
 5djl6Mw1joC5fwzPzP0YVC1dGEUfRv7pURXDZ8MOgra4mQQl8X2xIGHerZ3ptOtPXjrE
 sNck3JUiwVQj6nVF2lpAT4AyjaOZhdbqYf6WmCstl240FBxuZXYc9FCvvVRQLtqjgYkm
 QnAA==
X-Gm-Message-State: AOAM531mJmtgpaZ2hc395QLAsMZsF3UFzKzVz8r4cc8pSt2Ov+U0gbD2
 R3Aw1my9CA1McJTpH0+4O719itqze7mjCvAJF3wBtg==
X-Google-Smtp-Source: ABdhPJw46ud/uUkcZJ6tSOXJvAqor8Mj5zSR0l7JClGYT9/b+K2wIXlkgMzo8k4v5SokXVFThmMVRoGjQRQOqS4C810=
X-Received: by 2002:ac2:4ac7:: with SMTP id m7mr5517480lfp.572.1605019721579; 
 Tue, 10 Nov 2020 06:48:41 -0800 (PST)
MIME-Version: 1.0
References: <20201109110654.12547-1-brgl@bgdev.pl>
 <20201109110654.12547-6-brgl@bgdev.pl>
In-Reply-To: <20201109110654.12547-6-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Nov 2020 15:48:30 +0100
Message-ID: <CACRpkdZ9tRHFS51pnQg_TgKGed3pD_hRE_rGP_9tiFNcGrb1bQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] pinctrl: use krealloc_array()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 11 Nov 2020 09:00:10 +0100
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Gustavo Padovan <gustavo@padovan.org>, Jason Wang <jasowang@redhat.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Christoph Lameter <cl@linux.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Robert Richter <rric@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, netdev <netdev@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pekka Enberg <penberg@kernel.org>, James Morse <james.morse@arm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
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

On Mon, Nov 9, 2020 at 12:07 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Use the helper that checks for overflows internally instead of manually
> calculating the size of the new array.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
