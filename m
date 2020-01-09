Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EC2135464
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 09:33:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 100A51760;
	Thu,  9 Jan 2020 09:33:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 100A51760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578558835;
	bh=6CibdlS5pHKX7SbQBZVUTRQ3TwPnqku5l+U7TQYMe9A=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LTdLF8kEF65T+3Z4dnBGnU6HM92YnKK28DS/seqDhO8JfWiGkxIoj1v6+XKbxLtYI
	 lPyjawfhJU1ceVE+ni056/VPARk6lWFouAJvvBO+9x4FrRVusiqLjEtVx7dfOrdO8G
	 V2J3iNCd2qaZd3uqQE/fHa3oWBvA/RR0mVOXA690=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7688BF8014E;
	Thu,  9 Jan 2020 09:32:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33C79F8015B; Thu,  9 Jan 2020 09:32:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 776A7F80101
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 09:32:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 776A7F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BjYJn2wI"
Received: by mail-lf1-x12b.google.com with SMTP id 203so4522407lfa.12
 for <alsa-devel@alsa-project.org>; Thu, 09 Jan 2020 00:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=uJve4snUPmUSpawppJTMpPSQrfqBOYV7ulYZNa0BJdk=;
 b=BjYJn2wIVW90qheAuR6uOH1BpZNu2dQtZ0/xrWXncPnZ36MsHNVAkJJApWkypNC7y8
 nzPoawjziAVXafsUkATP9xAnkTp9TuZlcw2wCFxkz23ouNS/lqoQtGk4gVNn/SvSNhaR
 Oj1P5i7c3zUBFGYBDSMT603JgIWUmhtTjotfPMzdiW+dfvBpdI5tlqjn5iI1lZxOp7iY
 3t2cjeAwPAcuIKsiPzjQoB1aFc4rAoO8a0fp6I7NrNp12eiuvwdznkwfIopsMQujy2ed
 3Rc+/DGNUiLVAly/cm85V3lSdFlww92608lLMdScQnq5Jc2ZKHC8pxhFO/7N3lst7ERF
 P4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=uJve4snUPmUSpawppJTMpPSQrfqBOYV7ulYZNa0BJdk=;
 b=cpkhVazfSrdp15vWL+gTtG7tOgPicNsM0cnmVE2hkHa/ZfOvX4ZuWD1VZKBADFXb1c
 jPnkq0F2blISqXldMYkYT76bLsPeV+Aj796FadAU861GgtFjDjFSyhZigecYdKDFPObi
 zPVc8AIK0K6eBo3O4Kmf8lyrISbINaFyOw4uECQc2k2CMV+3v4Y77qk0P3RpF2GV2XNr
 LGnPdh51t3ZplsmhWLo4zVmO7Vt3vnFMOy9F4WItLlHA9BDx19w+EXUdCfFcfKjMe25s
 bTrB7TBt81TGU/fMUTebH0lhY3kx02Z33ibGvL+TD16aJ8fsQtxIqmeu82PrgZf5/5Oc
 wQ1A==
X-Gm-Message-State: APjAAAVX/cnNaz5UPsxB0SWI5xCglXFzN795E28K4YHSrxx19bc72TmT
 48rBlBeXmIMHdzvaMyhKQGOzlgsj/buxp+T6F4W0hywR
X-Google-Smtp-Source: APXvYqxSiPiNLkw8ZlwX5TkRwwdoU0owC+Dp0y8iCMWeSffe31ocQx4/KOMJ+oIrUooBsoMpZbHG5zAYeNUcqAOd7ZE=
X-Received: by 2002:ac2:4adc:: with SMTP id m28mr5402196lfp.26.1578558725048; 
 Thu, 09 Jan 2020 00:32:05 -0800 (PST)
MIME-Version: 1.0
From: Gabriele Zampieri <gabbla.malist@gmail.com>
Date: Thu, 9 Jan 2020 09:31:54 +0100
Message-ID: <CAAx3WaD_W7qUq7u7rvN44cT9hg6a4Ae8D=2C=6PumsnXopnnbQ@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Playback/Capture on a codec-to-codec link
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

Dear all,

I'm working on a board that is equipped with a Bluetooth chip and a gsm
phone, both connected to the CPU (AM3352) on 2 different pcm. I wrote the
codecs and they are working (read as: I can play/record on both devices).
What I want to achieve now is to route those pcm together and still being
able to (at least) play audio on both. I tried alsaloop, but it eats too
much CPU (80% +) even in half duplex loop (BT capture => GSM playback), and
it was the only application running. In [1] I saw that I should be able to
route the codec together in kernel space (to avoid data copy between user
and kernel spaces). I did not tried that solution yet because it's not
really clear to me how to implement it, any suggestions/examples? If I
follow that solution, can I still use those PCM to playback my audio file
(I see that I can disconnect that link through a mixer control, so this
should be possible)?

Again any suggestion is really appreciated.

Best regards,
Gabriele

[1]:
https://www.kernel.org/doc/html/latest/sound/soc/dpcm.html#hostless-pcm-streams
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
