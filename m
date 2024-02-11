Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD30E850BA4
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Feb 2024 22:28:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11C2886E;
	Sun, 11 Feb 2024 22:28:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11C2886E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707686914;
	bh=PvZzD9xwSuNVdurLz62S8R+IC7P78h89z4vjjwzPP9o=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=O984W5LT6jA9IpbDfjqlsYmZZWHjQZOhiv6TLF6G6AEQ78MEjkjxXW++uUmGENUEn
	 S+NeNdUCpVwCmjlEp2svd2fXpVmIi+ur6Cq0FQlBDoxW42fx6KF78zRANfIv84813C
	 mNmSCzJ9AeAASZu+u8QeLa+DvIF+TikBp8Gb2rfs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58466F8057C; Sun, 11 Feb 2024 22:28:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD76BF8057A;
	Sun, 11 Feb 2024 22:28:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05FEBF8025A; Sun, 11 Feb 2024 22:27:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1A31F800EE
	for <alsa-devel@alsa-project.org>; Sun, 11 Feb 2024 22:27:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1A31F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=OUljiPrT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707686863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d/Rtxgc2ZOWC1eshf/dC61Q1d3zqfSkAk78Po58ZR8s=;
	b=OUljiPrTakQAsMwqaCqIhDdT2l0oaoxKIRmN7/7nQkuK7j5KXa6tMk4MoyFQNFYakVcClP
	1AVK8k8tOqGHzeyHILtq1Rv+SxQena+wNGgmTPhZYul1e05nydk6OeQsIV0Rn5zIVKhcZ4
	m7ia0rD5xjIAMyp2Sc6djKE0hrd07Ak=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-V04hSXSLNCCwryTPsKCh2g-1; Sun,
 11 Feb 2024 16:27:39 -0500
X-MC-Unique: V04hSXSLNCCwryTPsKCh2g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84E773C000B7;
	Sun, 11 Feb 2024 21:27:38 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB51B40C9444;
	Sun, 11 Feb 2024 21:27:36 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: rt5645: Make LattePanda board DMI match more
 precise
Date: Sun, 11 Feb 2024 22:27:35 +0100
Message-ID: <20240211212736.179605-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: QSB3Q2BLBCMYDHBMAJA2XMXPIXDGXDZP
X-Message-ID-Hash: QSB3Q2BLBCMYDHBMAJA2XMXPIXDGXDZP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QSB3Q2BLBCMYDHBMAJA2XMXPIXDGXDZP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The DMI strings used for the LattePanda board DMI quirks are very generic.

Using the dmidecode database from https://linux-hardware.org/ shows
that the chosen DMI strings also match the following 2 laptops
which also have a rt5645 codec:

Insignia NS-P11W7100 https://linux-hardware.org/?computer=E092FFF8BA04
Insignia NS-P10W8100 https://linux-hardware.org/?computer=AFB6C0BF7934

All 4 hw revisions of the LattePanda board have "S70CR" in their BIOS
version DMI strings:

DF-BI-7-S70CR100-*
DF-BI-7-S70CR110-*
DF-BI-7-S70CR200-*
LP-BS-7-S70CR700-*

See e.g. https://linux-hardware.org/?computer=D98250A817C0

Add a partial (non exact) DMI match on this string to make the LattePanda
board DMI match more precise to avoid false-positive matches.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5645.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 5150d6ee3748..b3865e3c3259 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3837,6 +3837,16 @@ static const struct dmi_system_id dmi_platform_data[] = {
 		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
 		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
 		  DMI_EXACT_MATCH(DMI_BOARD_VERSION, "Default string"),
+		  /*
+		   * Above strings are too generic, LattePanda BIOS versions for
+		   * all 4 hw revisions are:
+		   * DF-BI-7-S70CR100-*
+		   * DF-BI-7-S70CR110-*
+		   * DF-BI-7-S70CR200-*
+		   * LP-BS-7-S70CR700-*
+		   * Do a partial match for S70CR to avoid false positive matches.
+		   */
+		  DMI_MATCH(DMI_BIOS_VERSION, "S70CR"),
 		},
 		.driver_data = (void *)&lattepanda_board_platform_data,
 	},
-- 
2.43.0

