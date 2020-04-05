Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B2419ED62
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Apr 2020 20:38:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11D5A1682;
	Sun,  5 Apr 2020 20:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11D5A1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586111914;
	bh=iHEkUq0IUK55nHoSxmM4+QS78Ikzk095quaQYY5zsQE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ik4GkTjOhukxD85mhmCVO8wMWGgOlFwfoDtJs0ENwz41M0oToN6CzsZbOyQTC30wf
	 EL9NzUNd95datHn+IzBNzXMz/zkBVLe4OsnZO4vDKTYh0PK3xNS/unyDk6dGmOQ4k0
	 jTK3B+OORxeJadPiiooWrmFQy41nzyL/rwFlSxMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCFA4F8029A;
	Sun,  5 Apr 2020 20:35:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92921F80216; Sun,  5 Apr 2020 20:35:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5850F801DA
 for <alsa-devel@alsa-project.org>; Sun,  5 Apr 2020 20:35:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5850F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="JARdVQgf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586111705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tDVqz1CEwwlFtzdvOTwRVcni+AzFty+d+ZTbj+MDgHU=;
 b=JARdVQgfnUXykqr4M2nDuEZYIhh84jqL8jvKJWzLM1SgWIO9uHtNPMb3hZpdZMXIGdypiM
 nbBWeZP7L6HUDN8iQYyyvo+rjneHloj77rwpygCmhUJMs431EG41yvFr74xsNki3LyMdpK
 YegOJaUAefd2grlv8vjSXjiYusrFP6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-8WFJYjDpM5ujgabYTYcCAA-1; Sun, 05 Apr 2020 14:35:03 -0400
X-MC-Unique: 8WFJYjDpM5ujgabYTYcCAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C94F107ACC7;
 Sun,  5 Apr 2020 18:35:02 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-60.ams2.redhat.com [10.36.112.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A858F98A51;
 Sun,  5 Apr 2020 18:35:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 5/5] cht-bsw-rt5672: Fix HiFi-stereo-dmic2 conf not loading /
 working
Date: Sun,  5 Apr 2020 20:34:54 +0200
Message-Id: <20200405183454.34515-5-hdegoede@redhat.com>
In-Reply-To: <20200405183454.34515-1-hdegoede@redhat.com>
References: <20200405183454.34515-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

Fix HiFi-stereo-dmic2 conf not loading because of references to
non existing devices in the ConflictingDevices sections.

Stop playing Rename + Remove tricks with the output (Speaker2) and
input (DMIC1) devices which we do not want to be part of this config,
this does not work now that we only allow devices which are actually
part of our config in the ConflictingDevices sections.

Instead start with only having devices which all configs have in
the ConflictingDevices sections (Headphones / Headset) and add the
other ones from our HiFi*.conf files after including the shared
basic configs.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1786723
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
I have tested that both HiFi.conf and HiFi-stereo-dmic2.conf work
properly after these changes.
---
 ucm2/cht-bsw-rt5672/HiFi-stereo-dmic2.conf | 6 ++----
 ucm2/cht-bsw-rt5672/HiFi.conf              | 8 ++++++++
 ucm2/codecs/rt5672/DMIC1.conf              | 1 -
 ucm2/codecs/rt5672/DMIC2.conf              | 1 -
 ucm2/codecs/rt5672/HeadPhones.conf         | 2 --
 ucm2/codecs/rt5672/HeadsetMic.conf         | 2 --
 ucm2/codecs/rt5672/MonoSpeaker.conf        | 1 -
 ucm2/codecs/rt5672/Speaker.conf            | 1 -
 8 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/ucm2/cht-bsw-rt5672/HiFi-stereo-dmic2.conf b/ucm2/cht-bsw-rt56=
72/HiFi-stereo-dmic2.conf
index 82c976b..5e06b42 100644
--- a/ucm2/cht-bsw-rt5672/HiFi-stereo-dmic2.conf
+++ b/ucm2/cht-bsw-rt5672/HiFi-stereo-dmic2.conf
@@ -12,11 +12,9 @@ SectionVerb {
 }
=20
 <codecs/rt5672/Speaker.conf>
-RenameDevice."Speaker1" "Speaker"
-RemoveDevice."Speaker2" "Speaker2"
 <codecs/rt5672/HeadPhones.conf>
+SectionDevice."Headphones".ConflictingDevice.0 "Speaker1"
=20
 <codecs/rt5672/DMIC2.conf>
-RenameDevice."Mic2" "Mic"
-RemoveDevice."Mic1" "Mic1"
 <codecs/rt5672/HeadsetMic.conf>
+SectionDevice."Headset".ConflictingDevice.0 "Mic2"
diff --git a/ucm2/cht-bsw-rt5672/HiFi.conf b/ucm2/cht-bsw-rt5672/HiFi.conf
index 9a64cc3..2dfa479 100644
--- a/ucm2/cht-bsw-rt5672/HiFi.conf
+++ b/ucm2/cht-bsw-rt5672/HiFi.conf
@@ -14,7 +14,15 @@ SectionVerb {
 <codecs/rt5672/Speaker.conf>
 <codecs/rt5672/MonoSpeaker.conf>
 <codecs/rt5672/HeadPhones.conf>
+SectionDevice."Speaker1".ConflictingDevice.1 "Speaker2"
+SectionDevice."Speaker2".ConflictingDevice.1 "Speaker1"
+SectionDevice."Headphones".ConflictingDevice.0 "Speaker1"
+SectionDevice."Headphones".ConflictingDevice.1 "Speaker2"
=20
 <codecs/rt5672/DMIC1.conf>
 <codecs/rt5672/DMIC2.conf>
 <codecs/rt5672/HeadsetMic.conf>
+SectionDevice."Mic1".ConflictingDevice.1 "Mic2"
+SectionDevice."Mic2".ConflictingDevice.1 "Mic1"
+SectionDevice."Headset".ConflictingDevice.0 "Mic1"
+SectionDevice."Headset".ConflictingDevice.1 "Mic2"
diff --git a/ucm2/codecs/rt5672/DMIC1.conf b/ucm2/codecs/rt5672/DMIC1.conf
index 2018283..acc26f7 100644
--- a/ucm2/codecs/rt5672/DMIC1.conf
+++ b/ucm2/codecs/rt5672/DMIC1.conf
@@ -2,7 +2,6 @@ SectionDevice."Mic1" {
 =09Comment "Internal Digital Microphone on DMIC1"
=20
 =09ConflictingDevice [
-=09=09"Mic2"
 =09=09"Headset"
 =09]
=20
diff --git a/ucm2/codecs/rt5672/DMIC2.conf b/ucm2/codecs/rt5672/DMIC2.conf
index 48e6170..abe139b 100644
--- a/ucm2/codecs/rt5672/DMIC2.conf
+++ b/ucm2/codecs/rt5672/DMIC2.conf
@@ -2,7 +2,6 @@ SectionDevice."Mic2" {
 =09Comment "Internal Digital Microphone on DMIC2"
=20
 =09ConflictingDevice [
-=09=09"Mic1"
 =09=09"Headset"
 =09]
=20
diff --git a/ucm2/codecs/rt5672/HeadPhones.conf b/ucm2/codecs/rt5672/HeadPh=
ones.conf
index 2c8d6e8..9178607 100644
--- a/ucm2/codecs/rt5672/HeadPhones.conf
+++ b/ucm2/codecs/rt5672/HeadPhones.conf
@@ -2,8 +2,6 @@ SectionDevice."Headphones" {
 =09Comment "Headphones"
=20
 =09ConflictingDevice [
-=09=09"Speaker1"
-=09=09"Speaker2"
 =09]
=20
 =09EnableSequence [
diff --git a/ucm2/codecs/rt5672/HeadsetMic.conf b/ucm2/codecs/rt5672/Headse=
tMic.conf
index a764d82..e04c3ce 100644
--- a/ucm2/codecs/rt5672/HeadsetMic.conf
+++ b/ucm2/codecs/rt5672/HeadsetMic.conf
@@ -2,8 +2,6 @@ SectionDevice."Headset" {
 =09Comment "Headset Microphone"
=20
 =09ConflictingDevice [
-=09=09"Mic1"
-=09=09"Mic2"
 =09]
=20
 =09EnableSequence [
diff --git a/ucm2/codecs/rt5672/MonoSpeaker.conf b/ucm2/codecs/rt5672/MonoS=
peaker.conf
index f08c9c6..88c39d2 100644
--- a/ucm2/codecs/rt5672/MonoSpeaker.conf
+++ b/ucm2/codecs/rt5672/MonoSpeaker.conf
@@ -2,7 +2,6 @@ SectionDevice."Speaker2" {
 =09Comment "Mono Speaker"
=20
 =09ConflictingDevice [
-=09=09"Speaker1"
 =09=09"Headphones"
 =09]
=20
diff --git a/ucm2/codecs/rt5672/Speaker.conf b/ucm2/codecs/rt5672/Speaker.c=
onf
index 8b7bcf8..c70ffae 100644
--- a/ucm2/codecs/rt5672/Speaker.conf
+++ b/ucm2/codecs/rt5672/Speaker.conf
@@ -2,7 +2,6 @@ SectionDevice."Speaker1" {
 =09Comment "Stereo Speakers"
=20
 =09ConflictingDevice [
-=09=09"Speaker2"
 =09=09"Headphones"
 =09]
=20
--=20
2.26.0

