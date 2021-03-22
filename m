Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD673439F8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 07:50:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 160F8852;
	Mon, 22 Mar 2021 07:50:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 160F8852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616395858;
	bh=Nd6jjxGhnImp7hM6BTg4uRLk1wmvxO0wosV2T2XBy90=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GD2fBz1P1l7s0ba42TbhAnbCOiZwFN3Jifts5C1jm8O+YG0nYvL+HByhroQC+Q6zf
	 xLdUpJoOJFrYdPjXxADhgcBoKlmsej1+upTqATj9ISrj9gtf7uM799sARvvZEBT4JC
	 I3nE8ngaWralC9Tz7O7kmK9ElS4h/SDL8qCNgtN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68A5DF80156;
	Mon, 22 Mar 2021 07:49:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0087AF8016B; Mon, 22 Mar 2021 07:49:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB37FF80107
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 07:49:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB37FF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nD1TzUdy"
Received: by mail-qt1-x82f.google.com with SMTP id l13so11552238qtu.9
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 23:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QxDMqFUouE20qsvNflnewD1IIh7nduTTtj8Eq1UkFGs=;
 b=nD1TzUdyCyfaTUFBhzqKBYtbu/HzeBjY4HUm9oyJb6LTq1pjhqZOZDIG6sWIlHqJyQ
 smL0WrI/0MNwpTvn3C5e/bhBJ3OSUc3/ke/8ivPK/CGtevyqH3zpqIb0sJ9LnXR6YnkY
 cH6KIjBUlWoYQG3vi8p1Rc2c/2gBPWkHQPOCIbwwILh2eaLmzkObeeMXWbjB/QS3D+/B
 tEtfkzg5w42+VFN3oWtJfexvOaMMXgidUc9ROa7Jm6P55tLtWM4SCOll66F7IDj1+bnQ
 4DVkJwPdKCB0msjVtBInSHc4RcvC8IBnOFt+VvZiS0x+m8twRjRIyBUEYAb62TqIAGcm
 +/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QxDMqFUouE20qsvNflnewD1IIh7nduTTtj8Eq1UkFGs=;
 b=AL8bDrW2L2Kr0lDG4yJza5FAar/seLCmGfi0kuj50pORpit3UB/IqFsBDtOmALhbyX
 oMODM4kBSDBfM5PDG5/5bZU4Tr8WgIZ0OBAE8xDSwR32gKvch1j2A8sYaoQ56S1DstdZ
 CvVOD3NLN1KtzKRSzkkJPLRtyXWwiZepMQ73Cp/T/cdX1hEWkcwyGq2eB3U07qiYV6nt
 4sNfpKwN4pBQZwjhjtmZbDhMgd9G/hs+Wd/wMneG6zPuKFmgXGnt3RUO+UTqV4CXV2cL
 3vE6DHvwuG9OCIS5VTfZ5eG5y9Or8W21O9a/Qc5VILT1PFBByp//VWTccW3MBmhzC9sS
 oiGQ==
X-Gm-Message-State: AOAM530JVQh5eYs823+YidNPmHwxlPhJDk71LSy59WeiTgO4DgGUfaPe
 cS2wjamufUGJS1nIaySJl9Y=
X-Google-Smtp-Source: ABdhPJzBEXyQpF8NUqXKaZybJXOeP6riyABLtFcaEJFm2opVzlsQiH7AjwT6Fl4+hP6mnnsK/jZ0UA==
X-Received: by 2002:ac8:7d09:: with SMTP id g9mr8345828qtb.288.1616395762629; 
 Sun, 21 Mar 2021 23:49:22 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.40])
 by smtp.gmail.com with ESMTPSA id x14sm10156149qkx.112.2021.03.21.23.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 23:49:22 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, yang.jie@linux.intel.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, unixbhaskar@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: Intel: Fix a typo
Date: Mon, 22 Mar 2021 12:19:09 +0530
Message-Id: <20210322064909.4189290-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: rdunlap@infradead.org
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


s/struture/structure/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 sound/soc/intel/atom/sst-mfld-dsp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst-mfld-dsp.h b/sound/soc/intel/atom/sst-mfld-dsp.h
index 5795f98e04d4..102b0e7eafb0 100644
--- a/sound/soc/intel/atom/sst-mfld-dsp.h
+++ b/sound/soc/intel/atom/sst-mfld-dsp.h
@@ -358,7 +358,7 @@ struct snd_wma_params {
 	u8 reserved;	/* reserved */
 } __packed;

-/* Codec params struture */
+/* Codec params structure */
 union  snd_sst_codec_params {
 	struct snd_pcm_params pcm_params;
 	struct snd_mp3_params mp3_params;
--
2.31.0

