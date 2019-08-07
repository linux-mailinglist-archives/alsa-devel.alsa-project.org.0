Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 647AE85455
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 22:12:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0718A86E;
	Wed,  7 Aug 2019 22:11:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0718A86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565208720;
	bh=HB4qJPtVRJqlwNTlGsRYBKBOfcO3VCGlMpQipgbAUH4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bZ4D/m+pIoXuCHy3XMFoL2WDT/fuEuekZxdpIUUOHYpTHPasoN91RNyaUViqTSXzg
	 tTSJ5XKztdOW3A8xj1moAjwssK+VLcdFzAFbE0cUHHrXy5fBfOJijcfaZmJAat8Sie
	 I8WVQDsVKD1WZ2zUN7boCttcHZKYsI1XCtzEbX/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 611A8F804CA;
	Wed,  7 Aug 2019 22:10:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EA62F80290; Wed,  7 Aug 2019 22:10:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D570F800F3
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 22:10:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D570F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="zkUHyI/F"
Received: by mail-yb1-xb43.google.com with SMTP id b16so1295153ybq.0
 for <alsa-devel@alsa-project.org>; Wed, 07 Aug 2019 13:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ixWwo170ddgPTE2aN8ESbm6u2JStuwxevjwaO3Irl5c=;
 b=zkUHyI/Frrj3vbk2lwu3qCQ7ou4nGdUrlRWxtoRmVtRji392kmu8x5WVPwDGGMBuOY
 c2PX8M6XjLpma8i5GDgKORGSu3iT/zI/Tdbs+iP50C85soAZkACGoWw6JmA5dvsCPGZ9
 k7uKqzzRnUuZ5Wfn4wDiq2tbcIfw3E9oZR5rMxvNgcAhqMbRu/XiL9m7gcNejJCFPJWe
 CLjQBJA/zRHkPeBKF7BLGnp4uKDRCZc+6monxbEAzDFWeZ+hO8O4whQwLmtaTk+gcPZn
 a8c5LcMiSWONfv0j3VK0JGqm8faK7RJbHOhSay9xkO8XpnM3+T/PoCKzvhXMpAvLP5cU
 lngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ixWwo170ddgPTE2aN8ESbm6u2JStuwxevjwaO3Irl5c=;
 b=FSPpQvvcv/e3WHJgMzwZUQQarQGnLFmLv05hHOeelqywcOCUVcn/EXaojK/9sStNxR
 1HnOVF4O0KVbL+XQygojRJhmqvWs0ihS50UTCBR655Ltj31StXwxSTaG0j9uR1JXMW0I
 gfo3Sw+wsNmbm4bPzG6sN1Dvgn3tyRpgDZQdULh5ulJhdvlWRRGo+cMlQh2yMD7oE26r
 Tlg9TPWRdg4Iin3HXOwVwHnupQ//kV+jhj3LUAABXdj461yg38HIqWpOcyWvxMILfXu+
 uJDvTOkK1hmr3G/QeiWeN9lsnq4Q/SpawOF/o+zOQjZL2tx7VpxoIJ2L5yfHxaC88Cef
 EwDw==
X-Gm-Message-State: APjAAAXkvEMzcjbg2Cy3fNTrG3hWs7ChOuWl1ndj4ewWzhYclQjyvXC4
 YwALMe8JiRPUBRFxj0XDitiZt7AHFVp2r0DTZiNGiQ==
X-Google-Smtp-Source: APXvYqwNOwFXewgkfh9oF3chxVXABA5rc8A0TqZA7pqx0jtXliIO8wXSiVHr2ipHXvxOBl9aqKzGpOYztoMzenjRCL0=
X-Received: by 2002:a05:6902:533:: with SMTP id
 y19mr3260172ybs.109.1565208608135; 
 Wed, 07 Aug 2019 13:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190807145227.26216-1-pierre-louis.bossart@linux.intel.com>
 <07fe0e09-6984-76c9-da7c-a1992e7f7b64@intel.com>
In-Reply-To: <07fe0e09-6984-76c9-da7c-a1992e7f7b64@intel.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Wed, 7 Aug 2019 13:09:57 -0700
Message-ID: <CAFQqKeXnSFUDG_72LGhxMD5aAU-DjnnPc9oqcrWBy_NfJNRQLg@mail.gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: tiwai@suse.de, Linux-ALSA <alsa-devel@alsa-project.org>,
 Jaska Uimonen <jaska.uimonen@intel.com>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: topology: use set_get_data in
 process load
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

On Wed, Aug 7, 2019 at 12:32 PM Cezary Rojewski <cezary.rojewski@intel.com>
wrote:

> On 2019-08-07 16:52, Pierre-Louis Bossart wrote:
> > From: Jaska Uimonen <jaska.uimonen@intel.com>
>
> >       process = kzalloc(ipc_size, GFP_KERNEL);
> > -     if (!process)
> > +     if (!process) {
> > +             kfree(wdata);
> >               return -ENOMEM;
> > +     }
> >
> >       /* configure iir IPC message */
> >       process->comp.hdr.size = ipc_size;
> > @@ -1835,7 +1890,9 @@ static int sof_process_load(struct
> snd_soc_component *scomp, int index,
> >       if (ret != 0) {
> >               dev_err(sdev->dev, "error: parse process.cfg tokens failed
> %d\n",
> >                       le32_to_cpu(private->size));
> > -             goto err;
> > +             kfree(wdata);
> > +             kfree(process);
> > +             return ret;
> >       }
> >
>
> > @@ -1886,10 +1916,36 @@ static int sof_process_load(struct
> snd_soc_component *scomp, int index,
> >
> >       ret = sof_ipc_tx_message(sdev->ipc, process->comp.hdr.cmd, process,
> >                                ipc_size, r, sizeof(*r));
> > -     if (ret >= 0)
> > +
> > +     if (ret < 0) {
> > +             dev_err(sdev->dev, "error: create process failed\n");
> > +             kfree(wdata);
> > +             kfree(process);
> >               return ret;
> > -err:
> > -     kfree(process);
> > +     }
> > +
> > +     /* we sent the data in single message so return */
> > +     if (ipc_data_size) {
> > +             kfree(wdata);
> > +             return ret;
> > +     }
> > +
> > +     /* send control data with large message supported method */
> > +     for (i = 0; i < widget->num_kcontrols; i++) {
> > +             wdata[i].control->readback_offset = 0;
> > +             ret = snd_sof_ipc_set_get_comp_data(sdev->ipc,
> wdata[i].control,
> > +                                                 wdata[i].ipc_cmd,
> > +                                                 wdata[i].ctrl_type,
> > +                                                 wdata[i].control->cmd,
> > +                                                 true);
> > +             if (ret != 0) {
> > +                     dev_err(sdev->dev, "error: send control failed\n");
> > +                     kfree(process);
> > +                     break;
> > +             }
> > +     }
> > +
> > +     kfree(wdata);
> >       return ret;
> >   }
>
> On several occasions you've added individual error paths instead of a
> unified one. Personally I don't find it easier to read and understand
> function's flow at all.
>
> <ifs with goto err>
>
> err:
>         kfree(process);
>         kfree(wdata);
>         return ret;
>
> doesn't look that bad..

Thanks for pointing out. Perhaps, the error handling can be improved a
little. We can fix in v2.

Thanks,
Ranjani

> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
