Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B10847D1FC8
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Oct 2023 23:19:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00784AEA;
	Sat, 21 Oct 2023 23:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00784AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697923192;
	bh=+pNMnpzWGGHTQuKIvYKjrfTVwdqNerVSRiSh1iXZQkw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=os+4cEcwKGRFXjNdoY7mkVSr+uGCi84Xku6MgyocOGVa5Ys7lBZBGxahp6+8Z//HX
	 P+pWoq4ZS3vVyOPBWXsSlCuf4qCxatrBM1vxtTz+rEPwvwnAFfpJRQg2S8Pg03BvQn
	 UcoxutIjGrCnXzNul0ykpOvvIa6ubD3FCkWQmynw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 832C4F805B0; Sat, 21 Oct 2023 23:17:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 273D8F805AB;
	Sat, 21 Oct 2023 23:17:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93F31F80536; Sat, 21 Oct 2023 23:16:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10128F8024E
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 23:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10128F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=WAYPAqmk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697922990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sYIcrz+NKRCM2GaEfcfFX8xws03XcisOZo0WIBAaPg0=;
	b=WAYPAqmkCHRt6ZgW7Y2n7SBv5OxUZ7MkBKOt45gtKLrUXitkse1IEMUwVxf/nBEx57KzCT
	qYHrU+gKvrLBnckMYkvEcteXDgD3p9sILO+YQvDlKhGwk3JCp9g1E8zIqirwi7wdAjTDM3
	ywTwC9waTPDyNO5b6HFGSpDhieoxqG0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-hhC0UEjfNoKps3K_gg_n7Q-1; Sat, 21 Oct 2023 17:16:25 -0400
X-MC-Unique: hhC0UEjfNoKps3K_gg_n7Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B73783804073;
	Sat, 21 Oct 2023 21:16:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EEA8B492BD9;
	Sat, 21 Oct 2023 21:16:23 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <bard.liao@intel.com>,
	alsa-devel@alsa-project.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH alsa-ucm-conf 2/2] bytcr-wm5102: Add support for different
 microphone routes
Date: Sat, 21 Oct 2023 23:16:14 +0200
Message-ID: <20231021211614.115152-2-hdegoede@redhat.com>
In-Reply-To: <20231021211614.115152-1-hdegoede@redhat.com>
References: <20231021211614.115152-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: LJSAXVZOW55X3N53SHYWQMCHNU2UKQH4
X-Message-ID-Hash: LJSAXVZOW55X3N53SHYWQMCHNU2UKQH4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LJSAXVZOW55X3N53SHYWQMCHNU2UKQH4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Unlike all designs supported sofar the Lenovo Yoga Tab 3 YT3-X90 does not
have its internal microphone (intmic) on IN3L with the headset microphone
on IN1L. Instead this tablet has the intmic on IN1L and the hsmic on IN2L.

Add IN1-InternalMic.conf and IN2-HeadsetMic.conf config snippets
under ucm2/codecs/wm5102/ for this and check the components string
to determine which microphone routes should be used.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/Intel/bytcr-wm5102/HiFi.conf       | 22 ++++++++++++++++++++--
 ucm2/codecs/wm5102/EnableSeq.conf       |  3 ++-
 ucm2/codecs/wm5102/IN1-InternalMic.conf | 23 +++++++++++++++++++++++
 ucm2/codecs/wm5102/IN2-HeadsetMic.conf  | 24 ++++++++++++++++++++++++
 4 files changed, 69 insertions(+), 3 deletions(-)
 create mode 100644 ucm2/codecs/wm5102/IN1-InternalMic.conf
 create mode 100644 ucm2/codecs/wm5102/IN2-HeadsetMic.conf

diff --git a/ucm2/Intel/bytcr-wm5102/HiFi.conf b/ucm2/Intel/bytcr-wm5102/HiFi.conf
index 2afc757..46ef7d1 100644
--- a/ucm2/Intel/bytcr-wm5102/HiFi.conf
+++ b/ucm2/Intel/bytcr-wm5102/HiFi.conf
@@ -32,5 +32,23 @@ If.spk {
 }
 
 Include.hp.File "/codecs/wm5102/HeadPhones.conf"
-Include.mic.File "/codecs/wm5102/IN3-InternalMic.conf"
-Include.headset.File "/codecs/wm5102/IN1-HeadsetMic.conf"
+
+If.intmic {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "cfg-intmic:in1l"
+	}
+	True.Include.intmic1.File "/codecs/wm5102/IN1-InternalMic.conf"
+	False.Include.intmic3.File "/codecs/wm5102/IN3-InternalMic.conf"
+}
+
+If.hsmic {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "cfg-hsmic:in2l"
+	}
+	True.Include.hsmic2.File "/codecs/wm5102/IN2-HeadsetMic.conf"
+	False.Include.hsmic1.File "/codecs/wm5102/IN1-HeadsetMic.conf"
+}
diff --git a/ucm2/codecs/wm5102/EnableSeq.conf b/ucm2/codecs/wm5102/EnableSeq.conf
index 87cb3bb..11166c0 100644
--- a/ucm2/codecs/wm5102/EnableSeq.conf
+++ b/ucm2/codecs/wm5102/EnableSeq.conf
@@ -7,8 +7,9 @@ EnableSequence [
 	cset "name='HPOUT2L Input 1' AIF1RX1"
 	cset "name='HPOUT2R Input 1' AIF1RX2"
 
-	# Both mics are quite soft by default, boost then
+	# mics are quite soft by default, boost then
 	cset "name='IN1L Volume' 28"
+	cset "name='IN2L Volume' 28"
 	cset "name='IN3L Volume' 28"
 
 	cset "name='Headphone Switch' off"
diff --git a/ucm2/codecs/wm5102/IN1-InternalMic.conf b/ucm2/codecs/wm5102/IN1-InternalMic.conf
new file mode 100644
index 0000000..d9a70ce
--- /dev/null
+++ b/ucm2/codecs/wm5102/IN1-InternalMic.conf
@@ -0,0 +1,23 @@
+SectionDevice."Mic" {
+	Comment "Internal Microphone"
+
+	ConflictingDevice [
+		"Headset"
+	]
+
+	EnableSequence [
+		cset "name='AIF1TX1 Input 1' IN1L"
+		cset "name='AIF1TX2 Input 1' IN1L"
+
+		cset "name='Internal Mic Switch' on"
+	]
+
+	DisableSequence [
+		cset "name='Internal Mic Switch' off"
+	]
+
+	Value {
+		CapturePriority 100
+		CapturePCM "hw:${CardId}"
+	}
+}
diff --git a/ucm2/codecs/wm5102/IN2-HeadsetMic.conf b/ucm2/codecs/wm5102/IN2-HeadsetMic.conf
new file mode 100644
index 0000000..8fbbcb1
--- /dev/null
+++ b/ucm2/codecs/wm5102/IN2-HeadsetMic.conf
@@ -0,0 +1,24 @@
+SectionDevice."Headset" {
+	Comment "Headset Microphone"
+
+	ConflictingDevice [
+		"Mic"
+	]
+
+	EnableSequence [
+		cset "name='AIF1TX1 Input 1' IN2L"
+		cset "name='AIF1TX2 Input 1' IN2L"
+
+		cset "name='Headset Mic Switch' on"
+	]
+
+	DisableSequence [
+		cset "name='Headset Mic Switch' off"
+	]
+
+	Value {
+		CapturePriority 200
+		CapturePCM "hw:${CardId}"
+		JackControl "Headset Mic Jack"
+	}
+}
-- 
2.41.0

