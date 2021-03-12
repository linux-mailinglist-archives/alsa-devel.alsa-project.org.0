Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A677A33968D
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:31:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 440BC182D;
	Fri, 12 Mar 2021 19:31:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 440BC182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615573918;
	bh=/9NFL+/j5eXg+WIN0DoY+EzQE4h23tvBfGxERZRaP5o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FAZT4WW/gu7GJfXSz8ek8pewn9XwooG1TWOD+ntorB8mpq0E1f1QpkZIrr/JAY7y4
	 eSvBedRv8QkVuom8gA94B4KEnlFj5Hgae7DEOainaqsucdzucz5YynvhtD4hcqgsMl
	 1N7/BltCBAUtTbmTNsgwFhM/brsSqTED5NiaR2Zo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C42CF80536;
	Fri, 12 Mar 2021 19:24:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28085F804E3; Fri, 12 Mar 2021 19:24:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D46AF804E4
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:23:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D46AF804E4
IronPort-SDR: S2nAzW7upNGg8O0bZ3PxTT3giS3EmF9HUTaDOxQbOB0aNgBsGSfs3GP1Qo7zbmXHDhP0m+EHan
 TKaGA+gww5MA==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="188236472"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="188236472"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:45 -0800
IronPort-SDR: Qmd/PrKab4w5xZ718ans4S8x0QzbdDtmgQ4cSiMH5KAMUFVWZalveoN5EIQ1fpgV22pc84X/lt
 qIjmHRs5kEJQ==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377792044"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:44 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 16/23] ASoC: pcm1681: remove useless assignment
Date: Fri, 12 Mar 2021 12:22:39 -0600
Message-Id: <20210312182246.5153-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 broonie@kernel.org
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

sound/soc/codecs/pcm1681.c:87:8: style: Variable 'i' is assigned a
value that is never used. [unreadVariable]
 int i = 0, val = -1, enable = 0;
       ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/pcm1681.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index 07ed8fded471..5b78e9299c95 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -84,7 +84,7 @@ static const int pcm1681_deemph[] = { 44100, 48000, 32000 };
 static int pcm1681_set_deemph(struct snd_soc_component *component)
 {
 	struct pcm1681_private *priv = snd_soc_component_get_drvdata(component);
-	int i = 0, val = -1, enable = 0;
+	int i, val = -1, enable = 0;
 
 	if (priv->deemph) {
 		for (i = 0; i < ARRAY_SIZE(pcm1681_deemph); i++) {
-- 
2.25.1

