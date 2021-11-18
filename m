Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D51D455F95
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 16:32:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8D801831;
	Thu, 18 Nov 2021 16:31:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8D801831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637249534;
	bh=x19otwcd7TR3jAVZUtxy7lCuWrirH6DYaaHp9G5+DiM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JqBkh0r0/wb1BgKtnrs2HyTwPcpTgCACthgvMG3MXJ+YxalLQ1tOC+COjuXQzOkPl
	 NFI8e6qbJS/FDNrxWO+QmyI5SoUDy6kQlJvZ+JKmQlzh526KNJzlSqBep8LMTnN+xm
	 Mn71uxsOkgidV6m3edIBWWA0Tod/JWxB0/BTFyUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36F07F802C4;
	Thu, 18 Nov 2021 16:30:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EB79F80272; Thu, 18 Nov 2021 16:30:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20A9AF800FA
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 16:30:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20A9AF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="cylFQdHb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637249443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7XApbZ+GOrUaz1a2WmdLgIjYew9ipMtR0GbiADq22d4=;
 b=cylFQdHbIH9fKSADT+tNOu6+cjMo+tJFqhFQJtHDoscVjKcHDb/cR5snzG+xYcypiowRQ+
 xCvIN1OXzBOXzdTSyAegTXkx1glLffYZgvez1XQu+OMAckSxclEH0pr85OyFnB1CW5ZFBf
 k8cFDYHWP7txPu22WMFzNq1fHBrWIEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-4rDbC1jKOAKOyXBt1P8unw-1; Thu, 18 Nov 2021 10:30:37 -0500
X-MC-Unique: 4rDbC1jKOAKOyXBt1P8unw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 281FB8799EB;
 Thu, 18 Nov 2021 15:30:36 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.195.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C508E5F4EF;
 Thu, 18 Nov 2021 15:30:15 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 5.16 regression fix] ASoC: soc-acpi: Set mach->id field on
 comp_ids matches
Date: Thu, 18 Nov 2021 16:30:14 +0100
Message-Id: <20211118153014.349222-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Commit dac7cbd55dca ("ASoC: Intel: soc-acpi-byt: shrink tables using
compatible IDs") and commit 959ae8215a9e ("ASoC: Intel: soc-acpi-cht:
shrink tables using compatible IDs") simplified the match tables in
soc-acpi-intel-byt-match.c and soc-acpi-intel-cht-match.c by merging
identical entries using the new .comp_ids snd_soc_acpi_mach field to
point a single entry to multiple ACPI HIDs and clearing the previously
unique per entry .id field.

But various machine drivers from sound/soc/intel/boards rely on mach->id
in one or more ways, e.g. some drivers contain the following snippets:

	adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);

	pkg_found = snd_soc_acpi_find_package_from_hid(mach->id, ...

	if (!strncmp(snd_soc_cards[i].codec_id, mach->id, 8)) { ...

All of which are broken by the match table shrinking.

Make the snd_soc_acpi_mach.id field non const (the storage for the tables
already is non const) and on a comps_ids match copy the matching HID to
the id field to fix this.

Fixes: dac7cbd55dca ("ASoC: Intel: soc-acpi-byt: shrink tables using compatible IDs")
Fixes: 959ae8215a9e ("ASoC: Intel: soc-acpi-cht: shrink tables using compatible IDs")
Suggested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Brent Lu <brent.lu@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/sound/soc-acpi.h | 2 +-
 sound/soc/soc-acpi.c     | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 31f4c4f9aeea..ac0893df9c76 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -147,7 +147,7 @@ struct snd_soc_acpi_link_adr {
  */
 /* Descriptor for SST ASoC machine driver */
 struct snd_soc_acpi_mach {
-	const u8 id[ACPI_ID_LEN];
+	u8 id[ACPI_ID_LEN];
 	const struct snd_soc_acpi_codecs *comp_ids;
 	const u32 link_mask;
 	const struct snd_soc_acpi_link_adr *links;
diff --git a/sound/soc/soc-acpi.c b/sound/soc/soc-acpi.c
index 2ae99b49d3f5..cbd7ea48837b 100644
--- a/sound/soc/soc-acpi.c
+++ b/sound/soc/soc-acpi.c
@@ -20,8 +20,10 @@ static bool snd_soc_acpi_id_present(struct snd_soc_acpi_mach *machine)
 
 	if (comp_ids) {
 		for (i = 0; i < comp_ids->num_codecs; i++) {
-			if (acpi_dev_present(comp_ids->codecs[i], NULL, -1))
+			if (acpi_dev_present(comp_ids->codecs[i], NULL, -1)) {
+				strscpy(machine->id, comp_ids->codecs[i], ACPI_ID_LEN);
 				return true;
+			}
 		}
 	}
 
-- 
2.31.1

