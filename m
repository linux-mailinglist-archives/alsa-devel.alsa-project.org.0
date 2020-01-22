Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D51145E12
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 22:32:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32647168B;
	Wed, 22 Jan 2020 22:31:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32647168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579728729;
	bh=ZEh0pBXJaOBlCGZLSnc08Z0eSdV2jEaHQcWRoSXBGy8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JKtp5WoAeqHJ3baxzKW1A0SMjqFratWX+ESSOY5ZXKbUqz0gUwvWnVgtb+ucM5j1e
	 FcIdcvYHthc8C0fUbwWaKvgmqJnzH/bXGYfMJKJdAQNAkVVAl1oR9DEI+O7GjL80jD
	 RcEjRhYzqKSo1tcU+R0vHkNqGl3ydnBr5TzVchzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FD8FF8020C;
	Wed, 22 Jan 2020 22:30:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D621EF8020C; Wed, 22 Jan 2020 22:30:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC9CCF800BA
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 22:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC9CCF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="bFyN4fxi"
Received: by mail-il1-x144.google.com with SMTP id t8so559387iln.4
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 13:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DhLefeNqLeukNBDhmhbZJgA1ak2CJQJmeBa8rPkAeV0=;
 b=bFyN4fxiX7zrizD9YMMKcciofic++lccIO+VmQtFVf/OXEx4v8sh0L1Er1wbxstB75
 Fdv/JR5HDYAtVVd0txcXXQmI1JXXaVRHNjHNnSfQDpgdUKF22nCVLLsEaVALAk+8qvBc
 F4pnbwyTQ+zYNahg22U5KKeJoXiNVRiDJaOWDyNkiJZkjLjOv98+lClWUTJjL2LZ8Dp8
 XWuSX4o6+bo2dbCKDRWLNWexnnVOrCj+g7fxRrkip5tTsQNmfztcKz7QPBctGKJdQXEo
 XbOGOm5Eq/xbU1Pq9oCM68HIwD7wVz/rrIe4rDTx0YWIEZfAT8E8Syd1MckmRU2JBxvG
 xLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DhLefeNqLeukNBDhmhbZJgA1ak2CJQJmeBa8rPkAeV0=;
 b=WHMUE16HZdNqt5R8yrloo+xNkHVdhG+5P29wZ9Q1L8tsN8rKi5zzDDsOCOWHmgvrpC
 jKbocVT6Bbz74AuqRDysJRIhKxtb1cyrYwCP2MGZVtn+S4LkryEyKtdTLxXJ3IOfdIxs
 YPWxHGQhEXVzUdLivhaB9JNK3iyqwNgaKcCf3+zZ3CWI8fX7XcEShnRUnjMz2c+g8HcL
 2pZ9brB4vKJK9jqfiULJoaHr659qqjch2009mPZhBEPxVLzWXvbciqjOgMlf1qhCWN2y
 TOQ22kLrKiUj4S+eYae7h84YKVQoozcGtdUrdtxe/G3dyBQ/QJdk1H3u6x7uc9Xs97we
 QTZA==
X-Gm-Message-State: APjAAAWkHiHHlgO2Q7UQ3mNHMElrBQP2yyT6tOTQCuitL7HT7K8UWeu6
 Lq73R0KeUTDLZJUGMbDtp9lcreipZal+7cPctUdBeQ==
X-Google-Smtp-Source: APXvYqyF2PYz1Y234JnbVa/1Tc2Nz7VIz4RZ+eyK68xVbiFQhyxVourP83f/DaZkt8vey56LsNUjB5YLCKLSoNzaUtE=
X-Received: by 2002:a92:5b49:: with SMTP id p70mr7403916ilb.209.1579728615263; 
 Wed, 22 Jan 2020 13:30:15 -0800 (PST)
MIME-Version: 1.0
References: <20200122181254.22801-1-cezary.rojewski@intel.com>
 <0c4a19c3-f1e3-7b76-be42-e4902645955b@linux.intel.com>
In-Reply-To: <0c4a19c3-f1e3-7b76-be42-e4902645955b@linux.intel.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Wed, 22 Jan 2020 13:30:04 -0800
Message-ID: <CAFQqKeVi8OBNc0ON+ogFBv07fYV25G3oK9Hsnydfg-sTwYZx5A@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, tiwai@suse.com,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: skl_hda_dsp_common: Fix
 global-out-of-bounds bug
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

On Wed, Jan 22, 2020 at 11:58 AM Pierre-Louis Bossart <
pierre-louis.bossart@linux.intel.com> wrote:

>
>
> On 1/22/20 12:12 PM, Cezary Rojewski wrote:
> > Definitions for idisp snd_soc_dai_links within skl_hda_dsp_common are
> > missing platform component. Add it to address following bug reported by
> > KASAN:
> >
> > [   10.538502] BUG: KASAN: global-out-of-bounds in
> skl_hda_audio_probe+0x13a/0x2b0 [snd_soc_skl_hda_dsp]
> > [   10.538509] Write of size 8 at addr ffffffffc0606840 by task
> systemd-udevd/299
> > (...)
>
> You could probably skip the call trace, it doesn't really provide much
> information.
>
> Kai and Ranjani, do you think this impacts SOF as well? Or does our BE
> override somehow suppresses the problem?
>
Hi Pierre/Cezary,

SOF does have the same problem too but I thought we're allowed to have dai
links without platform component? An alternative to adding the platform
component would be to do something like below.

Thanks,
Ranjani
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c
b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 11eaee9ae41f..dacf8014b870 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -112,6 +112,7 @@ static char hda_soc_components[30];

 static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params
*mach_params)
 {
+       struct snd_soc_dai_link_component *platform;
        struct snd_soc_card *card = &hda_soc_card;
        struct snd_soc_dai_link *dai_link;
        u32 codec_count, codec_mask;
@@ -148,7 +149,8 @@ static int skl_hda_fill_card_info(struct
snd_soc_acpi_mach_params *mach_params)
        card->num_dapm_routes = num_route;

        for_each_card_prelinks(card, i, dai_link)
-               dai_link->platforms->name = mach_params->platform;
+               for_each_link_platforms(dai_link, i, platform)
+                       platform->name = mach_params->platform;

        return 0;
 }
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
