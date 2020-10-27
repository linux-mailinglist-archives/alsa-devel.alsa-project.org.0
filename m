Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0467429CEE0
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 09:13:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DE91169D;
	Wed, 28 Oct 2020 09:12:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DE91169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603872790;
	bh=fBlhrFAdd5cWHt9K6UiCMlcQpEqyfwM6Ddhw6Y4ClJU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XZvjaz43tOltlRc0SwrEUgEFjpX24Mc65fp/JHhMoApGdrYvehg/CIwfjUvhGOHIb
	 I+AdwPD9desX+pMMxBbDT7xouT+wsIJ6+cdC/5B4mdVHYr/Z8CkbgIgPJkKsnz1bUb
	 C+YnYtyjMTZ0Bld1E8K+8Tgr/0IdQZ5xUFFzvTak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90B4FF80528;
	Wed, 28 Oct 2020 09:07:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77E50F8020D; Tue, 27 Oct 2020 19:25:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6ADA3F80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 19:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ADA3F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=alien8.de header.i=@alien8.de
 header.b="EgbFsJdf"
Received: from zn.tnic (p200300ec2f0dae00bf53706700052072.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:ae00:bf53:7067:5:2072])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BAB771EC0212;
 Tue, 27 Oct 2020 19:25:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1603823132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=HIlEQ668ZK65lA6MbCzNrMzTRfwiOqR1WIXbuHA3yjs=;
 b=EgbFsJdf1OZ3IGcke8XXZo3hz2cAmj/RcULw8QVmtef7YinSrbWCYFvbL5yywQPkzemwXO
 N724w3YmM6BIy+GiS4LbNct6nLnnKYjmBEbvDSj3xaVvbYC4cp66jlosXNW/p8ekCy1vAQ
 YuPzn8Qmf75kT/ZiIBq27HMK3PaA71Y=
Date: Tue, 27 Oct 2020 19:25:20 +0100
From: Borislav Petkov <bp@alien8.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 5/8] edac: ghes: use krealloc_array()
Message-ID: <20201027182520.GK15580@zn.tnic>
References: <20201027121725.24660-1-brgl@bgdev.pl>
 <20201027121725.24660-6-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201027121725.24660-6-brgl@bgdev.pl>
X-Mailman-Approved-At: Wed, 28 Oct 2020 09:06:30 +0100
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Gustavo Padovan <gustavo@padovan.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Christoph Lameter <cl@linux.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>,
 linux-media@vger.kernel.org, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 linux-gpio@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, netdev@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>, James Morse <james.morse@arm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
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

On Tue, Oct 27, 2020 at 01:17:22PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Use the helper that checks for overflows internally instead of manually
> calculating the size of the new array.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/edac/ghes_edac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/edac/ghes_edac.c b/drivers/edac/ghes_edac.c
> index a918ca93e4f7..6d1ddecbf0da 100644
> --- a/drivers/edac/ghes_edac.c
> +++ b/drivers/edac/ghes_edac.c
> @@ -207,8 +207,8 @@ static void enumerate_dimms(const struct dmi_header *dh, void *arg)
>  	if (!hw->num_dimms || !(hw->num_dimms % 16)) {
>  		struct dimm_info *new;
>  
> -		new = krealloc(hw->dimms, (hw->num_dimms + 16) * sizeof(struct dimm_info),
> -			        GFP_KERNEL);
> +		new = krealloc_array(hw->dimms, hw->num_dimms + 16,
> +				     sizeof(struct dimm_info), GFP_KERNEL);
>  		if (!new) {
>  			WARN_ON_ONCE(1);
>  			return;
> -- 

Sure, why not.

Acked-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
