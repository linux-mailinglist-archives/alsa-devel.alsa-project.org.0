Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA18323A29
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 11:07:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E131F168B;
	Wed, 24 Feb 2021 11:06:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E131F168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614161269;
	bh=r1d1SFbLadvmoNzMdx50IJS7usJkBWvkj81VivA9BKE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oxXyUejBEc4bJwMRdsLo05AkLiACj4nJ4gTNMPbQjpJu38RtlNwlxLWrJ0Un3v9wc
	 62vwpe3ooU2TaQUyUpkCOCxBJ1U2KFEQvjDXAhbYuYyMpR5CkKbzvaAAOkZIyRPWd0
	 2MIxgW4NvHKvf7p6lG7Ck6ySCLU6kKAmtMEIoiks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C0C2F80249;
	Wed, 24 Feb 2021 11:06:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05422F8016C; Wed, 24 Feb 2021 11:06:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_94,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40B72F80129
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 11:06:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40B72F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Np3qh10b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614161160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bbQoqNtkB2ZH0cWvNq9ipZPSrKT0JOS3TmG+KK0si3Y=;
 b=Np3qh10bxebtXlSVgFmfwYXf5s/h0xCkqaZogT2o6pC6Ol0pJZalttdWArk66nOMtbhcWX
 zhhmroIPNfzweTQX4xBKwaejiGARM1Y7iE0kjne0/s1ko2tFX7fwAiFNPcpN8BcL9RbkVP
 WhZ/OQo7bjgVAVt86p0vMcGB9K6HrgM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-sZ-nBWitPBS36ZI80jip9A-1; Wed, 24 Feb 2021 05:05:56 -0500
X-MC-Unique: sZ-nBWitPBS36ZI80jip9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CA02193579C;
 Wed, 24 Feb 2021 10:05:55 +0000 (UTC)
Received: from x1.localdomain (ovpn-113-243.ams2.redhat.com [10.36.113.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB9E95D9D3;
 Wed, 24 Feb 2021 10:05:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 2/3] mixer: Add exception for non " Volume" suffixed
 capture vol-ctls used in ASoC realtek codec drivers
Date: Wed, 24 Feb 2021 11:05:50 +0100
Message-Id: <20210224100551.15141-2-hdegoede@redhat.com>
In-Reply-To: <20210224100551.15141-1-hdegoede@redhat.com>
References: <20210224100551.15141-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>
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

The following ASoC codec drivers:

sound/soc/codecs/rt5640.c
sound/soc/codecs/rt5645.c
sound/soc/codecs/rt5651.c
sound/soc/codecs/rt5677.c

Use capture-volume-control names like: "IN1 Boost", note the missing
" Volume" suffix. This causes the mixer code to not identify these as
volume-controls, which causes some of the dB related sm_elem_ops to
return -EINVAL.

This in turn causes alsamixer to not show dB info and causes UCM profile
HW volume control support in pulseaudio to not work properly due to the
lacking dB scale info.

This cannot be fixed on the kernel side because the non " Volume" suffixed
names are used in UCM profiles currently shipping in alsa-ucm-conf.

Add some code to the base_len() function, which is responsbile for
getting the control-type to deal with these special cases.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 src/mixer/simple_none.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/src/mixer/simple_none.c b/src/mixer/simple_none.c
index 7da7de1e..262e3516 100644
--- a/src/mixer/simple_none.c
+++ b/src/mixer/simple_none.c
@@ -905,13 +905,29 @@ static const struct suf {
 	{" Volume", CTL_GLOBAL_VOLUME},
 	{NULL, 0}
 };
+
+/*
+ * Some kernel drivers use mixer-element names for capture-volumes which
+ * are not suffixed with " Capture Volume". This cannot be fixed on the
+ * kernel side because the non-suffixed names are used in UCM profiles,
+ * so we map these to CTL_CAPTURE_VOLUME based on their full name.
+ */
+const char * const capture_volume_names[] = {
+	"ADC Boost Gain",
+	"IN1 Boost",
+	"IN2 Boost",
+	"IN3 Boost",
+	NULL
+};
 #endif
 
 /* Return base length */
 static int base_len(const char *name, selem_ctl_type_t *type)
 {
-	const struct suf *p;
 	size_t nlen = strlen(name);
+	const struct suf *p;
+	char buf[32];
+	int i;
 
 	/* exception: "Capture Volume" and "Capture Switch" */
 	if (!strcmp(name, "Capture Volume")) {
@@ -923,6 +939,13 @@ static int base_len(const char *name, selem_ctl_type_t *type)
 		return strlen("Capture");
 	}
 
+	for (i = 0; capture_volume_names[i]; i++) {
+		if (!strcmp(name, capture_volume_names[i])) {
+			*type = CTL_CAPTURE_VOLUME;
+			return nlen;
+		}
+	}
+
 	p = suffixes;
 	while (p->suffix) {
 		size_t slen = strlen(p->suffix);
-- 
2.30.1

