Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 020D754ECF1
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 23:57:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 865611B0E;
	Thu, 16 Jun 2022 23:56:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 865611B0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655416668;
	bh=LTdL0slQiHxU3KC6lpZNIp2W8oeUBbocsotjy3j5hH8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wbc6dAYLnGIgU/KvdF9GpTxPIwVeHX8Nj/NZFywAsXSPA/UqyLrUN1OxI0TkrcucV
	 0CL6nC8QLm3afvHgnUwUyrp+yEta/wIg8BPsXZCLxGsbwea9DtDsVnB7UomJZvS5W+
	 OHDccmGlYKqrRusK2zsGM5VUk1NfGbh7o0RCH+VI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E9F8F8053D;
	Thu, 16 Jun 2022 23:54:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7A2CF8053B; Thu, 16 Jun 2022 23:54:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E1D7F801D8
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 23:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E1D7F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZLV+iqY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655416488; x=1686952488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LTdL0slQiHxU3KC6lpZNIp2W8oeUBbocsotjy3j5hH8=;
 b=ZLV+iqY3mXMEJIjkhPC396DQk+NsOSGtahqLAYPq/eUilZBoyTYdf8nv
 UyIMhgGhRl8QazX4R1HrkXx0ha3IUr7du7FvBDQK42T+Sa8GUTatXhlBs
 nISJfM8gFWNtDEmb/+1WeLyuA29sW0beTlAhQrSjtxHQglJDVBfxKvc2Y
 rsG7JHG/lUeWtrlab1ipCGVh1PMu5DDrE0faNdb+4KmXMZomu0tMEXv8g
 B9t/7zFDC5TBpC7v9zc4nSd7choz/BlzKXB+EGB25V5Cp8/xH+QZZJ62W
 AezOZ+rSBOWHWYQ63L9D0pTyRK0qzzedhaq3Fv9oWR46IerGPZK3xEtoq A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268047834"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268047834"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:22 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="675212702"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/13] ASoC: SOF: ipc4: remove use of __func__ in dev_dbg
Date: Thu, 16 Jun 2022 16:53:49 -0500
Message-Id: <20220616215351.135643-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
References: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

The module and function information can be added with
'modprobe foo dyndbg=+pmf'

Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index a8dea5abf2655..432b812bdf9c6 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -574,7 +574,7 @@ static void sof_ipc4_rx_msg(struct snd_sof_dev *sdev)
 		data_size = sizeof(struct sof_ipc4_notify_resource_data);
 		break;
 	default:
-		dev_dbg(sdev->dev, "%s: Unhandled DSP message: %#x|%#x\n", __func__,
+		dev_dbg(sdev->dev, "Unhandled DSP message: %#x|%#x\n",
 			ipc4_msg->primary, ipc4_msg->extension);
 		break;
 	}
-- 
2.34.1

