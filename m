Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 094FA741012
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 13:30:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 640DE825;
	Wed, 28 Jun 2023 13:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 640DE825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687951846;
	bh=lKWavKcJmhJMmOc7elPM5P+Mx5xns+y2GkW+Y5jDDOU=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VbmrGkmRZ+ZDZPaMi2rjZbMOVMlb4iwmbjnaUlN6Vdp9OyPpZGEKddHkYBsYq3ldo
	 y7D1uEmWahmG0PRDvPkf406kh1fgRbPtCWDLbCYJVTMeThM4AYjxTGPrxltHFQJudO
	 d5kq9ZoBT8PcqKos0WG5QVkI/ztv2XMCXG0V+zxY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32910F80552; Wed, 28 Jun 2023 13:29:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48332F80544;
	Wed, 28 Jun 2023 13:29:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08FF3F80246; Tue, 27 Jun 2023 07:42:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9C09F80093
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 07:42:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9C09F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AXLCkakn
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso4905618f8f.3
        for <alsa-devel@alsa-project.org>;
 Mon, 26 Jun 2023 22:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687844537; x=1690436537;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ulR4ivQIhJ1l/oBTs/p+pGMIWg2ZKFF2T+fQE8UqO7Q=;
        b=AXLCkaknqRPTLvSNzKOecb3LAe7Gqzwk9Y08eXY/CQm2tKL39Ot/35C2r5m2KRBsDE
         utNTFY3htod9Fc2TwFkiwm5KOfxobqxVuxlsxsnhQgtXPSJ4oUUau8hdtQu290dZD7Sz
         V1x76o+ZQ2duyz8gfmt7JaKTzLdDRzhL6hnSFyxX168Fx/6IWS8adntNhrWsMAB4zSIH
         55mgxJF7CUiRmYlGPNdsMusXDXSSkIu/6IosNeAkkF5gNUPQhTQPrmtSNqkmfBlshlXb
         VELZV5Dl8SuXFD7giRJ1ywVFg2OTC6Y4/dKVfVRtcXhOBF1NG5RfjmmIhxiqpkuXb3qo
         dG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687844537; x=1690436537;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulR4ivQIhJ1l/oBTs/p+pGMIWg2ZKFF2T+fQE8UqO7Q=;
        b=Tvv9qHzv7v95lg9qBGZHBuC07/Fj6HXppMFXXrx61p/NZDmsFM+b6ls+VKP46ClsWn
         qlrsuOkekvmGLjQBym4Z9ah/0R6GWnkn0RIgzQQTI/rrscNn4g0Tzbz77HmdC1+Lr29e
         C56T6hsCbmgYzDagiZkBTTZ9TxFPuCorKkhSrQJ6TIl9FF3Gp6BuLKrUtJ0wE9BgBBv6
         OI5DW+EBBDk3u/a1+4EvukhVADcV+jNkuUdCv/d0i4+1bcyCKhjkEJbB7issPp/IAtcD
         GPW2rCIsCi5JXnlh/6n8+DnMwwVP6rQsdiGmUpGXigLY6/ZbgaeQqpJsETUj0/9wrnuM
         8P8Q==
X-Gm-Message-State: AC+VfDxDGOsEgAwwNNnI7ycjadUfjA4NRpKOSYTkZ9s3UwhthvZ0RUBg
	YWatqBusNhF70rLjcK74IWuDdw==
X-Google-Smtp-Source: 
 ACHHUZ7Zp5+uRz6d5ee0l1lmoea0gtR6KnNww7WDkTx4AKpOp2uVH4UYxGbkQ7iXjjiQIyIVBhgc7g==
X-Received: by 2002:adf:ffce:0:b0:30a:ec3b:58d8 with SMTP id
 x14-20020adfffce000000b0030aec3b58d8mr25394627wrs.3.1687844536934;
        Mon, 26 Jun 2023 22:42:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 u12-20020adfdd4c000000b0030903d44dbcsm9275843wrm.33.2023.06.26.22.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 22:42:14 -0700 (PDT)
Date: Tue, 27 Jun 2023 08:42:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	"Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] soundwire: amd: Fix a check for errors in probe()
Message-ID: <9863b2bf-0de2-4bf8-8f09-fe24dc5c63ff@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RU2U455V6GERRSIRGY5ZJOR4JURSWSMH
X-Message-ID-Hash: RU2U455V6GERRSIRGY5ZJOR4JURSWSMH
X-Mailman-Approved-At: Wed, 28 Jun 2023 11:29:01 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RU2U455V6GERRSIRGY5ZJOR4JURSWSMH/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This code has two problems:
1) The devm_ioremap() function returns NULL, not error pointers.
2) It's checking the wrong variable.  ->mmio instead of ->acp_mmio.

Fixes: a673a8dfc214 ("soundwire: amd: Add support for AMD Manager driver")
Suggested-by: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Change the variable.  My original fix would have prevented the
driver from loading so many thanks to Vijendar for pointing that out.

 drivers/soundwire/amd_manager.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 08aeb7ed00e1..3a99f6dcdfaf 100644
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
2.39.2

