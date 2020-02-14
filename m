Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ADD15D62C
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 12:01:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C01831674;
	Fri, 14 Feb 2020 12:00:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C01831674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581678088;
	bh=yuK5IXLH2Z54OXdcKaFCUlqfj25xueXxwufSFUPkSXA=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XLRb2j0suGO/6MqzAxSvgtgM+0rPTMVDKlOWn0M9dDCUdQcPG/r+QXuTJJ+4uTsK3
	 /2/a/KWJSDkH4OfJUz2f4jkZFrmDtdGjUpkEKb0o3Bptus1ItXDS3Zn/H+1Gdx94N2
	 nc7H175MrE64LFvOHdoCPUx3m0mLHQz5k9865o+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D460EF8028D;
	Fri, 14 Feb 2020 11:58:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54EF0F8028C; Fri, 14 Feb 2020 11:58:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61605F8027D
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 11:58:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61605F8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="DMFgRXf2"
Received: by mail-qt1-x849.google.com with SMTP id l1so5644539qtp.21
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 02:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=6FZ7q26NPH3lvGcTR+WEnKM9v3p6kQafjzDGQME5vhg=;
 b=DMFgRXf2U8Xa0D/C8kVvxKWK19epE3C0A8MwL/oMVQyEn2mR07eyqKBkW9cmxZCEFP
 pJVMeYorJ+etKyGSFszVtaAToSYiAsam0eo9cw0IrWOu//ZlQRqKhx0srSrkJi1g2ocs
 4lCheJ5tDJ29sVz1ZAlVqabyS1pNNpOOfB7In8HuBqyNEonVvc2dEwKjwynRXplE+7iW
 evVwSgeIqmRHIy46r7kOuD6PMIWmAQ6XlFS067gv1UvZs8+Hb0wCylLp9K+5nIAGL1lz
 1unnsQraF4vqCI8ZmBuQGCHbZVb4G0P7wLiAn6fU5x0EapRh5oUgt9lO+Iyla/rhBJJ+
 68cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=6FZ7q26NPH3lvGcTR+WEnKM9v3p6kQafjzDGQME5vhg=;
 b=T9sSCa1uKe+sAELHbVrzpwZmek9vwuWnpMQpqRjjWJ97ZBIdSHRrtIWwpIr6mfmiE6
 XHyh4XGEgvAzsvW8wU0+T0GjDfkPPefJooQnjEsTFwXx3BltSQqtAZAtS0JLCMp4HQEG
 sNBnOWNFKVXzb6R0dSgRXPUNXtNNNz+wQrdMaY2hp8CjeW6fRXEqQa2dQyB5eJ2jQ6h8
 nJ2r7M8V9mNy9HWpwqsxFg54IL0zyiWsAk1TQWVQkxrY/lPRTLNFhjKRchH+yqjy6Bpc
 kP/qe2UtPBFjEL84oKYXeePXHHGWQFZrKDwDlVLd3/WZl1HRxte0jo/wRY5l0kLhxxXF
 wPVg==
X-Gm-Message-State: APjAAAVGuSxp6Xzz9Iv244LCBccnvfz83cXHWNALSy+2+fjvWqMsVq8U
 O0Wj396LOtZ2lyceS7EvRyv3UMc0uF79
X-Google-Smtp-Source: APXvYqyjZj9OtwmngRF2W+EWjFmSkf/pQWHWAcj5LiTuyZKFFhtQFCZAYOXEwBzaBTo2/3ZceEdgZKB4ZKrL
X-Received: by 2002:a37:948:: with SMTP id 69mr1967224qkj.258.1581677886825;
 Fri, 14 Feb 2020 02:58:06 -0800 (PST)
Date: Fri, 14 Feb 2020 18:57:44 +0800
In-Reply-To: <20200214105744.82258-1-tzungbi@google.com>
Message-Id: <20200214105744.82258-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20200214105744.82258-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 3/3] ASoC: core: remove SND_SOC_BYTES_E
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

Reverts commit fb5126778333 ("ASoC: core: add SND_SOC_BYTES_E").

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 include/sound/soc.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f0e4f36f83bf..1af4f9413faf 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -299,12 +299,6 @@
 	.put = snd_soc_bytes_put, .private_value =	      \
 		((unsigned long)&(struct soc_bytes)           \
 		{.base = xbase, .num_regs = xregs }) }
-#define SND_SOC_BYTES_E(xname, xbase, xregs, xhandler_get, xhandler_put) \
-{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
-	.info = snd_soc_bytes_info, .get = xhandler_get, \
-	.put = xhandler_put, .private_value = \
-		((unsigned long)&(struct soc_bytes) \
-		{.base = xbase, .num_regs = xregs }) }
 
 #define SND_SOC_BYTES_MASK(xname, xbase, xregs, xmask)	      \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname,   \
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
