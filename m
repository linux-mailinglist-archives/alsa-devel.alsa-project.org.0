Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE83B372218
	for <lists+alsa-devel@lfdr.de>; Mon,  3 May 2021 22:55:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69B9D16B2;
	Mon,  3 May 2021 22:54:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69B9D16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620075319;
	bh=cZGwEUZ/qYIDaOPchQwVw1U3EyUwm1Cb/wSdVuG1Gik=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FhfDnnQXvQ0ejwCJrCKgVQ/yIMWjddI3aToID1U1kZaVjbDcjtrza4t80qtU3vt7Z
	 DnYGctjzNylswj9TUn018/swazpeO4FbAqeThTgZ9ocRx2OwjbbeDbh53VOKEpg7Ba
	 +qBE2HSuUlK5t1zIeLc5Sv4dYLGQPeZdsa3F7dxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F09C8F804AE;
	Mon,  3 May 2021 22:52:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 828C7F80162; Mon,  3 May 2021 22:52:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97F6BF80162
 for <alsa-devel@alsa-project.org>; Mon,  3 May 2021 22:52:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97F6BF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="OqF/fAzo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620075162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+aXiWvG5In1nqba8LwqQniGrMRRPHuVMo8s6UTvxpWY=;
 b=OqF/fAzodT4RfEDslHqUu3MkgSE77oInyF38CcQTMn+V3pvu2GJmxr9VY7jc6U46NbKcGf
 paI3uP7/Rm7RMDrPrlW1c+LFna8kOhAb/Vvp7DL8a5OC3jgpfKOanV9HaMbGAki1s/5eCr
 f9zDmYHUsR8QEM2YqQ98fI1HERoeYPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-knt3vZVfMquUVHghbN_Adw-1; Mon, 03 May 2021 16:52:36 -0400
X-MC-Unique: knt3vZVfMquUVHghbN_Adw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C12EB1006C83;
 Mon,  3 May 2021 20:52:35 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-158.ams2.redhat.com [10.36.112.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04C9A5C1C2;
 Mon,  3 May 2021 20:52:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 1/5] mixer: simple - Add generic exception mechanism
 for non-standard control-names
Date: Mon,  3 May 2021 22:52:27 +0200
Message-Id: <20210503205231.167346-2-hdegoede@redhat.com>
In-Reply-To: <20210503205231.167346-1-hdegoede@redhat.com>
References: <20210503205231.167346-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Add a generic exception mechanism for mixer-control-names which
don't use the standard suffixes from the suffixes table.

And move the existing exceptions which consist of a simple !strcmp()
check over to this new mechanism.

This also fixes the "Capture Volume" and "Capture Switch" exceptions
no longer working after commit 86b9c67774bc ("mixer: simple - Unify
simple_none: base_len() exception handling") because they were moved
to after the suffix checking, so they would be treated as
CTL_GLOBAL_VOLUME resp. CTL_GLOBAL_SWITCH based on their suffix
before the exception check has a chance to check for a match.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 src/mixer/simple_none.c | 48 +++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/src/mixer/simple_none.c b/src/mixer/simple_none.c
index 71d88486..30d5aa8b 100644
--- a/src/mixer/simple_none.c
+++ b/src/mixer/simple_none.c
@@ -905,14 +905,41 @@ static const struct suf {
 	{" Volume", CTL_GLOBAL_VOLUME},
 	{NULL, 0}
 };
+
+static const struct excep {
+	const char *name;
+	int base_len;
+	selem_ctl_type_t type;
+} exceptions[] = {
+	/* Special case - handle "Input Source" as a capture route.
+	 * Note that it's *NO* capture source.  A capture source is split over
+	 * sub-elements, and multiple capture-sources will result in an error.
+	 * That's why some drivers use "Input Source" as a workaround.
+	 * Hence, this is a workaround for a workaround to get the things
+	 * straight back again.  Sigh.
+	 */
+	{"Input Source", 12, CTL_CAPTURE_ROUTE},
+	/* Avoid these Capture Volume/Switch controls getting seen as GLOBAL VOL/SW */
+	{"Capture Volume", 7, CTL_CAPTURE_VOLUME},
+	{"Capture Switch", 7, CTL_CAPTURE_SWITCH},
+	{NULL,}
+};
 #endif
 
 /* Return base length */
 static int base_len(const char *name, selem_ctl_type_t *type)
 {
+	const struct excep *e;
 	const struct suf *p;
 	size_t nlen = strlen(name);
 
+	for (e = exceptions; e->name; e++) {
+		if (!strcmp(name, e->name)) {
+			*type = e->type;
+			return e->base_len;
+		}
+	}
+
 	for (p = suffixes; p->suffix; p++) {
 		size_t slen = strlen(p->suffix);
 		size_t l;
@@ -926,27 +953,6 @@ static int base_len(const char *name, selem_ctl_type_t *type)
 		}
 	}
 
-	/* exception: "Capture Volume" and "Capture Switch" */
-	if (!strcmp(name, "Capture Volume")) {
-		*type = CTL_CAPTURE_VOLUME;
-		return strlen("Capture");
-	}
-	if (!strcmp(name, "Capture Switch")) {
-		*type = CTL_CAPTURE_SWITCH;
-		return strlen("Capture");
-	}
-
-	/* Special case - handle "Input Source" as a capture route.
-	 * Note that it's *NO* capture source.  A capture source is split over
-	 * sub-elements, and multiple capture-sources will result in an error.
-	 * That's why some drivers use "Input Source" as a workaround.
-	 * Hence, this is a workaround for a workaround to get the things
-	 * straight back again.  Sigh.
-	 */
-	if (!strcmp(name, "Input Source")) {
-		*type = CTL_CAPTURE_ROUTE;
-		return strlen(name);
-	}
 	if (strstr(name, "3D Control")) {
 		if (strstr(name, "Depth")) {
 			*type = CTL_PLAYBACK_VOLUME;
-- 
2.31.1

