Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1868A6FF9AB
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 20:56:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8886C1E9;
	Thu, 11 May 2023 20:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8886C1E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683831382;
	bh=ue6Mr/Vj5dJskGTMSyU+u/1wSbHfp3R/9KXAMP1kIJk=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gjemcje+J5oL3hyZsLSHsh8IggZ+h2jbPNrCi268vk5GjdMolePCBU8VNupEsBlDW
	 N3M6FefNJQ02J4XzZjE2ro5aSlddRBGQvkMMpfh0bM30k/lHBs2wduJMJ9bem74epT
	 woNxNxnTrrQqsogUOqhWTiIYKoUCLqgWl9tH+rdM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF74DF8057A; Thu, 11 May 2023 20:54:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3995CF80567;
	Thu, 11 May 2023 20:54:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AC6AF804B1; Thu, 11 May 2023 14:09:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BCF16F802E8
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 14:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCF16F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=aId7+0de
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-559d8e22306so153963537b3.1
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 05:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683806955; x=1686398955;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7K8c0PbSb9/75eHA2UyPAuYfZp6gkS8+sNwMs4nkPsw=;
        b=aId7+0deecHGhvzHiCpQ99QDZYxs8sOskTVuQh+Id0foMa14spsgvuQ0XA0Z2ZEMuQ
         XuWIw22ug3J/BYgTc05q7rC0GG7biA1eiBtKmnUHCNLBLOoyslvxzJnEaU8TGLc/hRd0
         sGUQCfw0KuMjHnNhKyQGQPxbx5ylmXI1mHuScaYgtPCzlzYAgg2QA2K8IcTSnJbeYsHn
         zWZH0v/FMPmUTNE0s0iRHoD1v2dG094/NHJ2aH6MshBgjyUU9hs4oLsHhGpBd3ak/fT9
         YFhEv6DkZqGYwPRdsNwLA3e+/2qG2HrjBK7ytxtwTYYJjCXevj13Xfhl7vsPsiuoVNIR
         fELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683806955; x=1686398955;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7K8c0PbSb9/75eHA2UyPAuYfZp6gkS8+sNwMs4nkPsw=;
        b=GOtL4cYIMFR0jVsB1Joq2J0E5wyIpCwBjxF7ZoCi1xeo/X6O3lDpA/yQvb4JipXmi7
         lEUjxm+zzmQ/PrCWtZIBbaLmeUELpAE3faP9vlt5tHb7p1+FHRyfy+R5Ppm/N4eXVbP4
         TmRMauUcWiZZ7qkavDBMi195Czr4tidKCUpT+m4n38AyDdIpCLExvbqq5SNW5/kQy8Gl
         DrZseVRSMXn/JPmV5r2ibG0aGE0mZIwSL/eCnMqfGDzEyfeZt1B7+OQsBzsqdEYBepor
         FmmykdSMLS5IQZpFlExU8odAoQq76wtrl68px5RTlkwcgQqRNkdlz6yct+2QpL7qfMpc
         PZ6w==
X-Gm-Message-State: AC+VfDyKb4SjyCsl619axYIctOFk8EiIvl7zuKA8FYs1cHuKMrTFdYEA
	CUK8sybCLQrIdV87wka4KvSdqdBvo1onBGrwQQ==
X-Google-Smtp-Source: 
 ACHHUZ649eEZOGu+69lcpa1h2QuufU2JwY+7I6E65DKzbwztYqdOFIXoAXFKOH6AJFiL/OCdeIEENenkhD6EYIzmYA==
X-Received: from yixuanjiang.ntc.corp.google.com
 ([2401:fa00:fc:202:6c9a:64c9:7e44:6b1d])
 (user=yixuanjiang job=sendgmr) by 2002:a81:b285:0:b0:559:f1b0:6eb with SMTP
 id q127-20020a81b285000000b00559f1b006ebmr12820158ywh.4.1683806955346; Thu,
 11 May 2023 05:09:15 -0700 (PDT)
Date: Thu, 11 May 2023 20:08:36 +0800
In-Reply-To: <20230511120841.2096524-1-yixuanjiang@google.com>
Mime-Version: 1.0
References: <20230511120841.2096524-1-yixuanjiang@google.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
Message-ID: <20230511120841.2096524-2-yixuanjiang@google.com>
Subject: [PATCH 1/6] ASoC: soc-pcm: use GFP_ATOMIC for dpcm structure
From: yixuanjiang <yixuanjiang@google.com>
To: tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yixuan Jiang <yixuanjiang@google.com>,
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: 
 369pcZAsKCj43n2zfsonfsllttlqj.htrfqxf-ij0jqfqxf-uwtojhy.twl@flex--yixuanjiang.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: S23O5KK7HDRGVYA4TA5QIXJ3VAI5UPFE
X-Message-ID-Hash: S23O5KK7HDRGVYA4TA5QIXJ3VAI5UPFE
X-Mailman-Approved-At: Thu, 11 May 2023 18:54:30 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S23O5KK7HDRGVYA4TA5QIXJ3VAI5UPFE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit d8a9c6e1f6766a16cf02b4e99a629f3c5512c183 ]

We allocate a structure in dpcm_be_connect(), which may be called in
atomic context. Using GFP_KERNEL is not quite right, we have to use
GFP_ATOMIC to prevent the allocator from sleeping.

Suggested-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20211207173745.15850-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Fixes: aa9ff6a4955f ("ASoC: soc-compress: Reposition and add pcm_mutex")
Signed-off-by: Yixuan Jiang <yixuanjiang@google.com>
Cc: stable@vger.kernel.org # 5.15+
---
 sound/soc/soc-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 3b673477f6215..cffae9b7c2548 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1132,7 +1132,7 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 			return 0;
 	}
 
-	dpcm = kzalloc(sizeof(struct snd_soc_dpcm), GFP_KERNEL);
+	dpcm = kzalloc(sizeof(struct snd_soc_dpcm), GFP_ATOMIC);
 	if (!dpcm)
 		return -ENOMEM;
 
-- 
2.40.1.521.gf1e218fcd8-goog

