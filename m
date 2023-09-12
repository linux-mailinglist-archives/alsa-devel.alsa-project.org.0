Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F05CB79D63E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 18:27:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37D29AEA;
	Tue, 12 Sep 2023 18:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37D29AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694536048;
	bh=8ltZ1RAODhf+ZyZGueAkDu0r0heKXiDqd7lSxiNg+s0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DU2dMZKhlDi+gOSzqpCyGH3J/BBjpYwwQri22BfvjUXsVdadp70KnD3qRfNlUGctN
	 IFJutoqMz+KuOfcmHymKKuaDe4/EeaNXI889TTxLAjZOu4GDY9n1AJadJJwWjJgbBj
	 8u5aSiKGTgi6ttTyKefU/xaHWtwFxL+faJUvyPxU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7144F8055C; Tue, 12 Sep 2023 18:26:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26B5EF80431;
	Tue, 12 Sep 2023 18:26:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9DCCF8055A; Tue, 12 Sep 2023 18:26:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DB20F80425
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 18:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DB20F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DK2phx2k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694535980; x=1726071980;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8ltZ1RAODhf+ZyZGueAkDu0r0heKXiDqd7lSxiNg+s0=;
  b=DK2phx2knx6QWCufa9Un0c8d5ehViogjdWrlIs5vknaeQMCWXBm+tCRf
   pRP5/t+V9LhJO8Teb+IcWpcW1ICm1nEnIqas3ItWv339RAm4vHjzZzlgp
   VzNkdLgvfil3mIenfqU+PXDWa4Cm78r3Dp8br24+F0eVsQ3kJbpQoHAw6
   Xfb9BTlOFduLWlhhEF2jmZqvVfnDcvkgi/pIZCC6wc9FQslxov0vMnNHB
   5nBCDe/RuFBh5p/kxTGpEf5SJ96SptL0bIhET51eQgsmGMHIO8dYU/wbs
   hwmSSnaflPdFPYDJNlMhlEOzkUWSg4SycrIshaEVZbdk3azO48SmJA3jC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="357860027"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000";
   d="scan'208";a="357860027"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 09:26:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="737173950"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000";
   d="scan'208";a="737173950"
Received: from zmoussao-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.37.58])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 09:26:13 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.com,
	perex@perex.cz,
	arnd@arndb.de
Cc: masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ALSA: hda: intel-sdw-acpi: Use u8 type for link index
Date: Tue, 12 Sep 2023 19:26:17 +0300
Message-ID: <20230912162617.29178-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KKJDHY2WLK6HZ35WZP62XABH464C6OTH
X-Message-ID-Hash: KKJDHY2WLK6HZ35WZP62XABH464C6OTH
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KKJDHY2WLK6HZ35WZP62XABH464C6OTH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use consistently u8 for sdw link index. The id is limited to 4, u8 is
adequate in size to store it.

This change will also fixes the following compiler warning/error (W=1):

sound/hda/intel-sdw-acpi.c: In function ‘sdw_intel_acpi_scan’:
sound/hda/intel-sdw-acpi.c:34:35: error: ‘-subproperties’ directive output may be truncated writing 14 bytes into a region of size between 7 and 17 [-Werror=format-truncation=]
   34 |                  "mipi-sdw-link-%d-subproperties", i);
      |                                   ^~~~~~~~~~~~~~
In function ‘is_link_enabled’,
    inlined from ‘sdw_intel_scan_controller’ at sound/hda/intel-sdw-acpi.c:106:8,
    inlined from ‘sdw_intel_acpi_scan’ at sound/hda/intel-sdw-acpi.c:180:9:
sound/hda/intel-sdw-acpi.c:33:9: note: ‘snprintf’ output between 30 and 40 bytes into a destination of size 32
   33 |         snprintf(name, sizeof(name),
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   34 |                  "mipi-sdw-link-%d-subproperties", i);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

The warnings got brought to light by a recent patch upstream:
commit 6d4ab2e97dcf ("extrawarn: enable format and stringop overflow warnings in W=1")

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/hda/intel-sdw-acpi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index 5cb92f7ccbca..b57d72ea4503 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -23,7 +23,7 @@ static int ctrl_link_mask;
 module_param_named(sdw_link_mask, ctrl_link_mask, int, 0444);
 MODULE_PARM_DESC(sdw_link_mask, "Intel link mask (one bit per link)");
 
-static bool is_link_enabled(struct fwnode_handle *fw_node, int i)
+static bool is_link_enabled(struct fwnode_handle *fw_node, u8 idx)
 {
 	struct fwnode_handle *link;
 	char name[32];
@@ -31,7 +31,7 @@ static bool is_link_enabled(struct fwnode_handle *fw_node, int i)
 
 	/* Find master handle */
 	snprintf(name, sizeof(name),
-		 "mipi-sdw-link-%d-subproperties", i);
+		 "mipi-sdw-link-%hhu-subproperties", idx);
 
 	link = fwnode_get_named_child_node(fw_node, name);
 	if (!link)
@@ -51,8 +51,8 @@ static int
 sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
 {
 	struct acpi_device *adev = acpi_fetch_acpi_dev(info->handle);
-	int ret, i;
-	u8 count;
+	u8 count, i;
+	int ret;
 
 	if (!adev)
 		return -EINVAL;
-- 
2.42.0

