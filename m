Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4584485A3C
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 21:48:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56C9B1A7C;
	Wed,  5 Jan 2022 21:47:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56C9B1A7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641415729;
	bh=lohHRU5jWlGu6k1D0eqMf5rq/tlxU/RuB+Sox3qE/5M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ls43j+Z499uVi7+BmvwNOjUf2VYYbGhHye1xhbJURUpU8IoLk+fzuJsqeimwUkt4p
	 /YKuLpWIyrxoEcuRMBhxxY7qyI90Rnvooe2vNyJ6dikizGcl3HnJXR9VKFZQlZEgap
	 u2P9nq08kk2ovX4AGSJ14Qkk544MEUTRHpdjU2SM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6986F8020C;
	Wed,  5 Jan 2022 21:47:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70E4CF801D8; Wed,  5 Jan 2022 21:47:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15894F800BB
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 21:47:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15894F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SZctfo1h"
Received: by mail-wr1-x42b.google.com with SMTP id l10so659181wrh.7
 for <alsa-devel@alsa-project.org>; Wed, 05 Jan 2022 12:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1x22qTFpSb6bZYn4CjnxGFO6nFWt/OFzC8ECKf/TSSM=;
 b=SZctfo1hPZ4+VueES6umOTaX5ArRZH1k20tFig/f5g5S8PHnA/WRAJyO6JnoDWWprm
 f7fn21+vqlPKEp+NvvVxfp8DjmmJ7e14iy7NPb7UPW7b8SDZ3MW6DzDUzyte0tR6zJxc
 1SGxenTEib1SXfvPuKQx3T/H2mW1fpTqSv+evMMpWui8biayJbtCIDrBIgFpyJTyXK0X
 zHq4RlLBnHShZfP9xYVgItMqV6w1kO//fSMDK3J6HkvlAmyOv+oOiWdy1FevszaapwDI
 ylACGSZYh+6BsNfQLuCSTOeljjrO3Oyo+GwL3FRcLI5RCdA9+6/dEYJ9GCAWOd2XqcYJ
 yp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1x22qTFpSb6bZYn4CjnxGFO6nFWt/OFzC8ECKf/TSSM=;
 b=7H5GIhA5XYx9O2TEmqkUsG5fzT93hCqGVm8zCy9R/7DU3pRHUvJ2sIvN/YrlpeMBk1
 OpxM65akDBzNdSMxZl4zyTYVkxHllhRltGif0p35CgVH/Kfw5exmEHHdTz4SWD1qs4j6
 08P+m690r618oLL5SS5pva0a6bubo5L6HJfqr5JP9/yrktpViz3EQ93HPGEJe2j5OFDI
 GVYlcz/z2lLj1MA1HNgJmqgLQpio74OcGBqyHZIBA+D7B2GFB77PMAhTu9l7vHr8jvdq
 uciD9tyJwO0m5cdNxsvzDT7aPtZCYI3KbuJGJU+uEwX3l+O+b0Tqk1kvbphcSeyES+q4
 lu6g==
X-Gm-Message-State: AOAM530GkxdeOBoxmh2U+3bLxMWtfrbwwXC8la0hyku4t2dIdjzfyTQp
 qAN9P8/Z/fTOPhQPRh9PnvdnoQESpw==
X-Google-Smtp-Source: ABdhPJxrKsonu8HSPiyLncCPyhyqqtEtCox3TnC70oXID5E/YxsZ9mQ/sd0VXxqvso6F2un2AEqO1A==
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr47614758wrz.127.1641415650471; 
 Wed, 05 Jan 2022 12:47:30 -0800 (PST)
Received: from wave.lan (ip5f5bf846.dynamic.kabel-deutschland.de.
 [95.91.248.70])
 by smtp.googlemail.com with ESMTPSA id m12sm44552wrp.49.2022.01.05.12.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 12:47:30 -0800 (PST)
From: Stefan Sauer <st.kost@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: seq: virmidi: Add a drain operation
Date: Wed,  5 Jan 2022 21:47:17 +0100
Message-Id: <20220105204717.12175-1-st.kost@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAJ4JBRO7qE63TAC-=4y=QMaiAEfkyjRmgiZEF_57Hm+ztc8+Qg@mail.gmail.com>
References: <CAJ4JBRO7qE63TAC-=4y=QMaiAEfkyjRmgiZEF_57Hm+ztc8+Qg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Stefan Sauer <st.kost@gmail.com>
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

If a driver does not supply a drain operation for outputs, a default code
path will execute msleep(50). Especially for a virtual midi device
this severely limmits the throughput.

This implementation for the virtual midi driver simply flushes the output
workqueue.

Signed-off-by: Stefan Sauer <st.kost@gmail.com>
---
 sound/core/seq/seq_virmidi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/core/seq/seq_virmidi.c b/sound/core/seq/seq_virmidi.c
index 4abc38c70cae..f5cae49500c8 100644
--- a/sound/core/seq/seq_virmidi.c
+++ b/sound/core/seq/seq_virmidi.c
@@ -262,6 +262,16 @@ static int snd_virmidi_output_close(struct snd_rawmidi_substream *substream)
 	return 0;
 }
 
+/*
+ * drain output work queue
+ */
+static void snd_virmidi_output_drain(struct snd_rawmidi_substream *substream)
+{
+	struct snd_virmidi *vmidi = substream->runtime->private_data;
+
+	flush_work(&vmidi->output_work);
+}
+
 /*
  * subscribe callback - allow output to rawmidi device
  */
@@ -336,6 +346,7 @@ static const struct snd_rawmidi_ops snd_virmidi_output_ops = {
 	.open = snd_virmidi_output_open,
 	.close = snd_virmidi_output_close,
 	.trigger = snd_virmidi_output_trigger,
+	.drain = snd_virmidi_output_drain,
 };
 
 /*
-- 
2.34.1

