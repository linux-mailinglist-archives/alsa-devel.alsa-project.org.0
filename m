Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B984CD041
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 09:40:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94A9918C5;
	Fri,  4 Mar 2022 09:39:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94A9918C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646383207;
	bh=66sUMk84I7KBoVCEsmk33xVnxuzkvf3Mt0fM8G+tLTw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GLX1oSUGOUbUYIbszb9O05agtMeDpusR2sYtDAu15pOm775mqmn3ClfiHhAVi2Uxo
	 dUib4dYRtxkR8s4xAGN8Lt9YsHOnWnZZgpyUmpVs+mk/Fq7uzQitrDzcw677DaDKO3
	 C/5NAoGPfianCFXT77VMLsP2T7XepjHI/9ATggKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14B55F801F5;
	Fri,  4 Mar 2022 09:38:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50E5EF801EC; Fri,  4 Mar 2022 09:38:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,RDNS_DYNAMIC,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com
 [162.62.57.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F2EAF800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 09:38:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F2EAF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com
 header.b="jTTonvd+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1646383126;
 bh=VhTKKyAhQFqLXrwmbMwbMaF9x5HZIH2oU44KJBELClQ=;
 h=From:To:Cc:Subject:Date;
 b=jTTonvd+Gqp7il2o4Dt6VecIFDvZnAYQFo/HJ6MP+smS9kO/jmvGDdPGe/szxAw6X
 2HEv+6tObxoAh8co9AP3itUIdn1BIy1wQLuHIxbfxWNG3PpCKWf8PAZMWqglrTGV2s
 +PSG+RPenI0jdqDVBIGHN+htoBQQ19GM1j7IqY+A=
Received: from localhost.localdomain ([218.197.153.188])
 by newxmesmtplogicsvrszc8.qq.com (NewEsmtp) with SMTP
 id 9AB026B7; Fri, 04 Mar 2022 16:38:43 +0800
X-QQ-mid: xmsmtpt1646383123txww0qwx1
Message-ID: <tencent_4221FC4089F6DF01C48F192E5784038BA205@qq.com>
X-QQ-XMAILINFO: NhUkPfKlCtQww2mZ0zeqm2zgwoQjyTa62EicOQuEEZvwAXJNVniFcmgXAouBPt
 X3wiozJpRIdopfA+s4aNJVEFr+kXchO9S1w/gMpl8GBJY81NBpF1wkl3jl/rdwoHRQohHP4zzKbZ
 tuxM//p0BJDkeFfMWdUMelUHQn0Ot/S1iLVUY/Bcy5300esWq2CI19ZwR89NoxQy4sD2d+W3zECQ
 pvHONYi5yLsbsEU77yc1UTwxGFXZiDyxMrankNm6MeOt69l3VUkZ0qROkq3TOpSk9/ugOA2f73Hi
 aTiLOYji3RvBdFhtpWyF1MfOsbxyhe4Oayf8Yv9FStXeNoHHpyR7YyPJQdila+OMva15SQnAG0FY
 LXEQJWnqDNZ4/iT6DnDFraJaQKrlaKHYcnomzzAa8NaunqAGZjH13DleayC+Mj+NK2+YuYi4Iqgk
 UEjWwNGun0x9FTCreEe1wxEjwN2w1mntY+y70TlIAQcQAyK2yiZb1i/pCRu2sH5sjMxRbKqIA6cz
 nLur0eB7tQ9vEWO+XmUNZ8AiPHinKv018u0eIduxJE86FBxQ7GolMSWenbcQ0EnBGjdJe4w5TrwR
 jLhEUtoUF6MF991x5j1XDSKMArrPG7ZhEo/4mdkGPv4H8MSJGtFgNGid5dfAdmEhNH9LdAvjjuiG
 w3QxYWB7EJauH0J1xxO2seXPEBRaInLmMU/OQa4CeTmdXCWvdfZScKC++sOJ+hnUXxbAHjyFCYV0
 wRAi0JvKxMR+tj3pugUwyMpTLu2PEwPQ3alD2LRPBnJfwYX6cx1D72pj/z0ENcRVvSa/KKuU8Jfv
 279RRdRL9d3L2P7VA7/RLGD0P7Gxy4VLYCixzZOGyopjLpAkg2ESRE5E9DCAUQ3QmcXOTLakJw0O
 5Dq+tYn3sFpSgG8/KgKcxtEYDTGfL0uW4ipGZ04H8Qnc6HMCZKdrspOkcIwpCoNWD0lO64bloj
From: xkernel.wang@foxmail.com
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: lola: add a check for the return of vmalloc()
Date: Fri,  4 Mar 2022 16:38:20 +0800
X-OQ-MSGID: <20220304083820.4914-1-xkernel.wang@foxmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Xiaoke Wang <xkernel.wang@foxmail.com>
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

From: Xiaoke Wang <xkernel.wang@foxmail.com>

vmalloc() is a memory allocation function which can return NULL when
some internal memory errors happen. So it is better to check the return
of it to catch the error in time.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 sound/pci/lola/lola_mixer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/lola/lola_mixer.c b/sound/pci/lola/lola_mixer.c
index e2c8f14..6b16248 100644
--- a/sound/pci/lola/lola_mixer.c
+++ b/sound/pci/lola/lola_mixer.c
@@ -121,6 +121,8 @@ int lola_init_mixer_widget(struct lola *chip, int nid)
 
 	/* reserve memory to copy mixer data for sleep mode transitions */
 	chip->mixer.array_saved = vmalloc(sizeof(struct lola_mixer_array));
+	if (!chip->mixer.array_saved)
+		return -ENOMEM;
 
 	/* mixer matrix sources are physical input data and play streams */
 	chip->mixer.src_stream_outs = chip->pcm[PLAY].num_streams;
-- 
