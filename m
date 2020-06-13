Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 080E71F8DD4
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 08:28:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADBAD15E5;
	Mon, 15 Jun 2020 08:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADBAD15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592202535;
	bh=bSDKJ7Wz9350883ZHG6/OQT1KtQYL7W4anOUutvOqlQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XduPeYT6qMwK8CBogB+AJrE2+y9GITzcmUzKUYAmP8npmvLjZMIg0feYcbgFimuSg
	 /FFE3qZI7MlJyK+p3KlPzp77jrq1eMi3mbqC1d+981Xc6zU+u+6k5yl6bbna2P4gBU
	 GBroXwiUalw0iyi+WzX4LtGVHokLMSJmcEvVHm+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53B0DF800EF;
	Mon, 15 Jun 2020 08:26:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A53CF80279; Sat, 13 Jun 2020 22:52:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02E80F800CD
 for <alsa-devel@alsa-project.org>; Sat, 13 Jun 2020 22:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02E80F800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu
 header.b="Ardg8aLx"
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 49kqXR4KtHz9vCFn
 for <alsa-devel@alsa-project.org>; Sat, 13 Jun 2020 20:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9OM2j5bi0JPd for <alsa-devel@alsa-project.org>;
 Sat, 13 Jun 2020 15:52:07 -0500 (CDT)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 49kqXR2m3Jz9vCGM
 for <alsa-devel@alsa-project.org>; Sat, 13 Jun 2020 15:52:06 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 49kqXR2m3Jz9vCGM
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 49kqXR2m3Jz9vCGM
Received: by mail-io1-f70.google.com with SMTP id t23so8599117iog.21
 for <alsa-devel@alsa-project.org>; Sat, 13 Jun 2020 13:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=UkcroixAl0qAjD6GgNgyzou/IsN1STk9p+xVVDcmeP0=;
 b=Ardg8aLxFj2jA4QjL4csIbDmbF7Qv6ioBUq9BFwPAzpqdsP+ivgI2B8v6vEDSmF5Kq
 T+VI+cMiJyrltzxL2KJ+S2WHTXIUF/tzDx+Hy6iiCbHiebDtommqrsorIxWsJtD5Xxfl
 rSzCIoMmPWNRk35WVAw7LbUcN+FwnWoL2ov7l39z+On9rB0EWpXx0pMhwvIoyqrXUaxN
 SVjXxR5F+7oT+/CflVUIQ8BF6ijShRJTLfKceESF3Hx+zZ8lX0oXaFdA9bCViMHOZw8e
 x1Ek4ACuuHNQSXcdq2kYUQsZrqkPdIsjq0SIXmIxXnf4IToCmyoJ83/4UJ3PDAddESUD
 Xw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UkcroixAl0qAjD6GgNgyzou/IsN1STk9p+xVVDcmeP0=;
 b=BXfv05sYdKacd92hkc6N6e8VcGYvLdNdHQvdUgF7N2PkvKBGzTJIJSvKwoRtrNcAly
 vPn9hXaMY5PC0XHOi5UnKkKCpkeXRE3pal3LYn1HH+MKmhV7EoxUElwmTaS+c5UG7wMn
 BR0QYv8GPmJZNZjOZFCSn1pHCoug15fiuYrTMT3luV7jwYcxJShnwvWjvTpqpc7bsSpo
 J7+PXoPAlqPjV7yfBa3pM0RsP8SAvGjUwoLlGiNgJnHLG9q8cjOOWiOr/36gNhusJuwR
 4bufTFtNfvoKUJ+kiNIktQaEFrvmb7i/plXQAfcP8oXxDZzxjlT6ihMGVGsAFShDVIOX
 f7tw==
X-Gm-Message-State: AOAM533KkdCqyfdj2D7GbGx9FnmaMjENis3VMNL+VgDrFtV6vuKU2vi1
 Mj81YCuoMBkTO1zvMTrWtIlXnJKL4sVfCIsojbPMPm9fq3iCUNZqj/TuIyAjZ/jtH8xx3Vc+aIy
 LZKrwONVJ8hcLFDCEe25joOGmErQ=
X-Received: by 2002:a05:6e02:542:: with SMTP id
 i2mr19700887ils.203.1592081526552; 
 Sat, 13 Jun 2020 13:52:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWlEJFk6HoO+GE9Acy8SKo/fFC/orEpAve7+rluozITdaEPrSwu9DbTGUy6wx6oKsMcR3TDA==
X-Received: by 2002:a05:6e02:542:: with SMTP id
 i2mr19700858ils.203.1592081526162; 
 Sat, 13 Jun 2020 13:52:06 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
 by smtp.gmail.com with ESMTPSA id c1sm5138369ilh.35.2020.06.13.13.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 13:52:05 -0700 (PDT)
From: wu000273@umn.edu
To: kjlu@umn.edu
Subject: [PATCH] ASoC: rockchip: Fix a reference count leak.
Date: Sat, 13 Jun 2020 15:51:58 -0500
Message-Id: <20200613205158.27296-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 15 Jun 2020 08:26:10 +0200
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 wu000273@umn.edu, linux-arm-kernel@lists.infradead.org
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

From: Qiushi Wu <wu000273@umn.edu>

Calling pm_runtime_get_sync increments the counter even in case of
failure, causing incorrect ref count if pm_runtime_put is not called in
error handling paths. Call pm_runtime_put if pm_runtime_get_sync fails.

Fixes: fc05a5b22253 ("ASoC: rockchip: add support for pdm controller")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 sound/soc/rockchip/rockchip_pdm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 7cd42fcfcf38..1707414cfa92 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -590,8 +590,10 @@ static int rockchip_pdm_resume(struct device *dev)
 	int ret;
 
 	ret = pm_runtime_get_sync(dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put(dev);
 		return ret;
+	}
 
 	ret = regcache_sync(pdm->regmap);
 
-- 
2.17.1

