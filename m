Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2858B4549A1
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 16:12:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 184741933;
	Wed, 17 Nov 2021 16:11:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 184741933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637161950;
	bh=8zer9hE7Vmo9zuDYlQU5fUv+LMnfyp4nwc5VGesieFk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aa9xvr1j0wdzJ8ieDb5whgNtJ8KpsX0nma0yp2d6uzUqEBMmPDExoqihPh/yrw06K
	 s07dtDV7Z3qPDg1nrXi+jJRg0InKKuEyVUFHFPGn2Y3npwyEBkg++3AmXzwaJ0BOiW
	 0RdVSuU3FqQK/5mQHlXX+uJFzNtiPNUKKxOVmbdc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24ACFF804EB;
	Wed, 17 Nov 2021 16:10:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B401F8027D; Wed, 17 Nov 2021 16:10:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F7DEF8020D
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 16:10:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F7DEF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="EYLiKMFC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637161833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7wd0UpbsaaQpor0wcIQ2AnSKRKgr3MzcDKE4xa0JlGA=;
 b=EYLiKMFCSw5yZNj7DCpeCF+GfNMzwxHV7HZ0tf33PEQwYOF4c6K9Ptz6blnYUcvV4vqVns
 6s3oNYWH+mHjSkBHzPyHx/yybw4orfw4J7lg32PayOh6yjFPNeXOmMD+/mElENyY2Bgvro
 K/WmrZBXK2dZs0PGAaYj8Kb2RAoB1UI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-EmlFYzTbMYuNHOFvJYe5Aw-1; Wed, 17 Nov 2021 10:10:30 -0500
X-MC-Unique: EmlFYzTbMYuNHOFvJYe5Aw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E05110168C0;
 Wed, 17 Nov 2021 15:10:28 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.193.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 915BF5DEFA;
 Wed, 17 Nov 2021 15:10:26 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 5.16 regression fix 2/2] ASoC: Intel: soc-acpi-cht: Revert
 shrink tables using compatible IDs
Date: Wed, 17 Nov 2021 16:10:22 +0100
Message-Id: <20211117151022.122286-2-hdegoede@redhat.com>
In-Reply-To: <20211117151022.122286-1-hdegoede@redhat.com>
References: <20211117151022.122286-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Brent Lu <brent.lu@intel.com>
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

Commit 959ae8215a9e ("ASoC: Intel: soc-acpi-cht: shrink tables using
compatible IDs") simplified the match tables in soc-acpi-intel-cht-match.c
by merging identical entries using the new .comp_ids snd_soc_acpi_mach
field to point a single entry to multiple ACPI HIDs and clearing the
previously unique per entry .id field.

But various machine drivers from sound/soc/intel/boards rely on mach->id
in one or more ways. For example all of the following machine-drivers
for entries combined during the shrinking:
sound/soc/intel/boards/bytcr_rt5640.c
sound/soc/intel/boards/cht_bsw_rt5645.c
sound/soc/intel/boards/bytcht_da7213.c

Do:
	adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);

Which now no longer works and some of them also do:

	pkg_found = snd_soc_acpi_find_package_from_hid(mach->id, ...

	if (!strncmp(snd_soc_cards[i].codec_id, mach->id, 8)) { ...

Which now also no longer works. All these calls need to be fixed before
we can shrink the tables, so revert this change for now.

Fixes: 959ae8215a9e ("ASoC: Intel: soc-acpi-cht: shrink tables using compatible IDs")
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Brent Lu <brent.lu@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../intel/common/soc-acpi-intel-cht-match.c   | 69 ++++++++++++-------
 1 file changed, 44 insertions(+), 25 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index c60a5e8e7bc9..227424236fd5 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -51,31 +51,18 @@ static struct snd_soc_acpi_mach *cht_quirk(void *arg)
 		return mach;
 }
 
-static const struct snd_soc_acpi_codecs rt5640_comp_ids = {
-	.num_codecs = 2,
-	.codecs = { "10EC5640", "10EC3276" },
-};
-
-static const struct snd_soc_acpi_codecs rt5670_comp_ids = {
-	.num_codecs = 2,
-	.codecs = { "10EC5670", "10EC5672" },
-};
-
-static const struct snd_soc_acpi_codecs rt5645_comp_ids = {
-	.num_codecs = 3,
-	.codecs = { "10EC5645", "10EC5650", "10EC3270" },
-};
-
-static const struct snd_soc_acpi_codecs da7213_comp_ids = {
-	.num_codecs = 2,
-	.codecs = { "DGLS7212", "DGLS7213"},
-
-};
-
 /* Cherryview-based platforms: CherryTrail and Braswell */
 struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 	{
-		.comp_ids = &rt5670_comp_ids,
+		.id = "10EC5670",
+		.drv_name = "cht-bsw-rt5672",
+		.fw_filename = "intel/fw_sst_22a8.bin",
+		.board = "cht-bsw",
+		.sof_fw_filename = "sof-cht.ri",
+		.sof_tplg_filename = "sof-cht-rt5670.tplg",
+	},
+	{
+		.id = "10EC5672",
 		.drv_name = "cht-bsw-rt5672",
 		.fw_filename = "intel/fw_sst_22a8.bin",
 		.board = "cht-bsw",
@@ -83,7 +70,23 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.sof_tplg_filename = "sof-cht-rt5670.tplg",
 	},
 	{
-		.comp_ids = &rt5645_comp_ids,
+		.id = "10EC5645",
+		.drv_name = "cht-bsw-rt5645",
+		.fw_filename = "intel/fw_sst_22a8.bin",
+		.board = "cht-bsw",
+		.sof_fw_filename = "sof-cht.ri",
+		.sof_tplg_filename = "sof-cht-rt5645.tplg",
+	},
+	{
+		.id = "10EC5650",
+		.drv_name = "cht-bsw-rt5645",
+		.fw_filename = "intel/fw_sst_22a8.bin",
+		.board = "cht-bsw",
+		.sof_fw_filename = "sof-cht.ri",
+		.sof_tplg_filename = "sof-cht-rt5645.tplg",
+	},
+	{
+		.id = "10EC3270",
 		.drv_name = "cht-bsw-rt5645",
 		.fw_filename = "intel/fw_sst_22a8.bin",
 		.board = "cht-bsw",
@@ -107,7 +110,15 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.sof_tplg_filename = "sof-cht-nau8824.tplg",
 	},
 	{
-		.comp_ids = &da7213_comp_ids,
+		.id = "DLGS7212",
+		.drv_name = "bytcht_da7213",
+		.fw_filename = "intel/fw_sst_22a8.bin",
+		.board = "bytcht_da7213",
+		.sof_fw_filename = "sof-cht.ri",
+		.sof_tplg_filename = "sof-cht-da7213.tplg",
+	},
+	{
+		.id = "DLGS7213",
 		.drv_name = "bytcht_da7213",
 		.fw_filename = "intel/fw_sst_22a8.bin",
 		.board = "bytcht_da7213",
@@ -124,7 +135,7 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 	},
 	/* some CHT-T platforms rely on RT5640, use Baytrail machine driver */
 	{
-		.comp_ids = &rt5640_comp_ids,
+		.id = "10EC5640",
 		.drv_name = "bytcr_rt5640",
 		.fw_filename = "intel/fw_sst_22a8.bin",
 		.board = "bytcr_rt5640",
@@ -132,6 +143,14 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.sof_fw_filename = "sof-cht.ri",
 		.sof_tplg_filename = "sof-cht-rt5640.tplg",
 	},
+	{
+		.id = "10EC3276",
+		.drv_name = "bytcr_rt5640",
+		.fw_filename = "intel/fw_sst_22a8.bin",
+		.board = "bytcr_rt5640",
+		.sof_fw_filename = "sof-cht.ri",
+		.sof_tplg_filename = "sof-cht-rt5640.tplg",
+	},
 	{
 		.id = "10EC5682",
 		.drv_name = "sof_rt5682",
-- 
2.31.1

