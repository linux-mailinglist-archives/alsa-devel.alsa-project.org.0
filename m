Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4834C0F50
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 10:39:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B27A1A96;
	Wed, 23 Feb 2022 10:38:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B27A1A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645609162;
	bh=uWUA5AXOyYNcwsMisuIfA4XzSYcscPTKlTF1kn16klM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ptaCzy0b6URJ1iV6N/0E7AJSk6LPAt81HSAMnybnQ0IVS+EskEcIkBWMmeCHjHwFG
	 fzxdzVnnjqdGfOURzEzxz0R9tBOBkeJs1zjWxQGx5CpKfGhojkPNYGbr5bOPCrSG7v
	 Z3WI+ydGGsUj0y0c2bX7s/v8J/b/VDMHO1ERIoJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E353F8025D;
	Wed, 23 Feb 2022 10:38:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A65BF80237; Wed, 23 Feb 2022 10:38:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98024F80118
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 10:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98024F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="W9//dLFs"
Received: by mail-ej1-x635.google.com with SMTP id qx21so50996686ejb.13
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 01:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P//RFNU8QGEKYuAQ+gDMeXJ3hARQqa91sPEYb36da38=;
 b=W9//dLFsBDlRpSO+zyqplXFbyI5o8LW38Tds0Wi1Kte8sLaoV0pdKG7J0jF2ghH4+E
 OPp0dM6Y9p7hp55vHgui6fEH0SIpEy8T+pEGoPiu8UAfKkP5ZBbUNHdcf512WHRyGmhX
 ZWRYtq9Vv2VkSgq2h+Oe+myy2fSNFFoZXDRYBK8m/Z+hDp7QdnRLxKrUl8i2V++hmY4H
 ZElOG3fZRj6t8C0+z7P85/lQdbPkV3C9rTMqRLfk9yj9yqkJor7cWUnULPzNQFeOjdcQ
 a0Kp5PJR9xzM8/wiaocF37bLcCAuZM0gEqvWEj7j1HN0hJHVQ6ueX7DtEG8tzX/nZXI3
 /yPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P//RFNU8QGEKYuAQ+gDMeXJ3hARQqa91sPEYb36da38=;
 b=4OfKChALicZBRa7u3Ff6tnrMFok4RF/TVARk5hLnptX3oRcLgveXBIrxmHdDpVrdYa
 vavDE4eyrmtCgneE0T1IbefqT1ZcNaWIMQBdS/ISq1bcj3Iiz1YU0LRNenaR4lJaVraD
 ySMTuWEOTtpf/vGmKs2m/TYd5jKgmGaUAK1FMopXvde4ouBJ5o/JBorbPLGaD++tIECb
 zn3E3uqfyhKWc8nhV+kD2fzYQNobwOenmlrJGqzXKq6SHcHZKl+n0iAGQElChiLX3ro8
 RK0my9s+/TCanB3ikgehZLqkbH/cS3ZWS4sghQKq9Rfg9YaKTRlLLqTTtKk0XxjH/Va/
 Wy+w==
X-Gm-Message-State: AOAM5325KbDxA3F3yTTb2BZp90S7sFl1uYyDAACE8xuqz1O/wRu5p5vc
 nVVEomgX/L+2p+OO0u22f9gZxxcg4hw=
X-Google-Smtp-Source: ABdhPJwZGUNJV3IKeAMhpyfHiEyUrhOehHeMKffbaWFfB3P+algDJwkveMPANcs16enaT7KFnGLUqw==
X-Received: by 2002:a17:906:c299:b0:6b6:baa1:e5cb with SMTP id
 r25-20020a170906c29900b006b6baa1e5cbmr22421158ejz.624.1645609085159; 
 Wed, 23 Feb 2022 01:38:05 -0800 (PST)
Received: from Dell-Boy.localdomain (39.191.90.146.dyn.plus.net.
 [146.90.191.39])
 by smtp.gmail.com with ESMTPSA id 7sm7299423edw.37.2022.02.23.01.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 01:38:04 -0800 (PST)
From: Alan Young <consult.awy@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] pcm: rate: fix drain of partial period at end of buffer
Date: Wed, 23 Feb 2022 09:37:40 +0000
Message-Id: <20220223093740.113617-1-consult.awy@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Alan Young <consult.awy@gmail.com>
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

In the case that:
* the buffer size is not an integer multiple of the period size, and
* drain must flush a partial period located before the end of the buffer
  but without a full period available, where
* these conditions may pertain to the source or slave pcm buffer, and
* because rate conversion is always done on a full period,
it is necessary to check that both a full source period is available
before source pcm buffer wrap and a full slave period is available
before slave pcm buffer wrap in order to use the simple, single-commit
implementation in snd_pcm_rate_commit_area().

The alternative fix would be to change snd_pcm_rate_write_areas1() to
take size and slave_size parameters. This would be more disruptive to
the code base, tricky to get right, and is unnecessary given that
snd_pcm_mmap_commit() only commits the partial period of actually valid
converted samples.

Fixes: 3047f8fa5a3dce0c9775404a2285fb2cff462d96
Signed-off-by: Alan Young <consult.awy@gmail.com>
---
 src/pcm/pcm_rate.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/src/pcm/pcm_rate.c b/src/pcm/pcm_rate.c
index c45895a9..ba5364c0 100644
--- a/src/pcm/pcm_rate.c
+++ b/src/pcm/pcm_rate.c
@@ -781,16 +781,25 @@ static int snd_pcm_rate_commit_area(snd_pcm_t *pcm, snd_pcm_rate_t *rate,
 	snd_pcm_sframes_t result;
 
 	areas = snd_pcm_mmap_areas(pcm);
-	if (cont >= size) {
+	/*
+	 * Because snd_pcm_rate_write_areas1() below will convert a full source period
+	 * then there had better be a full period available in the current buffer.
+	 */
+	if (cont >= pcm->period_size) {
 		result = snd_pcm_mmap_begin(rate->gen.slave, &slave_areas, &slave_offset, &slave_frames);
 		if (result < 0)
 			return result;
-		if (slave_frames < slave_size) {
+		/*
+		 * Because snd_pcm_rate_write_areas1() below will convert to a full slave period
+		 * then there had better be a full slave period available in the slave buffer.
+		 */
+		if (slave_frames < rate->gen.slave->period_size) {
 			snd_pcm_rate_write_areas1(pcm, areas, appl_offset, rate->sareas, 0);
 			goto __partial;
 		}
 		snd_pcm_rate_write_areas1(pcm, areas, appl_offset,
 					  slave_areas, slave_offset);
+		/* Only commit the requested slave_size, even if more was actually converted */
 		result = snd_pcm_mmap_commit(rate->gen.slave, slave_offset, slave_size);
 		if (result < (snd_pcm_sframes_t)slave_size) {
 			if (result < 0)
-- 
2.25.1

