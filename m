Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B2A212D5B
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:48:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22F6516CB;
	Thu,  2 Jul 2020 21:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22F6516CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593719339;
	bh=t37hTOvZhygZOhPPM9lY41gAkBY0v/DolsPMAWdjjg4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DMJUL0FPzkUl5uN5PVu7ysKlsGEWiBPEM5vrRzcD4I3wYuBJUkO1xG+emIzhnLQpB
	 iL+tOQwxoB0MvIInSOSV47w9WbcWFJrNKbB5Jumqzs+NJjyvdIC+Ycp8suuoOJO988
	 6HB7pkdS/sFFQ1hNz1Pu2JY2yMA1fIh+WAwlb4Z0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78B84F80368;
	Thu,  2 Jul 2020 21:37:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 822ADF80329; Thu,  2 Jul 2020 21:37:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5963F802EB
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5963F802EB
IronPort-SDR: GJkZulnMEA3O4Ij49sNE9R51SUv97gENFZkoEBhryA9bZfBJg6VZMmkpmqCAhS7JM017/Hulxv
 za3nyc38SyRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549360"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549360"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:29 -0700
IronPort-SDR: kagkX6LwLQTybrmcW1QQd4r0AY/Sd0SV80es5t4j1fpI8ONfEp751r4khTHXOEADTp8WkE5xQy
 N/Af6uqNnpSg==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116395"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 18/23] ALSA: pci/es1938: remove 'set but not used' warning
Date: Thu,  2 Jul 2020 14:35:59 -0500
Message-Id: <20200702193604.169059-19-pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warning. Mark the 'audiostatus' variable as __always_unused.

sound/pci/es1938.c: In function ‘snd_es1938_interrupt’:
sound/pci/es1938.c:1622:24: warning: variable ‘audiostatus’ set but
not used [-Wunused-but-set-variable]
 1622 |  unsigned char status, audiostatus;
      |                        ^~~~~~~~~~~

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/es1938.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index b4a0adf7451c..09704a78d799 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -1619,7 +1619,8 @@ static int snd_es1938_create(struct snd_card *card,
 static irqreturn_t snd_es1938_interrupt(int irq, void *dev_id)
 {
 	struct es1938 *chip = dev_id;
-	unsigned char status, audiostatus;
+	unsigned char status;
+	__always_unused unsigned char audiostatus;
 	int handled = 0;
 
 	status = inb(SLIO_REG(chip, IRQCONTROL));
-- 
2.25.1

