Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BB1619295
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 09:18:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A49B169A;
	Fri,  4 Nov 2022 09:17:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A49B169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667549892;
	bh=CH9rDTV98Ca3+zZeq5hW/4Ji9736O8XkVWFOW97yQYk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nvqZxBzXLBIftOU1cuDZeAA4a1Z4BNx243N3qIXjKea1p8CAMUrHNqO+nU6etVWFW
	 YyNlB47wCfVCPDitzoQomdMoZfF4qrmy4DXoI9w5fQx6wNSnpsrL/Z2hxzuKnu8cKO
	 lhiAKEa0wNVWbWw9HkZAXQvSKce/P+of4nq/Icso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB311F80566;
	Fri,  4 Nov 2022 09:16:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31EB6F8051E; Thu,  3 Nov 2022 14:20:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E051EF80155
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 14:20:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E051EF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Fskr4Ctz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667481638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ovqy3PKqpWLl3OLA2y49toePIlWwBHL4i7iH80Fhx1A=;
 b=Fskr4Ctz7bPtxt83M5kOb95bluQPNJ72mhctqYC36CAN9Q0+3+YM0CUvBcHiG6djXT7mQ2
 7oDcy/pV6K2Tszbp7R/G/DUJ2EGjsK//J5PnWlZTMWiplZbuo7fZXaGAwNFTznVR2UT4aJ
 /z1gOI6NF2zc7sX85gosdGxUptEUt7A=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-gwc0RgEKPGegwwUquJIjUw-1; Thu, 03 Nov 2022 09:20:37 -0400
X-MC-Unique: gwc0RgEKPGegwwUquJIjUw-1
Received: by mail-ej1-f71.google.com with SMTP id
 sc40-20020a1709078a2800b007ae024e5e82so1224102ejc.13
 for <alsa-devel@alsa-project.org>; Thu, 03 Nov 2022 06:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ovqy3PKqpWLl3OLA2y49toePIlWwBHL4i7iH80Fhx1A=;
 b=BFGfPYYZRudDNToLFhuWeWUKB7qCp9YeyiIsQFs3IJf28JiWxa74ViGxB6seWNa3nC
 XYo/dcUKggsPMygPpdLdJ/T50DvuJe+ArF/d0PCSTOKlCJPyQWT94blOgsIpBDX9pKam
 i1FNR21MHriaL20oiUf9SfV+XXdDxdnRK4kOj4Fl2ruoyeETSCHiJJI+uGpansy5h8z2
 JRMztdjiV5lv5Nftrky76VX6NxGgw09W7pb09aDk8K/PAL8su9AETSFu5rUuEAZGh1Vp
 Ybolx5w4fcIhSQTxFjL8cmR6qSX5vHOT5JENijWfPlnT5oR4jou25F7MRbnXNZ8B+GgU
 zHBQ==
X-Gm-Message-State: ACrzQf1Ad5f2ebNK8S6atZisjrWcqAiJOXUtJDHAI14FcCEr+LCiNxNR
 ddiEeMhBZSQELuZ218Cjx7CduorXv+9kIs3UU2xQMz+9/JaBepJBz22RSoTnAtr0JNp7HJ40hY6
 +etGUD5mLRArrkdCcUVq+lZuqAJWBO6b3bMrMqf8=
X-Received: by 2002:a05:6402:1f84:b0:455:27b8:27aa with SMTP id
 c4-20020a0564021f8400b0045527b827aamr29906957edc.243.1667481634779; 
 Thu, 03 Nov 2022 06:20:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4dSB/hFIGGg1daX/q2zXyhPTYqElWsOtD88QnVjE0ODSW0gMPiK5a6qFiztqjoR9Qd074eUZEbeRxeQ1+egl8=
X-Received: by 2002:a05:6402:1f84:b0:455:27b8:27aa with SMTP id
 c4-20020a0564021f8400b0045527b827aamr29906933edc.243.1667481634528; Thu, 03
 Nov 2022 06:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221102200527.4174076-1-jmontleo@redhat.com>
 <2bbe7bed-21d4-018a-8957-10d9dbe0c661@linux.intel.com>
 <87a658o4e0.wl-tiwai@suse.de> <20221103095404.GI92394@ediswmail.ad.cirrus.com>
 <87v8nwmgso.wl-tiwai@suse.de>
In-Reply-To: <87v8nwmgso.wl-tiwai@suse.de>
From: Jason Montleon <jmontleo@redhat.com>
Date: Thu, 3 Nov 2022 09:20:23 -0400
Message-ID: <CAJD_bPJet1Mk3mCrZc4eJm1gP=kk91VgmY-zMRFq5jxSQvBUPQ@mail.gmail.com>
Subject: Re: [PATCH] Fix kbl_rt5663_rt5514_max98927 regression
To: Takashi Iwai <tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 04 Nov 2022 09:16:01 +0100
Cc: oder_chiou@realtek.com, cezary.rojewski@intel.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>, regressions@lists.linux.dev,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
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

Thanks all for the feedback. I've adjusted the commit message as
asked, and updated rt5677-spi as well. From what I think I can see in
past commits it looks like separate drivers are done with separate
commits/patches. I didn't see any additional comments whether
endianness should or shouldn't also be set so I left it off. I can
make another updated if necessary.

I apologize if I'm mucking it up, This is my first kernel patch,
trying to follow along and do things right.

On Thu, Nov 3, 2022 at 7:14 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 03 Nov 2022 10:54:04 +0100,
> Charles Keepax wrote:
> >
> > On Thu, Nov 03, 2022 at 08:59:03AM +0100, Takashi Iwai wrote:
> > > On Wed, 02 Nov 2022 23:05:14 +0100,
> > > Pierre-Louis Bossart wrote:
> > > >
> > > > On 11/2/22 16:05, Jason Montleon wrote:
> > > > > Starting with 6.0-rc1 these messages are logged and the sound card
> > > > > is unavailable. Adding legacy_dai_naming to the rt5514-spi causes
> > > > > it to function properly again.
> > > > >
> > > > > [   16.928454] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: CPU DAI
> > > > > spi-PRP0001:00 not registered
> > > > > [   16.928561] platform kbl_r5514_5663_max: deferred probe pending
> > > >
> > > > Thanks for reporting this regression, much appreciated.
> > > >
> > > > a) you need to CC: maintainers Mark Brown and Takashi Iwai
> > > > b) the commit title should be something like "ASoC: rt5514: fix legacy
> > > > dai naming".
> > > > c) it's not clear if this is actually enough. there's no
> > > > legacy_dai_naming for e.g. rt5663 and the .endianness member is not set.
> > >
> > > IIUC, rt5663.c should be fine; it used to have non_legacy_dai_naming
> > > flag and it was dropped after the switch.
> > >
> > > But, through a quick glance, rt5677-spi.c seems to be the same pattern
> > > as rt5514-spi.c.  The rt5677.c was covered properly but the *-spi.c
> > > wan't.
> > >
> >
> > Yeah I think these got missed as they are effectively CPU side
> > devices but living in the CODEC space. Looks like it would be
> > reasonable to add legacy_dai_naming to both of them to me.
>
> BTW, the bug was reported on bugzilla:
>   https://bugzilla.kernel.org/show_bug.cgi?id=216641
>
> Please respond on there and add the link to the fix patch, too.
>
>
> thanks,
>
> Takashi
>
> >
> > Thanks,
> > Charles
> >
> > > > >  static const struct snd_soc_component_driver rt5514_spi_component = {
> > > > > -       .name           = DRV_NAME,
> > > > > -       .probe          = rt5514_spi_pcm_probe,
> > > > > -       .open           = rt5514_spi_pcm_open,
> > > > > -       .hw_params      = rt5514_spi_hw_params,
> > > > > -       .hw_free        = rt5514_spi_hw_free,
> > > > > -       .pointer        = rt5514_spi_pcm_pointer,
> > > > > -       .pcm_construct  = rt5514_spi_pcm_new,
> > > > > +       .name                   = DRV_NAME,
> > > > > +       .probe                  = rt5514_spi_pcm_probe,
> > > > > +       .open                   = rt5514_spi_pcm_open,
> > > > > +       .hw_params              = rt5514_spi_hw_params,
> > > > > +       .hw_free                = rt5514_spi_hw_free,
> > > > > +       .pointer                = rt5514_spi_pcm_pointer,
> > > > > +       .pcm_construct          = rt5514_spi_pcm_new,
> > > > > +       .legacy_dai_naming      = 1,
> > > > >  };
> > > > >
> > > > >  /**
> > > >
> >
>


-- 
Jason Montleon        | email: jmontleo@redhat.com
Red Hat, Inc.         | gpg key: 0x069E3022
Cell: 508-496-0663    | irc: jmontleo / jmontleon

