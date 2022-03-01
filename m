Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 622504C820E
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 05:15:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F15BC1B19;
	Tue,  1 Mar 2022 05:14:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F15BC1B19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646108107;
	bh=v7oiJacm0+wsOsNdjZM1Q3iSa762Qt1sZFgEqfpf3/c=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j7jD3GMuSOe886mHpWAKEY5Wn5G4LSg1m1zfqi0CE6FKlazw6OASWZbelpyEqMJbw
	 tZc6NTNdYo4UP8TC+Jc/6/0KhsgX+o/lmoxzKOkKGjq6oByVjMZuT40tJo6HwW4etm
	 TtP2b6Zy7ECPClVBTc9JBOLtpvc/Bx+DXBWXht9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65C42F802D2;
	Tue,  1 Mar 2022 05:14:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19FD6F801D8; Tue,  1 Mar 2022 05:13:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9888FF80167
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 05:13:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9888FF80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="T2Ujh5Dq"
Received: by mail-qv1-xf31.google.com with SMTP id 8so15843367qvf.2
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=TA4z/TQd5Ml23p6Mp3p/g231OA/seFe8B/IVikvo0Pk=;
 b=T2Ujh5Dq9BlAbtru7jelh0O0xu1vzZ51bB6xlv3FMEu1EZoLUXGHJheFiBMgMQdF1u
 pBDuSg2qaAZ9z+o3E7uTyTEbiBpoPk4cDL2OvMyy8mo7iBAz04iQzKSlKOca6kjZ8FgY
 Taupq7pY97wY6wQ/iWX1rRGn6JqFJdD0MgMrf6cikLF2q2LbDJKsIJN3xGRHPJXXc4Mg
 XLzCLDMfE0v9xyXdmjNug2ytOik0VcOJ/M1a7goUm3PXO01u+9q3iOa83VvsbRoR7poG
 kNKL18jyAob1gRGmnZVQ7h3icGrarQKDikucK3pettkDoPm2Z3ny3QzNU1fVTZlcnxSf
 A7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=TA4z/TQd5Ml23p6Mp3p/g231OA/seFe8B/IVikvo0Pk=;
 b=o2WtFT06+eWON4RWquieTtgyOruTRJFxOB4TWYXGXtmhUKOqDSumkLdgSD3y3dMXOs
 kf8WMDcIk7zUFKbCR8sxpS3PXteCxcUz3pFhjB8ss04OhdhSAutOBVNyuFFV6GHZjPa8
 Gv4wIl+6Nlk3DYbvGeNzCVnPgTq6tOseRq3WitB5smMYhKk/ahAZjfcHl52yoPr4XEAQ
 +FI/HjfCFQJzpwD4QOJiUZcxXL9RGXtjoctQTasIW1QpFWfCcGMlhGHYVpGhg7sF+o9x
 ZNj6Op6m/l1k1PN6CUxx+S0WhN+3Qk47pG7+CDm/Tq1oajtJZKc6dinNubfIj60JTZXm
 FaVw==
X-Gm-Message-State: AOAM533lgq2FTJOzsRBmRLgKPe7fkgIQHfLXQLsT7rYXoZVNQHgmjyCq
 dvGSRxNkZG8f/G6aDwSco1T/9h5m7sbzaNHKoiS4laSIw0I=
X-Google-Smtp-Source: ABdhPJxeh9UUKlnqT+996Ah9uhtPO8bZDPrS9IuTO+lwSIeAA3o7xnmBT67PQc4UXYVOOUNI+/uL88bK7LRnSxJq+T8=
X-Received: by 2002:a05:6214:19c5:b0:432:ec12:f121 with SMTP id
 j5-20020a05621419c500b00432ec12f121mr8276272qvc.128.1646108026149; Mon, 28
 Feb 2022 20:13:46 -0800 (PST)
MIME-Version: 1.0
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 1 Mar 2022 12:13:35 +0800
Message-ID: <CAA+D8AMxmrxL9rWuZ6uStpHwBY3b4DhVcfKsYzZJ-mJHwNARKQ@mail.gmail.com>
Subject: chancel.liu@nxp.com, shengjiu.wang@nxp.com
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, 
 Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi Takashi Iwai, Jaroslav Kysela

    We encountered an issue in the pcm_dsnoop use case, could you please
help to have a look?

    *Issue description:*
    With two instances for dsnoop type device running in parallel, after
suspend/resume,  one of the instances will be hung in memcpy because the
very large copy size is obtained.

#3 0x0000ffffa78d5098 in snd_pcm_dsnoop_sync_ptr (pcm=0xaaab06563da0)
at pcm_dsnoop.c:158
dsnoop = 0xaaab06563c20
slave_hw_ptr = 64
old_slave_hw_ptr = 533120
avail = *187651522444320*

  * Reason analysis: *
   The root cause that I analysis is that after suspend/resume,  one
instance will get the SND_PCM_STATE_SUSPENDED state from slave pcm device,
  then it will do snd_pcm_prepare() and snd_pcm_start(),  which will reset
the dsnoop->slave_hw_ptr and the hw_ptr of slave pcm device,  then the
state of this instance is correct.  But another instance may not get
the SND_PCM_STATE_SUSPENDED state from slave pcm device because slave
device may have been recovered by first instance,  so
the dsnoop->slave_hw_ptr is not reset.  but because hw_ptr of slave pcm
device has been reset,  so there will be a very large "avail" size.

   *Solution:*
   I didn't come up with a fix for this issue,  seems there is no easy way
to let another instance know this case and reset the
dsnoop->slave_hw_ptr,  could you please help?

Best regards
Wang shengjiu
