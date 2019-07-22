Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EEC7039E
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 17:23:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44B661801;
	Mon, 22 Jul 2019 17:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44B661801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563809020;
	bh=RpAVD0vFfY3A85qzNbz8D5rkg2lS0hvRCdSDGYOLVmU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lE+IpvbsEEOwznpdHqNLNcwZLgAMie9T5uH1YFMsJ2Ke3JNc9ojCuViIm6qIsdmil
	 I5fTtn01MZBEwdAz2drB/ecswOPi4YMzT3vI6SNpbVQ4H0sh2/R1lf9ow/QDjt0rCK
	 2qMSG3AQZ72wA8kMUKjylavKvS+BCGyykzk86yFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1073F8015B;
	Mon, 22 Jul 2019 17:21:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC10FF803D1; Mon, 22 Jul 2019 17:21:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM, HEADER_FROM_DIFFERENT_DOMAINS, PRX_BODY_64,
 RCVD_IN_DNSWL_BLOCKED, 
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45F76F800E8
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 17:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45F76F800E8
Received: by mail-qt1-f195.google.com with SMTP id r6so34690534qtt.0
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 08:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pbrm6P8ozZzKpm0OxCMGSgZScoFWEg9X0MRg7kLdedQ=;
 b=UV4uIsY4PRHU7NcBLUCQPboHXD4iowFlrhdm2sonvOKvZ/EJ5LTtZbM2jY3zikopO7
 thyyYhcu5fUqb+Vp8fnIjLJcO6HFjTvUW2sNX/YaHgvX4zWjWpFBOupKpBV+1tBL683j
 XMFjtpQ4NWgfTgyVHExtfNIwU6eSj3NZfqrtihtlU/aJrb0PlF4Z/2iFemMrPSBsPWbm
 9RkqtwDcPWDMRoGAcf56nrTUAc2EkQn+WOEeUmwZ4I2x3ZtcR8bI2uuACwI8X5e1cG8e
 kfLE3+I51VK5EsRSP60UwbxtCIfjAxDmke0u/Vh7Yfk8k5iKoiV2FLU0XI4n9Obk4uYO
 Oh4A==
X-Gm-Message-State: APjAAAVmat0UlcQ4Ky068ckfSQ7KIGM6RLDUPKO5XaBXsMYRTDdu+jMH
 A2lGgVC2jINzbORQ2Mxv+nYHt72Rf+0Je7R/4e4=
X-Google-Smtp-Source: APXvYqxnPuowWMhrH6V+M7Ik6Aa9HM1kt0ksL4QItNC2I5iXYgej2trlQTdipljpGNH2ToxnNvKCkOD0h/aIs9Ld1Ac=
X-Received: by 2002:ac8:f99:: with SMTP id b25mr43173538qtk.142.1563808906647; 
 Mon, 22 Jul 2019 08:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190721142308.30306-1-yamada.masahiro@socionext.com>
 <de9e94ee-9c01-1c0c-4359-b637319a298f@linux.intel.com>
 <s5hftmy8byl.wl-tiwai@suse.de>
 <ec306745-052d-f52c-2cce-d8915822d4ff@linux.intel.com>
 <CAK8P3a2tLuqu+upt0nW8dUzXc+t_kEJwVhLcqY8TXydHLb_nCw@mail.gmail.com>
 <9a56ccdb-397b-3046-4043-49bc20aaa804@linux.intel.com>
In-Reply-To: <9a56ccdb-397b-3046-4043-49bc20aaa804@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 22 Jul 2019 17:21:30 +0200
Message-ID: <CAK8P3a29JcyMOfGGSpRCyeS913BSGn5bJT_pZ9e-K3Ds1E0UHw@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: use __u32 instead of uint32_t
 in uapi headers
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

On Mon, Jul 22, 2019 at 5:18 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> On 7/22/19 8:34 AM, Arnd Bergmann wrote:
> > On Mon, Jul 22, 2019 at 3:16 PM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> wrote:
> >> On 7/22/19 7:56 AM, Takashi Iwai wrote:
> >>> On Mon, 22 Jul 2019 14:49:34 +0200,
> >> Our goal is to minimize the differences and allow deltas e.g. for
> >> license or comments. We could add a definition for __u32 when linux is
> >> not used, I am just not sure if these two files really fall in the UAPI
> >> category and if the checks make sense.
> >
> > If you can build all the SOF user space without these headers being
> > installed to /usr/include/sound/sof/, you can move them from
> > include/uapi/sound/sof to include/sounds/sof and leave the types
> > unchanged.
>
> yes we don't need those files to build userspace stuff. The idea was
> that these format definitions establish a contract between userspace
> (more specifically the files stored in /lib/firmware) and the kernel.
> IIRC we wanted to make sure that any changes would be tracked as
> breaking userspace. If the consensus is that the uapi directory is
> strictly used for builds then we should indeed move those files

I don't see a problem with keeping the files in uapi for practical
purposes, but then I think it makes sense to apply the same rules as
for other uapi headers and use user-space clean type names.

       Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
