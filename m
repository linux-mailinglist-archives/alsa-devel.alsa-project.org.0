Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 020727A8993
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 18:35:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 529A420C;
	Wed, 20 Sep 2023 18:35:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 529A420C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695227750;
	bh=dJDjfrLAKivUblGfaQV3YbrxEMRn89eblmBZJUoxxjQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f7mLmtBZQIw0cgHVdGnRWc0oSmXjyA9OwkYdH4vvWx18FDmFyERyVgjH8n6Czp6bp
	 2bddVjVs2hlbKKL0WYbfr3RTrkKlynH4h05Tn3wkzFD4XMSmrMNm1PUeBS98HXAkrR
	 lO9ska2wTORz94aAC9xYlZBHyoMPAKtTxM2E2uF4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A31F6F80578; Wed, 20 Sep 2023 18:33:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8F22F80579;
	Wed, 20 Sep 2023 18:33:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A518EF80563; Wed, 20 Sep 2023 18:33:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2C17F8025A
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 18:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2C17F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=iEA0VVrL
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38K3qoWl031049;
	Wed, 20 Sep 2023 11:33:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=EJ5ed+ITbEi3A3t572jlfnIzGCe9Zx/6EDGQBJFmsQs=; b=
	iEA0VVrL2eZNmVmuWR9A+erQ+xj0eT7auZuK9JmP9ECgmq1WQzi3oXDbfT1tJhfq
	BgJYXz/n0/HWDb/35PpWqSA49giivSRNSerSDw+fh5ijjLf9HvQVdmjMTg/LLLCE
	fzMuTKy4O1RBjNhpiU8NSAaSyYAunCAmEG0xm5R8dzep1fGkc/M0/7eWHdI2vjIH
	90Gj+DXTQrIY0T420OHVcdQCMCWCQgkWPwPXjDw5z5h77JjRX4CctXKf/brcWb+Y
	eHJJZ1qh5eDFIfCUZitfRGR8CNKY8JhtdueonEZdKBV+xrXNcz+zOUYkhC5nvVOd
	YZk4gbB3pPJ5B5H01fr2LA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t59ry5sr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 11:33:38 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 20 Sep
 2023 17:33:36 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Wed, 20 Sep 2023 17:33:36 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.135])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9AF3711CD;
	Wed, 20 Sep 2023 16:33:36 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v4 1/4] ALSA: hda: cs35l41: Add notification support into
 component binding
Date: Wed, 20 Sep 2023 16:54:47 +0100
Message-ID: <20230920155450.576287-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920155450.576287-1-sbinding@opensource.cirrus.com>
References: <20230920155450.576287-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: E-6Negf5VwOxcjlf6n5al58UGsIvUc7q
X-Proofpoint-ORIG-GUID: E-6Negf5VwOxcjlf6n5al58UGsIvUc7q
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: V6COH5SCWRN7ETVR2WIV65DT3MF66YTS
X-Message-ID-Hash: V6COH5SCWRN7ETVR2WIV65DT3MF66YTS
X-MailFrom: prvs=462798be35=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6COH5SCWRN7ETVR2WIV65DT3MF66YTS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some systems support a notification from ACPI, which can be used
for different things.

Only one handler can be registered for the acpi notification, but all
amps need to receive that notification, we can register a single handler
inside the component master, so that it can then notify through the
component framework.

This is required to support mute notifications from ACPI.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/hda_component.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
index f170aec967c1..bbd6f0ed16c1 100644
--- a/sound/pci/hda/hda_component.h
+++ b/sound/pci/hda/hda_component.h
@@ -6,6 +6,7 @@
  *                    Cirrus Logic International Semiconductor Ltd.
  */
 
+#include <linux/acpi.h>
 #include <linux/component.h>
 
 #define HDA_MAX_COMPONENTS	4
@@ -15,6 +16,9 @@ struct hda_component {
 	struct device *dev;
 	char name[HDA_MAX_NAME_SIZE];
 	struct hda_codec *codec;
+	struct acpi_device *adev;
+	bool acpi_notifications_supported;
+	void (*acpi_notify)(acpi_handle handle, u32 event, struct device *dev);
 	void (*pre_playback_hook)(struct device *dev, int action);
 	void (*playback_hook)(struct device *dev, int action);
 	void (*post_playback_hook)(struct device *dev, int action);
-- 
2.34.1

