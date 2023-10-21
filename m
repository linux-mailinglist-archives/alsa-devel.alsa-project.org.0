Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9E77D1FC7
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Oct 2023 23:19:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D7BC82B;
	Sat, 21 Oct 2023 23:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D7BC82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697923170;
	bh=8KHUNXQNTO2jTbS7+MfwuYiItYo74A+/0h4X0owalS4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cIWu83fGdGcPs+UzTOAJlBmEF0SFbzxxMnwWtH5e9QDN1ucs8eE3arxyy36jA5hrT
	 H29tALXtvhtZEOjC8520lvOg4XD36/BMLDS+45Gv9FGDEcUg5EABYyNOaMmnJ+KD/6
	 Hua+RayNeygNUL3b/C+564HHTGZnGMtA8S7PHhi4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 881A9F80578; Sat, 21 Oct 2023 23:17:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6E85F8057E;
	Sat, 21 Oct 2023 23:17:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AECD4F80552; Sat, 21 Oct 2023 23:16:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D624EF800C9
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 23:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D624EF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=VoCmcDyI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697922987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QRC6Mj4jjk2r1y7jzJuxamy8oam/0O+V83hwFKZBZy8=;
	b=VoCmcDyIHnzmduBsF3ChhmwtPwv0DmHR8mbR0dXXKQ+Yu/QzhE2cLouBKWmujzc0P7+YWv
	1SHJj2nDQbDAIle8HlPwqnbzI2v4CgklAT2HvjQ+B+FO82WrfOoX5LyfX86AJfeOlc5G5d
	POrJ5NWm5IaB4sN5TES1szlkeSqTssQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-6IpKpkU6MqOyAIkkDxAG6g-1; Sat, 21 Oct 2023 17:16:24 -0400
X-MC-Unique: 6IpKpkU6MqOyAIkkDxAG6g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD043857F8C;
	Sat, 21 Oct 2023 21:16:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B008D492BD9;
	Sat, 21 Oct 2023 21:16:22 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <bard.liao@intel.com>,
	alsa-devel@alsa-project.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH alsa-ucm-conf 1/2] bytcr-wm5102: Add support for speakers
 connected to HPOUT2
Date: Sat, 21 Oct 2023 23:16:13 +0200
Message-ID: <20231021211614.115152-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 2IM4QMHEGHAIQLR7WM54XEDUNMJC2JVU
X-Message-ID-Hash: 2IM4QMHEGHAIQLR7WM54XEDUNMJC2JVU
X-MailFrom: hdegoede@redhat.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IM4QMHEGHAIQLR7WM54XEDUNMJC2JVU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On the Lenovo Yoga Tab 3 YT3-X90 the speaker amplifiers are connected
to the HPOUT2 output pins instead of the the SPK output pins.

Check for "cfg-spk:hpout2" in the components string which indicates
this setup and add a ucm2/codecs/wm5102/HPOut2-Speaker.conf file
for this setup.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/Intel/bytcr-wm5102/HiFi.conf      | 11 ++++++++++-
 ucm2/codecs/wm5102/EnableSeq.conf      |  2 ++
 ucm2/codecs/wm5102/HPOut2-Speaker.conf | 22 ++++++++++++++++++++++
 3 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 ucm2/codecs/wm5102/HPOut2-Speaker.conf

diff --git a/ucm2/Intel/bytcr-wm5102/HiFi.conf b/ucm2/Intel/bytcr-wm5102/HiFi.conf
index 1269868..2afc757 100644
--- a/ucm2/Intel/bytcr-wm5102/HiFi.conf
+++ b/ucm2/Intel/bytcr-wm5102/HiFi.conf
@@ -21,7 +21,16 @@ SectionVerb {
 	}
 }
 
-Include.spk.File "/codecs/wm5102/Speaker.conf"
+If.spk {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "cfg-spk:hpout2"
+	}
+	True.Include.hpout2.File "/codecs/wm5102/HPOut2-Speaker.conf"
+	False.Include.spk.File "/codecs/wm5102/Speaker.conf"
+}
+
 Include.hp.File "/codecs/wm5102/HeadPhones.conf"
 Include.mic.File "/codecs/wm5102/IN3-InternalMic.conf"
 Include.headset.File "/codecs/wm5102/IN1-HeadsetMic.conf"
diff --git a/ucm2/codecs/wm5102/EnableSeq.conf b/ucm2/codecs/wm5102/EnableSeq.conf
index 6a857a2..87cb3bb 100644
--- a/ucm2/codecs/wm5102/EnableSeq.conf
+++ b/ucm2/codecs/wm5102/EnableSeq.conf
@@ -4,6 +4,8 @@ EnableSequence [
 	cset "name='SPKOUTR Input 1' AIF1RX2"
 	cset "name='HPOUT1L Input 1' AIF1RX1"
 	cset "name='HPOUT1R Input 1' AIF1RX2"
+	cset "name='HPOUT2L Input 1' AIF1RX1"
+	cset "name='HPOUT2R Input 1' AIF1RX2"
 
 	# Both mics are quite soft by default, boost then
 	cset "name='IN1L Volume' 28"
diff --git a/ucm2/codecs/wm5102/HPOut2-Speaker.conf b/ucm2/codecs/wm5102/HPOut2-Speaker.conf
new file mode 100644
index 0000000..375f9ba
--- /dev/null
+++ b/ucm2/codecs/wm5102/HPOut2-Speaker.conf
@@ -0,0 +1,22 @@
+SectionDevice."Speaker" {
+	Comment "Speakers"
+
+	Value {
+		PlaybackPriority 100
+		PlaybackPCM "hw:${CardId}"
+	}
+
+	ConflictingDevice [
+		"Headphones"
+	]
+
+	EnableSequence [
+		cset "name='HPOUT2 Digital Switch' on"
+		cset "name='Speaker Switch' on"
+	]
+
+	DisableSequence [
+		cset "name='HPOUT2 Digital Switch' off"
+		cset "name='Speaker Switch' off"
+	]
+}
-- 
2.41.0

