Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B89625BBBD
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 09:32:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ED0618CC;
	Thu,  3 Sep 2020 09:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ED0618CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599118377;
	bh=HoA69lv80afhN1L2O1t1wLyEATdorSOc7HndTSHMZYQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rlAzF3Mm4IYlk1a3ROPPJrjuqsvgMZql2wJ8j/CCBLMPvu8vVZ384t1pHdIPFeRjU
	 RyIv18HCepHDth6ifoOIoxaRzKCJJqE911h9wdKqwlYWqDCzTLtqkpiyODvULs8AQL
	 Ccj0qErzKEtDM/5zXyQKoqvgK2DzQvaqHkQU5OVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55883F8021D;
	Thu,  3 Sep 2020 09:31:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BDF4F80217; Thu,  3 Sep 2020 09:31:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1693F800BA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 09:31:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1693F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Fyg3uVtj"
Received: by mail-pf1-x442.google.com with SMTP id o68so1599047pfg.2
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 00:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eWgR4tSVODMFTW14quEFYhG5PeWt22bZJ48zs+tX/wI=;
 b=Fyg3uVtjGbwvuRttgW8YMbm9VlOOQYyfTMjQqOnhFxrt3Or2GWPV1KLR0UPDHdFyZx
 9FSrKv20fuLrsCDeuAOESNgb1Tfi1ZqN+vrOf9EGH7SjaEREqb4ptZ7Ydnso1Pe3PYzM
 +CRAdoiRdQar2BB48FouIrTAuzLYMcovGRw0GU5YiHdPmof9lf0mmn4v3Aigf/X2xiqs
 q3lAQ8G9qJIrc4CBCtbl6hQeta5WrVhgO0A9UIShyBHcLdvRFnfhh/l9ae+P+Tbozf1H
 xa5Tj8vfaDMJGoq8SE/VA0uV+JF/H0NymHSVYEPkyglx5pRHpwPaJ1HiPyO2ub4LMov/
 z44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eWgR4tSVODMFTW14quEFYhG5PeWt22bZJ48zs+tX/wI=;
 b=oJjJu9bG2swHSt3Ocam0KnX/SBgaeD4ggrB1R1ioFl5UVCHGzBLbw8NueATVU09Szw
 /TLzUpSdRk621Er71xlalMm8Yd2t6oHon660rqLuxR5fxQaq18XeIbRne/IZsMyHheiv
 ssmlyyAaAkI3nbr9yQGXP1q6KfWPge51vnyV/02Jk340ID09CgnXnSKGMmamDd6KZ8VJ
 Q2Hx4au6SGATAVQrJ+qW1n0gcPmar5uL0xmw1HrlAwWmw2K7AWCgnjdo/SJqOuQ6n+6S
 +FdGG8E/40zsel2H9mSGgRdRBpFqixOr6Ke7EfXiQwtRlDLShrmXmdhxWlXOgoBHOGls
 kPIQ==
X-Gm-Message-State: AOAM531EiozsPGOg69rzhvfRM1MUS1XgyjvzSgvU8lLT8YCy+SeCZz9V
 592+iLIBchRU2kgwo2gXVvQ=
X-Google-Smtp-Source: ABdhPJy2kLox/0S1Uckt9aAjNOmbc6sFpW1bAZtVarJyv0yrCPfc3l7gaW6zsf+hprFMkE8V4wgfCw==
X-Received: by 2002:a17:902:b405:: with SMTP id
 x5mr2495136plr.267.1599118265088; 
 Thu, 03 Sep 2020 00:31:05 -0700 (PDT)
Received: from f3 (ae055068.dynamic.ppp.asahi-net.or.jp. [14.3.55.68])
 by smtp.gmail.com with ESMTPSA id y203sm1986801pfb.58.2020.09.03.00.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 00:31:04 -0700 (PDT)
Date: Thu, 3 Sep 2020 16:30:59 +0900
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/realtek - Add control fixup for Lenovo
 Thinkpad X1 Carbon 7th
Message-ID: <20200903073059.GA3612@f3>
References: <20200829112746.3118-1-benjamin.poirier@gmail.com>
 <32b649db-ede6-d3ea-a963-d0bac331e4b4@perex.cz>
 <s5hft81czh8.wl-tiwai@suse.de> <s5hlfhsbn0u.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hlfhsbn0u.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Hui Wang <hui.wang@canonical.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Vincent Bernat <vincent@bernat.ch>, Even Brenden <evenbrenden@gmail.com>,
 Mark Pearson <mpearson@lenovo.com>
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

On 2020-09-02 10:28 +0200, Takashi Iwai wrote:
[...]
> 
> After testing the actual patch with hda-emu, I noticed that the
> Speaker volume changes the volume of both speakers, and it's also tied
> with Headphone, too.  That said, basically this is de facto Master
> volume, and we basically don't need to control the individual amp.
> 
> If that's the case, the following patch may work instead (checked only
> via hda-emu).  It applies the workaround to fix the routing, then
> rename the half-working volume controls that aren't touched by PA.  If
> user definitely needs to adjust the individual amp, they can still
> change the renamed kctl (DAC1 and DAC2), but this must be a rare
> requirement.
> 
> 
> Takashi
> 
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -5867,6 +5867,39 @@ static void alc275_fixup_gpio4_off(struct hda_codec *codec,
>  	}
>  }
>  
> +/* Quirk for Thinkpad X1 7th and 8th Gen
> + * The following fixed routing needed
> + * DAC1 (NID 0x02) -> Speaker (NID 0x14); some eq applied secretly
> + * DAC2 (NID 0x03) -> Bass (NID 0x17) & Headphone (NID 0x21); sharing a DAC
> + * DAC3 (NID 0x06) -> Unused, due to the lack of volume amp
> + */
> +static void alc285_fixup_thinkpad_x1_gen7(struct hda_codec *codec,
> +					  const struct hda_fixup *fix, int action)
> +{
> +	static const hda_nid_t conn[] = { 0x02, 0x03 }; /* exclude 0x06 */
> +	static const hda_nid_t preferred_pairs[] = {
> +		0x14, 0x02, 0x17, 0x03, 0x21, 0x03, 0
> +	};
> +	struct alc_spec *spec = codec->spec;
> +
> +	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
> +		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
> +		spec->gen.preferred_dacs = preferred_pairs;
> +		break;
> +	case HDA_FIXUP_ACT_BUILD:
> +		/* The generic parser creates somewhat unintuitive volume ctls
> +		 * with the fixed routing above, and the shared DAC2 may be
> +		 * confusing for PA.
> +		 * Rename those to unique names so that PA don't touch them
                                                           ^ doesn't
> +		 * and use only Master volume.
> +		 */
> +		rename_ctl(codec, "Front Playback Volume", "DAC1 Playback Volume");
> +		rename_ctl(codec, "Bass Speaker Playback Volume", "DAC2 Playback Volume");
> +		break;
> +	}
> +}
> +
[...]

I've tested that the following all work:
* DAC1/DAC2 volume controls in all 4 speakers/headphones
* 3 mute controls
* mute led
* plugging/unplugging headphones while PA is running switches outputs as
  expected
* loud volume, of course

... as well as some of the corner cases that I had tripped on when
working on my patches:
* headphone sound "wobble" due to the "secret" equalizer on output 0x02:
  not present with this patch; connection 0x03 is used for headphones as
  expected from the code
* resume after s3 suspend (which resets the codec): desired connections
  are still used

Everything looks good.
Your patch is simple yet effective; I'm humbled, thank you. You're a
true HDA ninja!

Tested-by: Benjamin Poirier <benjamin.poirier@gmail.com>
