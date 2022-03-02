Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF35A4CB768
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 08:06:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53ECD1A8E;
	Thu,  3 Mar 2022 08:05:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53ECD1A8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646291163;
	bh=quZJORXDoBJnmtXWeY1UEG0LMErZNbKWG4uR8GxuM8A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GdsYX5OVO25HG+RYYheXVR1fH+pC+iFp7Cx2uJqt6odsN18eK6IOH5LCv3/UDWzHs
	 K6daHZLaLgmC8H6fKIYXkTyeGg1VQtEwMiCotEnBeqrBqD41o9NwChnoDe+GoXABwi
	 sk9cRbJfPa1IdeDRw6uMbwAxYqmMGrgugzOFxI2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04A4DF8051F;
	Thu,  3 Mar 2022 08:03:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31F2CF80167; Wed,  2 Mar 2022 18:15:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HK_RANDOM_ENVFROM,HK_RANDOM_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DA9EF80167
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 18:15:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DA9EF80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TWMNJoph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646241309; x=1677777309;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=quZJORXDoBJnmtXWeY1UEG0LMErZNbKWG4uR8GxuM8A=;
 b=TWMNJophuQUEh3ONnDSDVnu8MN8V/b+6ojMhWxHreJbECDgKWMO55DtK
 dJCdSCA63tpzPkenUwjz+v5UIBdXuCPY7f1mbxGHDGuP+L9uQDt+mF8I5
 xSpf8kmXetnZy3imi18QrlBwTKeeZQOOhlyW1YYaJlonKXZA4J9SAfBXr
 hntHIL8GTgCPxFcP0ZW6E7b+NGkrkn9lW8LQeH6nOGqQi5d+hBqIXpDu1
 uVdcArqO6yyMebYPe2My0m/FgpPRIxZ56WSK6pZ6gnLcj7EY7x9NdNfbL
 nb3vDc2AJ8oXZv+4Y5C92jqL4cWA3kne0Vt40rsj3QE4rO3Br5XF5/cle g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="251028993"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="251028993"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 09:15:05 -0800
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="551343768"
Received: from jbuller-mobl1.ger.corp.intel.com (HELO [10.213.194.231])
 ([10.213.194.231])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 09:14:53 -0800
Message-ID: <ed52ce3c-0f4a-a1e8-4176-543657d6228d@linux.intel.com>
Date: Wed, 2 Mar 2022 17:14:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 6/6] treewide: remove check of list iterator
 against head past the loop body
Content-Language: en-US
To: Jakob Koschel <jakobkoschel@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-7-jakobkoschel@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220228110822.491923-7-jakobkoschel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 03 Mar 2022 08:03:24 +0100
Cc: linux-wireless@vger.kernel.org, alsa-devel@alsa-project.org,
 kvm@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, amd-gfx@lists.freedesktop.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, "Bos,
 H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dmaengine@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 linux-block@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
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


On 28/02/2022 11:08, Jakob Koschel wrote:
> When list_for_each_entry() completes the iteration over the whole list
> without breaking the loop, the iterator value will be a bogus pointer
> computed based on the head element.
> 
> While it is safe to use the pointer to determine if it was computed
> based on the head element, either with list_entry_is_head() or
> &pos->member == head, using the iterator variable after the loop should
> be avoided.
> 
> In preparation to limiting the scope of a list iterator to the list
> traversal loop, use a dedicated pointer to point to the found element.
> 
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>

[snip until i915 parts]

>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 14 +++---
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 15 ++++---
>   drivers/gpu/drm/i915/gt/intel_ring.c          | 15 ++++---

[snip]

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 00327b750fbb..80c79028901a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -107,25 +107,27 @@ static void lut_close(struct i915_gem_context *ctx)
>   	radix_tree_for_each_slot(slot, &ctx->handles_vma, &iter, 0) {
>   		struct i915_vma *vma = rcu_dereference_raw(*slot);
>   		struct drm_i915_gem_object *obj = vma->obj;
> -		struct i915_lut_handle *lut;
> +		struct i915_lut_handle *lut = NULL;
> +		struct i915_lut_handle *tmp;
> 
>   		if (!kref_get_unless_zero(&obj->base.refcount))
>   			continue;
> 
>   		spin_lock(&obj->lut_lock);
> -		list_for_each_entry(lut, &obj->lut_list, obj_link) {
> -			if (lut->ctx != ctx)
> +		list_for_each_entry(tmp, &obj->lut_list, obj_link) {
> +			if (tmp->ctx != ctx)
>   				continue;
> 
> -			if (lut->handle != iter.index)
> +			if (tmp->handle != iter.index)
>   				continue;
> 
> -			list_del(&lut->obj_link);
> +			list_del(&tmp->obj_link);
> +			lut = tmp;
>   			break;
>   		}
>   		spin_unlock(&obj->lut_lock);
> 
> -		if (&lut->obj_link != &obj->lut_list) {
> +		if (lut) {
>   			i915_lut_handle_free(lut);
>   			radix_tree_iter_delete(&ctx->handles_vma, &iter, slot);

Looks okay although personally I would have left lut as is for a smaller 
diff and introduced a new local like 'found' or 'unlinked'.

>   			i915_vma_close(vma);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 1736efa43339..fda9e3685ad2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2444,7 +2444,8 @@ static struct i915_request *eb_throttle(struct i915_execbuffer *eb, struct intel
>   {
>   	struct intel_ring *ring = ce->ring;
>   	struct intel_timeline *tl = ce->timeline;
> -	struct i915_request *rq;
> +	struct i915_request *rq = NULL;
> +	struct i915_request *tmp;
> 
>   	/*
>   	 * Completely unscientific finger-in-the-air estimates for suitable
> @@ -2460,15 +2461,17 @@ static struct i915_request *eb_throttle(struct i915_execbuffer *eb, struct intel
>   	 * claiming our resources, but not so long that the ring completely
>   	 * drains before we can submit our next request.
>   	 */
> -	list_for_each_entry(rq, &tl->requests, link) {
> -		if (rq->ring != ring)
> +	list_for_each_entry(tmp, &tl->requests, link) {
> +		if (tmp->ring != ring)
>   			continue;
> 
> -		if (__intel_ring_space(rq->postfix,
> -				       ring->emit, ring->size) > ring->size / 2)
> +		if (__intel_ring_space(tmp->postfix,
> +				       ring->emit, ring->size) > ring->size / 2) {
> +			rq = tmp;
>   			break;
> +		}
>   	}
> -	if (&rq->link == &tl->requests)
> +	if (!rq)
>   		return NULL; /* weird, we will check again later for real */

Alternatively, instead of break could simply do "return 
i915_request_get(rq);" and replace the end of the function after the 
loop with "return NULL;". A bit smaller diff, or at least less "spread 
out" over the function, so might be easier to backport stuff touching 
this area in the future. But looks correct as is.

> 
>   	return i915_request_get(rq);
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring.c b/drivers/gpu/drm/i915/gt/intel_ring.c
> index 2fdd52b62092..4881c4e0c407 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring.c
> @@ -191,24 +191,27 @@ wait_for_space(struct intel_ring *ring,
>   	       struct intel_timeline *tl,
>   	       unsigned int bytes)
>   {
> -	struct i915_request *target;
> +	struct i915_request *target = NULL;
> +	struct i915_request *tmp;
>   	long timeout;
> 
>   	if (intel_ring_update_space(ring) >= bytes)
>   		return 0;
> 
>   	GEM_BUG_ON(list_empty(&tl->requests));
> -	list_for_each_entry(target, &tl->requests, link) {
> -		if (target->ring != ring)
> +	list_for_each_entry(tmp, &tl->requests, link) {
> +		if (tmp->ring != ring)
>   			continue;
> 
>   		/* Would completion of this request free enough space? */
> -		if (bytes <= __intel_ring_space(target->postfix,
> -						ring->emit, ring->size))
> +		if (bytes <= __intel_ring_space(tmp->postfix,
> +						ring->emit, ring->size)) {
> +			target = tmp;
>   			break;
> +		}
>   	}
> 
> -	if (GEM_WARN_ON(&target->link == &tl->requests))
> +	if (GEM_WARN_ON(!target))
>   		return -ENOSPC;
> 
>   	timeout = i915_request_wait(target,

Looks okay as well. Less clear here if there is a clean solution to make 
the diff smaller so no suggestions. I mean do I dare mention "goto 
found;" from inside the loop, where the break is, instead of the 
variable renames.. risky.. :) (And ofc "return -ENOSPC" immediately 
after the loop.)

As a summary changes looks okay, up to you if you want to try to make 
the diffs smaller or not. It doesn't matter hugely really, all I have is 
a vague and uncertain "maybe it makes backporting of something, someday 
easier". So for i915 it is good either way.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com> # i915 bits only

Regards,

Tvrtko
