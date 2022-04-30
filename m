Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63509515CA4
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Apr 2022 14:06:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D63EB852;
	Sat, 30 Apr 2022 14:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D63EB852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651320376;
	bh=tWlItz5i5kXdXuKnvQvNpU5f7HV/eMhhZ4OfG79KfB4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TFVZf45Hu0mwObAhDLTn7lexXI9sTeM7y8e6KRtc4fbTMeVswpUyxeljj+t1Ovwy5
	 ivhOk4620DwlBU6GbNsK5oyCjd97BcEVIG86PpDUQgCNs89lOVWVJzOgw7vb6ABNzj
	 8x+9RsxJ8Fn4z+/xMCmrO4Y7uGcYkCokyUNSVR5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C7A4F8012B;
	Sat, 30 Apr 2022 14:05:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D49ECF8012A; Sat, 30 Apr 2022 14:05:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B099F80125
 for <alsa-devel@alsa-project.org>; Sat, 30 Apr 2022 14:05:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B099F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="EWPWQ/+A"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D1A160AE6;
 Sat, 30 Apr 2022 12:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9E4C385AA;
 Sat, 30 Apr 2022 12:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651320303;
 bh=tWlItz5i5kXdXuKnvQvNpU5f7HV/eMhhZ4OfG79KfB4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EWPWQ/+A8KiWNeEnnCkAKXMPSezGdtzp5Pu/mRwQ/MU866OQbmFsojF7i409gTuJu
 COUJKad1RdoM48RcXRCz1/y234ep+r8F5hVv3U8qnSyXd89g/SqzfONVpSS2CCu9eN
 CMKtf9Kko8TmVqrBl0bJ24rI3PoZ2XY2ikw7YirU=
Date: Sat, 30 Apr 2022 14:04:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 1/2] module: update dependencies at try_module_get()
Message-ID: <Ym0l6yeTWCCAeww8@kroah.com>
References: <cover.1651314499.git.mchehab@kernel.org>
 <3c7547d551558c9da02038dda45992f91b1f5141.1651314499.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c7547d551558c9da02038dda45992f91b1f5141.1651314499.git.mchehab@kernel.org>
Cc: alsa-devel@alsa-project.org, mauro.chehab@linux.intel.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Kai Vehmanen <kai.vehmanen@intel.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Dan Williams <dan.j.williams@intel.com>,
 linux-modules@vger.kernel.org,
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

On Sat, Apr 30, 2022 at 11:30:58AM +0100, Mauro Carvalho Chehab wrote:
> Sometimes, device drivers are bound into each other via try_module_get(),
> making such references invisible when looking at /proc/modules or lsmod.
> 
> Add a function to allow setting up module references for such
> cases, and call it when try_module_get() is used.
> 
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> See [PATCH v2 0/2] at: https://lore.kernel.org/all/cover.1651314499.git.mchehab@kernel.org/
> 
>  include/linux/module.h |  4 +++-
>  kernel/module/main.c   | 35 +++++++++++++++++++++++++++++++++--
>  2 files changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 46d4d5f2516e..836851baaad4 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -620,7 +620,9 @@ extern void __module_get(struct module *module);
>  
>  /* This is the Right Way to get a module: if it fails, it's being removed,
>   * so pretend it's not there. */
> -extern bool try_module_get(struct module *module);
> +extern bool __try_module_get(struct module *module, struct module *this);
> +
> +#define try_module_get(mod) __try_module_get(mod, THIS_MODULE)
>  
>  extern void module_put(struct module *module);
>  
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 05a42d8fcd7a..9f4416381e65 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -631,6 +631,35 @@ static int ref_module(struct module *a, struct module *b)
>  	return 0;
>  }
>  
> +static int ref_module_dependency(struct module *mod,
> +				       struct module *this)

This can be on one line, right?

> +{
> +	int ret;
> +
> +	if (!this || !this->name) {
> +		return -EINVAL;
> +	}

Did you run checkpatch on this?  Please do :)

> +
> +	if (mod == this)
> +		return 0;

How can this happen?

When people mistakenly call try_module_get(THIS_MODULE)?  We should
throw up a big warning when that happens anyway as that's always wrong.

But that's a different issue from this change, sorry for the noise.

> +
> +	mutex_lock(&module_mutex);
> +
> +	ret = ref_module(this, mod);
> +
> +#ifdef CONFIG_MODULE_UNLOAD
> +	if (ret)
> +		goto ret;
> +
> +	ret = sysfs_create_link(mod->holders_dir,
> +				&this->mkobj.kobj, this->name);

Meta comment, why do we only create links if we can unload things?

thanks,

greg k-h
