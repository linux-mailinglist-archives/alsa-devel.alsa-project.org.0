Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B9B41C168
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 11:14:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5301A16B0;
	Wed, 29 Sep 2021 11:13:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5301A16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632906881;
	bh=BtR9eY7PHJCIVK1YbFXlTNgoI36EYDZCtHMpAs4mkkw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kpl14ku6Gs1SyirXOxq1JqSCXVyGfyykEb7jxFhdXqx99ygvSD2ILOmwn+Zqj7JHt
	 SeTMP/CsqAwvuwRhX/u+Biqld16wk6t6O4ajkU9MkiDpjLSAoUSWK+k5KhG5hEVafU
	 oLC1YUvFyFMPJfQCthD0ntJ1I7nuF+SuQ/5/bZbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FD55F804FD;
	Wed, 29 Sep 2021 11:12:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42382F804F2; Wed, 29 Sep 2021 11:12:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20356F802C4
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 11:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20356F802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="S6bbwO1v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632906718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JRxi7g+MSd9FpJfL0aUfhvRhV9PhbJ+DNRj9UnZFn4U=;
 b=S6bbwO1vQO2qtero3chisCG3dfjPD6QLMHSK1G9Fj+ERhGlwQBRk/yRKsGWytQ4iUokx/n
 QM+jn6BqnFuus2cHPl68Q+d4HONF8NdQQbG9rla4mA/GDa3Ey6KKKePzIgiK35zXPDKm3H
 jfJg9QO9prj6O2sQld40MCj5WQbRvHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-voO5lqAcPKq3GnYY-awLQQ-1; Wed, 29 Sep 2021 05:11:54 -0400
X-MC-Unique: voO5lqAcPKq3GnYY-awLQQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDBAA362FB;
 Wed, 29 Sep 2021 09:11:53 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D196C100760B;
 Wed, 29 Sep 2021 09:11:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 4/5] bytcr-rt5640: Add support for a second
 headphones output
Date: Wed, 29 Sep 2021 11:11:43 +0200
Message-Id: <20210929091144.4778-5-hdegoede@redhat.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
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

Some devices (HP Elitepad 1000 G2) have a second headphones output
(1 on the dock, 2nd on the tablet itself) which is implemented through
the line-out output of the codec combined with an external hp-amp.

The kernel has recently gotten support for this setup and will
advertise this to userspace by adding cfg-hp2:lineout to the
components string, add support for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/bytcr-rt5640/HiFi-Components.conf |  9 +++++
 ucm2/bytcr-rt5640/HiFi.conf            | 18 ++++++++++
 ucm2/codecs/rt5640/HeadPhones2.conf    | 46 ++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 ucm2/codecs/rt5640/HeadPhones2.conf

diff --git a/ucm2/bytcr-rt5640/HiFi-Components.conf b/ucm2/bytcr-rt5640/HiFi-Components.conf
index 39c7f36..3f941ac 100644
--- a/ucm2/bytcr-rt5640/HiFi-Components.conf
+++ b/ucm2/bytcr-rt5640/HiFi-Components.conf
@@ -16,6 +16,15 @@ If.mono {
 	True.Define.HaveSpeaker "1"
 }
 
+If.hp2 {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "cfg-hp2:lineout"
+	}
+	True.Define.HaveHeadPhones2 "yes"
+}
+
 If.dmic1 {
 	Condition {
 		Type String
diff --git a/ucm2/bytcr-rt5640/HiFi.conf b/ucm2/bytcr-rt5640/HiFi.conf
index 604e7d9..2e099bd 100644
--- a/ucm2/bytcr-rt5640/HiFi.conf
+++ b/ucm2/bytcr-rt5640/HiFi.conf
@@ -2,6 +2,7 @@
 
 Define.HaveAif ""
 Define.HaveSpeaker ""
+Define.HaveHeadPhones2 ""
 Define.HaveInternalMic ""
 Define.HaveHeadsetMic "yes"
 Define.StereoADC2Mux "DMIC1"
@@ -116,6 +117,23 @@ If.hp {
 	}
 }
 
+If.hp2 {
+	Condition { Type String Empty "${var:HaveHeadPhones2}" }
+	False {
+		Include.hs.File "/codecs/rt5640/HeadPhones2.conf"
+
+		SectionDevice."Headphones2" {
+			EnableSequence [
+				cset "name='Line Out Switch' on"
+			]
+
+			DisableSequence [
+				cset "name='Line Out Switch' off"
+			]
+		}
+	}
+}
+
 If.dmic {
 	Condition {
 		Type String
diff --git a/ucm2/codecs/rt5640/HeadPhones2.conf b/ucm2/codecs/rt5640/HeadPhones2.conf
new file mode 100644
index 0000000..b75e420
--- /dev/null
+++ b/ucm2/codecs/rt5640/HeadPhones2.conf
@@ -0,0 +1,46 @@
+# The 2nd headset jack uses lineout with an external HP-amp
+
+SectionDevice."Headphones2" {
+	Comment "Headphones 2"
+
+	ConflictingDevice [
+		"Speaker"
+		"Headphones"
+	]
+
+	EnableSequence [
+		cset "name='LOUT MIX OUTVOL L Switch' on"
+		cset "name='LOUT MIX OUTVOL R Switch' on"
+		cset "name='OUT Channel Switch' on"
+	]
+
+	DisableSequence [
+		cset "name='LOUT MIX OUTVOL L Switch' off"
+		cset "name='LOUT MIX OUTVOL R Switch' off"
+		cset "name='OUT Channel Switch' off"
+	]
+
+	Value {
+		PlaybackPriority 400
+		PlaybackPCM "hw:${CardId}"
+		JackControl "Line Out Jack"
+		PlaybackMixerElem "OUT"
+		PlaybackVolume "OUT Playback Volume"
+		If.HpAif1 {
+			Condition {
+				Type String
+				String1 "${var:HaveAif}"
+				String2 "1"
+			}
+			True.PlaybackMasterElem "DAC1"
+		}
+		If.HpAif2 {
+			Condition {
+				Type String
+				String1 "${var:HaveAif}"
+				String2 "2"
+			}
+			True.PlaybackMasterElem "DAC2"
+		}
+	}
+}
-- 
2.31.1

