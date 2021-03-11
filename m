Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5729336929
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 01:48:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AC7816F8;
	Thu, 11 Mar 2021 01:47:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AC7816F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615423689;
	bh=LbiKD9J7iyIN577UX6UYMwHXhxL6v7gEZ7rGRG9YMMc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PK2A2hyDSRIwxUy8L1stbxWzoUk8joA7wGwn1yxs88y4K39qUwb4jc4DxwLk5tlWB
	 uDIkNJzBDgZmMtikCbwaFl3yK84NNOkn4uSy94EBSd30ARvTaHO2Y/l+SzinSYY96+
	 qVNLwz9U5h1XVOrz4/brLS/dJjBeOjLtkWZ/86fg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F899F804CF;
	Thu, 11 Mar 2021 01:44:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ED4FF80475; Thu, 11 Mar 2021 01:44:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 453FDF8032B
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 01:43:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 453FDF8032B
IronPort-SDR: qg1u3VmgJGmdCkQYHL189mSI7YayySNaMCN2VXAboqoZeFI7avQtpor0643KolWKbkxsH6J6W4
 ag5mgLIvCTdg==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="176185746"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="176185746"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:43:47 -0800
IronPort-SDR: Fm/EgNHvkdgao0HQ9Isz+Z3BRsRezH73TFnJxkFz0inpfbf5xyEDjbsjrlNRvSIZIPxQNvCkZ1
 U4oQCrPcTNrw==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="370385625"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:43:46 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/10] ASoC: wm8994: align function prototype
Date: Wed, 10 Mar 2021 18:43:29 -0600
Message-Id: <20210311004332.120901-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311004332.120901-1-pierre-louis.bossart@linux.intel.com>
References: <20210311004332.120901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, patches@opensource.cirrus.com, broonie@kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
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

sound/soc/codecs/wm8994.c:3923:26: style:inconclusive: Function
'wm8958_mic_detect' argument 3 names different: declaration 'cb'
definition 'det_cb'. [funcArgNamesDifferent]
        wm1811_micdet_cb det_cb, void *det_cb_data,
                         ^
sound/soc/codecs/wm8994.h:53:26: note: Function 'wm8958_mic_detect'
argument 3 names different: declaration 'cb' definition 'det_cb'.
        wm1811_micdet_cb cb, void *det_cb_data,
                         ^
sound/soc/codecs/wm8994.c:3923:26: note: Function 'wm8958_mic_detect'
argument 3 names different: declaration 'cb' definition 'det_cb'.
        wm1811_micdet_cb det_cb, void *det_cb_data,
                         ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/wm8994.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8994.h b/sound/soc/codecs/wm8994.h
index 41c4b126114d..bc584b17bf28 100644
--- a/sound/soc/codecs/wm8994.h
+++ b/sound/soc/codecs/wm8994.h
@@ -50,7 +50,7 @@ typedef void (*wm1811_mic_id_cb)(void *data, u16 status);
 int wm8994_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack,
 		      int micbias);
 int wm8958_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack,
-		      wm1811_micdet_cb cb, void *det_cb_data,
+		      wm1811_micdet_cb det_cb, void *det_cb_data,
 		      wm1811_mic_id_cb id_cb, void *id_cb_data);
 
 int wm8994_vmid_mode(struct snd_soc_component *component, enum wm8994_vmid_mode mode);
-- 
2.25.1

