Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED5E2DC345
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Dec 2020 16:39:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 063B017E0;
	Wed, 16 Dec 2020 16:38:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 063B017E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608133181;
	bh=j1QTUWN/q8oBdXgp9qSVETOQNvC33m0f7xDhMb59gUY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p0YAZi1brwec+p8nfnQlhw5+/q6Xmd64YbuPejGGP7SSDlbET2UNx0PC4/OeVX0oI
	 uosNoJU1vCK4PRE7h9rsWwTTiUNICNO8hWv4ZMioAWfMB/DYZSHmtVTf2Qhw3Iv7xe
	 nAZofA0MrDGvzg9USFu6ubuSPtLbaLl+hiViEr3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB21EF80274;
	Wed, 16 Dec 2020 16:38:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F1BEF80272; Wed, 16 Dec 2020 16:38:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8FD8F80168
 for <alsa-devel@alsa-project.org>; Wed, 16 Dec 2020 16:38:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8FD8F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="MLCCBVLJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608133123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JTF0o9oV4RmYD6ED/gY1H41/0K08xXARiFU7Fd9/Wgw=;
 b=MLCCBVLJXmRc3vriFnUocQgtFbSoTtQC5LIkipw6fp8PA5JoF15IU81lsksVUch4uLCGJT
 J8gO716aJT47uddWwS4IyIH8/qjAisjDlB+x1OPyWUR6ehtl+axVcXpU5uPnq8B+cPkrgK
 ABGMQta0xt6ureCZ3Vc3/CML2fn5gLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-KIU3FAL9PH2lkikUzF37cQ-1; Wed, 16 Dec 2020 10:38:42 -0500
X-MC-Unique: KIU3FAL9PH2lkikUzF37cQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0515107B46F;
 Wed, 16 Dec 2020 15:38:40 +0000 (UTC)
Received: from x1.localdomain (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45F2660861;
 Wed, 16 Dec 2020 15:38:38 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 1/3] chtnau8824: Move DAC Channel Source
 selection to Speaker/Headphones EnableSeq
Date: Wed, 16 Dec 2020 16:38:36 +0100
Message-Id: <20201216153838.34945-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Move DAC Channel Source selection to Speaker/Headphones EnableSeq.

The main reason for doing this is to make it easier to allow using
variables, as the Speaker/Headphones conf files are evaluated after
the main HiFi.conf had a chance to set them.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/codecs/nau8824/EnableSeq.conf   | 3 ---
 ucm2/codecs/nau8824/HeadPhones.conf  | 2 ++
 ucm2/codecs/nau8824/MonoSpeaker.conf | 2 ++
 ucm2/codecs/nau8824/Speaker.conf     | 2 ++
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/ucm2/codecs/nau8824/EnableSeq.conf b/ucm2/codecs/nau8824/EnableSeq.conf
index 3650d06..2595e5f 100644
--- a/ucm2/codecs/nau8824/EnableSeq.conf
+++ b/ucm2/codecs/nau8824/EnableSeq.conf
@@ -1,7 +1,4 @@
 EnableSequence [
-	# Playback TDM configuration
-	cset "name='DACL Channel Source' 0"
-	cset "name='DACR Channel Source' 1"
 	# Input Configuration
 	cset "name='DMIC1 Enable Switch' off"
 	cset "name='DMIC2 Enable Switch' off"
diff --git a/ucm2/codecs/nau8824/HeadPhones.conf b/ucm2/codecs/nau8824/HeadPhones.conf
index a807f84..46ec5d7 100644
--- a/ucm2/codecs/nau8824/HeadPhones.conf
+++ b/ucm2/codecs/nau8824/HeadPhones.conf
@@ -12,6 +12,8 @@ SectionDevice."Headphones" {
 	]
 
 	EnableSequence [
+		cset "name='DACL Channel Source' 0"
+		cset "name='DACR Channel Source' 1"
 		cset "name='Headphone Switch' on"
 	]
 
diff --git a/ucm2/codecs/nau8824/MonoSpeaker.conf b/ucm2/codecs/nau8824/MonoSpeaker.conf
index 6b4ef8a..09edea5 100644
--- a/ucm2/codecs/nau8824/MonoSpeaker.conf
+++ b/ucm2/codecs/nau8824/MonoSpeaker.conf
@@ -11,6 +11,8 @@ SectionDevice."Speaker" {
 	]
 
 	EnableSequence [
+		cset "name='DACL Channel Source' 0"
+		cset "name='DACR Channel Source' 1"
 		# nau8824 mono speaker boards have the speaker on the right chan
 		cset "name='Speaker Left DACL Volume' 0"
 		cset "name='Speaker Left DACR Volume' 0"
diff --git a/ucm2/codecs/nau8824/Speaker.conf b/ucm2/codecs/nau8824/Speaker.conf
index a995873..64d7eee 100644
--- a/ucm2/codecs/nau8824/Speaker.conf
+++ b/ucm2/codecs/nau8824/Speaker.conf
@@ -11,6 +11,8 @@ SectionDevice."Speaker" {
 	]
 
 	EnableSequence [
+		cset "name='DACL Channel Source' 0"
+		cset "name='DACR Channel Source' 1"
 		cset "name='Speaker Left DACL Volume' 1"
 		cset "name='Speaker Left DACR Volume' 0"
 		cset "name='Speaker Right DACL Volume' 0"
-- 
2.28.0

