Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A84AB32AC69
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:56:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F66E1AD9;
	Tue,  2 Mar 2021 22:55:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F66E1AD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614722204;
	bh=ChhH1eqcmmCzPJAZzgNR8uwlXwj/EcK744AxBLHRxDc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X+Q7IsH4vZoH0OfeHu/v6YB3t2KQERRykIzIGi4HPwsQpKnim7+7rPRG6Igf130Yw
	 UpwMQP5qkkRqxzvyFK9Iidr7uJEvA01FdTqzEbazrf2VztOpEnXz5SibzOr0qCAGaE
	 3VigXBM4VYgAslb4Iuh0wKuChXWhII8qZO8bHt5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37E03F80424;
	Tue,  2 Mar 2021 22:55:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5E8FF8025B; Tue,  2 Mar 2021 22:54:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 737ACF8025B
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:54:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 737ACF8025B
IronPort-SDR: GLQrUX6e1pDpUouS82Zff3uJ3pAo4rdu6eU80IgeeQmv7Jvx6ZL3EGgY2VKndvFkQw26JGUKQH
 O15xp5seF1Yg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="166248701"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="166248701"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:54:45 -0800
IronPort-SDR: 3eFUxU2esxIKlf1QID9HT7LV3cP4e2BQAmNyUsCF+z4w3/tW5IFg/jPYkBRVdccoAD19TgYahB
 XpkUbWxrEyfw==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="518014311"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:54:44 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ALSA: vx: fix kernel-doc warning
Date: Tue,  2 Mar 2021 15:54:28 -0600
Message-Id: <20210302215430.87309-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302215430.87309-1-pierre-louis.bossart@linux.intel.com>
References: <20210302215430.87309-1-pierre-louis.bossart@linux.intel.com>
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

make W=1 warning:

sound/drivers/vx/vx_core.c:410: warning: expecting prototype for
snd_vx_boot_xilinx(). Prototype was for snd_vx_load_boot_image()
instead

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/drivers/vx/vx_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/vx/vx_core.c b/sound/drivers/vx/vx_core.c
index d5c65cab195b..a22e5b1a5458 100644
--- a/sound/drivers/vx/vx_core.c
+++ b/sound/drivers/vx/vx_core.c
@@ -402,7 +402,7 @@ int vx_send_rih(struct vx_core *chip, int cmd)
 #define END_OF_RESET_WAIT_TIME		500	/* us */
 
 /**
- * snd_vx_boot_xilinx - boot up the xilinx interface
+ * snd_vx_load_boot_image - boot up the xilinx interface
  * @chip: VX core instance
  * @boot: the boot record to load
  */
-- 
2.25.1

