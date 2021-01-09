Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 649B92F03B0
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Jan 2021 22:05:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E03E916F8;
	Sat,  9 Jan 2021 22:04:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E03E916F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610226302;
	bh=GzZJExIryUdWh6fr1HKfieNkK+t3GE0JIEkBIGay/U4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ELlnITW6TQUBJiIPfcL8M6qu3xC79RTfNzu1iPv7A1uVxuo/ZLmpJV09Pafzi7M/h
	 piWtx+qyKH6R26a4wafpRubjkP4Bx5HUZ3jCpSFDugm9XhI9BmW3XtN4Zv6JweFYR9
	 WcKAJZx/ixapGg4q4jEUY0goi3sxSdBvgj5lQnz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 931F3F804D6;
	Sat,  9 Jan 2021 22:03:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 986C9F804D6; Sat,  9 Jan 2021 22:03:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD75DF801F5
 for <alsa-devel@alsa-project.org>; Sat,  9 Jan 2021 22:03:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD75DF801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="HqnosZLm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610226179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPSBsAF1/mETDKSW+428hPTt3J6wkJb+epDI/JbPG/4=;
 b=HqnosZLm9RSMpzPiyvz4yot4oB3Sj1r6umRVmo3zBB5NP5lyGToEKigh9abvI9Hm8M7YVE
 xXgQFhKG09QaDb9JsCu622FD5SRlzsUsuul9q4aU/rQ1F1EIglEX60jjiwFcIw4jj4DMT6
 MOAq49tqnD+W6TRgTxIjzHGxb00o6KM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-ekyHrc9UM6Gb8xDVus-a6g-1; Sat, 09 Jan 2021 16:02:57 -0500
X-MC-Unique: ekyHrc9UM6Gb8xDVus-a6g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7606E801A9D;
 Sat,  9 Jan 2021 21:02:56 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-11.ams2.redhat.com [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EC6C648A8;
 Sat,  9 Jan 2021 21:02:55 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 2/2] rt5640: Move standard DAC setup to
 EnableSeq.conf
Date: Sat,  9 Jan 2021 22:02:52 +0100
Message-Id: <20210109210252.159162-2-hdegoede@redhat.com>
In-Reply-To: <20210109210252.159162-1-hdegoede@redhat.com>
References: <20210109210252.159162-1-hdegoede@redhat.com>
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

No matter which output is used, we always need to setup the standard
DAC config. Move this to the shared EnableSeq.conf to avoid having
to duplicate it in various places.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/codecs/rt5640/EnableSeq.conf   | 6 ++++++
 ucm2/codecs/rt5640/HeadPhones.conf  | 6 ------
 ucm2/codecs/rt5640/MonoSpeaker.conf | 6 ------
 ucm2/codecs/rt5640/Speaker.conf     | 6 ------
 4 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/ucm2/codecs/rt5640/EnableSeq.conf b/ucm2/codecs/rt5640/EnableSeq.conf
index cbf4038..145a23b 100644
--- a/ucm2/codecs/rt5640/EnableSeq.conf
+++ b/ucm2/codecs/rt5640/EnableSeq.conf
@@ -1,5 +1,11 @@
 EnableSequence [
 	# RT5640 default output routing
+	cset "name='DAC MIXL INF1 Switch' on"
+	cset "name='DAC MIXR INF1 Switch' on"
+	cset "name='Stereo DAC MIXL DAC L1 Switch' on"
+	cset "name='Stereo DAC MIXR DAC R1 Switch' on"
+	cset "name='Stereo DAC MIXL DAC L2 Switch' on"
+	cset "name='Stereo DAC MIXR DAC R2 Switch' on"
 	cset "name='OUT MIXL DAC L1 Switch'  on"
 	cset "name='OUT MIXR DAC R1 Switch'  on"
 
diff --git a/ucm2/codecs/rt5640/HeadPhones.conf b/ucm2/codecs/rt5640/HeadPhones.conf
index b7707e5..a9e4d20 100644
--- a/ucm2/codecs/rt5640/HeadPhones.conf
+++ b/ucm2/codecs/rt5640/HeadPhones.conf
@@ -14,12 +14,6 @@ SectionDevice."Headphones" {
 	}
 
 	EnableSequence [
- 		cset "name='DAC MIXL INF1 Switch'  on"
- 		cset "name='DAC MIXR INF1 Switch'  on"
- 		cset "name='Stereo DAC MIXL DAC L1 Switch'  on"
- 		cset "name='Stereo DAC MIXR DAC R1 Switch'  on"
-		cset "name='Stereo DAC MIXL DAC L2 Switch'  on"
- 		cset "name='Stereo DAC MIXR DAC R2 Switch'  on"
  		cset "name='HPO MIX HPVOL Switch'  on"
  		cset "name='Headphone Switch'  on"
 		cset "name='HP Channel Switch' on"
diff --git a/ucm2/codecs/rt5640/MonoSpeaker.conf b/ucm2/codecs/rt5640/MonoSpeaker.conf
index ddc7ba8..23cf34c 100644
--- a/ucm2/codecs/rt5640/MonoSpeaker.conf
+++ b/ucm2/codecs/rt5640/MonoSpeaker.conf
@@ -6,12 +6,6 @@ SectionDevice."Speaker" {
 	]
 
 	EnableSequence [
-		cset "name='DAC MIXL INF1 Switch' on"
-		cset "name='DAC MIXR INF1 Switch' on"
-		cset "name='Stereo DAC MIXL DAC L1 Switch' on"
-		cset "name='Stereo DAC MIXR DAC R1 Switch' on"
-		cset "name='Stereo DAC MIXL DAC L2 Switch'  on"
-		cset "name='Stereo DAC MIXR DAC R2 Switch'  on"
 		cset "name='SPK MIXL DAC L1 Switch' on"
 		cset "name='SPK MIXR DAC R1 Switch' on"
 		cset "name='SPOL MIX SPKVOL L Switch' on"
diff --git a/ucm2/codecs/rt5640/Speaker.conf b/ucm2/codecs/rt5640/Speaker.conf
index 411cd13..422cfdf 100644
--- a/ucm2/codecs/rt5640/Speaker.conf
+++ b/ucm2/codecs/rt5640/Speaker.conf
@@ -6,12 +6,6 @@ SectionDevice."Speaker" {
 	]
 
 	EnableSequence [
-		cset "name='DAC MIXL INF1 Switch' on"
-		cset "name='DAC MIXR INF1 Switch' on"
-		cset "name='Stereo DAC MIXL DAC L1 Switch' on"
-		cset "name='Stereo DAC MIXR DAC R1 Switch' on"
-		cset "name='Stereo DAC MIXL DAC L2 Switch'  on"
- 		cset "name='Stereo DAC MIXR DAC R2 Switch'  on"
 		cset "name='SPK MIXL DAC L1 Switch' on"
 		cset "name='SPK MIXR DAC R1 Switch' on"
 		cset "name='SPOL MIX SPKVOL L Switch' on"
-- 
2.28.0

