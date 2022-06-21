Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0766B552984
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 04:47:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B5BC2866;
	Tue, 21 Jun 2022 04:46:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B5BC2866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655779662;
	bh=kRciXbB0ceOithCE22Px31uo+3KmDv6IcnJj3+loB/w=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uva7y5Q2f/DR7EFentRXrUbbSLynwifJJzWVjSht0Od2n+0KHckbIE4MyXjggygJN
	 0PNnans+u4l0+FSZVengyBY5aKeEzE502bsG0DQoEh+33WNjk6L4VdGT7PIkEDLpOS
	 Jnnvh2Qm/N8dGYoAznLb0o8RkcMmG1QUSVKov2TM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77090F800E3;
	Tue, 21 Jun 2022 04:46:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9606F80155; Tue, 21 Jun 2022 04:46:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25925F80104;
 Tue, 21 Jun 2022 04:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25925F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EZZD1iIO"
Received: by mail-il1-x135.google.com with SMTP id o4so1680937ilm.9;
 Mon, 20 Jun 2022 19:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=n0ZsIsM1hSR8SGvAfAtb7KID3gwNumol7V8bVZdmf0c=;
 b=EZZD1iIODzbzmjZQH98fxiXZR/QSLe1jSJpBpvZhmHGUL35fiA9n+Q763NWlgMS1sR
 jb2K+13zcsA0FClskwO/JXlts6b8KH/TnE1BKXF/TOxwcntXz0CtFSmiKZDjBQRvGGCg
 bpIXVtcMfX9DjxaE1xFQpyMpjvwaFYivZNhRlaNk/QfYEZ5+KNp6VAfJArtUJKT6rAj+
 uJDGuqe32rQQuimSePJLRap0K0VvOqATjUpMIoi2m/sdb942Co1voe0//FXm+x4kcC+M
 7fnJrgb+ErkS3O+VHB7dYMRlsm4RL/HURqBhbhKrPe7a9Tw3Os5Wzzo3m3ZztC/bLq9y
 3JeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=n0ZsIsM1hSR8SGvAfAtb7KID3gwNumol7V8bVZdmf0c=;
 b=YTcoq90/Xa8z3t0Bu2qER5Ac1EGqkE9WHUclaqy+UuCdVIc+fzLZzpjq0js4gcFL7/
 OPdTNyxjS8AkronXJZl1dyntFTsopfSAyX9gO5/vNTd4YTN8bZVTfrbcwooLbBWSFoSv
 34sKqs21QLJQwsiCn6INbJ3iOc5mcVe0bZoBTIranR9yOL9cp1oR/0eHbsyj5iY2E70z
 b0mpXm0ztTGAKUmDXM8uNMzC4c21aF+1kwCzi5JHyG9w+cZtAou8qLaoN1VtYOou9+oM
 TM1sOF4W73c4J6YUZJS7IslydlHjJukHai/n5nxHC+lvb0lIsiqRy21ZddWpVxlIkT90
 9PDQ==
X-Gm-Message-State: AJIora8dxNfIpLkbc5+EfOvBPUcykqE2rcoy8tWpE5z7LEwFp2EYXbg4
 IAYCKK/E7Ue89IHDIMmS++tCHJhV6Ixo00nkWtA=
X-Google-Smtp-Source: AGRyM1uOcgAoNIHrtAKB0jOSkrlpxkoN+kKY6aQBqLn5XVcXMu7pRmUCaGexdfqf+YEivorkJA5UxwK8ajAbFJujePM=
X-Received: by 2002:a05:6e02:17ca:b0:2d3:e6bf:7724 with SMTP id
 z10-20020a056e0217ca00b002d3e6bf7724mr15059355ilu.312.1655779594570; Mon, 20
 Jun 2022 19:46:34 -0700 (PDT)
MIME-Version: 1.0
From: noman pouigt <variksla@gmail.com>
Date: Mon, 20 Jun 2022 19:46:23 -0700
Message-ID: <CAES_P+_aC4cHMB3Tn0pz13_gKCpXs=efeae2JBvEPOK5zidYnA@mail.gmail.com>
Subject: ASoC: SOF: Race condition in ipc.c
To: Mark Brown <broonie@kernel.org>, liam.r.girdwood@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 linux-kernel@vger.kernel.org, yangyingliang@huawei.com, rander.wang@intel.com,
 yung-chuan.liao@linux.intel.com, sound-open-firmware@alsa-project.org
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

Folks,

I have borrowed part of SOF architecture for my own DSP
framework development as the memory on the DSP is
extremely small and wouldn't be able to support SOF.

Currently I am running into a race condition as below:

CPU                                            DSP
PCM_TRIGGER_START
sof_ipc_send_msg ---->

                                      <------Immediate ACK
ipc3_wait_tx_done
(wait_event_timeout)
                                      <------ POSITION update

snd_pcm_period_elapsed


As you can see TRIGGER_START didn't even finish
and waiting for it to complete in ipc3_wait_tx_done
function. However, before it could complete the position
interrupt was issued which results in calling period_elapsed
function.

In order to fix this I assume below is called in SOF framework:
schedule_work(&spcm->stream[substream->stream].period_elapsed_work);

How is this design working? If the interrupt is coming too fast
from the DSP than the associated function with this schedule_work
will not get called as the scheduler will not get time to schedule the
workqueue and elapsed function will not be called thereby not increasing
the hw_ptr. How is the flow control for data transfer achieved?

I am facing the above problem in my design.

I am wondering if I can simply add one more IPC command(don't call
wait_event_interruptible for this) after TRIGGER_START to start the
streaming.This way schedule_work for updating period_elapsed function
can be avoided and it can be called in an interrupt context.

Thanks,
Variksla
