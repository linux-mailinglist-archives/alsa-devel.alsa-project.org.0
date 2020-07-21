Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 146FF22790F
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 08:52:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6666168A;
	Tue, 21 Jul 2020 08:51:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6666168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595314357;
	bh=iLmVukZ1LTdnqN0mWCNh6aTVl0nsJlY8rbv9DyDXADU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UNbSUJ29jyAa+7i5OWXjr5KflBr+b+oEF8LPXCuYeQMB/CiUMuhHIFI3dXpfytWCN
	 oKyGZLh3O4yu42kOHfDOye101zFTvBMsKfHQZIORoA+sFJz9p9ygK5gX9LkaXEoyyL
	 OkID4JoVGSjdpyeZbCsaUHDWg446I81ownKT4eeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7269F802DB;
	Tue, 21 Jul 2020 08:49:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4CD2F80274; Tue, 21 Jul 2020 08:49:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6B70F8024A
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 08:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6B70F8024A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Wf0BSoO4"
Received: by mail-ej1-x642.google.com with SMTP id w6so20538702ejq.6
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 23:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MXd+8fNEs/7NpbKYbNoDL1fdvOiNsA9CFQHvIgqYAuM=;
 b=Wf0BSoO4c2mfB8mDYdEc0+PCMRPUk3Fb+HyTVXaMHkHggmIFwAzyni1s857sH04OCt
 NcNKcn2/3u5QKaR8XZznNDQ7+4pE1UKOsL8IUOBvoWxBDtpDUtmEnDEBiUDaV5D9hH/7
 Wv1Dm/RR4AdRHYKqku1bsNovP1oQAjgE0h0hEAjp8AA7hfzKDg4T98aSXxpuoInL/sZ0
 DdjLPxusLNO6fTJZ9nGw6fmgALTc4Xmk54IHzn0Crb/92igJbou1AQ6pBUxm5rJDzJKA
 IpX0RhbKlt74RPV6/qGEPPmpXGQX2rSRG/y/ccMy1XaQUMFtsHCU7UMkJTVIqzpjrkJP
 C0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MXd+8fNEs/7NpbKYbNoDL1fdvOiNsA9CFQHvIgqYAuM=;
 b=SGKhyTl5XhijQGcwqaUl8B+nq2nZfTmuIlFHqPwtUCFJRgs9KX3XGLJcRjxxoOBvQg
 rC/2XQJ9EkcrYHJDkwjtv8/WGTkCfVP3AHadujFPjKPH4tQb40t2FC1W5TfM7KGYoxaQ
 CKBTkRaPxdBgRX/9+qKiykfdG2i/tbsjgDIIsUqJkStchPfm2lZPrHpuHj0wHfnjznj3
 lSedihoDiW9T5R20jSjEFF98WsIAx94E4Ik0DSp0w/8FzCbdrTxDJQw+AWRmasNBKCuy
 R8nu+52TH1L6wlggxa9nn64FEau8K5LSFXxEQmUCpzA5VvLngHGKhGLwwt3oSX3hmKLL
 0g3w==
X-Gm-Message-State: AOAM530aqAR+riPRgmL+Nz37ZQLrh9oaD0CbK4idzvrpesuyXYidsUs0
 KxTJI1dnj8sO5EmFMqULadEEQnAB5zoNPw==
X-Google-Smtp-Source: ABdhPJz7kY/V50ujJmNUNGVTt3hleheS3fukV12n4isF12uofYl+aT2xRsvkUnVIxzQU65RTja6Gfg==
X-Received: by 2002:a17:906:269a:: with SMTP id
 t26mr6496397ejc.286.1595314136165; 
 Mon, 20 Jul 2020 23:48:56 -0700 (PDT)
Received: from t5500.home (94-212-53-22.cable.dynamic.v4.ziggo.nl.
 [94.212.53.22])
 by smtp.gmail.com with ESMTPSA id p20sm16164613ejy.107.2020.07.20.23.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 23:48:55 -0700 (PDT)
Received: by t5500.home (Postfix, from userid 1000)
 id ACBACA82E45; Tue, 21 Jul 2020 08:48:53 +0200 (CEST)
From: =?UTF-8?q?Ren=C3=A9=20Herman?= <rene.herman@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 3/3] snd-usb-6fire: Unmark struct snd_pcm_hardware const
Date: Tue, 21 Jul 2020 08:48:53 +0200
Message-Id: <20200721064853.9516-4-rene.herman@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721064853.9516-1-rene.herman@gmail.com>
References: <20200721064853.9516-1-rene.herman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Torsten Schenk <torsten.schenk@zoho.com>
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

struct snd_pcm_hardware pcm_hw is in fact changed in usb6fire_pcm_open()

Signed-off-by: René Herman <rene.herman@gmail.com>
---
 pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pcm.c b/pcm.c
index cce1312..8ccf638 100644
--- a/pcm.c
+++ b/pcm.c
@@ -40,7 +40,7 @@ enum { /* pcm streaming states */
 	STREAM_STOPPING
 };
 
-static const struct snd_pcm_hardware pcm_hw = {
+static struct snd_pcm_hardware pcm_hw = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
-- 
2.17.1

