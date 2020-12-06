Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A832D04E6
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Dec 2020 13:49:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DF3A179F;
	Sun,  6 Dec 2020 13:48:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DF3A179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607258959;
	bh=L3BBYYK4TPGXP5h3blKl4qQRJmTuCUhUXIKKvUFi+GQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QJSviJ2MXKZmAaiYFlMSErnYu5F8vGbktCK+Q46iU/iP7NGSoJsEBm1wckLlAaeH5
	 swJZcIkRhX3MvygK00YxVQY11DA+JUChW99mN2AYpmYNGvZPLCcWMLxOnZVOZGLVBo
	 xEepTKz0dyuSHYvbyyEAL1Zxy5wdgcSfLSfKalFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A147DF804E3;
	Sun,  6 Dec 2020 13:47:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5511BF804E0; Sun,  6 Dec 2020 13:47:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0300F804D8
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 13:47:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0300F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="PfzRESOY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607258842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ip+rEu3WGTBF4375OEUQcNeQRUduLPow3yEgQ34DgmQ=;
 b=PfzRESOYv0GuC/uAs5iR/ElGnf0kfXonLMGx5fHZMYPEO+R98uUNu4Djj7eneezapUL+64
 6FrKHG4XCESiNhmsRK+683/vy4J8yDSXNke6LJDaJu2Q8YoZI13zabK7qXfPAkJKpHlVUQ
 J0HUS4oHRyjI0m7KIKZww3PMCFEiYpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-wiVLaPExMO-oj1B0pkHO4A-1; Sun, 06 Dec 2020 07:47:21 -0500
X-MC-Unique: wiVLaPExMO-oj1B0pkHO4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2042A803638;
 Sun,  6 Dec 2020 12:47:20 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-98.ams2.redhat.com [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24FD76062F;
 Sun,  6 Dec 2020 12:47:18 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 1/3] chtnau8824: Fix mono speaker config not working
Date: Sun,  6 Dec 2020 13:47:16 +0100
Message-Id: <20201206124718.14060-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Fix the Speaker define / var being changed from "Speaker" to "MonoSpeaker"
not having any effect because the variable gets expanded before the if
making the change is interpreted.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/chtnau8824/HiFi.conf | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/ucm2/chtnau8824/HiFi.conf b/ucm2/chtnau8824/HiFi.conf
index 3ccd6b1..d7a5f63 100644
--- a/ucm2/chtnau8824/HiFi.conf
+++ b/ucm2/chtnau8824/HiFi.conf
@@ -34,8 +34,15 @@ SectionVerb {
 	}
 }
 
-Include.spk.File "/codecs/nau8824/${var:Speaker}.conf"
-Include.hp.File "/codecs/nau8824/HeadPhones.conf"
+# The includes using $vars in there path must be conditional otherwise the
+# $var gets expanded before the other If-s above can change the vars.
+If.cfg-includes {
+	Condition { Type String Empty "" }
+	True {
+		Include.spk.File "/codecs/nau8824/${var:Speaker}.conf"
+		Include.hp.File "/codecs/nau8824/HeadPhones.conf"
 
-Include.mic.File "/codecs/nau8824/InternalMic.conf"
-Include.hsmic.File "/codecs/nau8824/HeadsetMic.conf"
+		Include.mic.File "/codecs/nau8824/InternalMic.conf"
+		Include.hsmic.File "/codecs/nau8824/HeadsetMic.conf"
+	}
+}
-- 
2.28.0

