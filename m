Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBEA568756
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:53:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEB8D168B;
	Wed,  6 Jul 2022 13:52:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEB8D168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657108424;
	bh=BHmWG6c0VB2XxZFlHPPmiVu4GAR7HgrBVzWFqZOxawc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QiXu4hkbAj6VR5stKtzH/C8DukETGf/rK+hao8RWKlledCGk28KuspXgd2V8X5ECC
	 Q7/x2zvq/v0Yru/Hrd8thEy/1eVnWKVWiMcuMSXdkSRyp3A5yAGvbOSVzNQshYCnJ2
	 N1b0Lsf7Rnfp1GE7vXnM8FOnAVt/dE5Auo5FkhK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EAE0F8016B;
	Wed,  6 Jul 2022 13:52:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51792F804B4; Wed,  6 Jul 2022 13:52:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 976FCF8012A
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 13:52:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 976FCF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RGTmDp8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657108359; x=1688644359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BHmWG6c0VB2XxZFlHPPmiVu4GAR7HgrBVzWFqZOxawc=;
 b=RGTmDp8BYOIKJg0mbVu9I0uDeHykj/ppALz7j5r6aFmAhHuhgj1gj9ec
 gMQTUrHI+xkYz+4aMx2KevZkbh/qGI3gE5NnhVhwr4ogtj22CDcEOa6dx
 YW6MIpLUUQE8ZFA469hE3NjlahVJVd6KXfz6ftG8UmVy3Eg4xL9xebHI8
 Mgq2aOyX3/51vhwXbVE+ma37O2JSBOVzVaIIhpUipNPipmwda8Nt9uDpK
 M/vVg0Ys8CopYlC8jyiqb9dpFUZUQPifqUaLKOWvJ2gViXnUXMPbno/Cy
 Dr3fsSmZBIv45w7SnLIZzNYZpYryB81N/6shyiFRlK3iTQsbLSSssgYtj A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="370042598"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="370042598"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 04:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="920136253"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 06 Jul 2022 04:52:34 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.com
Subject: [PATCH 1/9] ALSA: hda: Do not unset preset when cleaning up codec
Date: Wed,  6 Jul 2022 14:02:22 +0200
Message-Id: <20220706120230.427296-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706120230.427296-1-cezary.rojewski@intel.com>
References: <20220706120230.427296-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
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

snd_hda_codec_cleanup_for_unbind() unsets preset what interferes with
module unloading and triggers null-ptr-deref. Preset is assigned only
once, during device/driver matching whereas module reload and unload
follow completely different path and may occur several times during
runtime.

Fixes: 9a6246ff78ac ("ALSA: hda - Implement unbind more safely")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/pci/hda/hda_codec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 7579a6982f47..9ceb642ac819 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -795,7 +795,6 @@ void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
 	snd_array_free(&codec->cvt_setups);
 	snd_array_free(&codec->spdif_out);
 	snd_array_free(&codec->verbs);
-	codec->preset = NULL;
 	codec->follower_dig_outs = NULL;
 	codec->spdif_status_reset = 0;
 	snd_array_free(&codec->mixers);
-- 
2.25.1

