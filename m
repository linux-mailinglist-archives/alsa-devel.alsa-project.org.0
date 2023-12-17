Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E098162A8
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Dec 2023 22:51:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91462E11;
	Sun, 17 Dec 2023 22:51:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91462E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702849903;
	bh=GU3hfZz19sAHuMrZ8W9TiGM5sRPof3MoEt5F+U5hB7U=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bON/TwNO+aYhikn5/1MId51eTc6TpKCX0FlXJErB5k+0SBnOfQcz3LvQLyEqPSe3F
	 dLReM1+5eD0yVmP1tgro+bBelUHWuGMs5ShU7/TxJid4zAKSxewpA9mVAi2wh3eW1W
	 iNVEmu32Av/tAPhpjL++CXgnixD5ju8eGzFUsYSE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07A34F8057D; Sun, 17 Dec 2023 22:51:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58E48F8057A;
	Sun, 17 Dec 2023 22:51:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DA8CF80425; Sun, 17 Dec 2023 22:51:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71BE5F80124
	for <alsa-devel@alsa-project.org>; Sun, 17 Dec 2023 22:50:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71BE5F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=SWGgSyoq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702849858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HtC7Nh3FuyDV7+FyETXkq7G59tZctkRklsdCFnSDDB4=;
	b=SWGgSyoq3psoR3SbtGq/lIP3shdFDLd7RP4w6/c5PRGAjk1wckxMlSFB3N4tk9XJ2A0LBQ
	dt/GqbM9V8pjDiywOfYBbEG3cofKC8CjZJt20uHgJi2j4Z6Yto7Deyj988iQsv8qtU148c
	4gGY4N6izd/AIHaBPBhxTrelKXIGfZM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-mLoPz6XAO3eH2t2I_dJOBg-1; Sun,
 17 Dec 2023 16:50:57 -0500
X-MC-Unique: mLoPz6XAO3eH2t2I_dJOBg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4B451C0514C;
	Sun, 17 Dec 2023 21:50:56 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.105])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF1C9492BF0;
	Sun, 17 Dec 2023 21:50:55 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <bard.liao@intel.com>,
	alsa-devel@alsa-project.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH alsa-ucm-conf] ucm2: bytcr-rt5640: Add support for swapped
 speakers
Date: Sun, 17 Dec 2023 22:50:55 +0100
Message-ID: <20231217215055.50296-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: YWEX72DCQUL2K3WLQEHSYPAKQPK35DF4
X-Message-ID-Hash: YWEX72DCQUL2K3WLQEHSYPAKQPK35DF4
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YWEX72DCQUL2K3WLQEHSYPAKQPK35DF4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some BYTCR x86 tablets with a rt5640 codec have their speakers
swapped. This is indicated by the kernel by setting cfg-spk:swapped
in the components string. Add support for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/Intel/bytcr-rt5640/HiFi.conf | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/ucm2/Intel/bytcr-rt5640/HiFi.conf b/ucm2/Intel/bytcr-rt5640/HiFi.conf
index fd1906c..7e10db5 100644
--- a/ucm2/Intel/bytcr-rt5640/HiFi.conf
+++ b/ucm2/Intel/bytcr-rt5640/HiFi.conf
@@ -70,6 +70,7 @@ If.spk {
 
 		SectionDevice."Speaker" {
 			EnableSequence [
+				cset "name='DAC IF1 Data Switch' Normal"
 				cset "name='Speaker Switch' on"
 			]
 
@@ -91,6 +92,31 @@ If.mono {
 
 		SectionDevice."Speaker" {
 			EnableSequence [
+				cset "name='DAC IF1 Data Switch' Normal"
+				cset "name='Speaker Switch' on"
+			]
+
+			DisableSequence [
+				cset "name='Speaker Switch' off"
+			]
+		}
+	}
+}
+
+# Note this direcly looks at CardComponents since this is never set
+# by HiFi-LongName.conf
+If.swapped {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "cfg-spk:swapped"
+	}
+	True {
+		Include.spk.File "/codecs/rt5640/Speaker.conf"
+
+		SectionDevice."Speaker" {
+			EnableSequence [
+				cset "name='DAC IF1 Data Switch' Swap"
 				cset "name='Speaker Switch' on"
 			]
 
@@ -108,6 +134,7 @@ If.hp {
 
 		SectionDevice."Headphones" {
 			EnableSequence [
+				cset "name='DAC IF1 Data Switch' Normal"
 				cset "name='Headphone Switch' on"
 			]
 
@@ -125,6 +152,7 @@ If.hp2 {
 
 		SectionDevice."Headphones2" {
 			EnableSequence [
+				cset "name='DAC IF1 Data Switch' Normal"
 				cset "name='Line Out Switch' on"
 			]
 
-- 
2.41.0

