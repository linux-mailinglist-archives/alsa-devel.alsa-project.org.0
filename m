Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6936E1DABC0
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 09:15:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0D5F17AC;
	Wed, 20 May 2020 09:14:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0D5F17AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589958941;
	bh=U2uj/DgKwauLR6IhGfQia8fsZv3t2oBm+JAvAC4qHnY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G1pZ2p1++gS10enMtnC1MLly1gAPtfwKgzy9eC35MLCc1p0snKfd8XdJXbsc1EcIi
	 B+0iac9WDa/tTwGlAkYmRebY3l2EPJHpbv3lgVcoA/1aleULp+94odHxu1rz4i3OWm
	 L6Z8OYqfF6xJ1o2KrmF18mN+hH/pOcIKKnVqGlMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8289F801DA;
	Wed, 20 May 2020 09:14:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 629F4F80132; Wed, 20 May 2020 09:13:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E69DDF80132
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 09:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E69DDF80132
IronPort-SDR: Umekako9Jw88mjzKUj6csSnXpQDceM9cORsp4wGmkoYTAXAoKCVnUiACw1OChCho2cl5t1pJ7C
 6Qjpar0Nng1A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 00:13:46 -0700
IronPort-SDR: 1I4Md1o/u325pnWQMRQ3X79EeTBosykvzJPYwMnXYMhD0Jvyg9TpV494VcD529MpfSn6Je8ttg
 MPYvcYD4VoQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,413,1583222400"; d="scan'208";a="253596937"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga007.fm.intel.com with ESMTP; 20 May 2020 00:13:43 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/2] soundwire: intel: use a single module
Date: Wed, 20 May 2020 03:19:02 +0800
Message-Id: <20200519191903.6557-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

From: Rander Wang <rander.wang@intel.com>

It's not clear why we have two modules for the Intel controller/master
support when there is a single Kconfig. This adds complexity for no
good reason, the two parts need to work together anyways.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index 7319918e0aec..4f6094767212 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -16,12 +16,9 @@ soundwire-cadence-objs := cadence_master.o
 obj-$(CONFIG_SOUNDWIRE_CADENCE) += soundwire-cadence.o
 
 #Intel driver
-soundwire-intel-objs :=	intel.o
+soundwire-intel-objs :=	intel.o intel_init.o
 obj-$(CONFIG_SOUNDWIRE_INTEL) += soundwire-intel.o
 
-soundwire-intel-init-objs := intel_init.o
-obj-$(CONFIG_SOUNDWIRE_INTEL) += soundwire-intel-init.o
-
 #Qualcomm driver
 soundwire-qcom-objs :=	qcom.o
 obj-$(CONFIG_SOUNDWIRE_QCOM) += soundwire-qcom.o
-- 
2.17.1

