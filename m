Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D25D71D4C8B
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 13:26:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 804941669;
	Fri, 15 May 2020 13:25:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 804941669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589541993;
	bh=sRbCY0i9wN9MiwHYpn9bpouLYcwA2EwcmbJ/gPav3Lo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TY8GLYootzJvCsWYFsWxknju+jqa1BVY/xjp+dWPi64V0WTinjiYCtdPmRex7Yd+W
	 VXD89c8mQk1mLkpScwplF3Ar+X5u1A1FNGjD2qQuNLh99EbV02RE0GhMPCRD252/zG
	 JdYzt6irNUGxv8voIalHpCqy9oAN6/DZMv5Mm6Fo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A11BBF800B8;
	Fri, 15 May 2020 13:24:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2E74F80247; Fri, 15 May 2020 13:24:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 189DFF800B8
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 13:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 189DFF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bdJP4YKx"
Received: by mail-wr1-x443.google.com with SMTP id l11so3165869wru.0
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 04:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hSawsvMl5EP9RrORkGiXZlTDfRhQ0VxHw8fmFJ5AOko=;
 b=bdJP4YKxEx431napwutgf/H47ATR8OJV+Mulhd/AWyxZAt7iQbuA9iSXXn+GFMPgt8
 YyKAeuPQJ8RZNxU6Ny23qAC77SDcKC4d8IUrZsUE8qmP1Sg4UmhKltJ/jsFytFpLeEq4
 4ZmYc8BlNqGAqa5UjUJ0Dy6U3NdTjnRmM6LIcahl/PLR9o4nLoJAZhbrXa5+QmUAl2+4
 OGitXQHMXfMSu9wz3u4FcnuG3Wlqmhj0lI1BCqw5giY3HsHGLvS0p55LcfyVgrpy9Wn9
 lIUED9i8odhY8GpH6G1O8ZTkXiPJTKkRKe8mos82eyzeBauqBNW1dvvZwUzYqnDxPikb
 Z8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hSawsvMl5EP9RrORkGiXZlTDfRhQ0VxHw8fmFJ5AOko=;
 b=cFcntzejZqe0lo54R9mCh8BSX0FxIBJqk5vekN9MypHnSl45nTGAgZihZuxGGdovdN
 jnyyITfKgFAxhacpXb2wIiFnmxVGleJ/zM2AobRrdWTDsBuHwW62I3Yi1pLNhho5JYIu
 yGRcSuk6yvTB9crYDpOPm2fFwhgbctSNhXpN3ZGEPkEc1svCngJAPMV2cGBV+t0CTto/
 hjv4p+3EY/nFOhZvPn3PZ14qxf0gF3SmXHdk2xGU91SACyCqZ8yk0kqUMd2OQpCnlqH3
 aIAOvQcMP2dU0vs4jWYzSA6WBAjPWnWK/A/Gc+wPs80su8zaFC+9+H3gOzDhnoEVgdgU
 JIQw==
X-Gm-Message-State: AOAM531fIkEwBBPusG/puFi6w+V9PeN6flHZe0eHCx3F/LCft4GosUUG
 TdIWFqMJ7WK2YBF9/nZ9/Wxcmz9q
X-Google-Smtp-Source: ABdhPJwBDu3mexj/Sykln7UTq9jIAfT/4gwk8uhBijJYdKJl6Hw+01DmWm0etuhvNxmo6sfqq+uXCA==
X-Received: by 2002:a5d:6108:: with SMTP id v8mr3627252wrt.286.1589541882205; 
 Fri, 15 May 2020 04:24:42 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id 1sm3213690wmz.13.2020.05.15.04.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 04:24:41 -0700 (PDT)
Date: Fri, 15 May 2020 11:24:11 +0000
From: sylvain.bertrand@gmail.com
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] augment snd_pcm_drain() documentation regarding its
 non-blocking mode usage
Message-ID: <20200515112411.GA550@freedom>
References: <20200502193311.GA19340@freedom>
 <47281cd6-2ae5-309e-f1a9-8906ff50c9cc@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <47281cd6-2ae5-309e-f1a9-8906ff50c9cc@perex.cz>
User-Agent: Mutt/ (2018-04-13)
Cc: alsa-devel@alsa-project.org
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

augment the documentation regarding the use of the snd_pcm_drain function in
non-blocking mode.

signed-off-by: Sylvain BERTRAND <sylvain.bertrand@legeek.net>
---
 src/pcm/pcm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)
---
diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index 1064044c..0d4b2930 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -1311,8 +1311,14 @@ int snd_pcm_drop(snd_pcm_t *pcm)
  * \return 0 on success otherwise a negative error code
  * \retval -ESTRPIPE a suspend event occurred
  *
- * For playback wait for all pending frames to be played and then stop
- * the PCM.
+ * For playback, in blocking mode,  wait for all pending frames to be played
+ * and then stop the PCM.
+ * For playback, in non-blocking mode, will return -EAGAIN if the pcm is still
+ * being drained at the time of the call. A note of caution: the pcm can finish
+ * draining asynchronously from a snd_pcm_draw call. The pcm will be then in
+ * SND_PCM_STATE_SETUP state which means any subsequent calls to snd_pcm_drain
+ * will fail since you cannot switch the pcm to SND_PCM_STATE_DRAINING state
+ * from SND_PCM_STATE_SETUP state.
  * For capture stop PCM permitting to retrieve residual frames.
  *
  * For stopping the PCM stream immediately, use \link ::snd_pcm_drop() \endlink
