Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A7F212D5E
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:50:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0975A16ED;
	Thu,  2 Jul 2020 21:49:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0975A16ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593719439;
	bh=fZF4bFFXT36hIC0kzMmybWRM8br6dUWQmpS0t+TqlGY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lNBj7aiZQ0OCigH+QlHORcJESMuK7ER76iRf4QdBYHBxjyu3VhmnXK47frnsryVoR
	 A73leeGCRM7OGgI5qy9F00xveo6GmJpPTeQJwtiHVAAqOpCXGibEBKHvv7sctmtOuQ
	 o/sXKCru1FkkxUU70tTM3zBuzZ3k2SQRGB0yQMAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03D32F80377;
	Thu,  2 Jul 2020 21:37:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA908F80328; Thu,  2 Jul 2020 21:37:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54BC4F80304
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54BC4F80304
IronPort-SDR: 0j4lLLGvbt0TqRroR/1LEBBTw31TZi1TThW5dSaRfrNDCDJY7lxzJBbW8pzpMrzcJLt9ms5cnK
 t02nKvDXTtJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549365"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549365"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:32 -0700
IronPort-SDR: eSwk9xfu6xpASVGilAtKfYI+O5cxWtU8ihz7U7cYNT9xPA4L7n//Q3CEOBIDmG/T1frWZ/s/ul
 Xjp4Podgb3ng==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116407"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 21/23] ALSA: pcmcia/pdaudiocf: fix kernel-doc
Date: Thu,  2 Jul 2020 14:36:02 -0500
Message-Id: <20200702193604.169059-22-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
References: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
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

Fix W=1 warnings - add missing context parameter in description

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pcmcia/pdaudiocf/pdaudiocf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pcmcia/pdaudiocf/pdaudiocf.c b/sound/pcmcia/pdaudiocf/pdaudiocf.c
index 6c33ea91cc05..27d9da6d61e8 100644
--- a/sound/pcmcia/pdaudiocf/pdaudiocf.c
+++ b/sound/pcmcia/pdaudiocf/pdaudiocf.c
@@ -139,6 +139,7 @@ static int snd_pdacf_probe(struct pcmcia_device *link)
 
 /**
  * snd_pdacf_assign_resources - initialize the hardware and card instance.
+ * @pdacf: context
  * @port: i/o port for the card
  * @irq: irq number for the card
  *
-- 
2.25.1

