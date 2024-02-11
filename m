Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C154850BA6
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Feb 2024 22:30:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59176B65;
	Sun, 11 Feb 2024 22:30:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59176B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707687018;
	bh=IU4e4C8OUa9IFubXffb7eLxzIfcjQIqRtTbmMHTGOSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mZlrG1AS4Gi84sVECuWnePfQo/9xA6SZgpEZB9AsqkD9sX6OBIY/GgOdmv+8trUG3
	 y7vBQzmoN1bhsGkvLfmguWp1hYuGKM/RYeONEKjSmDlkTKwmAdelkpgkclAxApqXNT
	 JCrYPS6zaSho03SbUzQ1U/EseFN/IXRJvZ9ghLKI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7742F805AA; Sun, 11 Feb 2024 22:29:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A11E5F80571;
	Sun, 11 Feb 2024 22:29:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C85E7F8016E; Sun, 11 Feb 2024 22:27:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C6E4F8015B
	for <alsa-devel@alsa-project.org>; Sun, 11 Feb 2024 22:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C6E4F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=hpB65StK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707686864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8kpLb29PkCJQ9Cdq6GgbpC8SKpBu8yyjDA7FiCtXYk=;
	b=hpB65StKVjWwhS0jlNHTKvnluBLIU5rznSoGwknif4HeU0OcHOvCH2lOkz/L08dPdKvDWQ
	rEtRnnvTbiGat5a4AFU7AoVfQg1/pCy6Joh3C0sMpIpsMGZfirUA5PwIqdVUM+sh7FQWzn
	f611LgFiqK7h8WZrQvxhIdWGYs7yQ1Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-SfQjTRZNPW2QytWn1A_wTA-1; Sun, 11 Feb 2024 16:27:40 -0500
X-MC-Unique: SfQjTRZNPW2QytWn1A_wTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29FF585A588;
	Sun, 11 Feb 2024 21:27:40 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B63D040C106C;
	Sun, 11 Feb 2024 21:27:38 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: rt5645: Add DMI quirk for inverted jack-detect on
 MeeGoPad T8
Date: Sun, 11 Feb 2024 22:27:36 +0100
Message-ID: <20240211212736.179605-2-hdegoede@redhat.com>
In-Reply-To: <20240211212736.179605-1-hdegoede@redhat.com>
References: <20240211212736.179605-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: HWGWF75ZYL6SNS7JRM5KFDZ2JQY3BJDX
X-Message-ID-Hash: HWGWF75ZYL6SNS7JRM5KFDZ2JQY3BJDX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWGWF75ZYL6SNS7JRM5KFDZ2JQY3BJDX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The MeeGoPad T8 uses the standard rt5645 jd_mode=3 setting for jack-detect,
but the used jack connector outputs an inverted jack-detect signal.

Add a DMI quirk for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5645.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index b3865e3c3259..9672d1bac4e1 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3692,6 +3692,11 @@ static const struct rt5645_platform_data jd_mode3_monospk_platform_data = {
 	.mono_speaker = true,
 };
 
+static const struct rt5645_platform_data jd_mode3_inv_data = {
+	.jd_mode = 3,
+	.inv_jd1_1 = true,
+};
+
 static const struct rt5645_platform_data jd_mode3_platform_data = {
 	.jd_mode = 3,
 };
@@ -3881,6 +3886,16 @@ static const struct dmi_system_id dmi_platform_data[] = {
 		},
 		.driver_data = (void *)&intel_braswell_platform_data,
 	},
+	{
+		.ident = "Meegopad T08",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Default string"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Default string"),
+			DMI_MATCH(DMI_BOARD_NAME, "T3 MRD"),
+			DMI_MATCH(DMI_BOARD_VERSION, "V1.1"),
+		},
+		.driver_data = (void *)&jd_mode3_inv_data,
+	},
 	{ }
 };
 
-- 
2.43.0

