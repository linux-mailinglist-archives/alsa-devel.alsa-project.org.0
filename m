Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E065FC21
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 18:56:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FF9F16A2;
	Thu,  4 Jul 2019 18:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FF9F16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562259367;
	bh=p7lJiEpVDH5wLnYOmQqO/cHuCwpuJzvPtyujMaZZSKg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=t5DbPiizhW04vZvo23UDHko3acD+/RNfXB36HCNbTW3BDWGxwUA+yP27LA/wjMmhm
	 O6+RqQ2yNB2UqN1W4VbWtpqEzIkptfEankyKLS4aEDyaVBme7lblFCccFsw/gw60UI
	 nu/9EPyiaoDbt9eJbR3hpMrrX41jIXy8Yevgb0Ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4D20F80110;
	Thu,  4 Jul 2019 18:54:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15D97F80111; Thu,  4 Jul 2019 18:54:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_PDS_NO_HELO_DNS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACA40F800E8
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 18:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACA40F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fuMZsh42"
Received: by mail-wr1-x443.google.com with SMTP id n4so7319390wrs.3
 for <alsa-devel@alsa-project.org>; Thu, 04 Jul 2019 09:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ATUBsucBVnluQJ+11gu8baaBZlsEfg1dO25aQlDatqg=;
 b=fuMZsh42cgO7yHDNdFx6sPXq8RBno2OvpXkIGAZFdFqG9RrIDD4lqE2lbGgUsugMb7
 HdczZscId7HzdeZRb0RNhqhKZsCCpSiJ2yLxQvO3hCGPlS734BhUTD+M2Cv9MgxGzPgV
 1lsiS+iGtXNkf1HHZcrzAxLO6MXoJE1Z5YWhtQMU6OZxDfQmVgk3IFS0TbM74nu9Sifn
 D1AQC0hbbiGCav2+zmrDL9XJEmFqvLAHRwNitnE98zZuu3HnbxyWXFUviuQiskbv2Vzh
 L6Kk4h3HVZvpC3DoYnqYXgE1XRyzn4ei0Qt236CS5kIwk9HB5ckSq0C9u5UXIV0m3+3o
 OGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ATUBsucBVnluQJ+11gu8baaBZlsEfg1dO25aQlDatqg=;
 b=UIHZj+23IyYXUHunX158Dg5JRvTTiQaEJL/9dngIab/X4T6BHS2ITGs3SyDq1H0nmJ
 dgvAlNb8LBRz6u4z3P6rtIuGENJA9GW9evTYY+Tk52GL7aL6lM8UUiwnlnnzGgUUM97p
 tTCrpHHL5WFFmAaZd12iXEOltfHVKkABDXxsdiXgADY54ef9D9kAAKSKShbK5v7lzkCZ
 sfOSMRX2CcgQSerLt7kyKN+1KI1BYNFOrK3Jsb0NCg92MzxtCcE8IxsaAkptZiIfQROw
 NSX6vBtqhRYCMFzyIH49nB1XOtkSWAb+WxS6GDIccg9BgQqkGtKRMk4sB4ePh3mXJ9ez
 1Iuw==
X-Gm-Message-State: APjAAAVTmNsHhZb6+KY2fs4Myyu5JQYTc6UAv69gpid/BXbjkZK67jy2
 fMZhBlsHyFNhSh/6hF+IPlCFDQ==
X-Google-Smtp-Source: APXvYqzSIcOCgo7iO6O8x4Xml1XLjNGD5p53Zrw2fXj2b3xCjRjZhUGNSEWFh91XxVXdnr4yzjCGGA==
X-Received: by 2002:a5d:4e50:: with SMTP id r16mr35340948wrt.227.1562259256858; 
 Thu, 04 Jul 2019 09:54:16 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id p26sm8866097wrp.58.2019.07.04.09.54.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 04 Jul 2019 09:54:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Thu,  4 Jul 2019 17:54:10 +0100
Message-Id: <20190704165410.7173-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, lgirdwood@gmail.com
Subject: [alsa-devel] [PATCH v2] ASoC: wcd9335: remove multiple defines.
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

Found during review that there are multiple defines of same constants.
This patch removes them!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1:
	rebased on top of kernel/git/broonie/sound.git for-next

 sound/soc/codecs/wcd9335.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 85737fe54474..1bbbe421b999 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -86,11 +86,6 @@
 #define WCD9335_DEC_PWR_LVL_HP 0x04
 #define WCD9335_DEC_PWR_LVL_DF 0x00
 
-#define  TX_HPF_CUT_OFF_FREQ_MASK	0x60
-#define  CF_MIN_3DB_4HZ			0x0
-#define  CF_MIN_3DB_75HZ		0x1
-#define  CF_MIN_3DB_150HZ		0x2
-
 #define WCD9335_SLIM_RX_CH(p) \
 	{.port = p + WCD9335_RX_START, .shift = p,}
 
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
