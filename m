Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 245911312A1
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jan 2020 14:13:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A20B21802;
	Mon,  6 Jan 2020 14:13:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A20B21802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578316435;
	bh=obUW4yuwlmiSsc/O82MNtnccANXhxRgTYuH0UUSlZfQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a74g3E782iAcUoBD8AjVOQjWJebE7Ge6i9CqDIpTzhOW9htp1BYZTZ1MBjNRrb60y
	 FUtte9oRc9yvI1XMVDqcIBwwlD4A7sz4JvEMMQ5OP7kZZj266DXzZWbcVkDyFVFpTA
	 Ya5lBwS0UImSy6kKlLWPDZZjZLo2wEeov6HTPU1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCF92F80116;
	Mon,  6 Jan 2020 14:12:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9B1AF80159; Mon,  6 Jan 2020 14:12:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 063E7F80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jan 2020 14:12:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 063E7F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="fe3L7AmN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578316326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SC/5k3jXloywAD+A5e5Kko/Zr6C5D3RsCItukIr+alM=;
 b=fe3L7AmNj8vHtGEzB4HaZyofG//8lRYoVqk9Aizsw0kAIdkTrUhSfnLjRhu8TiJ1Y+W5j4
 nMioaFE9twRpr3KtqvrCyEBHLVGgPSi1bmzcaydGJ+aJHjjjYU/2+Cx8LPd3ZH55TgZNjM
 +kOQwU2gh54H8JT6id26IKxb8HANABc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-MRlefAt6Mp2S3nH70UYnbQ-1; Mon, 06 Jan 2020 08:12:04 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DE0C8024D4;
 Mon,  6 Jan 2020 13:12:03 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-130.ams2.redhat.com
 [10.36.116.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74C065D9CA;
 Mon,  6 Jan 2020 13:12:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Date: Mon,  6 Jan 2020 14:11:59 +0100
Message-Id: <20200106131159.476744-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: MRlefAt6Mp2S3nH70UYnbQ-1
X-Mimecast-Spam-Score: 0
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 youling 257 <youling257@gmail.com>
Subject: [alsa-devel] [PATCH alsa-ucm-conf] bytcht-es8316: Fix missing
	including of HeadPhones.conf after ucm2 conversion
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The conversion to ucm2 format missed adding an include for:

codecs/es8316/HeadPhones.conf

Leading to no sound on the headphones output, this commit adds the missing
include fixing this.

Cc: youling 257 <youling257@gmail.com>
Reported-by: youling 257 <youling257@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/bytcht-es8316/HiFi-Components.conf | 2 ++
 ucm2/bytcht-es8316/HiFi-LongName.conf   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/ucm2/bytcht-es8316/HiFi-Components.conf b/ucm2/bytcht-es8316/HiFi-Components.conf
index 314d355..c40bd49 100644
--- a/ucm2/bytcht-es8316/HiFi-Components.conf
+++ b/ucm2/bytcht-es8316/HiFi-Components.conf
@@ -20,6 +20,8 @@ If.mono {
 	}
 }
 
+<codecs/es8316/HeadPhones.conf>
+
 If.in1 {
 	Condition {
 		Type String
diff --git a/ucm2/bytcht-es8316/HiFi-LongName.conf b/ucm2/bytcht-es8316/HiFi-LongName.conf
index ea7d1c3..03cf17b 100644
--- a/ucm2/bytcht-es8316/HiFi-LongName.conf
+++ b/ucm2/bytcht-es8316/HiFi-LongName.conf
@@ -20,6 +20,8 @@ If.mono {
 	}
 }
 
+<codecs/es8316/HeadPhones.conf>
+
 If.in1 {
 	Condition {
 		Type String
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
