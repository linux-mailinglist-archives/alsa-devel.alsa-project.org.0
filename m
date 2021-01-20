Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCAB2FC845
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 03:51:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D94F418EF;
	Wed, 20 Jan 2021 03:51:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D94F418EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611111118;
	bh=461Yv8iivppi/trH756BYgdgwZ/DxDiwNtdN5kHiRd4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jTPFOHJHYBwla8yY+u4BUG1CLJVnlc4ZWO/dqVCTE1lpytzX+Z5UWm7puNUReah96
	 MTIS+OIKTSR9xDo9Em5ptWnEa4gU/k/cC/uz4MF9M3zV5jTDBmkecfHlurXrJZlO0n
	 NjDg0f5jeqIKMAuqUC7u5mgQ3dAFOkPHwBb2zWJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 480D4F8019B;
	Wed, 20 Jan 2021 03:50:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92DD0F8016E; Wed, 20 Jan 2021 03:50:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32260F80164
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 03:50:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32260F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="EYgJCgJ6"
Received: by mail-pj1-x102e.google.com with SMTP id l23so1224763pjg.1
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 18:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SK2/ipjT+YWcNiCuZHl6puNjdEQtTBsEWCQa8Yqn+os=;
 b=EYgJCgJ6ad9Lk9PYlOAjm7F1h6zhESGELOdCsPibR961IXoLCcls++SqkQWq6a0dgo
 KmbMZyxeh+V4WZz4uMhY6GQyYR/HRAgsND3K3620xeIn9K5DGwrpBe9CaB22hZG/f+kl
 jxw9UHn9bNYw/tEvRBSVKuSuROM8UItQsbfjOzcfWWb60dnHWEZaTzRK35t+lLBwusgM
 8s5j+GajwK2tqyk+1QH7L5h/Qw2VKcQDN82lHhRK1kJXCO1eH4uocFBiv2bDvvl8l7YK
 wbaOmBkFVqpamca98G08OX16brt7yz7KJy32oD8rbqvakkOS/EpqYSxTD7HZKT57iAli
 yQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SK2/ipjT+YWcNiCuZHl6puNjdEQtTBsEWCQa8Yqn+os=;
 b=MqiguH9MpIG2jqpP1hRkwRCdfjdDLBXPHD/PADaTpXBxUplvvjMeLhqSrMJSPlrDea
 sLOpb/PYyXxXHW4Zn9fF4x+1v4lmBZjMAOPz9UZOeIy2NoAlCJSz090a3Bjjs9ml/RY9
 AJjFnjBusqYY/qXOYmgP3XwF15qsFqZYXJid4oornq4hRSP/1yIIbdcsTqhjIZdY3C6i
 s9sRFKi0hzyLSGDC74Hsn/Wlfpah0DLsc5P2cUPWnn6aSk+iA2xQUbc05abWx1dL5LyI
 DZ7YqUotuvWHvyD7xDI23X1O+kgJ/35W7joQWzKHUqA3VW46rK/VbFD9kT3otybnNGm2
 Va5A==
X-Gm-Message-State: AOAM530goklvK60XaeLXX/dQ16XVa1RJgpjatMbbTzzlDOPkjhVh4vxP
 RJP6qyCtNyZLM/JRXN2aWz4pmQ==
X-Google-Smtp-Source: ABdhPJwl1OkPaQFtK/WZSUHsFCEBRE54cOCbVfI6PSgVBm6pbwN1/9abp1xLwAgmR8N1gU6NNvofLA==
X-Received: by 2002:a17:90b:690:: with SMTP id
 m16mr3071499pjz.74.1611111015332; 
 Tue, 19 Jan 2021 18:50:15 -0800 (PST)
Received: from localhost.localdomain (li519-153.members.linode.com.
 [66.175.222.153])
 by smtp.gmail.com with ESMTPSA id k25sm420987pfi.10.2021.01.19.18.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 18:50:14 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
To: srinivas.kandagatla@linaro.org
Subject: [PATCH v2] ASoC: qcom: lpass: Fix i2s ctl register bit map
Date: Wed, 20 Jan 2021 10:49:55 +0800
Message-Id: <20210120024955.3911891-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jun Nie <jun.nie@linaro.org>, plai@codeaurora.org, bgoswami@codeaurora.org,
 alsa-devel@alsa-project.org
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

Fix bitwidth mapping in i2s ctl register per APQ8016 document.
Fixes: b5022a36d28f ("ASoC: qcom: lpass: Use regmap_field for i2sctl and
dmactl registers")

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 sound/soc/qcom/lpass-apq8016.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 8507ef8f6679..3efa133d1c64 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -250,7 +250,7 @@ static struct lpass_variant apq8016_data = {
 	.micmode		= REG_FIELD_ID(0x1000, 4, 7, 4, 0x1000),
 	.micmono		= REG_FIELD_ID(0x1000, 3, 3, 4, 0x1000),
 	.wssrc			= REG_FIELD_ID(0x1000, 2, 2, 4, 0x1000),
-	.bitwidth		= REG_FIELD_ID(0x1000, 0, 0, 4, 0x1000),
+	.bitwidth		= REG_FIELD_ID(0x1000, 0, 1, 4, 0x1000),
 
 	.rdma_dyncclk		= REG_FIELD_ID(0x8400, 12, 12, 2, 0x1000),
 	.rdma_bursten		= REG_FIELD_ID(0x8400, 11, 11, 2, 0x1000),
-- 
2.25.1

