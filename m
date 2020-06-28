Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4380C20C95E
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jun 2020 19:47:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC4FA1662;
	Sun, 28 Jun 2020 19:46:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC4FA1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593366424;
	bh=1OYHH4hgp6XwABbmblX+yXfDTFRkJ6JBS0gnP8GoPrE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mxSZv6GOHJvhHjRbOQ6eWk/5LYFQIMLFZorr8H4F29gIehiATl8G8ckxpwBqOq9Ly
	 kO9EGvWg3GmkOAB93k7K035xF5GaKRph3+v11o8ZGiy/D0cESqPh7GblY0BdxmDR8K
	 za6DxHFh/D2F9V3CS7bUyt6LwOJcy1iXueOvdbpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20BC5F80253;
	Sun, 28 Jun 2020 19:44:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C08AF800F0; Sun, 28 Jun 2020 19:44:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFB3AF80096
 for <alsa-devel@alsa-project.org>; Sun, 28 Jun 2020 19:44:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFB3AF80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="MpHWeD2F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593366267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TcRg8noYX3LRRpmJuAI8PkbTVW5bTGE9P47wLwTouFM=;
 b=MpHWeD2FUJeTlSTfV1jcOlAveCp6rCQHYAovGcuhWAykjgjiNr+D1udRy2nRgt8T054L93
 4DhARCEctyrYzekcimF5UYxQkr2lZYVvBWGnSebbCMwMIRi9Ra1clDL3+NWzGrqvrVV4k6
 OQmhIJGqvLvXsJjkDpppX96hRCO8p3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-6QOoImEfOAeIN_ZztXDgng-1; Sun, 28 Jun 2020 13:44:24 -0400
X-MC-Unique: 6QOoImEfOAeIN_ZztXDgng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F126A80183C;
 Sun, 28 Jun 2020 17:44:23 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FE705D9D3;
 Sun, 28 Jun 2020 17:44:22 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 1/5] Fix invalid "Regex" Type in various Condition
 blocks
Date: Sun, 28 Jun 2020 19:44:17 +0200
Message-Id: <20200628174421.115133-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
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

Regex is not a valid Condition type, using it leads to errors like these:

ALSA lib ucm_cond.c:300:(if_eval) unknown If.Condition.Type
ALSA lib main.c:983:(snd_use_case_mgr_open) error: failed to import cht-bsw-rt5672 use case configuration -22
alsaucm: error failed to open sound card cht-bsw-rt5672: Invalid argument

Replacing it with "RegexMatch" fixes this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/cht-bsw-rt5672/HiFi.conf         | 4 ++--
 ucm2/chtnau8824/HiFi.conf             | 2 +-
 ucm2/chtrt5645/HiFi.conf              | 6 +++---
 ucm2/sof-soundwire/sof-soundwire.conf | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/ucm2/cht-bsw-rt5672/HiFi.conf b/ucm2/cht-bsw-rt5672/HiFi.conf
index 394e45d..dc8ddd5 100644
--- a/ucm2/cht-bsw-rt5672/HiFi.conf
+++ b/ucm2/cht-bsw-rt5672/HiFi.conf
@@ -9,7 +9,7 @@ Define.HeadsetMic "yes"
 
 If.cfg-dmic1 {
 	Condition {
-		Type Regex
+		Type RegexMatch
 		String "${CardLongName}"
 		Regex "(SoMeThInK1)" # fixme!
 	}
@@ -21,7 +21,7 @@ If.cfg-dmic1 {
 
 If.cfg-dmic2 {
 	Condition {
-		Type Regex
+		Type RegexMatch
 		String "${CardLongName}"
 		Regex "(LENOVO.*ThinkPad8)"
 	}
diff --git a/ucm2/chtnau8824/HiFi.conf b/ucm2/chtnau8824/HiFi.conf
index 6b7624d..3ccd6b1 100644
--- a/ucm2/chtnau8824/HiFi.conf
+++ b/ucm2/chtnau8824/HiFi.conf
@@ -2,7 +2,7 @@ Define.Speaker "Speaker"
 
 If.cfg-mspk {
 	Condition {
-		Type Regex
+		Type RegexMatch
 		String "${CardLongName}"
 		Regex "(cube-i1_TF|PIPO-W2S)"
 	}
diff --git a/ucm2/chtrt5645/HiFi.conf b/ucm2/chtrt5645/HiFi.conf
index fb8636d..5d0e3bf 100644
--- a/ucm2/chtrt5645/HiFi.conf
+++ b/ucm2/chtrt5645/HiFi.conf
@@ -4,7 +4,7 @@ Define.DigitalMic ""
 
 If.cfg-dmic1 {
 	Condition {
-		Type Regex
+		Type RegexMatch
 		String "${CardLongName}"
 		Regex "(ASUSTeK.*T100HAN|ASUSTeK.*T101HA)"
 	}
@@ -16,7 +16,7 @@ If.cfg-dmic1 {
 
 If.cfg-dmic2 {
 	Condition {
-		Type Regex
+		Type RegexMatch
 		String "${CardLongName}"
 		Regex "(LENOVO.*LenovoMIIX320|MEDION.*Wingman)"
 	}
@@ -28,7 +28,7 @@ If.cfg-dmic2 {
 
 If.cfg-mspk {
 	Condition {
-		Type Regex
+		Type RegexMatch
 		String "${CardLongName}"
 		Regex "(gpd-win-pocket-rt5645|TECLAST-X80Pro)"
 	}
diff --git a/ucm2/sof-soundwire/sof-soundwire.conf b/ucm2/sof-soundwire/sof-soundwire.conf
index fe43d5f..2ba44be 100644
--- a/ucm2/sof-soundwire/sof-soundwire.conf
+++ b/ucm2/sof-soundwire/sof-soundwire.conf
@@ -38,7 +38,7 @@ DefineRegex {
 
 If.hs_init {
 	Condition {
-		Type Regex
+		Type RegexMatch
 		Regex "(rt5682|rt700|rt711)"
 		String "${var:HeadsetCodec1}"
 	}
@@ -47,7 +47,7 @@ If.hs_init {
 
 If.mic_init {
 	Condition {
-		Type Regex
+		Type RegexMatch
 		Regex "(rt715)"
 		String "${var:MicCodec1}"
 	}
-- 
2.26.2

