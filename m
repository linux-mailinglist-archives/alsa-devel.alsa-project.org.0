Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A01B330138
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Mar 2021 14:32:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E7511F12;
	Sun,  7 Mar 2021 14:32:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E7511F12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615123974;
	bh=S7IWAbPv5qnh3Ho4oFKppBM3Ltr7CXQAYFjP/7PAjQY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ndsafb1QzICp7XU36UtE2XJPKgMlwsF7G1t/YnfA+vaT+33K+ZUs9r5+I+y0LKEn4
	 AxBc0P8nosIm2Ri5XfBt63i6i4BT9l9MssULWwQ82GtS6Ei5TFVoSnn0ULBX4YDXFB
	 nJvXq3L5GeLbdg2q+EO1TmzhfuARuk/omL3Mbjvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D9F6F8025A;
	Sun,  7 Mar 2021 14:30:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A44EF802E7; Sun,  7 Mar 2021 14:30:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_94,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2F3EF80256
 for <alsa-devel@alsa-project.org>; Sun,  7 Mar 2021 14:30:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2F3EF80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="g04CdcwB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615123812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i047CKFCjWISjT8RgNvNjcSgYVkSqF6L9d0bgC4eBM0=;
 b=g04CdcwBAZKRJrSCDAlb6IaAB8ukTZZE72BoY19UUTWdLJKWcBpPwfpKk08cY1e82lBKi6
 nmQcI2pyKz3Af7MoopPqj7se/NPzxjr5wMxTFDHhAKS+MBmT7f/nhOaqc2lztEKeP2LR6O
 c6BHCpzT53GdqNF7ux+SUL4vqm1L4Wo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-TJgNWWD-NvCp_7PFRoVMuA-1; Sun, 07 Mar 2021 08:30:10 -0500
X-MC-Unique: TJgNWWD-NvCp_7PFRoVMuA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C14DF8143F0;
 Sun,  7 Mar 2021 13:30:09 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 020C25C1CF;
 Sun,  7 Mar 2021 13:30:08 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v3 2/5] mixer: simple - Move handling of 3D Control -
 Depth controls to the exceptions list
Date: Sun,  7 Mar 2021 14:30:02 +0100
Message-Id: <20210307133005.30801-3-hdegoede@redhat.com>
In-Reply-To: <20210307133005.30801-1-hdegoede@redhat.com>
References: <20210307133005.30801-1-hdegoede@redhat.com>
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

Remove the custom handling of 3D Control - Depth control-names, replacing
this with adding the 3 full names which are used for such controls to the
exceptions list:

"3D Control - Depth"
"3D Control Sigmatel - Depth"
"3D Control Sigmatel - Rear Depth"

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 src/mixer/simple_none.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/src/mixer/simple_none.c b/src/mixer/simple_none.c
index 30d5aa8b..b29554cb 100644
--- a/src/mixer/simple_none.c
+++ b/src/mixer/simple_none.c
@@ -922,6 +922,10 @@ static const struct excep {
 	/* Avoid these Capture Volume/Switch controls getting seen as GLOBAL VOL/SW */
 	{"Capture Volume", 7, CTL_CAPTURE_VOLUME},
 	{"Capture Switch", 7, CTL_CAPTURE_SWITCH},
+	/* Playback Volume/Switch controls without a " Playback ..." suffix */
+	{"3D Control - Depth", 18, CTL_PLAYBACK_VOLUME},
+	{"3D Control Sigmatel - Depth", 27, CTL_PLAYBACK_VOLUME},
+	{"3D Control Sigmatel - Rear Depth", 32, CTL_PLAYBACK_VOLUME},
 	{NULL,}
 };
 #endif
@@ -953,13 +957,6 @@ static int base_len(const char *name, selem_ctl_type_t *type)
 		}
 	}
 
-	if (strstr(name, "3D Control")) {
-		if (strstr(name, "Depth")) {
-			*type = CTL_PLAYBACK_VOLUME;
-			return strlen(name);
-		}
-	}
-
 	*type = CTL_SINGLE;
 	return strlen(name);
 }
-- 
2.30.1

