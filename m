Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 307BFD3234
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 22:42:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE7911675;
	Thu, 10 Oct 2019 22:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE7911675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570740145;
	bh=MSkNJNTSm3aBE9ulCPtwtJCVnHWvOcErhlolL63DgCc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JCm/ZbzabhDNgOI/2QqjOorGSYqTSTEe9PSYkebEPliZrlC+OYbtlCJ78avfQxXMj
	 EcMOoIlmChcreOWW2ICuXhJZpZnPaybtA1WP7EARAY/0uPg8QvYY6dBUKMnNas17Dl
	 5e5fcszlrX6G5/K+y4qWglhoe1xf2GZ4b63q7KXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41EB3F80447;
	Thu, 10 Oct 2019 22:40:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D934F8038F; Thu, 10 Oct 2019 22:40:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22CE9F802BC
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 22:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22CE9F802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="F2Kuy9cu"
Received: by mail-wm1-x32c.google.com with SMTP id y21so8094670wmi.0
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 13:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xtf5LheklZ4rgm2ExWBGsogpHCCf2p4yW1CRSaeltpk=;
 b=F2Kuy9cueDNOVzFWgqerwnWwKZFO/fmPw0YEOhNlNSKF48A4y1+0d73OXbwKfP2BlJ
 dCYg84emQvFxNO69UCf6b79Fq3iwiow8mgUoDEtvfYS449jkot95UM88dTZlVVp1Le+M
 PCJDIIDkivVeYj+basCLL5cp2mpLsaZEd+lHvhsHYR05ZJzKIA5n3UHyINnbgr5tUYEx
 EcH8+EUXj3Kkjb3ZftfZ/STDXfMqecuO0DGpwKYz/SomBdYqBclqAXlF3i3QD6VjaNLd
 pCwkRUqG8U2cU56lapuDjX/HCaC9P08stcz90LxMmTTTovReE1VE2YKHvQsE3rwM1rDn
 ECKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xtf5LheklZ4rgm2ExWBGsogpHCCf2p4yW1CRSaeltpk=;
 b=M7qhzyqnrl/zqUzIIV4+ji4GCH05duVqG5dqp/0R1fQhHrh5n0LFedJnbUcD6b8JCW
 MontLEfVqAAhGD5pRW2QB8/fBDyvlR0uLENilT55cZuR0wUq1pixtlq0Xczoaj2cgpiT
 47JvOzv54KmLT7q6eDc8QGvP7AoThu9KzzlO0JpiOMefZbRRfhcOWOOjRoDQydW78Cgi
 C6STAbTH94mA4SXMbXYgvwSgtAj/e7EyslmVx6gCi4sXkqx3SjM3vj0hW3phHvKdIJI5
 yMtK708B15lQHupmwAVMwL/XacrjOF4aXerSu7Og3aPApqwmKT35lD8pDKx2W0UsNGbD
 3HBw==
X-Gm-Message-State: APjAAAUtYezw1SqrcAMywK48OA6uPM2EOLXa/syzl7xK5BQ8zvdwqbQc
 BWw6FJIViHkGa8UJHO2+yLnDRskh5HA2cmVlbdTmJSUiDdc=
X-Google-Smtp-Source: APXvYqzmarqULD4yZ9naK/rktZ51s9auDud7l5LCjVeKSYVU8euyvRns2gUGceLVGqlvZTR2cMqDPxYxCShN/+k5OzE=
X-Received: by 2002:a1c:7dce:: with SMTP id y197mr284934wmc.171.1570740034325; 
 Thu, 10 Oct 2019 13:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAEnQRZDhhZHOyqC8QSmgy+CY5eYSktPUiL6tVF9z_5ACegCsQw@mail.gmail.com>
 <CAEnQRZABxV+s3bF1yRr2TF0EJhZ-u+ZXxuvvz5so8AfyHVm8wA@mail.gmail.com>
 <87zhiaixfj.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zhiaixfj.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 10 Oct 2019 23:40:22 +0300
Message-ID: <CAEnQRZDZc3vWVQTTa37opRs7aqx8xzTHTBB3oHXCrmeFTZRBhQ@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Counting links in simple-card
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

On Wed, Oct 9, 2019 at 3:18 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Daniel
>
> > >      * ex1)
> > >      * CPU0 --- Codec0
> > >      * CPU1 --- Codec1
> > >      * CPU2 -----/
> > >      * CPU3 --- Codec2
> > >      *
> > >      *    => 5 links = 2xCPU-Codec + 2xCPU-dummy + 1xdummy-Codec
> > >      *    => 7 DAIs  = 4xCPU + 3xCodec
> > >      *    => 1 ccnf  = 1xdummy-Codec
> > >
> > >
> > > So, I don't understand exactly how did you get the formula for links. AFAICT
> > > there should be 3 x CPU-Codec + 1 x CPU-dummy.
>
> CPU1/CPU2 and Codec1 are using DPCM.
> Thus, it is...
>
>  2xCPU-Codec:
>         CPU0 - Codec0
>         CPU3 - Codec2
>
>  2xCPU-dummy:
>         CPU1 - dummy
>         CPU2 - dummy
>
>  1xdummy-Codec:
>         dummy - Codec1

One more question: How would you describe in the DTS this scenario. Is
this, correct?

machine_drv {
        compatible = "simple-card";

        simple-audio-card,dai-link@0 {
           cpu {
                  sound-dai=<&cpu0>;
           }
           codec {
                 sound-dai=<&Codec0>;
           }
       }

simple-audio-card,dai-link@1 {
           cpu {
                  sound-dai=<&cpu3>;
           }
           codec {
                 sound-dai=<&Codec2>;
           }
       }


simple-audio-card,dai-link@2 {
           cpu {
                  sound-dai=<&cpu1>;
           }
       }



simple-audio-card,dai-link@3 {
           cpu {
                  sound-dai=<&cpu2>;
           }
       }

simple-audio-card,dai-link@4{
           cpu {
                  sound-dai=<&Codec1>;
           }
       }
};
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
