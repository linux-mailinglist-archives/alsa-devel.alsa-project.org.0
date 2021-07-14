Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D75153C7CE9
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 05:26:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D7C8169A;
	Wed, 14 Jul 2021 05:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D7C8169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626233183;
	bh=vPB4yKNbWZHAscJVOfejIkASnjvyrw30GPYW6XKkiNY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dEv4rzFo12slSmgWO8Aue7lOd7RrSjWO57+a91tFxfSZ+8E0Ircmgb+jF/yPEKZcC
	 AkJPBwNSMw9gDRLc+MOUmPvt8qpuV1b0e7KSZASdK/SUGgQZT1KTsaperm8ACx/3FG
	 Z/jF1gji3+59hmGkXXbmXkbzw5AbLn9ADtmrJrb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77258F80507;
	Wed, 14 Jul 2021 05:22:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50309F804E3; Wed, 14 Jul 2021 05:22:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA7F1F8013C
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 05:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA7F1F8013C
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="232086443"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="232086443"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:22:39 -0700
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="459818176"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:22:36 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 06/10] soundwire: add flag to ignore all command/control for
 mockup devices
Date: Wed, 14 Jul 2021 11:22:05 +0800
Message-Id: <20210714032209.11284-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
References: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

SoundWire mockup devices don't take part in the command/control
protocol, so all commands will complete with -ENODATA or
Command_Ignored results. With a flag, we can suppress such errors in
the bus management and make it appear as if all read/writes succeed.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 3 +++
 sound/soc/codecs/sdw-mockup.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index a48ac3e77301..76ce3f3ac0f2 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -661,6 +661,8 @@ struct sdw_slave_ops {
  * initialized
  * @first_interrupt_done: status flag tracking if the interrupt handling
  * for a Slave happens for the first time after enumeration
+ * @is_mockup_device: status flag used to squelch errors in the command/control
+ * protocol for SoundWire mockup devices
  */
 struct sdw_slave {
 	struct sdw_slave_id id;
@@ -683,6 +685,7 @@ struct sdw_slave {
 	struct completion initialization_complete;
 	u32 unattach_request;
 	bool first_interrupt_done;
+	bool is_mockup_device;
 };
 
 #define dev_to_sdw_dev(_dev) container_of(_dev, struct sdw_slave, dev)
diff --git a/sound/soc/codecs/sdw-mockup.c b/sound/soc/codecs/sdw-mockup.c
index a4f79eb2c69d..8ea13cfa9f8e 100644
--- a/sound/soc/codecs/sdw-mockup.c
+++ b/sound/soc/codecs/sdw-mockup.c
@@ -263,6 +263,8 @@ static int sdw_mockup_sdw_probe(struct sdw_slave *slave,
 	dev_set_drvdata(dev, sdw_mockup);
 	sdw_mockup->slave = slave;
 
+	slave->is_mockup_device = true;
+
 	ret =  devm_snd_soc_register_component(dev,
 					       &snd_soc_sdw_mockup_component,
 					       sdw_mockup_dai,
-- 
2.17.1

