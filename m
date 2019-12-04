Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 622FA1137D7
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 23:53:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1CD7166B;
	Wed,  4 Dec 2019 23:52:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1CD7166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575500005;
	bh=Boj1VFhwQf0soHq0hFUSLOOcg8T0eCEnYtFVVysf6TI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TNB25qHY2swzeXB27NC+DJNFnPVdlRq6oopgDuAeNs1mZM27A9vFH39cwHt8bDJ/q
	 87araSsf4Q6EBoBc254TQdJ4eUA3s9lw/6IuYQG/AhlmhwcHLxFZZ0B1AF+qjHt8lm
	 c5KImuIU2+0YcIUzcV/5KNrTOSBvo0Y54mmhekl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98576F801D9;
	Wed,  4 Dec 2019 23:51:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FCF4F801EC; Wed,  4 Dec 2019 23:51:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C892F8010F
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 23:51:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C892F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="NYuy1jAr"
Received: by mail-qt1-x844.google.com with SMTP id 14so1521719qtf.5
 for <alsa-devel@alsa-project.org>; Wed, 04 Dec 2019 14:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xR9T5eczS/K1Gj41THsx1eOw9T5lohK3EUBAPQS8nb0=;
 b=NYuy1jAradzh+Lt92T9v2etjEl/UTUPx5/TsNWglwsUEG8zgBo8xzTgbezE2uy/dDB
 8a5dURW81aQrashegdVr+XMmNX9PPi01FLr2Ly2IxiYtaSFewimu6WvUAW9Z0/UpQ82S
 h71bszl4E1yT4QRgr8xy7BxQxCaY8L0/WNBOO/0tIe23/1dvxM6rdU7JbjlTuGgY3q29
 LgPce3jWM7AX+AClo88Yk6+OMEU55CFb32b7mhvnQskuahxkYjP52271gfJTcv22FTjq
 dlrbeF8/sQJn6kXcxDOaylojxXdOJKMrwWUMYyudHknZyloZ7B1Ffx2PwcQnCA1aRpCf
 1Hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xR9T5eczS/K1Gj41THsx1eOw9T5lohK3EUBAPQS8nb0=;
 b=YGZVPHwnSaaj7XzdJ3fs23riPIKhAcdhTUHhOV6+gQys3EhWrPecxmFUURhYXxRtar
 fy6d1YclJjxlZ87271C5wYxo9oB3JLt6luJ3MOmPTKxALEn9hAGOjTw7IyHpb82hATDP
 18QqUt+BECJTIpCAD9H/mcH+h75eYcvStU2XunWS2bV3kytYKYHZGHk+xSm9Jg4lYFGk
 jEg6DD1rS2FO7rU2s9wHPAZemc6oK8LJbuUtc+RC5rSe4d/kHgWoRWa31A78feyKCpJ8
 AZpLvtY4g6MrqxUg+NImRLcAmmC11BuVFueIxdGtw8A6Y0Z/aCMo5nXlyjFi7NyFvQa3
 JL2w==
X-Gm-Message-State: APjAAAUlJYRA/l2XwxS01qoA8a7lJZ6VJs0oPzgNSXv1PDI7Qu+v+Kue
 0EPJJ+bkZU1IWKFp4HlZD3qXtDXwVxZRXBEzHfJgIA==
X-Google-Smtp-Source: APXvYqy61YFcWZcO6e3msiNFj1pWPrlNayTCZfZIA7Z68bHiBGMVLnBOB3v9R0z0LWihk5FBdq3KTv6B6Juj70dHmoM=
X-Received: by 2002:ac8:6f75:: with SMTP id u21mr5237621qtv.52.1575499893776; 
 Wed, 04 Dec 2019 14:51:33 -0800 (PST)
MIME-Version: 1.0
References: <20191204011118.74217-1-cujomalainey@chromium.org>
 <a828597a-2faa-d672-a6a0-43fcaaa6bca1@linux.intel.com>
In-Reply-To: <a828597a-2faa-d672-a6a0-43fcaaa6bca1@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 4 Dec 2019 14:51:22 -0800
Message-ID: <CAOReqxjqF6kPyX99i7CzLeTip2yVKezo=Laobuk-SRg6_D2n1Q@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Hui Wang <hui.wang@canonical.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Allison Randal <allison@lohutok.net>, Naveen Manohar <naveen.m@intel.com>,
 Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>,
 Jon Flatley <jflat@chromium.org>, Bard liao <yung-chuan.liao@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jenny TC <jenny.tc@intel.com>
Subject: Re: [alsa-devel] [RESEND PATCH] ASoC: intel: Add Broadwell rt5650
 machine driver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

>
> > +/* ASoC machine driver for Broadwell DSP + RT5650 */
> > +static struct snd_soc_card bdw_rt5650_card = {
> > +     .name = "bdw-rt5650",
> > +     .owner = THIS_MODULE,
>
> is this needed?
Left over from older conventions, any harm in keeping it? All modules
from that era appear to have it on the card.
>
> > +     .dai_link = bdw_rt5650_dais,
> > +     .num_links = ARRAY_SIZE(bdw_rt5650_dais),
> > +     .dapm_widgets = bdw_rt5650_widgets,
> > +     .num_dapm_widgets = ARRAY_SIZE(bdw_rt5650_widgets),
> > +     .dapm_routes = bdw_rt5650_map,
> > +     .num_dapm_routes = ARRAY_SIZE(bdw_rt5650_map),

> > +static struct platform_driver bdw_rt5650_audio = {
> > +     .probe = bdw_rt5650_probe,
> > +     .remove = bdw_rt5650_remove,
> > +     .driver = {
> > +             .name = "bdw-rt5650",
> > +             .owner = THIS_MODULE,
>
> is this needed?
Same as above comment
>
> > +     },
> > +};
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
