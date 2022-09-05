Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC505AD7F7
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 18:59:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C2B61663;
	Mon,  5 Sep 2022 18:59:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C2B61663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662397199;
	bh=e8YXLtq3TD5WABfmx3boLopZxKdFinKI+1f8BL03nW8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EkvDBu1Jv534hDZIbdEcc8S511gobvl9zej0CL7zb7MftksRR8AIUBhCdmtyTDv4X
	 31xn87/HYKFw1Uto91nrXMwErb12/YZtw4zVq1Aoq3dojssCdB14IUtdAhPrIz+n6F
	 j8W9wtbgdT7Psk0ce0ThnycP9Q/kQKOLSAmPEHjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D847F800E9;
	Mon,  5 Sep 2022 18:58:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76015F80533; Mon,  5 Sep 2022 18:58:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E364DF800E9
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 18:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E364DF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mgyi+ojS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662397108; x=1693933108;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e8YXLtq3TD5WABfmx3boLopZxKdFinKI+1f8BL03nW8=;
 b=mgyi+ojS7BRzbDsTYRPKzKGewU4W0n7g9JSOj7qNQLLAy4GmHfHck/QJ
 fciBRIhk5WjRnWj+jxu9ww43a+xzbh4X4vJ4Jev/OXSHQnVqLUL2fAqT3
 fZWWRyFh5ygq4rqloUgyNpSwUEDTFXMGV3zyrZ1d1mDb7fTa7QtF4HSyW
 /pzMYvItWuzOVCL2ybnPOBb71CusE47prbCLcoWX6GEd2lB/uwp/r7R+0
 WB6IyE9EINVdfXYB2PPbD8hkoDCbMcnJqfrhHzJujQobT6n2Ge6ghB+Vv
 W4CEMUJ1p9JcgdxyUW9kyQMp/wrJUzYMUfY5PiGMmQ8sUhjC3sG/28SjT Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="279439130"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="279439130"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 09:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="609716171"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 05 Sep 2022 09:58:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 7C131101; Mon,  5 Sep 2022 19:58:33 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ALSA: hda: cs35l41: Call put_device() in the scope of
 get_device()
Date: Mon,  5 Sep 2022 19:58:25 +0300
Message-Id: <20220905165826.35979-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>
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

When put_device() is called in another function it's hard to realize
that and easy to "fix" the code in a wrong way. Instead, move
put_device() to be in the same scope as get_device(), so we prevent
appearance of any attempts to "fix" the code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/pci/hda/cs35l41_hda.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 15e2a0009080..12e955931044 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1154,7 +1154,6 @@ static int cs35l41_no_acpi_dsd(struct cs35l41_hda *cs35l41, struct device *physd
 	hw_cfg->gpio2.func = CS35L41_INTERRUPT;
 	hw_cfg->gpio2.valid = true;
 	hw_cfg->valid = true;
-	put_device(physdev);
 
 	if (strncmp(hid, "CLSA0100", 8) == 0) {
 		hw_cfg->bst_type = CS35L41_EXT_BOOST_NO_VSPK_SWITCH;
@@ -1204,9 +1203,10 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 
 	property = "cirrus,dev-index";
 	ret = device_property_count_u32(physdev, property);
-	if (ret <= 0)
-		return cs35l41_no_acpi_dsd(cs35l41, physdev, id, hid);
-
+	if (ret <= 0) {
+		ret = cs35l41_no_acpi_dsd(cs35l41, physdev, id, hid);
+		goto err_put_physdev;
+	}
 	if (ret > ARRAY_SIZE(values)) {
 		ret = -EINVAL;
 		goto err;
@@ -1295,8 +1295,9 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	return 0;
 
 err:
-	put_device(physdev);
 	dev_err(cs35l41->dev, "Failed property %s: %d\n", property, ret);
+err_put_physdev:
+	put_device(physdev);
 
 	return ret;
 }
-- 
2.35.1

