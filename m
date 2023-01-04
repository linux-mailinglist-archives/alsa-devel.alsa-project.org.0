Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0549965D6B2
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 15:58:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E89DB56B;
	Wed,  4 Jan 2023 15:57:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E89DB56B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672844300;
	bh=pSQgydIRS+f+56yNB/Po7JfuLpD+BulyAa6IY66Pdkw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qrXOLHXRsb3WGd8MLQNA624vApmmzd9pPB+PAfPKoCpdBv7otGeMZZdgDZBv1RNsb
	 8QpTbzEZ/grsAm84eXODsP1aEujVJypp8OnBPY7vvYXIl1Nc+FmOJqLjfWNdKyy4Lt
	 yXCul9pmbO70hDnE/4pIMd+V9oUi6kLi7vcDpPPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98407F8053D;
	Wed,  4 Jan 2023 15:57:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47265F80542; Wed,  4 Jan 2023 15:57:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43BBBF8053C
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 15:57:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43BBBF8053C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ya5WJi8z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672844244; x=1704380244;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pSQgydIRS+f+56yNB/Po7JfuLpD+BulyAa6IY66Pdkw=;
 b=Ya5WJi8zBXLmTdbrNsy/VfeIy9b9ushdNm1ZUflSkwx25Jhm4Wzv2DVo
 ib4qam6PMOAI9WUoQ1kU6m7eDb63P7UFr6oCvr5UD5GnYZE8aHIci0AkX
 In3kYjm7U4cH+1WOuyDtpyjfJRMO5qNzuoSUKY+S3sfqRWgMvVmKadWkp
 JxnZgd7g978j0KNyxfZOjNQx5NuIRj7CT85nbRJfnM9+sGzmkXxOqqlrW
 Reh5ixBxQsZwCnCrtjmQE6q/5zFv3R6s+OxN424i0c/NtzFo4UIwLq/gd
 WRF2UKJ5m0BBKON+oEMaIb2h7Aq1VW9a/esWYZLiP77l0BgPilEn09F9H A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="323950465"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="323950465"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 06:57:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="687556600"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="687556600"
Received: from hlgentry-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.74.62])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 06:57:19 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: amd: ps: use static function
Date: Wed,  4 Jan 2023 08:57:08 -0600
Message-Id: <20230104145708.25051-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Sparse warning:

error: symbol 'acp63_fill_platform_dev_info' was not declared. Should
it be static?

Also reduce line lines below 100 characters.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/amd/ps/pci-ps.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 401cfd0036bed..02bb48b62afc9 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -167,10 +167,14 @@ static void get_acp63_device_config(u32 config, struct pci_dev *pci,
 	}
 }
 
-void acp63_fill_platform_dev_info(struct platform_device_info *pdevinfo, struct device *parent,
-				  struct fwnode_handle *fw_node, char *name, unsigned int id,
-				  const struct resource *res, unsigned int num_res,
-				  const void *data, size_t size_data)
+static void acp63_fill_platform_dev_info(struct platform_device_info *pdevinfo,
+					 struct device *parent,
+					 struct fwnode_handle *fw_node,
+					 char *name, unsigned int id,
+					 const struct resource *res,
+					 unsigned int num_res,
+					 const void *data,
+					 size_t size_data)
 {
 	pdevinfo->name = name;
 	pdevinfo->id = id;
-- 
2.37.2

