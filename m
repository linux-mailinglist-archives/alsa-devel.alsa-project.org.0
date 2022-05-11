Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D982523E00
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 21:52:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C7D51A95;
	Wed, 11 May 2022 21:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C7D51A95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652298743;
	bh=rUTPYUhf+yXLlD+ZlHCeS+jaBDhLx8hw4GqXh9n/Sew=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GGpZASjq1D3qp6fdyQEbReN5eUKv3o0PxvGqkWgqKWfH1T1r67CkB7IC5dMU1k6bA
	 ZjRLY0KoUCQqz6DXW7wji32xSlTxWQtcXrGzcb6gaM8sUpxaeoXcUAZKizuE3gtyQW
	 iyiusoGHswDEj1TFlzRte9qVwNGwv3uieSvULjNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A1B3F80212;
	Wed, 11 May 2022 21:51:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90779F8015B; Wed, 11 May 2022 21:51:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF177F80116
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 21:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF177F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch
 header.b="QUS04llQ"
Received: by mail-ej1-x630.google.com with SMTP id dk23so6109768ejb.8
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 12:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=okDasmSIedZIfDNVfGzL/C0tlLQxT7cXpy43/5U1qMo=;
 b=QUS04llQ/TQdvF3bJLtNkYv+9Y/6CRyA1IhJj03bD1ysf9ANin3YF7pIozL2ckCVd9
 OEgvjLcrm/1wDU9oB6CTsdkJp6bSY0dGxFMc0XUZpQx5vjtv+lpaWgY+z91+b2dCfgUQ
 oJPZmG2v8C8OYJmWR8Lmy78eHPjrvYJULiRqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=okDasmSIedZIfDNVfGzL/C0tlLQxT7cXpy43/5U1qMo=;
 b=rlJgLs8IgccBdp7hFAOxst+q1mQ+RE5vZ6jAG52RBr/kU/FtuQS7+G8YZLlVc93Sz/
 2eExuGkv1rIo3idZrCNKvRTgX+gvMisyO4iqgShFdJBbSODcWFP/RO31tKR/VasAZ663
 bfcoYc1UHNxkFIZ9lKvPEfVY1080Sdi7wkqJZjOZl+GHTs4J7ZGsFD4P+Q+eeoAlSfj0
 Ugb4KgAju/gWbGttYYtp7WC98yOo0JqL5WD5m7sRS/VfcvKZtY8w96L55qOexvTGwwe3
 RYiB6pzPvsLliYtCt3r2rCf3lB5tjaPLQp5c2R5RsyDgZUhUqfledwi8vEv90Z+PleR8
 eKSQ==
X-Gm-Message-State: AOAM532b/jXtjoZNIf/OC3gZzX1kpAOL42bFmHat5EEaYY/lOZ/PJ/yy
 49SJRoT/4xQkMtM920FEIlNUWA==
X-Google-Smtp-Source: ABdhPJzc30UDk4ot2UfqIn3JcPVtx5jKy3U9yzEWlwhCj1FbId8oXyy3bEiSM7KRq59c9iZ9/8xhUg==
X-Received: by 2002:a17:906:b74b:b0:6f4:cd08:6fec with SMTP id
 fx11-20020a170906b74b00b006f4cd086fecmr28194512ejb.155.1652298670454; 
 Wed, 11 May 2022 12:51:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 cb13-20020a0564020b6d00b0042617ba639asm1598568edb.36.2022.05.11.12.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 12:51:09 -0700 (PDT)
Date: Wed, 11 May 2022 21:51:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v6 4/4] ALSA: hda - identify when audio is provided by a
 video driver
Message-ID: <YnwTrF6VpM7V1jdu@phenom.ffwll.local>
Mail-Followup-To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 David Airlie <airlied@linux.ie>,
 Greg KH <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 mauro.chehab@linux.intel.com, Takashi Iwai <tiwai@suse.de>
References: <cover.1652113087.git.mchehab@kernel.org>
 <f53f8a9d04b39a6843f19fe3069d1be7a9713aae.1652113087.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f53f8a9d04b39a6843f19fe3069d1be7a9713aae.1652113087.git.mchehab@kernel.org>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Cc: alsa-devel@alsa-project.org, mauro.chehab@linux.intel.com,
 David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Takashi Iwai <tiwai@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, Kai Vehmanen <kai.vehmanen@intel.com>,
 Luis Chamberlain <mcgrof@kernel.org>, linux-modules@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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

On Mon, May 09, 2022 at 06:23:39PM +0200, Mauro Carvalho Chehab wrote:
> On some devices, the hda driver needs to hook into a video driver,
> in order to be able to properly access the audio hardware and/or
> the power management function.
> 
> That's the case of several snd_hda_intel devices that depends on
> i915 driver.
> 
> Ensure that a proper reference between the snd-hda driver needing
> such binding is shown at /proc/modules, in order to allow userspace
> to know about such binding.
> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> See [PATCH v6 0/4] at: https://lore.kernel.org/all/cover.1652113087.git.mchehab@kernel.org/
> 
>  sound/hda/hdac_component.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/hda/hdac_component.c b/sound/hda/hdac_component.c
> index bb37e7e0bd79..7789873ddf47 100644
> --- a/sound/hda/hdac_component.c
> +++ b/sound/hda/hdac_component.c
> @@ -199,7 +199,7 @@ static int hdac_component_master_bind(struct device *dev)
>  	}
>  
>  	/* pin the module to avoid dynamic unbinding, but only if given */
> -	if (!try_module_get(acomp->ops->owner)) {
> +	if (!try_module_get_owner(acomp->ops->owner, dev->driver->owner)) {

I'm still a bit confused why snd-hda does this and why this wasn't put
into component.c, but that's kinda a pre-existing issue and I guess could
be fixed later on. It really shouldn't be anything specific to snd-hda
here.

Anyway I scrolled through the series, it makes a lot more sense than the
intial hack to me, so on the series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But maybe don't count that as real review :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
