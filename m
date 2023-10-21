Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC4B7D1FCC
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Oct 2023 23:20:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58B64844;
	Sat, 21 Oct 2023 23:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58B64844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697923255;
	bh=7SGCURhw2jVnrog23BIXPuyKmEQcLkr8o166R7Bj4g4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H/DZ9XlXbjL8yqsAifpQpJuobSVb0XZw+ZsCXYWzibybHs5VuheZDiH8SI30CdKjl
	 c2JiRLwxqFaMbSv+1Ae0nAX1oA1g9i2hIJLOSLeA/uca3V1ZnyAwi61OH68f3G1LxP
	 +LrPlkJraJS20heOwI27o7YjUjFhoA7+ynGqYsoc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C836F8055C; Sat, 21 Oct 2023 23:20:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49E00F80552;
	Sat, 21 Oct 2023 23:20:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E11C1F80558; Sat, 21 Oct 2023 23:19:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AEA9F8025F
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 23:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AEA9F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=YaBNCEh/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697922952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O1S0o+gZP4oU9FO33hpUekrK/zcyOaTTRWXeWMH/Hk8=;
	b=YaBNCEh/4B+usCzfwaumCAhhEEGxEAQuPMO4msigj59KygeO+7kYnNqG2k9CqhXb9FXjBf
	Vfz55e3y7Hx89XWfYaDDEiTCTep8DlGfrvgZsnhqneMkNdrA7UbRKGgq7mJH17Hsu4KRd0
	Act3+wTc2+JzWHVpkuWx4tqgrC2/R3E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-UITuBRfTO1CtwqT0DKvChQ-1; Sat, 21 Oct 2023 17:15:45 -0400
X-MC-Unique: UITuBRfTO1CtwqT0DKvChQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39F8C10201E3;
	Sat, 21 Oct 2023 21:15:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E712492BFB;
	Sat, 21 Oct 2023 21:15:44 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 2/6] ASoC: Intel: bytcr_wm5102: Add support for Lenovo Yoga
 Tab 3 Pro YT3-X90
Date: Sat, 21 Oct 2023 23:15:29 +0200
Message-ID: <20231021211534.114991-2-hdegoede@redhat.com>
In-Reply-To: <20231021211534.114991-1-hdegoede@redhat.com>
References: <20231021211534.114991-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: RGYC2CBWTTRFF7FA44AYPJHWHVOZQOSJ
X-Message-ID-Hash: RGYC2CBWTTRFF7FA44AYPJHWHVOZQOSJ
X-MailFrom: hdegoede@redhat.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGYC2CBWTTRFF7FA44AYPJHWHVOZQOSJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Lenovo Yoga Tab 3 Pro YT3-X90 x86 tablet, which ships with Android
with a custom kernel as factory OS, does not list the used WM5102 codec
inside its DSDT.

So acpi_dev_get_first_match_dev() is going to fail on this board.
Fallback to using "spi-$(mach->id)" as codec device name in this case
to allow bytcr_wm5102 to work on these tablets.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_wm5102.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 5c9e06ed1a53..cf77a12b6a10 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -413,14 +413,15 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 	 */
 	mach = dev->platform_data;
 	adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
-	if (!adev) {
-		dev_err(dev, "Error cannot find acpi-dev for codec\n");
-		return -ENOENT;
+	if (adev) {
+		snprintf(codec_name, sizeof(codec_name), "spi-%s", acpi_dev_name(adev));
+		acpi_dev_put(adev);
+	} else {
+		/* Special case for when the codec is missing from the DSTD */
+		strscpy(codec_name, "spi1.0", sizeof(codec_name));
 	}
-	snprintf(codec_name, sizeof(codec_name), "spi-%s", acpi_dev_name(adev));
 
 	codec_dev = bus_find_device_by_name(&spi_bus_type, NULL, codec_name);
-	acpi_dev_put(adev);
 	if (!codec_dev)
 		return -EPROBE_DEFER;
 
-- 
2.41.0

