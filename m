Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7FF41C165
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 11:13:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25FE416AF;
	Wed, 29 Sep 2021 11:12:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25FE416AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632906821;
	bh=ClESuv63cHd3zQY0G0vHNVEnTexDu9RWhR1UtxNg6UI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p77wu9a6QcF/+kBJJaMgVaAXvHAEvsvSz0lN57RaC6ZLca/MQRHikqlziNJPWTZlX
	 g5GTQERNQ4qNWvP8bGeRTnnSW988gLnT1dNLfzQv/kiV55AjMYLnYaLg9634XuSSjw
	 DLGje43/73RgdziBXA6QX7BQ92W+KL6Vdz7cXxFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8BE7F804E2;
	Wed, 29 Sep 2021 11:12:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 852DBF80227; Wed, 29 Sep 2021 11:11:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD317F80105
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 11:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD317F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="fnraMoqZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632906711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pMXqtNQYb8pZOIOQkMH7F6H0o9rVPHyBAyEGKrjx3nk=;
 b=fnraMoqZRX1zZmsoj77NTIZpHDiREZg3KRQZELAufvn4fmlEZQVN23PXNBDm9NbtJSljkw
 dhsTsyCI6q/KgK7xH5GnHXytELyqUH5Ngk0SLkaRde+OT55Wgl8J1aYaTUzSWj6jjO+Eds
 Yh5g9tS2HMjdO+4Bxud8QUxo9A6dUvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-um8N2XTuOamG8ijhuHrUKQ-1; Wed, 29 Sep 2021 05:11:50 -0400
X-MC-Unique: um8N2XTuOamG8ijhuHrUKQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33576835DE5;
 Wed, 29 Sep 2021 09:11:49 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B505A109B6E0;
 Wed, 29 Sep 2021 09:11:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 1/5] bytcr-rt5640: Fix 'Headphone Switch' /
 'Headset Mic Switch' no longer getting set
Date: Wed, 29 Sep 2021 11:11:40 +0200
Message-Id: <20210929091144.4778-2-hdegoede@redhat.com>
In-Reply-To: <20210929091144.4778-1-hdegoede@redhat.com>
References: <20210929091144.4778-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Dmitry Osipenko <digetx@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
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

Commit 446d0a71b47f ("codecs/rt5640: Move out BayTrail-specific pin switches")
moved the setting of the 'Headphone Switch' / 'Headset Mic Switch' into
"If.hp" resp "If.hsmic" blocks. But instead of making them part of the
True {} block inside that If, the statements where added add the top-level
of the If {} block where they are no-ops.

Move them to inside the True blocks so that these Switches again get
properly turned on/off. This fixes the Headphones and Headset-mic no longer
working on bytcr-rt5640 devices.

Cc: Dmitry Osipenko <digetx@gmail.com>
Fixes: 446d0a71b47f ("codecs/rt5640: Move out BayTrail-specific pin switches")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/bytcr-rt5640/HiFi.conf | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/ucm2/bytcr-rt5640/HiFi.conf b/ucm2/bytcr-rt5640/HiFi.conf
index a5b47df..08127e0 100644
--- a/ucm2/bytcr-rt5640/HiFi.conf
+++ b/ucm2/bytcr-rt5640/HiFi.conf
@@ -100,16 +100,18 @@ If.mono {
 
 If.hp {
 	Condition { Type String Empty "" }
-	True.Include.hs.File "/codecs/rt5640/HeadPhones.conf"
+	True {
+		Include.hs.File "/codecs/rt5640/HeadPhones.conf"
 
-	SectionDevice."Headphones" {
-		EnableSequence [
-			cset "name='Headphone Switch' on"
-		]
+		SectionDevice."Headphones" {
+			EnableSequence [
+				cset "name='Headphone Switch' on"
+			]
 
-		DisableSequence [
-			cset "name='Headphone Switch' off"
-		]
+			DisableSequence [
+				cset "name='Headphone Switch' off"
+			]
+		}
 	}
 }
 
@@ -178,15 +180,17 @@ If.in3 {
 
 If.hsmic {
 	Condition { Type String Empty "" }
-	True.Include.hsmic.File "/codecs/rt5640/HeadsetMic.conf"
+	True {
+		Include.hsmic.File "/codecs/rt5640/HeadsetMic.conf"
 
-	SectionDevice."Headset" {
-		EnableSequence [
-			cset "name='Headset Mic Switch' on"
-		]
+		SectionDevice."Headset" {
+			EnableSequence [
+				cset "name='Headset Mic Switch' on"
+			]
 
-		DisableSequence [
-			cset "name='Headset Mic Switch' off"
-		]
+			DisableSequence [
+				cset "name='Headset Mic Switch' off"
+			]
+		}
 	}
 }
-- 
2.31.1

