Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2254B6D9815
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 15:23:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D08FDDF1;
	Thu,  6 Apr 2023 15:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D08FDDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680787419;
	bh=3RieJURbbs7rd4zC5OsfC2lZN0Dgn5gDWbcDpBqyMkQ=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=q1hNAAbpplu+Q3Rtb+vv0ecK5JL2WFLqWO4MY0Om1fgb7iQd+mdMj3sviNd136CZ3
	 Fzp6wwmHW/HTD+HMOzf+666Iztr2ta6f93Jon9YEuBL9fyIDD8nQ/XgrtduVVQpr4k
	 W7YqiNQLTvB0aYNxwlQNNArCHsZ/uWjvF0TRdQXE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D354F80171;
	Thu,  6 Apr 2023 15:22:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDEA4F80246; Thu,  6 Apr 2023 15:22:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73FB4F8015B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 15:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73FB4F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=B3eZbsNb
Received: by mail-wm1-x329.google.com with SMTP id
 l15-20020a05600c4f0f00b003ef6d684102so20223900wmq.3
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Apr 2023 06:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680787360; x=1683379360;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M/VYyN4aT+7RK5+5vhV35MtnDLhdcOUHlRDMz2RR5gU=;
        b=B3eZbsNbKGWQAJbXPzGoKnejdO/W5SfNNme91c4rMGOOqhplK7Uw8TVYYZFTINVjDw
         VVLx0puCCepl5DRrmAw028+P78garpg/EUjYXYASf8Jsvgty2GixhBs3ihem8qhGqpra
         Xv9KkZ1LweoIvWvRC2MQDpQd81UndDBGVxJYRioXbCRPCnpeuRIAFZKNRmUnW9EJPnPA
         s/uyqR3xtSjCcpdv5yWYb1IsnfOz6aKyFJxLF5TpdwV1pXsdAt13/6mNs21fZL2ml7L/
         uTMrC51NRU64pIvvwMZwo9laHGHnXFxr4ayh5dIQJojcqKqSZ4PgzYEZULd5Gyx+oXb6
         uxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680787360; x=1683379360;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M/VYyN4aT+7RK5+5vhV35MtnDLhdcOUHlRDMz2RR5gU=;
        b=lzFwp3OB1VSmThz3ABIHHRXYbDesn3rObfMPi/YgKqHtV+rmBHRzW6iHUV5d2uhJ7I
         Vb334HmtQzBwssuNFTR+oPE+bajPb0JBdGmlIm+XwK8qALP5tfDlJNweWUkTJL1FsVDp
         ywJmWcCBwBaa0jA+GHBJw/tgmdZ/UCVqQZfjKDhxG27yBZaZ7nDFeJcmvoMefHmR8ASm
         EK9iPBZ6jxRUzluORGukPyWAFxOYnHWmdXRCbWHlZ/lJnfzNbpoTWy+Sru2wckhJMD6B
         srIy+1xjrcVRpfLs/7TGDDl3W1YfuaLXta8cel0aV9KQxEX5bJSM+YisDkNYNKWdPoAW
         gFjA==
X-Gm-Message-State: AAQBX9e/0BC6kNjwkBCaX22AbRCnoU9DRKMZfHMerS3dXF2d+9uUlVNR
	FEFpohOXP9ZPAVsNyxYWJ18=
X-Google-Smtp-Source: 
 AKy350YZMoIKdCj1u6EHAJQP8zd+E2hjVkrncP2e/RmCEx2iHfjygYP87A64w6u3/kxnUuNVdDpUwA==
X-Received: by 2002:a05:600c:3644:b0:3eb:42fa:39d5 with SMTP id
 y4-20020a05600c364400b003eb42fa39d5mr7373848wmq.29.1680787360435;
        Thu, 06 Apr 2023 06:22:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 u11-20020a05600c19cb00b003ede3f5c81fsm5411989wmq.41.2023.04.06.06.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 06:22:40 -0700 (PDT)
Date: Thu, 6 Apr 2023 16:22:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2] soundwire: amd: fix an error check in probe()
Message-ID: <390287d1-ddce-4414-873d-44ac0186a14c@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Message-ID-Hash: AQRTROQII4QIGYCPRWFYIEXHQBG2IJXT
X-Message-ID-Hash: AQRTROQII4QIGYCPRWFYIEXHQBG2IJXT
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AQRTROQII4QIGYCPRWFYIEXHQBG2IJXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This code is testing the wrong variable.  It should be ->acp_mmio
instead of ->mmio.  It also should be a NULL check instead of an
IS_ERR() check.

Fixes: a673a8dfc214 ("soundwire: amd: Add support for AMD Manager driver")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2: My first patch just fixed the NULL vs IS_ERR() but because it was
using the wrong variable that broke the driver completely.  Thanks,
Vijendar for finding this:

Fixes-from: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

 drivers/soundwire/amd_manager.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 9fb7f91ca182..21c638e38c51 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -910,9 +910,9 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	amd_manager->acp_mmio = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(amd_manager->mmio)) {
+	if (!amd_manager->acp_mmio) {
 		dev_err(dev, "mmio not found\n");
-		return PTR_ERR(amd_manager->mmio);
+		return -ENOMEM;
 	}
 	amd_manager->instance = pdata->instance;
 	amd_manager->mmio = amd_manager->acp_mmio +
-- 
2.39.1

