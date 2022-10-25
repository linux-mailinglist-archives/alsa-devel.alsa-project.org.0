Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C18C60CD67
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 15:27:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D21D01935;
	Tue, 25 Oct 2022 15:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D21D01935
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666704468;
	bh=QWKvt3x49Rqq6M1WbUJTvLylKUkzZ8XS+Q4v8IoxB0A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UjWEZn1KWwG75m58d5TiHKmWEQ1HzwSMvd/5Z/lYMxXbcdVn0GgaaOp99/guZ1Naq
	 RxkIAqo059HIGEbefT/O+yYywaQ/n4k74o1/XFGB4SzG4LqPAebpl0aQPxmKvSRt8P
	 mhKWRYFVh2xmbh+KBHoS6E+dgfKxmnvwy0NL2jVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DBECF80448;
	Tue, 25 Oct 2022 15:26:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60932F80431; Tue, 25 Oct 2022 15:26:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4F28F80100
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 15:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4F28F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Qdv3TmBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666704407; x=1698240407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QWKvt3x49Rqq6M1WbUJTvLylKUkzZ8XS+Q4v8IoxB0A=;
 b=Qdv3TmBX/zX6zrsfirPVvgJHRHW7LOr9so5lGfSYh8AgzX80SXgF9UOR
 zJVL7PhT5IQmhvH2CI34dS5giyB3xI61LrZ0kDq0v3790mWWMljEiZDk+
 mkv/H/437+QfnZNJmc4zQ4Orm0fBdInwbQnF6kwQqyPTmzC7YFgmv+qZ3
 qR5/f8eHxycX5f2ZydpF+5b3Nt7vclRbOXFj4Sl8tWu0qHSWo+3fpdCkg
 AsDWRCjpZ6xcHa6ts+T3a6Dek0lgo5yCUekG15kel74p0+yzCexrVuYfE
 qIbzuOHO2gJoV9+LLdV/a3RCkHvsnWK/amimASZm4gY5dPa02YCOpFShf A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="288068288"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="288068288"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 06:26:43 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="662803266"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="662803266"
Received: from agsteede-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.12.174])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 06:26:41 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	dan.carpenter@oracle.com
Subject: [PATCH] ASoC: SOF: ipc4-loader: Return ssize_t from
 sof_ipc4_fw_parse_ext_man()
Date: Tue, 25 Oct 2022 16:27:06 +0300
Message-Id: <20221025132706.30356-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

sof_ipc4_fw_parse_ext_man() can return negative error numbers which is not
correct for the used size_t type.

Change the return value to ssize_t and use the same type where the function
is called.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: 73c091a2fe96 ("ASoC: SOF: ipc4-loader: Support for loading external libraries")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-loader.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index af0018b38cf0..702196774c50 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -17,8 +17,8 @@
 /* The module ID includes the id of the library it is part of at offset 12 */
 #define SOF_IPC4_MOD_LIB_ID_SHIFT	12
 
-static size_t sof_ipc4_fw_parse_ext_man(struct snd_sof_dev *sdev,
-					struct sof_ipc4_fw_library *fw_lib)
+static ssize_t sof_ipc4_fw_parse_ext_man(struct snd_sof_dev *sdev,
+					 struct sof_ipc4_fw_library *fw_lib)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	const struct firmware *fw = fw_lib->sof_fw.fw;
@@ -141,7 +141,7 @@ static size_t sof_ipc4_fw_parse_basefw_ext_man(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	struct sof_ipc4_fw_library *fw_lib;
-	size_t payload_offset;
+	ssize_t payload_offset;
 	int ret;
 
 	fw_lib = devm_kzalloc(sdev->dev, sizeof(*fw_lib), GFP_KERNEL);
@@ -170,7 +170,7 @@ static int sof_ipc4_load_library_by_uuid(struct snd_sof_dev *sdev,
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	struct sof_ipc4_fw_library *fw_lib;
 	const char *fw_filename;
-	size_t payload_offset;
+	ssize_t payload_offset;
 	int ret, i, err;
 
 	if (!sdev->pdata->fw_lib_prefix) {
-- 
2.38.1

