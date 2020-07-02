Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E48D6212D39
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F47C16AC;
	Thu,  2 Jul 2020 21:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F47C16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593718855;
	bh=nBAWBKDvRCsoND2zwxBlWPknizl1eCh3HXeA2Ols+p4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S4/8wl1UJzToe2Ajc4h5Wr0BWPBjX37BuGO4pDDn8YahrzJ1NSNDbM5GGGPysaR0O
	 okAZchhAsiUPEPu3zqXz4hTqDLaEreajfwv91fRVI6c6X2U/5p4cUj07RXDZHRMddE
	 mnw/IRQz3YM/h5wqDryHGX4MyxbZDBqiNwHMqtOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 020A7F802E9;
	Thu,  2 Jul 2020 21:36:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4E64F8028F; Thu,  2 Jul 2020 21:36:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF073F8028F
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF073F8028F
IronPort-SDR: O2N6Jxlc2eXJ81aXdxq0s82Bml5wo0da+xNWhsIM85T/nkeCz0tvW9IzHGrWG6elG4DujWfd7w
 gh3D19bUCLVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549346"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549346"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:21 -0700
IronPort-SDR: v8bUtnqjLMgDIzJTcRZoBQcxVNqxQDDvBOiVTvBzf2Ss9oszjY5PCrz1oC5f5svKlYgAX+Kc1J
 sLkrmrDNdJnQ==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116370"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 06/23] ALSA: pci/echoaudio: remove 'set but not used'
 warning
Date: Thu,  2 Jul 2020 14:35:47 -0500
Message-Id: <20200702193604.169059-7-pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warning. One variable is only used in a conditionally-compiled
block, mark as __maybe_unused

sound/pci/echoaudio/echoaudio.c: In function ‘snd_echo_probe’:
sound/pci/echoaudio/echoaudio.c:1958:6: warning: variable ‘i’ set but
not used [-Wunused-but-set-variable]
 1958 |  int i, err;
      |      ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/echoaudio/echoaudio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 0941a7a17623..bee3271e29da 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -1955,7 +1955,8 @@ static int snd_echo_probe(struct pci_dev *pci,
 	struct snd_card *card;
 	struct echoaudio *chip;
 	char *dsp;
-	int i, err;
+	__maybe_unused int i;
+	int err;
 
 	if (dev >= SNDRV_CARDS)
 		return -ENODEV;
-- 
2.25.1

