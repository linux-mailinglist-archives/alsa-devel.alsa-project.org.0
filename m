Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7AB5466C3
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 14:44:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3DD31F57;
	Fri, 10 Jun 2022 14:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3DD31F57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654865085;
	bh=MXZ6xTG4CogdlZTDXiEkaqvXNjBEdhfNSLTAy3qhCXs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YsSUjRtq6M8FXiTIsHbucPVoj+Hb4xgEPcAoz1ySFOMMLQA0cCpkq8DsffWoG1vG/
	 drVXE/E1DfTnDrxB683QPoZ9lrK00bqxM0jmGJDWY0JyjzYh+hhbi9rVALMsT1v9+V
	 GGnkxSjmrgQUX4yXgjrKVF5vjkit6Ka9BM49v5KY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20179F804D8;
	Fri, 10 Jun 2022 14:43:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4003F804D2; Fri, 10 Jun 2022 14:43:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FB06F800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 14:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FB06F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QzAwksaa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654865018; x=1686401018;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MXZ6xTG4CogdlZTDXiEkaqvXNjBEdhfNSLTAy3qhCXs=;
 b=QzAwksaaAu7FSVjlHT75do7MNHSfTY/rwjnBomHMjDEWU0YFmOfVfObY
 qo0IHIP6xXD3hrVVO4jt1ni3UUlveMqd48UgjyAnRZ3RGcqDDUeerSZYf
 VRW6gBJfKPTWMWWv32CfCjIsDX5wtPFiUNSYJllEcWIikG3RIyA45Pq27
 5G4KidRLZuzqhXZiu8ZAcLY+/k7GF1mQhxS471nWmK/gQGjZ6mIp7ireV
 P7Bg7o/pENssipQVoWQi3xWHfrlRnI+GAyOOJpnPCMdh1PoFgN01kIR9+
 vFd+GRRQIZ0eDk1TyDJ2UqNOwOIybUfyajPTwyViuUZDB3ogvzu7dVaek Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="363949843"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="363949843"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 05:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="671830119"
Received: from dev2.igk.intel.com ([10.237.148.94])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Jun 2022 05:42:43 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: avs: Fix parsing UUIDs in topology
Date: Fri, 10 Jun 2022 14:42:57 +0200
Message-Id: <20220610124257.4160658-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

Use correct type for parsing UUIDs, this eliminates warning present,
when compiling with W=1.

Fixes: 34ae2cd53673 ("ASoC: Intel: avs: Add topology parsing infrastructure")
Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 0d11cc8aab0b..6a06fe387d13 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -128,10 +128,10 @@ struct avs_tplg_token_parser {
 static int
 avs_parse_uuid_token(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
 {
-	struct snd_soc_tplg_vendor_value_elem *tuple = elem;
+	struct snd_soc_tplg_vendor_uuid_elem *tuple = elem;
 	guid_t *val = (guid_t *)((u8 *)object + offset);
 
-	guid_copy((guid_t *)val, (const guid_t *)&tuple->value);
+	guid_copy((guid_t *)val, (const guid_t *)&tuple->uuid);
 
 	return 0;
 }
-- 
2.25.1

