Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0221212D5C
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:49:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2097616EB;
	Thu,  2 Jul 2020 21:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2097616EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593719369;
	bh=c53X1sckrL315gXa+mYiUNQaaOJpigOdPDEkwD6xAcI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k6+ebI3CplIXMukc/vMWPmHdF56zCByeqo0YOWb1Q2S2y9AmqpmARXqaeDqRnah0m
	 ++EqdE1XaxBQMHE9yArKyec+NWpZzAE/FDbiVzUZZDTzIN2ULy6cJK1jKKbvanioQn
	 eHbpMk5NHpUzNusidhup0k7e0Vrt/tEFEJRu2OhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 516ECF80369;
	Thu,  2 Jul 2020 21:37:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94445F80328; Thu,  2 Jul 2020 21:37:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 362F3F802F9
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 362F3F802F9
IronPort-SDR: X34fN3bTVOlZ1xpXt/QGK3vCpHe4QVYlhtx1W//fMMquw5qBW1lTzDZsUyUCcmvzWpSPTsZFUs
 oECH4qXY5L0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549364"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549364"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:31 -0700
IronPort-SDR: AZ/NyXXZuLkYB8pNSAcrblWFcp1agqmfS1AJzgpEhDjkVqPqE2HILiJnWXk1ozAqCcjCDPJLut
 kE0m8dBKD4yQ==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116403"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 20/23] ALSA: pci/via82xx: remove 'set but not used'
 warnings
Date: Thu,  2 Jul 2020 14:36:01 -0500
Message-Id: <20200702193604.169059-21-pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warnings. Mark variables as __always_unused.

sound/pci/via82xx.c: In function ‘snd_via82xx_codec_wait’:
sound/pci/via82xx.c:547:6: warning: variable ‘err’ set but not used
[-Wunused-but-set-variable]
  547 |  int err;
      |      ^~~
sound/pci/via82xx_modem.c: In function ‘snd_via82xx_codec_wait’:
sound/pci/via82xx_modem.c:401:6: warning: variable ‘err’ set but not
used [-Wunused-but-set-variable]
  401 |  int err;
      |      ^~~

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/via82xx.c       | 2 +-
 sound/pci/via82xx_modem.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index 8b03e2dc503f..7abd47dbfe55 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -544,7 +544,7 @@ static int snd_via82xx_codec_valid(struct via82xx *chip, int secondary)
 static void snd_via82xx_codec_wait(struct snd_ac97 *ac97)
 {
 	struct via82xx *chip = ac97->private_data;
-	int err;
+	__always_unused int err;
 	err = snd_via82xx_codec_ready(chip, ac97->num);
 	/* here we need to wait fairly for long time.. */
 	if (!nodelay)
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index 607b7100db1c..addfa196df21 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -398,7 +398,7 @@ static int snd_via82xx_codec_valid(struct via82xx_modem *chip, int secondary)
 static void snd_via82xx_codec_wait(struct snd_ac97 *ac97)
 {
 	struct via82xx_modem *chip = ac97->private_data;
-	int err;
+	__always_unused int err;
 	err = snd_via82xx_codec_ready(chip, ac97->num);
 	/* here we need to wait fairly for long time.. */
 	msleep(500);
-- 
2.25.1

