Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 432BA598591
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 16:17:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0B371693;
	Thu, 18 Aug 2022 16:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0B371693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660832225;
	bh=EW0ARkTrK0sgs3zaXFUnHfDqPW/DNwNAumfLEbrEiZ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JRwrfsQAGYEtAn3p9kvgC3oGeUPe5bpMnKbgU2aZO0cIYpAWaM4i8VtFHgYn/xKi9
	 9IdLT8VrKvW4JpjiWj9bHMrxJK7Jhr100c8O/uSyy+egrQbBTQiMEQwQ3C+xQ9jQOt
	 5daQL7rx4Kiq7klay9sHZGSs/Ps2jUpxpS9h7hhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CDACF804C2;
	Thu, 18 Aug 2022 16:15:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60954F804C2; Thu, 18 Aug 2022 16:15:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD848F804C2
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 16:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD848F804C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="d9AiKLri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660832113; x=1692368113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EW0ARkTrK0sgs3zaXFUnHfDqPW/DNwNAumfLEbrEiZ4=;
 b=d9AiKLri4mTTD/OJEiAHqTMbGY8LsRJXpVNpYToDwwj73rOR5zPQvoQ1
 JIXQACY6+6xPvLXYtkYsVk8F0UpyE5I9OE3RHXRmzyQomEYytxpgSVP2P
 UohTt4t4AzpYNu5T7cScUf/e8TqLgzQq/Tp9YXOpzX1E8TKwN+Fm03/gb
 QYNU+/UL4QtZ9EcwmlyDuclkF+s21ZX+ZbrS/rQWl2rdJKmlmvc/iICUg
 XvQ9vzUUq7in+dEhQtLQVgaqpogVpzoxPEFJ+sOqYvXXHsmauNBXNgvZz
 LA7awd1H5nPNXdg4YNMwO3nwt7qcoGtSkY2fkk8S/pooux1X6wJeRw9tX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="292764766"
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="292764766"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 07:14:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="584222252"
Received: from dev2.igk.intel.com ([10.237.148.94])
 by orsmga006.jf.intel.com with ESMTP; 18 Aug 2022 07:14:47 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 3/4] ALSA: hda: Remove unused MAX_PIN_CONFIGS constant
Date: Thu, 18 Aug 2022 16:15:16 +0200
Message-Id: <20220818141517.109280-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818141517.109280-1-amadeuszx.slawinski@linux.intel.com>
References: <20220818141517.109280-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Since it was introduced around v2.6.30 it was never used. Also HDA
specification does not mention any limitation on number of PIN
configurations.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/pci/hda/hda_sysfs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/pci/hda/hda_sysfs.c b/sound/pci/hda/hda_sysfs.c
index bf951c10ae61..69ebc37a4d6f 100644
--- a/sound/pci/hda/hda_sysfs.c
+++ b/sound/pci/hda/hda_sysfs.c
@@ -375,8 +375,6 @@ static ssize_t user_pin_configs_show(struct device *dev,
 	return pin_configs_show(codec, &codec->user_pins, buf);
 }
 
-#define MAX_PIN_CONFIGS		32
-
 static int parse_user_pin_configs(struct hda_codec *codec, const char *buf)
 {
 	int nid, cfg, err;
-- 
2.25.1

