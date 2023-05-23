Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6F070E0E5
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 17:48:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F02F828;
	Tue, 23 May 2023 17:48:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F02F828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684856935;
	bh=mg7RA/8ofAKXTJh1pUsmNJqHfhSHPMoJmdVBNCpqGQg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AXk1VlS/hTDaBKEjRlBT7WCczjuNfLn+is//p4jmZZK5kZx/y7QH70syezkwJBHir
	 OkrT5NiFXBqNFOn+qnJkVlbnlKjJJnDqmSpQPEzG9G7OWjL6Otm9LpnjxfMDAmogjC
	 LQOa4Y+7gli8mP4LRqfU6eYyriizS0e4Lvc/gwOA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BDD5F8016A; Tue, 23 May 2023 17:48:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAAEAF80249;
	Tue, 23 May 2023 17:48:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0004DF800DF; Tue, 23 May 2023 17:48:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7946AF800DF
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 17:47:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7946AF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XI33DDyK
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f607dc98cdso252795e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 23 May 2023 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684856877; x=1687448877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wQCfe4UyM82vmyTRFBM4WHyG7YgqkrNHdPfn864Gl+8=;
        b=XI33DDyKIlOhh0N/WCTe3/A54qgbzrtME6LI7rRzz+FXMx+ISS41uwFhQDBwtOmy4q
         aLPNelYtU+JQg5Wa2sImzUXTBePkCQpTHPBxtlXKqbN3nVvSbkLm/YenPGVFbitNfKrN
         kRUR7aiSZ2kyqrkYrD76nTZLCOcG/c3qAC7TGyjlI8G8lktBr7DWMgTxIf80NGd+Htt7
         /Fw5pVOduACQ/0kQ67HdHHWfZSE60wgw7+n8ROp0ZighNUwwLzbYTECBNk7R/avrK2S5
         CrlY4Vh4ksrc6VXYFTSTUXSdQjRi7cmAVMg5k0oQ/yuyKCdPPwXf5RBFelrDHqLuza+4
         sB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684856877; x=1687448877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQCfe4UyM82vmyTRFBM4WHyG7YgqkrNHdPfn864Gl+8=;
        b=cakJXJqPG/9HLz/zcyP3i9s7MiTAvb6dOoenxp7D3MkG1O+R+gPY6oLl8ctC5yFPYg
         45+jo6nAruBV5lCZRbaeKbOPtRp57XusZoTjSLtZzdXY+sqeMcvGbqTGkFf+QcXWCmjO
         HNpnyAgZK8lgI7SJrcREYJjBA1TkpFdsTUyEiyxja8hq9Sgfe/havSsOiH3AZfFLxiBp
         A8HUVouHtLJqUjHPcrb9BFyiOoRYgSslgwscc84PNNiE9GJiKaSMwAhbyCRQL/zraLXZ
         VHiVXP7AnYOBzK5/diX1SQPHRUoJq0E2eMhXgyah7DD4hnpP8jXcqACu3bKiovjeAPbd
         7Ejw==
X-Gm-Message-State: AC+VfDzNjYsTf4PX0OMe1yUemAypvljk/IAPgWBDytbVQ8z/9On2kNte
	A2OScoR3rm4qygImMXwxhFEAeg==
X-Google-Smtp-Source: 
 ACHHUZ7CPsTH5MMiP5kdNXdVZV0bfwqRP6BQlHOunHj7pJHFJvIoFx/mtWtRhIKOMH6MhbPrmxHxKA==
X-Received: by 2002:a1c:6a03:0:b0:3f6:580:b091 with SMTP id
 f3-20020a1c6a03000000b003f60580b091mr4773535wmc.16.1684856877505;
        Tue, 23 May 2023 08:47:57 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 g3-20020a7bc4c3000000b003f427687ba7sm12052386wmk.41.2023.05.23.08.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 08:47:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ckeepax@opensource.cirrus.com,
	tanureal@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] regmap: sdw: check for invalid multi-register writes config
Date: Tue, 23 May 2023 16:47:47 +0100
Message-Id: <20230523154747.5429-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SZ4335CLR3XBJTP3K3USDQXMEVKQ24YS
X-Message-ID-Hash: SZ4335CLR3XBJTP3K3USDQXMEVKQ24YS
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SZ4335CLR3XBJTP3K3USDQXMEVKQ24YS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SoundWire code as it is only supports Bulk register writes and
it does not support multi-register writes.

Any drivers that set can_multi_write and use regmap_multi_reg_write() will
easily endup with programming the hardware incorrectly without any errors.

So, add this check in bus code to be able to validate the drivers config.

Fixes: 522272047dc6 ("regmap: sdw: Remove 8-bit value size restriction")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/base/regmap/regmap-sdw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/base/regmap/regmap-sdw.c b/drivers/base/regmap/regmap-sdw.c
index 09899ae99fc1..159c0b740b00 100644
--- a/drivers/base/regmap/regmap-sdw.c
+++ b/drivers/base/regmap/regmap-sdw.c
@@ -59,6 +59,10 @@ static int regmap_sdw_config_check(const struct regmap_config *config)
 	if (config->pad_bits != 0)
 		return -ENOTSUPP;
 
+	/* Only bulk writes are supported not multi-register writes */
+	if (config->can_multi_write)
+		return -ENOTSUPP;
+
 	return 0;
 }
 
-- 
2.21.0

