Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 123162DC349
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Dec 2020 16:40:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A376917F8;
	Wed, 16 Dec 2020 16:39:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A376917F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608133229;
	bh=q2TtwsfKyGfUXSdApyawZmYVOzM+uYi3wEaveDDGzeM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i1H+BEm6ewT0WslGsZi/8w1/eWRhu8RAuZuy1XR7+DLUhVHhyOq1vWGS1hUCjXdsS
	 xWhxzPdEegz8htDrBvDcCyUn2KsQ0cR5dfG54bmjA75R2WCQAsQCa3uLsahae6ptuK
	 nIgsI8VZ4RCyBH1f5Tt7GKB4/sT3MH9lrGA1DW/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F037F804CA;
	Wed, 16 Dec 2020 16:38:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2711EF80168; Wed, 16 Dec 2020 16:38:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7C64F80272
 for <alsa-devel@alsa-project.org>; Wed, 16 Dec 2020 16:38:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7C64F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="aSKKapj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608133126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJXp6UEMcReBTy9sdIGPjZlonnYD8dHy6PRyEeZJ4Ag=;
 b=aSKKapj8Tt6v0u/rIPLcFmYYr+W6ZVrnsdzEO7TxIJhRJVVSk5eAQ1APse7N9YVJFX8YdP
 OfwFvy8Ui9ylrI+0OqLcrL17zTZNipWfo0/1Lj3IruYuzF+Q3tr76Tn6Ve7ZJxxWfrNkld
 BosD1B7vJHj37OF+QrInUERhN1F7/f0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-EoLypP9FPoGC6GoUUglEfA-1; Wed, 16 Dec 2020 10:38:43 -0500
X-MC-Unique: EoLypP9FPoGC6GoUUglEfA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4430A1E7C1;
 Wed, 16 Dec 2020 15:38:42 +0000 (UTC)
Received: from x1.localdomain (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4741660C9C;
 Wed, 16 Dec 2020 15:38:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 2/3] chtnau8824: Add a SST define/variable
Date: Wed, 16 Dec 2020 16:38:37 +0100
Message-Id: <20201216153838.34945-2-hdegoede@redhat.com>
In-Reply-To: <20201216153838.34945-1-hdegoede@redhat.com>
References: <20201216153838.34945-1-hdegoede@redhat.com>
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

Add a SST define which gets set to "yes" when using the SST driver
and to "" when not using the SST driver;

And decide if platforms/bytcr/PlatformEnableSeq.conf should be included
or not based on this.

This is a preparation patch for adding SOF support.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/chtnau8824/HiFi.conf | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/ucm2/chtnau8824/HiFi.conf b/ucm2/chtnau8824/HiFi.conf
index 105f360..b36588f 100644
--- a/ucm2/chtnau8824/HiFi.conf
+++ b/ucm2/chtnau8824/HiFi.conf
@@ -1,5 +1,16 @@
 Define.Speaker "Speaker"
 Define.Mic "InternalMic"
+Define.SST "yes"
+
+If.Controls {
+	Condition {
+		Type ControlExists
+		Control "name='media0_in Gain 0 Switch'"
+	}
+	False {
+		Define.SST ""
+	}
+}
 
 If.cfg-mspk {
 	Condition {
@@ -33,12 +44,12 @@ SectionVerb {
 
 	Include.e.File "/codecs/nau8824/EnableSeq.conf"
 
-	If.Controls {
+	If.SST {
 		Condition {
-			Type ControlExists
-			Control "name='media0_in Gain 0 Switch'"
+			Type String
+			Empty "${var:SST}"
 		}
-		True {
+		False {
 			Include.pe {
 				File "/platforms/bytcr/PlatformEnableSeq.conf"
 				Before.EnableSequence "0"
-- 
2.28.0

