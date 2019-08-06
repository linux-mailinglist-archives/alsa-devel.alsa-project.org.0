Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA02F82C35
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 09:02:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D0FC1667;
	Tue,  6 Aug 2019 09:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D0FC1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565074976;
	bh=VpI3JwBpVYlQN5MKxl8eHGdvuLpshNldU+YIxTq1OKs=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=izHdMzK7fs+6N2ElLQHOlz9TRBTyysW3i2MppYFuh3ki9xlDuaSwFKM6NmpoKnZa0
	 mjR3NPYriAEzYD7J3XrE5Wi/grV3gcUKFPcbT54NvJNdpbva+GkRk5XsYO+Wi7YuUO
	 zJxYpdYKc+/3u01clS3BSzmTn0vMduTnu5hShmEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A250BF80483;
	Tue,  6 Aug 2019 09:01:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89226F80483; Tue,  6 Aug 2019 09:01:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ajax.cs.uga.edu (ajax.cs.uga.edu [128.192.4.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5778CF800F3
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 09:01:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5778CF800F3
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54]) (authenticated bits=0)
 by ajax.cs.uga.edu (8.14.4/8.14.4) with ESMTP id x76713uG032291
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <alsa-devel@alsa-project.org>; Tue, 6 Aug 2019 03:01:05 -0400
Received: by mail-lf1-f54.google.com with SMTP id s19so60141179lfb.9
 for <alsa-devel@alsa-project.org>; Tue, 06 Aug 2019 00:01:04 -0700 (PDT)
X-Gm-Message-State: APjAAAVdH29Md2SS1UoW5m56X2QKsYk8cqhGRtmSjza83+I64RiTnidU
 1hhEYU9VbHyvWG+K3A7QoRAKLMnbYzS1hepJblU=
X-Google-Smtp-Source: APXvYqzK+h1zd05B5faJWK4k6lnbLwPVygF0Bc2bfH0WYGAZDBEe12r9ifxxD8N9NgISRwr6acMQCGJE4l4x2+UVOtA=
X-Received: by 2002:a19:cbc4:: with SMTP id b187mr1253490lfg.27.1565074863147; 
 Tue, 06 Aug 2019 00:01:03 -0700 (PDT)
MIME-Version: 1.0
From: Wenwen Wang <wenwen@cs.uga.edu>
Date: Tue, 6 Aug 2019 03:00:27 -0400
X-Gmail-Original-Message-ID: <CAAa=b7f=SG6QR248JD9_VP89B=D2p3pdYcSAzRLchbJTpdXt_A@mail.gmail.com>
Message-ID: <CAAa=b7f=SG6QR248JD9_VP89B=D2p3pdYcSAzRLchbJTpdXt_A@mail.gmail.com>
To: Wenwen Wang <wenwen@cs.uga.edu>
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Richard Fontana <rfontana@redhat.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: fix a memory leak bug
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

In snd_usb_get_audioformat_uac3(), a structure for channel maps 'chmap' is
allocated through kzalloc() before the execution goto 'found_clock'.
However, this structure is not deallocated if the memory allocation for
'pd' fails, leading to a memory leak bug.

To fix the above issue, free 'fp->chmap' before returning NULL.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 sound/usb/stream.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 7ee9d17..e852c7f 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -1043,6 +1043,7 @@ snd_usb_get_audioformat_uac3(struct snd_usb_audio *chip,

                pd = kzalloc(sizeof(*pd), GFP_KERNEL);
                if (!pd) {
+                       kfree(fp->chmap);
                        kfree(fp->rate_table);
                        kfree(fp);
                        return NULL;
--
2.7.4
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
