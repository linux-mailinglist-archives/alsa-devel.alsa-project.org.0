Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8676E7F958E
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Nov 2023 22:42:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0E9BDF2;
	Sun, 26 Nov 2023 22:42:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0E9BDF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701034930;
	bh=pwD+bcb7eah+GmR3ST9o11woeQjXkbLqk55cE7dBpt8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z4oGI+4dSJwNjowr6+mHv10CrOuDVGm7LCYIoNrWC1wEIH90F3ROX936PhpuCg+Ev
	 NSC4NXLVaauKfzqpL6jaWlzpwtxB9mS3urX7Kr9xFJ4HgEC4k89gUarFtc4t6WQWje
	 GDcge0ivrHldK/8xxvW4iEEb40hJBUGFQWbn0Eic=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3459AF805E1; Sun, 26 Nov 2023 22:41:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EBDDF805E9;
	Sun, 26 Nov 2023 22:41:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E9A6F80246; Sun, 26 Nov 2023 22:40:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB29FF801D5
	for <alsa-devel@alsa-project.org>; Sun, 26 Nov 2023 22:40:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB29FF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=AsDS2OIL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701034843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fv+oHgIYcalkHoRzEbK4DErtkShu10DLgpKech866XY=;
	b=AsDS2OILEDuS/rto9smxPawl8mNTovF/HemaEyA+8/7ZgiSmhNan+eDkqxmmCRzJp4ii1o
	qAQjSVazYiFk1Wv7L3LPqfBrDhf9Y7xiqm39vlJyBy1Byk3RJNbOKo6vsWQJJW2+1xaaVy
	jzoyn9nI3iA0VVWxgtKk23xQtGOPKvk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-BPIH2L9JMN6kfS286o3azA-1; Sun, 26 Nov 2023 16:40:38 -0500
X-MC-Unique: BPIH2L9JMN6kfS286o3azA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FD5C80513D;
	Sun, 26 Nov 2023 21:40:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D3581C060B0;
	Sun, 26 Nov 2023 21:40:36 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 2/7] ASoC: rt5645: Add platform-data for Acer Switch V 10
Date: Sun, 26 Nov 2023 22:40:19 +0100
Message-ID: <20231126214024.300505-3-hdegoede@redhat.com>
In-Reply-To: <20231126214024.300505-1-hdegoede@redhat.com>
References: <20231126214024.300505-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: FQNMUA6UB5X3FDXORO565H23GBMHZDI7
X-Message-ID-Hash: FQNMUA6UB5X3FDXORO565H23GBMHZDI7
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQNMUA6UB5X3FDXORO565H23GBMHZDI7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Acer Switch V 10 uses the default jack-detect mode 3, but instead of
using an analog microphone it is using a DMIC on dmic-data-pin 1,
like other models following Intel's Braswell's reference design.

Add a DMI quirk pointing to the intel_braswell_platform_data for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5645.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index c7089c2f7c5c..20bbdf76ffd7 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3847,6 +3847,14 @@ static const struct dmi_system_id dmi_platform_data[] = {
 		},
 		.driver_data = (void *)&ecs_ef20_platform_data,
 	},
+	{
+		.ident = "Acer Switch V 10 (SW5-017)",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "SW5-017"),
+		},
+		.driver_data = (void *)&intel_braswell_platform_data,
+	},
 	{ }
 };
 
-- 
2.41.0

