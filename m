Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCDA3C466D
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 12:07:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDC00167F;
	Mon, 12 Jul 2021 12:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDC00167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626084435;
	bh=Qq/SRjKWhhKlvcuhIVE0vHO1GmJcKmSYS5CkghzLTg4=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SBLqzXXzIu4RKAgCdM3G1coewvuV8mblcSa+L1bng7AQwmxA9jVMuaqT29e55SKVJ
	 WWvn8ZW0TiVvYC8Vs7knqbavHxDv2cBqQuxyF7F09L3pu4V3to1Cq7w64aUyboUO9g
	 /T0SBSpiMQpUa3tOweEc/rus3Hc9jMvZsZ0QVk04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BE71F800EB;
	Mon, 12 Jul 2021 12:05:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 855CAF80254; Mon, 12 Jul 2021 12:05:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E89C4F800EB
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 12:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E89C4F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Rm6FHh2B"
Received: by mail-wr1-x42f.google.com with SMTP id t5so10943656wrw.12
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 03:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language;
 bh=kQPONDaMfJHqxusTTv+AOrN7No4zepdu5/0ZwIKfltY=;
 b=Rm6FHh2BAu8us6Ep20Jzkk52gzqFD9dkqBj6aM0MXoao77qeumD1NUkxInRTtYswtd
 F1jo0RBZjmXEH39lwzEM8F2hzgvONPeHKUtqZzDfEwK8HBHRkyy/kQhzV5G2jTi+YaBQ
 X+fY8GqSfzRX0iPfoLB+6nzQOr+R7OQenm9w5w3U25FEl0HL3VPinidEZuumfi/k/D5h
 DIYmFmIQPUdT32euemjxjGzN6cEuWbUtUB9JEzbAFLA5BuIttWSazj58NPAAaanfVpKJ
 VEBc5/AND5VoirqZwKqmCU1vp4hrPXY6CF++dZdF2u/UvvIJ0yLzLaAlnyVMx2JeRhPJ
 xo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language;
 bh=kQPONDaMfJHqxusTTv+AOrN7No4zepdu5/0ZwIKfltY=;
 b=HjH4hN0PT3u4Ji87PvYlA+4Y+lT+GYwEUiMgLDcPelpkQXHCAYXFrdO6JdMqUcWtxq
 e0MRiO2h/sfQHLIYindY6bdcI7wL7a483rfVnEZEuBAayOnD2UGFtTvAyMG6sZ6RTv+J
 0ILLEfrCg7s6L8E/gCamDdLJqt/AkiZ/6P80yuf608H7mS0F1m6XSdjyerbCL/mOenUG
 UhfCkJz1hL98LH63VdOJgSNTuNRzKvASwRioSG1DlgiuzZXnr93HitByrKMwIiYvuoBU
 GJkOHCXWAPxdfCeSgahToYBOcACpWWQu8JR3iGzzMhZYDUk1NSP0C61PUQ80c8YKBVQl
 wK1w==
X-Gm-Message-State: AOAM5339lIs7bBrLDZkoAxOTKgPghNwmaY8hyDwbvcGXttlsJ8yeA2yA
 cIMVPTDzhgJm9dv/VsB0jKpFlr8skbsLqw==
X-Google-Smtp-Source: ABdhPJzbhkmi/ny0gqRlOXN2/z7QyhZWS+NryLg86Tf6Kgpts/eQ2p9aOTWRD43QU4wDStnzYYHMVA==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr39959484wrm.413.1626084341631; 
 Mon, 12 Jul 2021 03:05:41 -0700 (PDT)
Received: from [192.168.11.11] (78.160.159.143.dyn.plus.net. [143.159.160.78])
 by smtp.googlemail.com with ESMTPSA id
 b11sm13860693wrf.43.2021.07.12.03.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 03:05:41 -0700 (PDT)
From: Alan Young <consult.awy@gmail.com>
Subject: [PATCH] ALSA: core: Call substream ack() method upon compat mmap,
 commit
To: alsa-devel@alsa-project.org, tiwai@suse.de
Message-ID: <c441f18c-eb2a-3bdd-299a-696ccca2de9c@gmail.com>
Date: Mon, 12 Jul 2021 11:05:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------EEEC70A75D8F39F9D35D6F3D"
Content-Language: en-GB
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

This is a multi-part message in MIME format.
--------------EEEC70A75D8F39F9D35D6F3D
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"

   If a 32-bit application is being used with a 64-bit kernel and is using
   the mmap mechanism to write data, then the SNDRV_PCM_IOCTL_SYNC_PTR
   ioctl results in calling snd_pcm_ioctl_sync_ptr_compat(). Make this use
   pcm_lib_apply_appl_ptr() so that the substream's ack() method, if
   defined, is called.
   The snd_pcm_sync_ptr() function, used in the 64-bit ioctl case, already
   uses snd_pcm_ioctl_sync_ptr_compat().

--------------EEEC70A75D8F39F9D35D6F3D
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ALSA-core-Call-substream-ack-method-upon-compat-mmap.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-ALSA-core-Call-substream-ack-method-upon-compat-mmap.pa";
 filename*1="tch"

From 9c3a4ffca82a0106cd858db8be29945cfbcc9952 Mon Sep 17 00:00:00 2001
From: Alan Young <consult.awy@gmail.com>
Date: Fri, 9 Jul 2021 09:48:54 +0100
Subject: [PATCH] ALSA: core: Call substream ack() method upon compat mmap
 commit

If a 32-bit application is being used with a 64-bit kernel and is using
the mmap mechanism to write data, then the SNDRV_PCM_IOCTL_SYNC_PTR
ioctl results in calling snd_pcm_ioctl_sync_ptr_compat(). Make this use
pcm_lib_apply_appl_ptr() so that the substream's ack() method, if
defined, is called.

The snd_pcm_sync_ptr() function, used in the 64-bit ioctl case, already
uses snd_pcm_ioctl_sync_ptr_compat().

Signed-off-by: Alan Young <consult.awy@gmail.com>
---
 sound/core/pcm_native.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 17a85f4815d5..91a749835ca1 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3057,9 +3057,14 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
 		boundary = 0x7fffffff;
 	snd_pcm_stream_lock_irq(substream);
 	/* FIXME: we should consider the boundary for the sync from app */
-	if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
-		control->appl_ptr = scontrol.appl_ptr;
-	else
+	if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL)) {
+		err = pcm_lib_apply_appl_ptr(substream,
+				scontrol.appl_ptr);
+		if (err < 0) {
+			snd_pcm_stream_unlock_irq(substream);
+			return err;
+		}
+	} else
 		scontrol.appl_ptr = control->appl_ptr % boundary;
 	if (!(sflags & SNDRV_PCM_SYNC_PTR_AVAIL_MIN))
 		control->avail_min = scontrol.avail_min;
-- 
2.31.1


--------------EEEC70A75D8F39F9D35D6F3D--
