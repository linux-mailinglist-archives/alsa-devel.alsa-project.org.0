Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B72937B0ED
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 23:42:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCBFF18C3;
	Tue, 11 May 2021 23:41:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCBFF18C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620769355;
	bh=shYIGgL3NcN2xccc4rFY++25uExBFSvDqTfjkskZKaQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DH6+8iQlATmceOS0X2n7PTImnYmnsIEUW4cZjRyQ3sgVzhZuk3NglAxx1GJn5+QrS
	 uzRMpWBOXQiI7+YF92fItJ2NaxguxosXvmeXdTnqJULVplm9j15yF5GjtQ8BYCBBSt
	 FLUnGV2VuSXnzn3mkIco9iOxQJ8bYFOEOGV0NLeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB669F804FA;
	Tue, 11 May 2021 23:38:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D714F804F3; Tue, 11 May 2021 23:38:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D48FF80425
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 23:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D48FF80425
IronPort-SDR: M6P1vhWCWQqZaIuEd9sitZ9R9CImf+khRL1PDcJdHGUw3tqDUwtnUpRpacuZQ3jZwFFmu3o2pw
 oqhWYbqdmYOA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="186992082"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="186992082"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 14:37:37 -0700
IronPort-SDR: JeA0xR3RmzlmWfxzZ9Frbo4qIK2ZUM6SG/VftqRC9TTNHkX73rIqqp8DxZVphN8V9cMniuCerp
 zKcP/SroBLzg==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="469098989"
Received: from seanwol-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.100.14])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 14:37:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 8/9] ASoC: Intel: sof_sdw: fix signed/unsigned warning
Date: Tue, 11 May 2021 16:37:06 -0500
Message-Id: <20210511213707.32958-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511213707.32958-1-pierre-louis.bossart@linux.intel.com>
References: <20210511213707.32958-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Paul Olaru <paul.olaru@oss.nxp.com>
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

Sparse throws the following warning:

sound/soc/intel/boards/sof_sdw.c:796:31: error: incorrect type in argument 6 (different signedness)
sound/soc/intel/boards/sof_sdw.c:796:31:    expected int *group_id
sound/soc/intel/boards/sof_sdw.c:796:31:    got unsigned int *

The group_id cannot be negative, use unsigned int.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0f1ad9e0a53b..395400d83467 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -669,7 +669,7 @@ static int set_codec_init_func(const struct snd_soc_acpi_link_adr *link,
  */
 static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 			  struct device *dev, int *cpu_dai_id, int *cpu_dai_num,
-			  int *codec_num, int *group_id,
+			  int *codec_num, unsigned int *group_id,
 			  bool *group_generated)
 {
 	const struct snd_soc_acpi_adr_device *adr_d;
-- 
2.25.1

