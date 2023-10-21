Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5E87D1D7D
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Oct 2023 16:32:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C08C0832;
	Sat, 21 Oct 2023 16:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C08C0832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697898750;
	bh=JVqwtD96APy09LLksW4TxawD3GByRpXnrDYOI5dmXUM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bVcxMjurN5KmgWrEg1dUWZWgTQQd7nAvQ8oUovy4eqHDbQCQXb1ef4xQIaPXALMgs
	 b5MIRjYaanbcAmnumgGECAUKzr9QvIeo2wUr/N8/V+LGixDxO+1v8IFWKf7FfQMy0R
	 nPJvMNuTMa0wTFw39rBXOMfchdwtaT3XG+rKym+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F910F8032D; Sat, 21 Oct 2023 16:31:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6BA6F8024E;
	Sat, 21 Oct 2023 16:31:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2F36F8025F; Sat, 21 Oct 2023 16:31:33 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CCB8DF80166
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 16:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCB8DF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=R1WjvG/3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697898682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NU7VBh/6Ma/QwKJ7w6i1Rs0u+taH0flV/SFRvioR6mQ=;
	b=R1WjvG/3YMjzScqQSubvX0HsWHomKFBDLCdklN3oo7xTEgBXq1m+Ouwep54T0wu34o+I9B
	Glp4iRvObt1pTzPB8yO/eubv/5Hmr7hndb0GL6efYWgFLRydOMEA9kRu0429vTTWQSbqGM
	ZE10fSceqJdy0zij01DNGMP4H0TxNeg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-SfftkgtJPdqXRQn1JPPCsg-1; Sat, 21 Oct 2023 10:31:18 -0400
X-MC-Unique: SfftkgtJPdqXRQn1JPPCsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8089529ABA36;
	Sat, 21 Oct 2023 14:31:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 735F840C6F7B;
	Sat, 21 Oct 2023 14:31:17 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <bard.liao@intel.com>,
	alsa-devel@alsa-project.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH alsa-ucm-conf] chtnau8824: Mono speaker fixes
Date: Sat, 21 Oct 2023 16:31:09 +0200
Message-ID: <20231021143109.52210-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: DN3VHD6TCTHRARI5OUMMIEDNTECN7OL5
X-Message-ID-Hash: DN3VHD6TCTHRARI5OUMMIEDNTECN7OL5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DN3VHD6TCTHRARI5OUMMIEDNTECN7OL5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

2 mono speaker setup fixes:

1. Use the kernel's components string to check for a mono-speaker device
when the board has a components string.

2. So far known nau8824 boards with a mono speaker where using the right
speaker channel, which is unusual. Normally mono speaker setups use
only the left speaker channel. The Cyberbook T116 tablet is a nau8824
based model, which indeed uses the left speaker channel for its single
speaker.

Modify ucm2/codecs/nau8824/MonoSpeaker.conf to send a left+right
channel mix to both speaker channels, so that things will work
independent of which speaker channel is used for a mono setup.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/Intel/chtnau8824/HiFi.conf      | 15 +++++++++++++++
 ucm2/codecs/nau8824/MonoSpeaker.conf |  7 ++++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/ucm2/Intel/chtnau8824/HiFi.conf b/ucm2/Intel/chtnau8824/HiFi.conf
index c3d830d..1a1faf4 100644
--- a/ucm2/Intel/chtnau8824/HiFi.conf
+++ b/ucm2/Intel/chtnau8824/HiFi.conf
@@ -14,6 +14,21 @@ If.Controls {
 	}
 }
 
+# Figure out which components are in use on the device, we check both the
+# components string (present on newer kernels) as well as checking for DMI
+# strings for compatibility with older kernels. Note DMI matches for new
+# models should only be added to the kernel, this UCM profile will then
+# automatically pick up the info from the components string.
+
+If.components-mono-spk {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "cfg-spk:1"
+	}
+	True.Define.Speaker "MonoSpeaker"
+}
+
 If.cfg-mspk {
 	Condition {
 		Type RegexMatch
diff --git a/ucm2/codecs/nau8824/MonoSpeaker.conf b/ucm2/codecs/nau8824/MonoSpeaker.conf
index 6b4ef8a..5428133 100644
--- a/ucm2/codecs/nau8824/MonoSpeaker.conf
+++ b/ucm2/codecs/nau8824/MonoSpeaker.conf
@@ -11,9 +11,10 @@ SectionDevice."Speaker" {
 	]
 
 	EnableSequence [
-		# nau8824 mono speaker boards have the speaker on the right chan
-		cset "name='Speaker Left DACL Volume' 0"
-		cset "name='Speaker Left DACR Volume' 0"
+		# Some nau8824 mono speaker boards have the speaker on the right chan
+		# others on the left, enable output of both channels on both speakers
+		cset "name='Speaker Left DACL Volume' 1"
+		cset "name='Speaker Left DACR Volume' 1"
 		cset "name='Speaker Right DACL Volume' 1"
 		cset "name='Speaker Right DACR Volume' 1"
 		cset "name='Ext Spk Switch' on"
-- 
2.41.0

