Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B5637221A
	for <lists+alsa-devel@lfdr.de>; Mon,  3 May 2021 22:55:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8ACE1699;
	Mon,  3 May 2021 22:55:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8ACE1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620075353;
	bh=R2VaQOuy4N14vz+cdjMolxU48t+gX3MqIn4/YL+p59E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K0siqzqxTn68R8Yqppml2GowY+D9YnEsH6bF/wVBBR1dGBTfuW+CY7jBWLZKOvNjL
	 3qpA+UvSdggrbPW7eDbEwXewu66Ks/YW5Pm+hcRRs9jTK5it2tkyWYJ7atnDnHn8gS
	 MCBwjvNI19+Y6pl4mJ0KN4GX1kLISbiqKxIzXkLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C52ECF804AF;
	Mon,  3 May 2021 22:52:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 367D9F80482; Mon,  3 May 2021 22:52:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B321F8028D
 for <alsa-devel@alsa-project.org>; Mon,  3 May 2021 22:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B321F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="MzxygCP9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620075168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kY0etXVODAE2BS/115eUDgj7fnG4ZE2zo/r9J/e9xoU=;
 b=MzxygCP9U1pEAH+euasKvkFWEAOSRjymYlwu0QS2NKhGOCI/pgyDd0W+oZWS+o2236S1l4
 itHoitVPGpIFhaannE1YkZM2+XHGzjvatsntAf1JUpGIoQ7jko9VmuQGLncs7f+3aM682R
 4+oRbBX3ru9ZwkcrbqPfQi1QQeMhafw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-oDXrMvSsP4CwN693ZalvQg-1; Mon, 03 May 2021 16:52:46 -0400
X-MC-Unique: oDXrMvSsP4CwN693ZalvQg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C815D6972B;
 Mon,  3 May 2021 20:52:45 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-158.ams2.redhat.com [10.36.112.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B7FF6061F;
 Mon,  3 May 2021 20:52:44 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib] ucm: Fix sysw sequence command not working when
 requesting to ignore errors
Date: Mon,  3 May 2021 22:52:44 +0200
Message-Id: <20210503205244.167473-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

When the user requests to ignore sysfs write errors by prefixing
the path with a '-' then we need to skip the '-' when building the
actual path otherwise the write will never work.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 src/ucm/main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/ucm/main.c b/src/ucm/main.c
index 2b07cc95..3df9b62a 100644
--- a/src/ucm/main.c
+++ b/src/ucm/main.c
@@ -517,7 +517,10 @@ static int execute_sysw(const char *sysw)
 	if (sysw == NULL || *sysw == '\0')
 		return 0;
 
-	ignore_error = sysw[0] == '-';
+	if (sysw[0] == '-') {
+		ignore_error = true;
+		sysw++;
+	}
 
 	if (sysw[0] == ':')
 		return -EINVAL;
-- 
2.31.1

