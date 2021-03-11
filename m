Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF92336930
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 01:49:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 163A31693;
	Thu, 11 Mar 2021 01:48:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 163A31693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615423742;
	bh=C8rZLOyPeQFxEB79VDQlEvFD/fJTteTe+o7qgfWN7ng=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vi/t4XeO/5Dd0Qohw/E2ACxhEpih3v+8YIH+70/2BN/pdQ7xa/IrSRgFZ0RdFRLCO
	 2GJXWCr/IZujweKPGRZG/r+aTC+9bDQS49s+pzJw+yzW4ylBkXS5dJW9R3od3Lyq8T
	 drFDop5LIWY+A0QOqrTrfztzJatlYuxrJ1RC/FjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB552F804EB;
	Thu, 11 Mar 2021 01:44:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24826F804DA; Thu, 11 Mar 2021 01:44:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D3E3F8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 01:43:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D3E3F8010D
IronPort-SDR: zfr4FXAsVrdN4Ukl1QhoJZduYQY+Je6357GdSTH+G16fLvHzMddQN2uwFqpnn7R6k8r9RQaIPw
 /hBVMeG0r1Fw==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="176185755"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="176185755"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:43:50 -0800
IronPort-SDR: BcRb5lw500HsxKgUVtA4g1Rz0UT3NSia9ZfP0six96eSBVz2h+F+8OJpi8Nj99RTQtnlsOmNFS
 6IHu8VmCLIsQ==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="370385636"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:43:49 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/10] ASoC: wm_hubs: align function prototype
Date: Wed, 10 Mar 2021 18:43:32 -0600
Message-Id: <20210311004332.120901-11-pierre-louis.bossart@linux.intel.com>
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

cppcheck warnings:

sound/soc/codecs/wm_hubs.c:1194:11: style:inconclusive: Function
'wm_hubs_handle_analogue_pdata' argument 8 names different:
declaration 'micbias1_dly' definition
'micbias1_delay'. [funcArgNamesDifferent]
      int micbias1_delay, int micbias2_delay,
          ^
sound/soc/codecs/wm_hubs.h:59:11: note: Function
'wm_hubs_handle_analogue_pdata' argument 8 names different:
declaration 'micbias1_dly' definition 'micbias1_delay'.
      int micbias1_dly, int micbias2_dly,
          ^
sound/soc/codecs/wm_hubs.c:1194:11: note: Function
'wm_hubs_handle_analogue_pdata' argument 8 names different:
declaration 'micbias1_dly' definition 'micbias1_delay'.
      int micbias1_delay, int micbias2_delay,
          ^
sound/soc/codecs/wm_hubs.c:1194:31: style:inconclusive: Function
'wm_hubs_handle_analogue_pdata' argument 9 names different:
declaration 'micbias2_dly' definition
'micbias2_delay'. [funcArgNamesDifferent]
      int micbias1_delay, int micbias2_delay,
                              ^
sound/soc/codecs/wm_hubs.h:59:29: note: Function
'wm_hubs_handle_analogue_pdata' argument 9 names different:
declaration 'micbias2_dly' definition 'micbias2_delay'.
      int micbias1_dly, int micbias2_dly,
                            ^
sound/soc/codecs/wm_hubs.c:1194:31: note: Function
'wm_hubs_handle_analogue_pdata' argument 9 names different:
declaration 'micbias2_dly' definition 'micbias2_delay'.
      int micbias1_delay, int micbias2_delay,
                              ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/wm_hubs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_hubs.h b/sound/soc/codecs/wm_hubs.h
index 988b29e63060..a4ed9bd31426 100644
--- a/sound/soc/codecs/wm_hubs.h
+++ b/sound/soc/codecs/wm_hubs.h
@@ -56,7 +56,7 @@ extern int wm_hubs_handle_analogue_pdata(struct snd_soc_component *,
 					 int lineout1_diff, int lineout2_diff,
 					 int lineout1fb, int lineout2fb,
 					 int jd_scthr, int jd_thr,
-					 int micbias1_dly, int micbias2_dly,
+					 int micbias1_delay, int micbias2_delay,
 					 int micbias1_lvl, int micbias2_lvl);
 
 extern irqreturn_t wm_hubs_dcs_done(int irq, void *data);
-- 
2.25.1

