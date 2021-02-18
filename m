Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D58B431F25C
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 23:34:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 775151677;
	Thu, 18 Feb 2021 23:33:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 775151677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613687647;
	bh=uno+NJn+5yl60cOq3uYMjKWThPAiJhnt/QyNuekvE3Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BgO8PxDgQ1Red4XLtTgF7eiQsxaGYf63f/d/0plSSzwPHYj1Gog/H3Wy2FoenD7Es
	 W2vQXhTarzQvAA2qnXJB1OOp0bedJP45IH5UYSAqxbaYiFUJN88xxr+M+iZJiTyaua
	 z/V+OyZ47hkdDc9iQLcV3tF5LgC+TFGG9JiVWfAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1520CF80431;
	Thu, 18 Feb 2021 23:30:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E8ABF8016E; Thu, 18 Feb 2021 23:30:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 154D2F800E9
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 23:29:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 154D2F800E9
IronPort-SDR: JNk+q+qt8Sdj4YboEGkTT9izQJKbiH41fj+iOoKpF52VohgsgG6tOMEBoEBL00lNiMgmewmYd6
 Kh2Gs/mBvGHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="182875656"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="182875656"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:42 -0800
IronPort-SDR: 0IKw3eBUePnzsn6fvYO8P/AaH0PUrCDK21ErMWZDk5+jY0/okiHa23FseMtJzJhitOjVV4eTJi
 iX5lmabYn6XQ==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="364990848"
Received: from tphilli1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.38])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:41 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/10] ASoC: wcd9335: clarify return value
Date: Thu, 18 Feb 2021 16:29:14 -0600
Message-Id: <20210218222916.89809-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
References: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

cppcheck warning:

sound/soc/codecs/wcd9335.c:5216:9: warning: Identical condition and
return expression 'ret', return value is always 0
[identicalConditionAfterEarlyExit]
 return ret;
        ^
sound/soc/codecs/wcd9335.c:5211:6: note: If condition 'ret' is true,
the function will return/exit
 if (ret)
     ^
sound/soc/codecs/wcd9335.c:5216:9: note: Returning identical
expression 'ret'
 return ret;
        ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/wcd9335.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 9ddfed797b7e..adb325fac930 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -5213,7 +5213,7 @@ static int wcd9335_slim_status(struct slim_device *sdev,
 
 	wcd9335_probe(wcd);
 
-	return ret;
+	return 0;
 }
 
 static const struct slim_device_id wcd9335_slim_id[] = {
-- 
2.25.1

