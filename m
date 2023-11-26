Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 163127F9588
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Nov 2023 22:37:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E30D0A4C;
	Sun, 26 Nov 2023 22:37:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E30D0A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701034633;
	bh=a05RJL5MW+jG7dP5Kp6xBk0X8NkiE9o8hJa1POpzfVw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jsFweZMMmQ8fFhoZzF8Eu673dLEIDqXkxuThtIDH3EeUjHiZ3Mu01G+NkJCX/mHWL
	 0KGzvPzgnMhuNgEcEI7/0oXqGBSNSyyUnUHeTraDIp7pgNFm3mSSqwjoT9UnJRCGq9
	 1qvZiUev1QziRLsZTzq47ETqZD9Q8WYJcwLLzdZ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53B0BF8055C; Sun, 26 Nov 2023 22:36:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D670F80579;
	Sun, 26 Nov 2023 22:36:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E1DAF801D5; Sun, 26 Nov 2023 22:36:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A2C6F80166
	for <alsa-devel@alsa-project.org>; Sun, 26 Nov 2023 22:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A2C6F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=QRptbzdg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701034558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U+AHgj1O9QsEX1NMwx9Jrh2KyE17sejYtycorBKInfA=;
	b=QRptbzdgUlc5YSCwOKCo2b+koxViVlO7DBt/i9pBBEGyBTbSJ1zyxDNB3bITeZ0Ea2dkLi
	+BSOfmXnI5UJO4yqD4VBJg+bJmtPGLB/bjcpYHLYySIQfBdtz5rAaniHO4QyPdZYDEC7+C
	bk1q647sKfPqPyjzv/wptxzyU7hnIMc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-I7WQp9E2PWC88YtiSgqm5A-1; Sun, 26 Nov 2023 16:35:55 -0500
X-MC-Unique: I7WQp9E2PWC88YtiSgqm5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD563101A597;
	Sun, 26 Nov 2023 21:35:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B0AF75028;
	Sun, 26 Nov 2023 21:35:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <bard.liao@intel.com>,
	alsa-devel@alsa-project.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH alsa-ucm-conf] chtrt5645: Add support for the components
 string
Date: Sun, 26 Nov 2023 22:35:44 +0100
Message-ID: <20231126213544.300300-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 6VJQR5ZTIGNRIUBZ5WJIAOILSNM5PFYM
X-Message-ID-Hash: 6VJQR5ZTIGNRIUBZ5WJIAOILSNM5PFYM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6VJQR5ZTIGNRIUBZ5WJIAOILSNM5PFYM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Upcoming kernel versions will report which speaker and dmic config is used
by the device in a components strings so that we don't need to duplicate
the DMI quirks in both the kernel and the UCM profile.

Add support for getting the speaker and dmic config from the components string.

Note the old DMI matching is kept for support of older kernels, this means
that on devices where the old DMI matching was used things like:

Define.MonoSpeaker "Yes"

Will now be done twice, this is harmless as long as the kernel and UCM profile
DMI quirks are in sync, which they are.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/Intel/chtrt5645/HiFi.conf | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/ucm2/Intel/chtrt5645/HiFi.conf b/ucm2/Intel/chtrt5645/HiFi.conf
index 30fad50..f8dcbf5 100644
--- a/ucm2/Intel/chtrt5645/HiFi.conf
+++ b/ucm2/Intel/chtrt5645/HiFi.conf
@@ -2,6 +2,41 @@ Define.MonoSpeaker ""
 Define.AnalogMic "yes"
 Define.DigitalMic ""
 
+If.components-dmic1 {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "cfg-mic:dmic1"
+	}
+	True {
+		Define.AnalogMic ""
+		Define.DigitalMic "DMIC1"
+	}
+}
+
+If.components-dmic2 {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "cfg-mic:dmic2"
+	}
+	True {
+		Define.AnalogMic ""
+		Define.DigitalMic "DMIC2"
+	}
+}
+
+If.components-mspk {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "cfg-spk:1"
+	}
+	True {
+		Define.MonoSpeaker "yes"
+	}
+}
+
 If.cfg-dmic1 {
 	Condition {
 		Type RegexMatch
-- 
2.41.0

