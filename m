Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89772212D3A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:41:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C76916EF;
	Thu,  2 Jul 2020 21:40:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C76916EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593718891;
	bh=ldOT6oarDQmdbW9ZMmibjKbUvoatwsJQPoSjANKGEiQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UVhHTbe4u1t42TvobrSx4sQf99WpA3qXJbfdrzgRBG8KTU75q44iOWdWKYfKLadVX
	 cWHPliSf3n59j+xgusYV1EGQshLInV5t1db6qfvDXHnlkp0o/Ruptr40TnRWliyLAf
	 31k5nX1Pa93YKoMHMWy5DBhORszOQ1us4ITATOAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B05CFF80303;
	Thu,  2 Jul 2020 21:36:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA1EBF802E9; Thu,  2 Jul 2020 21:36:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EED54F8022D
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EED54F8022D
IronPort-SDR: Pqkq1DC1Y2euLRNpBv6uwGgBrAuK8W2jXV6Z96fbaI/SHWt2vE2TuZEgm16piUMo6ERfmfHttN
 aoNz7Zc3xZ5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549345"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549345"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:21 -0700
IronPort-SDR: tR+hxVQ1lxC7tFOVvXwiG/3Mlm1RMKmvvm9w4x0zxeQeSHBal6vznDcFlXNJjrLJSlRxSZjugN
 AIQ1NBA5v0dg==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116368"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 05/23] ALSA: pci/asihpi: remove 'set but not used' warning
Date: Thu,  2 Jul 2020 14:35:46 -0500
Message-Id: <20200702193604.169059-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
References: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warnings, mark variables as __always_unused

sound/pci/asihpi/asihpi.c: In function ‘snd_asihpi_tuner_band_get’:
sound/pci/asihpi/asihpi.c:1907:6: warning: variable ‘num_bands’ set
but not used [-Wunused-but-set-variable]
 1907 |  u32 num_bands;
      |      ^~~~~~~~~
sound/pci/asihpi/asihpi.c: In function ‘snd_asihpi_tuner_band_put’:
sound/pci/asihpi/asihpi.c:1934:6: warning: variable ‘num_bands’ set
but not used [-Wunused-but-set-variable]
 1934 |  u32 num_bands;
      |      ^~~~~~~~~

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/asihpi/asihpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index faa879f175a9..023c35a2a951 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -1904,7 +1904,7 @@ static int snd_asihpi_tuner_band_get(struct snd_kcontrol *kcontrol,
 	*/
 	u16 band, idx;
 	u16 tuner_bands[HPI_TUNER_BAND_LAST];
-	u32 num_bands;
+	__always_unused u32 num_bands;
 
 	num_bands = asihpi_tuner_band_query(kcontrol, tuner_bands,
 				HPI_TUNER_BAND_LAST);
@@ -1931,7 +1931,7 @@ static int snd_asihpi_tuner_band_put(struct snd_kcontrol *kcontrol,
 	unsigned int idx;
 	u16 band;
 	u16 tuner_bands[HPI_TUNER_BAND_LAST];
-	u32 num_bands;
+	__always_unused u32 num_bands;
 
 	num_bands = asihpi_tuner_band_query(kcontrol, tuner_bands,
 			HPI_TUNER_BAND_LAST);
-- 
2.25.1

