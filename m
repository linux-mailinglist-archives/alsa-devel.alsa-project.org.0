Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1649B5F9E15
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 13:55:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A10B2292A;
	Mon, 10 Oct 2022 13:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A10B2292A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665402922;
	bh=JG21J30E303QnCQzzTe0eJs1KhMOT0sa2wtynx1Q1TM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jdrCFyg18Vd+dylkvVdRveFfUGVQmNl95l4Dcxh+kNbvh5yLxuWREz2Yp6b++OySR
	 6mMP8bBRXuTjjV4EdpHL286Nnf/NlNM8P7zQNZ4bmJF7a8Sycgw4NXjyYXLbMYdsmN
	 CpMEq4pD2R3gRbHCm6I6BrDe+LoEA2gJW8jZb1Sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19926F805AB;
	Mon, 10 Oct 2022 13:52:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05B19F8059F; Mon, 10 Oct 2022 13:52:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93AEDF8055C
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 13:51:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93AEDF8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cBhCxfC1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665402714; x=1696938714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JG21J30E303QnCQzzTe0eJs1KhMOT0sa2wtynx1Q1TM=;
 b=cBhCxfC1c3oOCavoaQz79POhf6fBahe5aBFxyuJh2Q/+tlXubIU9bomS
 RGdbrkd0UBlw+TFgPLf4KTYAQY1L2irJEVn9oizDaMOJ8UOGjtuggf2IP
 6POICaOmXlmPmTI2o9sG8Y6qcIpHxv6OuJfxg+G9RBgYHKZ0pJA3qjel0
 Nh1wrXiT2t/OjcwQuUWq0h+iv6cFsF40HRX3IYOtHjGyP5AP+AMxsUpON
 Ds1ePtyYl4m2WokxyGx7936i1tDzCyk3mp6X5MgvBd6Jj5EZykTaeRkZH
 UP3n5hSPF3N+UTOXLq8376ho7dpQOVmTq7K13haXdcLFM2TIOOcaTtjRd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="390513249"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="390513249"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 04:51:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="954889069"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="954889069"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 10 Oct 2022 04:51:51 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 09/15] ASoC: Intel: avs: Add missing include to HDA board
Date: Mon, 10 Oct 2022 14:07:43 +0200
Message-Id: <20221010120749.716499-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010120749.716499-1-cezary.rojewski@intel.com>
References: <20221010120749.716499-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

In some configurations board fails to compile due to missing header. Add
it to fix build.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/hdaudio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 073663ba140d..e68c4c7aa2ba 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -6,6 +6,7 @@
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
 //
 
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <sound/hda_codec.h>
 #include <sound/hda_i915.h>
-- 
2.25.1

