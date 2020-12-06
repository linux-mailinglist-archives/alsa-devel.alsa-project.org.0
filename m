Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF46F2D04E8
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Dec 2020 13:49:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FB801776;
	Sun,  6 Dec 2020 13:49:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FB801776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607258999;
	bh=/Dvtq7qRvd8LGJAnaatkoYkCQm42fpO5g7bCLZ0mQqc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=roonD/w/u+TcFZbIavH4PiMFiKS/+T51636KvafE4FNJEdyyLHk19ufNDeGVFn98x
	 6zipDvdpekcLaNbh820pTCGCU/FadATac+JzKIvgK2HHxq8zAQcoNQeFEy9eiqZ80G
	 BafLHsKq5EGv658lSVtrxlIqHlJ+0N7IHGV2DsQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3D49F804E4;
	Sun,  6 Dec 2020 13:47:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7531DF804E5; Sun,  6 Dec 2020 13:47:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14716F804D8
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 13:47:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14716F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="IpBXdNpN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607258844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PWbsiQbDlsyl5BixS2XdcUjm+g+ZLtRSPGQAXhxMQLE=;
 b=IpBXdNpN2ZQtyZ5WkwaaQ5LhSzEfjsC1XzCU4q5nEJTlaxzjjm7T2JRXbTDQ3ilj4mqHQA
 ZKJPlTFa3/vyjr//+1mccP/xSqwb7v7h3isPy2Qps7Ea8rwl1QjplMpExwJmVcyE6cUkru
 W6lCoIcubfNYPoRIxW6Z2d5bJfX+kPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-3BQspb3IMcaKt8hVn_ouxg-1; Sun, 06 Dec 2020 07:47:22 -0500
X-MC-Unique: 3BQspb3IMcaKt8hVn_ouxg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30016107ACE4;
 Sun,  6 Dec 2020 12:47:21 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-98.ams2.redhat.com [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66ED06062F;
 Sun,  6 Dec 2020 12:47:20 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 2/3] chtnau8824: Add support for laptops using stereo
 DMICs
Date: Sun,  6 Dec 2020 13:47:17 +0100
Message-Id: <20201206124718.14060-2-hdegoede@redhat.com>
In-Reply-To: <20201206124718.14060-1-hdegoede@redhat.com>
References: <20201206124718.14060-1-hdegoede@redhat.com>
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

The Medion E2228T uses a NAU8824 codec combined with stereo
DMICs, add support for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/chtnau8824/HiFi.conf        | 16 +++++++++++++++-
 ucm2/codecs/nau8824/DMIC1_2.conf | 30 ++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 ucm2/codecs/nau8824/DMIC1_2.conf

diff --git a/ucm2/chtnau8824/HiFi.conf b/ucm2/chtnau8824/HiFi.conf
index d7a5f63..105f360 100644
--- a/ucm2/chtnau8824/HiFi.conf
+++ b/ucm2/chtnau8824/HiFi.conf
@@ -1,4 +1,5 @@
 Define.Speaker "Speaker"
+Define.Mic "InternalMic"
 
 If.cfg-mspk {
 	Condition {
@@ -11,6 +12,19 @@ If.cfg-mspk {
 	}
 }
 
+If.cfg-mic {
+	Condition {
+		Type RegexMatch
+		String "${CardLongName}"
+		# Medion E22??T models put DMIC in their product version
+		# when using DMICs
+		Regex "(MEDION-E22..T.*-DMIC-)"
+	}
+	True {
+		Define.Mic "DMIC1_2"
+	}
+}
+
 SectionVerb {
 
 	Value {
@@ -42,7 +56,7 @@ If.cfg-includes {
 		Include.spk.File "/codecs/nau8824/${var:Speaker}.conf"
 		Include.hp.File "/codecs/nau8824/HeadPhones.conf"
 
-		Include.mic.File "/codecs/nau8824/InternalMic.conf"
+		Include.mic.File "/codecs/nau8824/${var:Mic}.conf"
 		Include.hsmic.File "/codecs/nau8824/HeadsetMic.conf"
 	}
 }
diff --git a/ucm2/codecs/nau8824/DMIC1_2.conf b/ucm2/codecs/nau8824/DMIC1_2.conf
new file mode 100644
index 0000000..f54f671
--- /dev/null
+++ b/ucm2/codecs/nau8824/DMIC1_2.conf
@@ -0,0 +1,30 @@
+# Stereo DMICs on the DMIC1 and DMIC2 inputs
+
+SectionDevice."Mic" {
+	Comment "Internal Digital Microphones"
+
+	Value {
+		CapturePriority 200
+		CapturePCM "hw:${CardId}"
+	}
+
+	ConflictingDevice [
+		"Headset"
+	]
+
+	EnableSequence [
+		# Note needs to be swapped / swap is deliberate!
+		cset "name='ADC CH0 Select' 1"
+		cset "name='ADC CH1 Select' 0"
+
+		cset "name='Int Mic Switch' on"
+		cset "name='DMIC1 Enable Switch' on"
+		cset "name='DMIC2 Enable Switch' on"
+	]
+
+	DisableSequence [
+		cset "name='Int Mic Switch' off"
+		cset "name='DMIC1 Enable Switch' off"
+		cset "name='DMIC2 Enable Switch' off"
+	]
+}
-- 
2.28.0

