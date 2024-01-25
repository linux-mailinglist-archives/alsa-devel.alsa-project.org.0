Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CCE83BDF7
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 10:53:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12372210;
	Thu, 25 Jan 2024 10:53:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12372210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706176390;
	bh=hUTV/d6M9IsBFUd4/YbDs7cO7WzwxA3VmL/4irIndYM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W050fRGXyDtvrg26Po4UvDc5KHY0mV3BvQJUK1XP+MdmFI+vROWl4pnMcJvl6qh+e
	 4g9ye77jk4NggOJdglKgfsbnWYoTizYWww5ZW3t62b3jJd7GzgRzNIF2o++FdTuw2D
	 9aWyRG4PnXd+gFeGT19AphzC7D53urYGwLonvVEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECB96F80053; Thu, 25 Jan 2024 10:52:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 696C1F8055C;
	Thu, 25 Jan 2024 10:52:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65B19F8028D; Thu, 25 Jan 2024 10:52:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECB97F80149
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 10:52:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECB97F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=bjZhuXgP
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40P5Phw6014771;
	Thu, 25 Jan 2024 03:52:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=
	PODMain02222019; bh=vGrNSh62BaIht8+twse3zms0TY0FwQUJRwvQcagQHms=; b=
	bjZhuXgPZTSUUec+kRV7ga1yWlD4neFBTLeUVdef9NVO0lYjmf9qHhaA9+p4ZXnU
	Ho+B4tYyoV13aVJ9cY5edNXTEVU25bqRIAJHLS6ZvkddSesqTeJq4ES0ZIXgoiVE
	o0pSxbuaT68KSHeW3I28wTwPF0YtmFmXnkwmojRICP8lTXM/6f+zeweWosa1ov4o
	PLcQ6jpkc3cFKGdrtS3umV8E8tcMiQphGsHIG2Qu7aOxuUm2pz51HomLW6JOrql7
	Up9D2Hmda//xhdfxqemn1AtKvHsTeepImLLc7ratenC5kECtHA1HGpWUUNWJ3qFg
	JKxQMrb8h7WXudezyQnhPQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhj24c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 03:52:22 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 09:52:20 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 09:52:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 6E52A820241;
	Thu, 25 Jan 2024 09:52:20 +0000 (UTC)
Date: Thu, 25 Jan 2024 09:52:19 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH 6/7] ASoC: cs42l43: Refactor to use for_each_set_bit
Message-ID: <ZbIvU+UJTB2NbvxZ@ediswmail9.ad.cirrus.com>
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
 <20240124165558.1876407-6-ckeepax@opensource.cirrus.com>
 <CAHp75VdmpPXmQTDSJLotiYSxVO=4Fn27tWwQsByzYQuZwmHJ9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CAHp75VdmpPXmQTDSJLotiYSxVO=4Fn27tWwQsByzYQuZwmHJ9A@mail.gmail.com>
X-Proofpoint-ORIG-GUID: auRHtjoCfyH6Qy4EOMaajMZsgJWhwXEH
X-Proofpoint-GUID: auRHtjoCfyH6Qy4EOMaajMZsgJWhwXEH
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: RN5O5ZPHYJQ4ZUMVCCC76XOZXDEZGXCR
X-Message-ID-Hash: RN5O5ZPHYJQ4ZUMVCCC76XOZXDEZGXCR
X-MailFrom: prvs=8754d201d6=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RN5O5ZPHYJQ4ZUMVCCC76XOZXDEZGXCR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jan 25, 2024 at 12:42:13AM +0200, Andy Shevchenko wrote:
> On Wed, Jan 24, 2024 at 6:56 PM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> >
> > Refactor the code in cs42l43_mask_to_slots to use for_each_set_bit.
> 
> ..._bit()
> 
> ...
> 
> >  #include <linux/bitops.h>
> 
> > +#include <linux/bits.h>
> > +#include <linux/find.h>
> 
> No need, it's included by bitops.h (and there is kinda guarantee for these).
> 

We just moved a bunch of includes out of the cs42l43 header files
to be directly included in the C files. It makes sense to be
consistent if each file is going to directly include each header
it uses it should do so. The header guards will weed out what is
already included.

> > +               if (i == CS42L43_ASP_MAX_CHANNELS) {
> > +                       dev_warn(priv->dev, "Too many channels in TDM mask: %lx\n",
> > +                                mask);
> 
> This is invariant to the loop, you may check even before it (I'm
> writing by memory, might have made mistake(s) in the snippet):
> 
>   nslots = hweight_long(mask);
>   if (nslots >= ..._MAX_CHANNELS)
>     dev_warn(...);
> 
> >                         return;
> > +               }
> 

This would result in a change of behaviour, as one would need to
return before the loop to ensure we didn't overflow the slots
array. We could possible do something with masking the slots to
ensure it only has the right number of bits set, but it is really
starting to get a little micro-optimisation for something that is
likely only going to run once whilst the kernel boots.

Thanks,
Charles
