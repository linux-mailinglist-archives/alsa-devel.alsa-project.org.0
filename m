Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9B532AC50
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:35:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95806193B;
	Tue,  2 Mar 2021 22:34:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95806193B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614720920;
	bh=M8FDTdfVGeimVyvVmYWnh70Q3WVFjJ4UCTDWkCaLB00=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=flce4Yb4WBTkuHJ8y/8IAFXWelBULeGVgSMs/HHf7jDnvc7t2xxlQ4N9NgEE26j6k
	 uor+icr05k9RiuUwh5jAU8BDOdhUt1y3gHR1SOlBx0MfXXiyPoj10JdDzwqZ06/keX
	 kyGK9tjUinQ4ni5zrTuzi6NxvfyQiSXeVRQnbyqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63B7EF8053E;
	Tue,  2 Mar 2021 22:26:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D362F80525; Tue,  2 Mar 2021 22:26:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32A2BF804A9
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:26:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32A2BF804A9
IronPort-SDR: HkEuCiCh5F5YPi1NGCi0vbFfJWSb4QCrV+SVwsNwn1B88/7gDYuyGLYPYI4ZUIo6TPjjp+gHSk
 hU+qRabFtnHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="183603759"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="183603759"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:04 -0800
IronPort-SDR: fRf+ytAdffZJky1HKboVAnpSWGe/g8eoRKzVpU2ycYyCS23Po9RW1ByFkt7Uz/tZ37NfCbLTUG
 BRN2FZTDSCTw==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="399223408"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:25:57 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/24] ASoC: rt5645: use logical OR
Date: Tue,  2 Mar 2021 15:25:12 -0600
Message-Id: <20210302212527.55158-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302212527.55158-1-pierre-louis.bossart@linux.intel.com>
References: <20210302212527.55158-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

sound/soc/codecs/rt5645.c:693:37: style:inconclusive: Boolean
expression 'reg>=420&&reg<=461' is used in bitwise operation. Did you
mean '||'? [bitwiseOnBoolean]
 if ((reg >= 0x1a4 && reg <= 0x1cd) | (reg >= 0x1e5 && reg <= 0x1f8) |
                                    ^
sound/soc/codecs/rt5645.c:693:70: style:inconclusive: Boolean
expression 'reg==177' is used in bitwise operation. Did you mean '||'?
[bitwiseOnBoolean]
 if ((reg >= 0x1a4 && reg <= 0x1cd) | (reg >= 0x1e5 && reg <= 0x1f8) |
                                                                     ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5645.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 63a7e052eaa0..4db6cd70e32b 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -690,7 +690,7 @@ static int rt5645_hweq_get(struct snd_kcontrol *kcontrol,
 
 static bool rt5645_validate_hweq(unsigned short reg)
 {
-	if ((reg >= 0x1a4 && reg <= 0x1cd) | (reg >= 0x1e5 && reg <= 0x1f8) |
+	if ((reg >= 0x1a4 && reg <= 0x1cd) || (reg >= 0x1e5 && reg <= 0x1f8) ||
 		(reg == RT5645_EQ_CTRL2))
 		return true;
 
-- 
2.25.1

