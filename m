Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E03CE2871
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 04:49:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 033B21658;
	Thu, 24 Oct 2019 04:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 033B21658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571885386;
	bh=iccjQvAaE92+mpULRv816ksL2fAFks+r3++BTTVS2RA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iDAykLFgSC2WTU6f+rmrMhdlhTJ24Zx9mQLlQOs1z2PuWJ/tNjbIaDSXEjC/Mend6
	 /WYi0/tQEdRh3tGEbH8Iv99241fNsND4PbK3b1dV/AvCCxTTKDYDaAH5P3i3g9Jk8C
	 HwAhik9EnphIsGDFOxNsN2wt0IMic6k/Qn14oVmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 243F8F8036B;
	Thu, 24 Oct 2019 04:48:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A14CF8036B; Thu, 24 Oct 2019 04:47:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, PRX_BODY_135, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C1A7F80137
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 04:47:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C1A7F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aLsFQsA9"
Received: by mail-vk1-xa43.google.com with SMTP id n81so3338225vke.13
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 19:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nrlKHjqh679RSd+IakII5jolEcDIhr/F0OAuUImlbDQ=;
 b=aLsFQsA9VcucDe2LwFAzBAVRDgrnqQwIcuFI7FO7WCuF1laJ2uJ2sQdYlp8hdIHmNW
 tk4hycrQiiwPcJadeG6lQvdej197qpMBW4YNNlT7KnMBKJQz2cll0a9Oabgpn8n4CaFh
 2A33nLDT/031XsZK1u9FGp1gKYGoXLxe5P4UuRo9y2EHNVY02OOwf2zLOG7kTW5lC30z
 vy6IbHVR0Us0EYoDsBUAx+g3n6+1fhNmd8WA2y4ZSztE61qiCeNv84OuZCJwoEEggHMd
 D+Kl/5YZqRtSV+hk84K3DCuJ7ATRfsr69Gue31MbZQUGzoyIp9OUrI/VKwPkamgr85d+
 lNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nrlKHjqh679RSd+IakII5jolEcDIhr/F0OAuUImlbDQ=;
 b=OcCiMZ4hu59J3nfDXNjrlwy3yNULIeT4Ekb6OcBWbutpCJX/1ahmZExVKJKv4oVKNK
 2r4e7DjL2pFGXXzT4uSJU2EA02EkB69UrdFej1eGsCtNdNMP/2+UEjVo8cpc3s/bfxTV
 Hl2fpo9YTn6Sv0aOlQRky6YfjHFu3Ar0/Rf83R9HMtyJ5Gvxcor5mbLDHBES36gqXJQw
 ccg4u+4vihEo+C9pV460jnDi5rfAzl8bbj3o421cf6fO7KeCcKxQ+ZKiOqiZIVLP0kEl
 mkjoWh5AO1sdmIcxo/oUe6FIjD6CNM/NzxRwFfP7g1FhR8zu66a7ZjLs0erMfaRwP/Jo
 +KUQ==
X-Gm-Message-State: APjAAAUo/K+c25LNrJB5FJPtzqxwp0fpitcNO9RwOULwANPPLmDhTDxb
 qN/9Ae9WlcD/YXF9zdAR5vj8mpN0O/hv9pc0wYk=
X-Google-Smtp-Source: APXvYqw0ZLNL5Ev8CCHeW9EnWJvc0ASgsQ4z7/y870SRvj96VHmRc3zIBLkB0P6Wt0CDuwFAar27UgV98joSRrfXvnk=
X-Received: by 2002:a1f:9712:: with SMTP id z18mr1073989vkd.22.1571885272485; 
 Wed, 23 Oct 2019 19:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <CA+9XP1jeMVuzj0gz_-H6zV=cmjWQwvBLi08AED1KBie+kugmcg@mail.gmail.com>
 <s5hd0eocas9.wl-tiwai@suse.de>
In-Reply-To: <s5hd0eocas9.wl-tiwai@suse.de>
From: Fly Pig <flyingecar@gmail.com>
Date: Wed, 23 Oct 2019 19:47:44 -0700
Message-ID: <CA+9XP1ipsFn+r3bCBKRinQv-JrJ+EHOGBdZWZoMwxFv0R8Y1MQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Add Gustard U16/X26
 device family to quirks for native DSD support
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

Got it,

Tested using VID and fp->dsd_raw method. Works as well, patch updated
below. Sign off line attached.





--- a/sound/usb/quirks.c 2019-10-23 05:38:05.664262661 +0000
+++ b/sound/usb/quirks.c 2019-10-23 05:41:15.907336660 +0000
@@ -1452,6 +1452,7 @@
  case 0x2ab6:  /* T+A devices */
  case 0x3842:  /* EVGA */
  case 0xc502:  /* HiBy devices */
+ case 0x292b:  /* Gustard/Ess based devices */
  if (fp->dsd_raw)
  return SNDRV_PCM_FMTBIT_DSD_U32_BE;
  break;





By making a contribution to this project, I certify that:


   1. The contribution was created in whole or in part by me and I have the
   right to submit it under the open source license indicated in the file; or
   2. The contribution is based upon previous work that, to the best of my
   knowledge, is covered under an appropriate open source license and I have
   the right under that license to submit that work with modifications,
   whether created in whole or in part by me, under the same open source
   license (unless I am permitted to submit under a different license), as
   indicated in the file; or
   3. The contribution was provided directly to me by some other person who
   certified (a), (b) or (c) and I have not modified it.
   4. I understand and agree that this project and the contribution are
   public and that a record of the contribution (including all personal
   information I submit with it, including my sign-off) is maintained
   indefinitely and may be redistributed consistent with this project or the
   open source license(s) involved.

Signed-off-by: Justin Song<flyingecar@gmail.com>





On Tue, Oct 22, 2019 at 10:04 PM Takashi Iwai <tiwai@suse.de> wrote:

> On Wed, 23 Oct 2019 06:05:08 +0200,
> Fly Pig wrote:
> >
> > Hi There
> >
> > This patch add native DSD support for Gustard U16/X26 USB Interface.
> Tested on
> > my unit, working properly. Hence submit the patch.
> >
> > Cheers.
> >
> > Thank you very much.
> >
> > Pig
>
> The upstream code changed the DSD detection recently, so your patch
> doesn't apply.  In short, check whether you get fp->dsd_raw set.  If
> yes, we can apply the vendor check instead of vendor:device pair
> check.
>
> Please resubmit the patch with the correction, and don't forget to add
> your sign-off line (see Documentation/process/submitting-patches.rst).
> It's a legal requirement for taking the patch to upstream.
>
>
> thanks,
>
> Takashi
>
> >
> > --- a/sound/usb/quirks.c 2019-09-22 21:28:09.757897000 +0000
> > +++ b/sound/usb/quirks.c 2019-09-22 21:33:36.892274800 +0000
> > @@ -1369,6 +1369,7 @@
> >   case USB_ID(0x22d9, 0x0461): /* OPPO UDP-205 */
> >   case USB_ID(0x2522, 0x0012): /* LH Labs VI DAC Infinity */
> >   case USB_ID(0x2772, 0x0230): /* Pro-Ject Pre Box S2 Digital */
> > +        case USB_ID(0x292b, 0xc4b3): /* Gustard U16 */
> >   if (fp->altsetting == 2)
> >   return SNDRV_PCM_FMTBIT_DSD_U32_BE;
> >   break;
> >
> >
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
