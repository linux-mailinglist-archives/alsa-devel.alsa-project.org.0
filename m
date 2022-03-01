Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCE24C821B
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 05:18:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F41F91B1B;
	Tue,  1 Mar 2022 05:17:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F41F91B1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646108285;
	bh=v7oiJacm0+wsOsNdjZM1Q3iSa762Qt1sZFgEqfpf3/c=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V7q9thYewhanaXUFc1kzn3yRSy0ok/KbrXHiSm/+BXPzyUtNB48UD1uVb39hdI+uq
	 KLUlelneRcovJYCufL8AyvTqLyAlwUOZ4+RXS5Yn6ZAKYZAJ7g2TtIZwrAgBA9jFIa
	 +NUvh3+vHQLD21LADm4itpEkEUn3c8VC2gDiKneo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 608F5F80054;
	Tue,  1 Mar 2022 05:16:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1105F80227; Tue,  1 Mar 2022 05:16:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C1A5F80054
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 05:16:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C1A5F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JQxukc8m"
Received: by mail-qv1-xf2b.google.com with SMTP id c14so10981166qvk.10
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=a+kppkTycC3UuAE3zYKwEfBmXUuizSRDhwoL1WcNRSE=;
 b=JQxukc8mcvSLwdLxySoaEPGjPPLr+SNJ0pANsXdDsQSTkvPAkn07jORviONn0SKPF3
 JCPLUXTpHNiZaIS0hXu8MVqhWE+l883K6zo9egflH58fmfqXWZ+353BRMwa+gDsmLg4P
 GOX1a2vfC9ePAs+eH1VXkYDzB6nWqBxB2Lf72tDPpA5PuBdaWa9JiNmmjMGPrlLPsZqU
 1LtQGYBc0q5uQV3KyMtBbyagBKp2OafDcRrrnHldnGvSpPYjMtvy7SSqrIoia9V2jvBT
 uUHmnNw8kUAYABTE7KCMsJKObkWw3iU3xQoFXE9ssssUfOpGo8ZPO3k0xQ2UBc3QbVVs
 0g/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=a+kppkTycC3UuAE3zYKwEfBmXUuizSRDhwoL1WcNRSE=;
 b=OjHPK91A8okxEeVkTtgnLjMmI0t2iht55uAI2kvTK7udSoQ9SowTf/BX2+KpZ+krt/
 1H5/izcuRShWRSv51117lIM88ezwru7Dx20MI3xJ7roN6/Pfg6kLDODZL7LAQ7aJOf1X
 4+AhJxcA6u2bsrgkCoboLHIbowTF5zB28Z20shAgBcj0QAgJlI+tGAqw6+DJUSBzZBry
 DkvN60bEd+pKuRzaNEuYDtKx4GjqUTW27TqfuZz1ocF3sJ8vcvzGu6RXTPN8Tyn1h1Zm
 Hd6U6KkyLXG/45Z0G80YEZbgxCTzGKatG1+VHMxqDxVYa6ClcGf1XSzcTnxpIdjHTPVQ
 qlVw==
X-Gm-Message-State: AOAM5321fZEEyNlMTjp0XO4x33CZYlYQUu9f0JKzSJ3jyOnH88hGe7TG
 4+zYGRCImvaKALyn3hjg+vHHmyoBMPk48IJxDPThIrLj
X-Google-Smtp-Source: ABdhPJw2PiTdUVMOKo7GscWaOaOoAZwR+XTippq+WfkNSyXJJ0KBGZHz6/wegRVfaodXxLsmzxfkXMnVddHI7MyxsaU=
X-Received: by 2002:a05:6214:19c5:b0:432:ec12:f121 with SMTP id
 j5-20020a05621419c500b00432ec12f121mr8280137qvc.128.1646108209376; Mon, 28
 Feb 2022 20:16:49 -0800 (PST)
MIME-Version: 1.0
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 1 Mar 2022 12:16:38 +0800
Message-ID: <CAA+D8AOfPuFfAS3OhEb0OupJfNGc9xwNrFrKPcCykfO_LQb_nQ@mail.gmail.com>
Subject: Issue in pcm_dsnoop.c in alsa-lib
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, 
 Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, chancel.liu@nxp.com
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
