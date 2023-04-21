Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2216EB1BA
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 20:38:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E8FAE94;
	Fri, 21 Apr 2023 20:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E8FAE94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682102302;
	bh=XHgRUHyKNu0+htCLZZtMcTbpZxjZtdt+CFfgbjNnfFQ=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=D6jRZo6sXP7ECDP+0AxbdomBZecVrITiaKSWXuocy1E5Eds7fc7jgRAbDprQ1fjpB
	 nXFtD+8X3SRXhgd7hSo9A9egb/sGy/Aeu6a7jN8KK+nMksa4YXkOYGGkpVDWAoXk0z
	 xywcZE+GyzTRzLDvxeZb1Awxo4+KKk7EnweKVuJM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3C4EF80149;
	Fri, 21 Apr 2023 20:37:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAADFF80155; Fri, 21 Apr 2023 20:37:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 990DBF800F8
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 20:37:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 990DBF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Mb4xWdy2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682102237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6kIon2sBOGuwoV0LPLB2NcKpEuGgAeuHh/wbCjNk2G0=;
	b=Mb4xWdy22Iuxmim8uqddtE2QQXRCLyGRs3rtmSbULYPvbFdurrdnvTPuQvEqsBGmUGZrkN
	C1uIQMCEQRcoHTENaEWyV+I+FsUuVDGRCggcbrP1jsJtOvMOIEVdHCP4nyJSXrxJJIdEG3
	IfoUaQoHXjk/CEahiIfd9gQbogkaHDI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-YhaAKqzDP2ql0CpjJdr6uA-1; Fri, 21 Apr 2023 14:37:16 -0400
X-MC-Unique: YhaAKqzDP2ql0CpjJdr6uA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDA148996F1;
	Fri, 21 Apr 2023 18:37:15 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.29])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC6721121318;
	Fri, 21 Apr 2023 18:37:14 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: soc-acpi-byt: Fix "WM510205" match no longer
 working
Date: Fri, 21 Apr 2023 20:37:14 +0200
Message-Id: <20230421183714.35186-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: DEDYBVNMYL3MO2KCS6AGICC665UMAYFJ
X-Message-ID-Hash: DEDYBVNMYL3MO2KCS6AGICC665UMAYFJ
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DEDYBVNMYL3MO2KCS6AGICC665UMAYFJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 7e1d728a94ca ("ASoC: Intel: soc-acpi-byt: Add new WM5102 ACPI HID")
added an extra HID to wm5102_comp_ids.codecs, but it forgot to bump
wm5102_comp_ids.num_codecs, causing the last codec HID in the codecs list
to no longer work.

Bump wm5102_comp_ids.num_codecs to fix this.

Fixes: 7e1d728a94ca ("ASoC: Intel: soc-acpi-byt: Add new WM5102 ACPI HID")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/common/soc-acpi-intel-byt-match.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-byt-match.c b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
index db5a92b9875a..87c44f284971 100644
--- a/sound/soc/intel/common/soc-acpi-intel-byt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
@@ -124,7 +124,7 @@ static const struct snd_soc_acpi_codecs rt5640_comp_ids = {
 };
 
 static const struct snd_soc_acpi_codecs wm5102_comp_ids = {
-	.num_codecs = 2,
+	.num_codecs = 3,
 	.codecs = { "10WM5102", "WM510204", "WM510205"},
 };
 
-- 
2.39.2

