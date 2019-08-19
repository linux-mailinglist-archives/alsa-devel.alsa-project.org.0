Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B27DD91D4C
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2019 08:46:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AD7E1673;
	Mon, 19 Aug 2019 08:46:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AD7E1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566197214;
	bh=+Fu50Hn1j360oM4ZswAIadalg5ynFqIVVlHQZ2RIYhk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qaLdlSmHFRJk+QN4uhNRgqDI98iv1qqdqVRaZeXSz9Nhu3FzKjao7FrPEiUo+x2D+
	 TfRmde7QkHcxZvjscPgfOrQh0t6EWRDoa8SXKzrHGXrPMM1dz+MSLcXLTM3jkcX6ta
	 sdq3GGzuxrkX3yHCH6oOuAO+1s9r3iq8ySTj/6t8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82F74F802FB;
	Mon, 19 Aug 2019 08:45:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 876E5F802E0; Mon, 19 Aug 2019 08:45:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 423C7F800AA
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 08:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 423C7F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GyhMQmq8"
Received: by mail-wm1-x341.google.com with SMTP id 207so549884wma.1
 for <alsa-devel@alsa-project.org>; Sun, 18 Aug 2019 23:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aWjmZ/tcdGCe3FIHA1H1MZ0hY9QWosLUbHqDOu2BOJk=;
 b=GyhMQmq8X3JLnxr0KE7hKW3yrSWL8S+Fv4SlFteuQ5pxrRKTNwCCRADR4q2oocKMes
 NdwkGSQefaCLh5f1/XFhRIkSpICW0MpLwKwRP3pdhZuLl3c2NR+yrsvh6pEtxcOMjs5m
 3PBVR7Xjj/xLSIVExarsIelIG3fWckI3OPusu1rZwGrVU7DhHx+atInWvwJUrtyqsME9
 5bw1ZmuIc36NEN5rThmr5AC1sct3jTLOdY8MndOtJkwOuPN9QF+VSz+xRyMgoLZ0pYgj
 HBqKqjYdSFX4zl3s5D6WMaaBtq3ckNYPEvuX5PDjNHwI/tyBcmh9WCceUqd2XEd3Buzm
 2K4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aWjmZ/tcdGCe3FIHA1H1MZ0hY9QWosLUbHqDOu2BOJk=;
 b=abrzwzGv8tZKRsbzTkSCo8oXgguEJYYQwDTa6Ci5zpWGXqLAKG5iOD0p99oaBBexyT
 hSD/SgenWTBW5Lk0Q/7Ka+gJZ6T/Th1yRzLxweUGbsNB/ziL8up1+IuXNclXCtRcnjX6
 Wlu83s+Hcu2/ImlFmdKP7XhM6yHZwJqpa/2xzWA05f3efezZLBmmo7izdwne3wDhTLyw
 EqN9kHgLZZ4nA0p6L2+yHeqRHpFIGf4YH1p7BOvFW21SafWH+lntimECF1SGTrpRwEhA
 28NmkbcpQ2p1E3CFgPe63V9iI4gO/OO5km4wwFlzUa3mgp/8UFIcZ8YcY/shkjD0AQRZ
 H5Ag==
X-Gm-Message-State: APjAAAVw0jcPhWRg9nN3rb85F9wSOtwOpHHh6docbyAe7DC1KrJFBoxM
 3JACJP7vsSL75asfhirli2mq6uyAR4l/xCY0H0g=
X-Google-Smtp-Source: APXvYqwRxfStEI10GqR73+XwJdJMz8z39j4p4/FZ4J0MYRwo3WYniHCZMCvYj9S7pHK5ijLCG+Llp3PqtSDT+2pVV3s=
X-Received: by 2002:a1c:6a0b:: with SMTP id f11mr17161062wmc.87.1566197099765; 
 Sun, 18 Aug 2019 23:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190815154500.29090-1-pierre-louis.bossart@linux.intel.com>
 <20190815154500.29090-3-pierre-louis.bossart@linux.intel.com>
 <c8c78674-7af8-4577-9e18-da85c064b345@intel.com>
In-Reply-To: <c8c78674-7af8-4577-9e18-da85c064b345@intel.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Aug 2019 09:44:48 +0300
Message-ID: <CAEnQRZAvVs=-pCcNwhWw=wV54jZU5Fu0QAGLnZ8bvK4J3+YRcA@mail.gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: SOF: imx: Add i.MX8 HW support
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

Hi Cezary,

On Sat, Aug 17, 2019 at 6:22 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2019-08-15 17:44, Pierre-Louis Bossart wrote:
> > From: Daniel Baluta <daniel.baluta@nxp.com>
> >
> > Add support for the audio DSP hardware found on NXP i.MX8 platform.
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > +static void imx8_get_reply(struct snd_sof_dev *sdev)
> > +{
> > +     struct snd_sof_ipc_msg *msg = sdev->msg;
> > +     struct sof_ipc_reply reply;
> > +     int ret = 0;
> > +
> > +     if (!msg) {
> > +             dev_warn(sdev->dev, "unexpected ipc interrupt\n");
> > +             return;
> > +     }
> > +
> > +     /* get reply */
> > +     sof_mailbox_read(sdev, sdev->host_box.offset, &reply, sizeof(reply));
> > +
> > +     if (reply.error < 0) {
> > +             memcpy(msg->reply_data, &reply, sizeof(reply));
> > +             ret = reply.error;
> > +     } else {
> > +             /* reply has correct size? */
> > +             if (reply.hdr.size != msg->reply_size) {
> > +                     dev_err(sdev->dev, "error: reply expected %zu got %u bytes\n",
> > +                             msg->reply_size, reply.hdr.size);
> > +                     ret = -EINVAL;
> > +             }
> > +
> > +             /* read the message */
> > +             if (msg->reply_size > 0)
> > +                     sof_mailbox_read(sdev, sdev->host_box.offset,
> > +                                      msg->reply_data, msg->reply_size);
> > +     }
> > +
> > +     msg->reply_error = ret;
> > +}
>
> Assuming reply.hdr.size is coming from HW IPC regs, msg object is
> representing application side - SW, kernel. If so, is msg->reply_size
> value an estimated size (which can be overestimated since exact size may
> be unknown by the host) -or- the exact size of incoming IPC reply?
>

I would say msg->reply_size is the exact size of incoming IPC. At least for this
example:

Look at sound/soc/sof/pcm.c

sof_pcm_trigger

-> sof_ipc_tx_message(..,..,&reply, sizeof(reply))

msg->reply_size = sizeof(reply).

On the firmware side:

https://github.com/thesofproject/sof/blob/master/src/ipc/handler.c#L912
reply.rhdr.hdr.size = sizeof(reply);

> The estimated-case is usually permissive as long as assumed size is >=
> reply.hdr.size - dev_err needed. In the exact-case, it should be viewed
> as a requirement. If such "requirement" fails, is it valid to read
> mailbox regardless? Is this to extract some error-debug payload sent by FW?
>
> Just curious, please feel free to correct me here, Pierre.

If you think an improvement can be done, please send a patch :).

thanks,
Daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
