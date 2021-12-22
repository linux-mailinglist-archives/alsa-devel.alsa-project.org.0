Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADA347D5C4
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Dec 2021 18:22:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE8CA17DF;
	Wed, 22 Dec 2021 18:21:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE8CA17DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640193745;
	bh=5dL73oot1k/+QQ0q/bKmbJFyU8YokyOQ7yIYy2CvGYU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IoIci30gKJ8nQQo/gqKWFdHXEHiiUSaZj9oj+Rv4UT35xMJNaRKE28nOUg7XS7A0i
	 wZEFwv9Ct0QWq2SXNkpqdRTsBcCNHktyt9mZp7G3oMzI4LQ8eKLof/11TMdNvob3q1
	 U72qxocCIAKMDQRVsCUy9iSvqpuqtPsQLIV0sVzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55E2CF80105;
	Wed, 22 Dec 2021 18:21:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D349AF80109; Wed, 22 Dec 2021 18:21:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35097F80084
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 18:21:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35097F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ctm/DTWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640193672; x=1671729672;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=5dL73oot1k/+QQ0q/bKmbJFyU8YokyOQ7yIYy2CvGYU=;
 b=Ctm/DTWys5pBNYEW2SEyY9e54FG8fpf/Wth/4xHPqBc2ZxXVIsvmHZop
 MQ3StI+cuVPxwJNjdP1x3c+HkjAY6Ra8fR5YyKd6+zhmqaDZz+ECtNTlB
 t8JdHuwjvhmoaDMwpnkjwrqdvltFqfwE9tDiG2W/NTehDiRvhkRLMwx/l
 h6wBBk1Vz99IdYn4kzXbHGaCEhF9soopWc6aOpZ7/WpOX0A9BehL0shjA
 gIcX+ZemK+EyHiO57yhZ9CItoa7umY6tBpk713p9L6a57b5FnA/RMfF4R
 2FBYlqY2dlR6tIPXYEWdYaHCl+MZShEP6D1Vd1ddigP7G6b5xvlUkQk3e g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="239419449"
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; d="scan'208";a="239419449"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 09:05:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; d="scan'208";a="468233654"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 09:05:43 -0800
Date: Wed, 22 Dec 2021 18:57:43 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] ALSA: hda/hdmi: Disable silent stream on GLK
In-Reply-To: <20211222145350.24342-1-ville.syrjala@linux.intel.com>
Message-ID: <alpine.DEB.2.22.394.2112221851510.1661468@eliteleevi.tm.intel.com>
References: <20211222145350.24342-1-ville.syrjala@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Harsha Priya <harshapriya.n@intel.com>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, Emmanuel Jillela <emmanuel.jillela@intel.com>,
 Takashi Iwai <tiwai@suse.de>
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

Hi,

On Wed, 22 Dec 2021, Ville Syrjala wrote:

> The silent stream stuff recurses back into i915 audio
> component .get_power() from the .pin_eld_notify() hook.
> On GLK this will deadlock as i915 may already be holding
> the relevant modeset locks during .pin_eld_notify() and
> the GLK audio vs. CDCLK workaround will try to grab the
> same locks from .get_power().
>
> Until someone comes up with a better fix just disable the
> silent stream support on GLK.

decoupling the call to get_power() is a non-trivial change
(especially as it's done from generic hda_codec.c code),
so I'd say let's go with this patch for GLK:

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Br, Kai
