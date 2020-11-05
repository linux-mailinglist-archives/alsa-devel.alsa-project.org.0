Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C8B2A91B7
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 09:45:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAE1B1699;
	Fri,  6 Nov 2020 09:45:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAE1B1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604652350;
	bh=IbC7h6sutytvBKVgRkW8YBm4v4oQThhwvuIz3XlFJpw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jz4HR8b3+lVve+t9oZMnkb/uGgx7F5LxHe2k++l+7zKTu0rR7xBLGW6jH1qM26pWC
	 v1lnxPA726X+LKuOA/MWx9GNNHSFW65/EJeWXqvRjBmorxNdlbdl2pzwKheob4Q992
	 /vDRpKMK6rzFqIzK0DU+jSIPtQ/TihQgOEpIbui0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D8A8F804C3;
	Fri,  6 Nov 2020 09:43:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65323F80171; Thu,  5 Nov 2020 11:52:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28822F80150
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 11:52:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28822F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="d/RC4QlH"
Received: by mail-lj1-x243.google.com with SMTP id d24so1070597ljg.10
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 02:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IbC7h6sutytvBKVgRkW8YBm4v4oQThhwvuIz3XlFJpw=;
 b=d/RC4QlHsEU0Pk+87b5hebgQR1nvUbGfz+KWgyYPw8avJty+oHtYWwRBfI9ZwNnjQk
 6x1f9VNEkjxS+WacQizm9QFnRFRoNTRgXz7J8hUL7gDHTr1r0B4CDTIH++hxOUWPbRHA
 faB9Z1G3wfURCCb570cPMFzwdpYsz5NNLR9grwb6NletLAXur80zPGuj6TnPTgqIsI6W
 73tvdQLbSeHs/ZIHScGvMbbglljfvtEcmDpRr1SmCjt0Cs2115AxcxEJIltrAcsJpAIs
 i7f4CKXDgFTYIlx2Oia+shgKsQ9vbBqcm5RZnKYsE+6tO+5eUkPHBV9yZoGBsu8zWwxP
 sFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IbC7h6sutytvBKVgRkW8YBm4v4oQThhwvuIz3XlFJpw=;
 b=slAeaRJaqSAc2hZ0+EsERKEiWdY8hjB3oGhNmXtB9aq6HaBj9MZLH8YPbGnBwWBfcZ
 CI5De4BtOapqeTfEPvCtpjj1IulpUZzQIWzPUXRzs12JSkP7x4mLChF9Yus7++TgW3vU
 so/OhBL97u1tbdrcz9KNwvJyoguG8o3XvUh/TKNv4lT4ciafTVMh8guXzNzW5ox0hWqt
 1EDLBGcdAqWDRv+v5GcQhYxzzkruea51Z5lEJba0nWSqKO9hU6ti7Q7O9BPDVGMTBYik
 i9uJH/oSqu0aYCZD/PRXMZRaEaJhqhMIgAwma6++U0gwk4S2r8F6gYonj1OnN6G/La8E
 AnEw==
X-Gm-Message-State: AOAM5320HqLWe7AM6gDPsMOWeYl2MP2B+qosvxpjyCosBzhwtOkxvzxx
 O2YC8pN7nnWHMcJDU1yY4F0TI2ti+qzRy8jjmuXSNg==
X-Google-Smtp-Source: ABdhPJwMZsQSFYx3yHXvvtRlVkabm7C64j8LuP2+XUU2+XVFwAx/DWoa4YDvNPprZ43yAgspd5XcguY3mqI1O9Ir5Vs=
X-Received: by 2002:a05:651c:1205:: with SMTP id
 i5mr726163lja.283.1604573560846; 
 Thu, 05 Nov 2020 02:52:40 -0800 (PST)
MIME-Version: 1.0
References: <20201027121725.24660-1-brgl@bgdev.pl>
In-Reply-To: <20201027121725.24660-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Nov 2020 11:52:30 +0100
Message-ID: <CACRpkdYbpOZGmWONeOQFY7DE+t2ev30DQQ-8cxrJNoK9fVVunA@mail.gmail.com>
Subject: Re: [PATCH 0/8] slab: provide and use krealloc_array()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 06 Nov 2020 09:43:14 +0100
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

On Tue, Oct 27, 2020 at 1:17 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Andy brought to my attention the fact that users allocating an array of
> equally sized elements should check if the size multiplication doesn't
> overflow. This is why we have helpers like kmalloc_array().
>
> However we don't have krealloc_array() equivalent and there are many
> users who do their own multiplication when calling krealloc() for arrays.
>
> This series provides krealloc_array() and uses it in a couple places.
>
> A separate series will follow adding devm_krealloc_array() which is
> needed in the xilinx adc driver.

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I really like this.

Yours,
Linus Walleij
