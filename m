Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4364C2C4478
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 16:51:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D23821733;
	Wed, 25 Nov 2020 16:50:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D23821733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606319500;
	bh=P/W/fJVpYK2EAskgFvlZ/4rxwPhs7to3hX5BZ3Z1kx8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dCOVrzc7OsjaP9Hk89QOLCebj75g8KwodwX065SIBk29e2qmt/hSB5uF+4me1shOp
	 ZqU0V9kEJIb3hQWlwScJBUznyUJAo8W28qUP57O60gPyMTvDRDjqfYwrqOwb6Y5HfF
	 AfLDiIjNTZFOgTvX1PZf2dZg16Iq9ATTcAHVX/Qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31450F80128;
	Wed, 25 Nov 2020 16:50:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D045F8019D; Wed, 25 Nov 2020 16:50:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3FC1F80128
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 16:49:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3FC1F80128
Received: by mail-oi1-f194.google.com with SMTP id c80so3327045oib.2
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 07:49:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mY0WrvYNIljbWqKzA0GJRBDbUCscPAVS4IlM74iQAg0=;
 b=uLBw4Rbk6Nl+SPePBTNMtFCl25PvYg9XY6ZHyEBNRWccQVq8BUtlj9++H+6dh4bf5j
 wVR8sB3lOJs83zFUcOzq1e4IdKUcPkCgw5a8sxmCl+8nsocnA9Qr+JxKQsYFJiCfkRKn
 ebCQIV5KiClXkctImaWKnNtaWGVNK3pZUc6nxI/OB+Yc3h8dEhwpX6G8vcUuH2bzbNQR
 w2S9Q//SUaPFeJeQDiaUQkClCKBTVM8ihU996L/VrzuARfnUGTeIwzEk5LWfj2RICsAU
 bfcf/5o14JlqUmvIoK3io/e/uND+p2n3U94f6wXITla9ME/3a3UDHCN7tbnh+UU5OJ2Q
 0seg==
X-Gm-Message-State: AOAM530/21TP1FjAcY0xw+S0RalFRWIXNPtKiO6O+w947pyqECNEYHIV
 fmgLKq2U4Qp3qIUjyNJiArQG47XRQO8GkBg9Bjo=
X-Google-Smtp-Source: ABdhPJwTj+YCHLeNROjlvhJfRGyYwPTAUmweh1qboqGiQizs1FNOrf3G2y3YlMatgxWNI5r0NYzP8y6c74k1G9cHXe8=
X-Received: by 2002:aca:f15:: with SMTP id 21mr2657926oip.71.1606319390429;
 Wed, 25 Nov 2020 07:49:50 -0800 (PST)
MIME-Version: 1.0
References: <20201124095628.54373-1-andriy.shevchenko@linux.intel.com>
 <f33b4381ea3a4cf4b8e7f27676cd90ed@intel.com>
In-Reply-To: <f33b4381ea3a4cf4b8e7f27676cd90ed@intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 25 Nov 2020 16:49:39 +0100
Message-ID: <CAJZ5v0hxqydcoqTCDzR7O7Y4d71Qutx+k4sOmdvOY24f2-OWgg@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: Intel: catpt: Replace open coded variant of
 resource_intersection()
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
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

On Tue, Nov 24, 2020 at 1:13 PM Rojewski, Cezary
<cezary.rojewski@intel.com> wrote:
>
> On 2020-11-24 10:56 AM, Andy Shevchenko wrote:
> > Since we have resource_intersection() helper, let's utilize it here.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >
> > Promised clean up for recently introduced helper.
> >
> > This has dependency to the patches currently in linux-pm tree. Other than that
> > everything else is already in upstream. Hence, logically it's better to push
> > thru Rafael's tree than wait one more cycle.
> >
> >   sound/soc/intel/catpt/core.h   | 11 -----------
> >   sound/soc/intel/catpt/loader.c |  2 +-
> >   2 files changed, 1 insertion(+), 12 deletions(-)
> >
>
> Thanks for the patch, Andy.
>
> I hope you didn't get the impression I somehow forgotten about this : )
> Wanted to make it part of "cleanup/code reduction" after addition of
> last two missing features (fw traces + external module support).
>
> Fixes and removal of lpt-specific code were the priority though.
> As change is already here, I don't see any reason for delaying its
> merge:
>
> Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

Applied as 5.11 material, thanks!
