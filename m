Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 301E62D04E3
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Dec 2020 13:49:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C52F21760;
	Sun,  6 Dec 2020 13:48:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C52F21760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607258948;
	bh=G3Np7jkV0AbyFTFN8jiS/BqIQlJk/rZOQ8+tvFLrhvk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uiRen3DMN7J9yTodMfIlkIbgZWSWo71I8/2owcKR62sOg8o5xzVNB2RxIhbeXgRDn
	 iBYc9x0ER/LaOBD1cn0cl0WPkJbdkWN8xhWU4IokrpwE+gGSQ1ATtZVgksnrDS0Qx0
	 ODDDE2VuqCLRzVivxB/nHwgFcn7i3v5Hthsmjgc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEBD8F8026A;
	Sun,  6 Dec 2020 13:46:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0691DF8015F; Sun,  6 Dec 2020 13:46:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A121F8019D
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 13:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A121F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Z/gyXcZL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607258796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JO+hIPgLTN8vZGk6Oa+h3S185tTJK5P11qI4ottpHPA=;
 b=Z/gyXcZLI7KUWXM1zuYROq1FALj81j8ILLo2WJfg85hzYC43zY3QnZdS2imIW8wkhf7qdI
 qNhDoQ6kqC40FRShGTlOaj8O0e74uD5KZQO5dR0g8DojcavQo7jHXbxbp8Ru0WK7KJlnXn
 s8n7Wqk5r2Kf+rFaK2wyXPDPZpPyW7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-UEnXKotQMwKhPGiArXPWBQ-1; Sun, 06 Dec 2020 07:46:34 -0500
X-MC-Unique: UEnXKotQMwKhPGiArXPWBQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81FC2107ACE4;
 Sun,  6 Dec 2020 12:46:33 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-98.ams2.redhat.com [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A96905D9DB;
 Sun,  6 Dec 2020 12:46:30 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC SOF 2/2] topology: Add sof-cht-nau8824 topology file
Date: Sun,  6 Dec 2020 13:46:26 +0100
Message-Id: <20201206124626.13932-3-hdegoede@redhat.com>
In-Reply-To: <20201206124626.13932-1-hdegoede@redhat.com>
References: <20201206124626.13932-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

This uses the new sof-byt-codec-tdm4.m4 file, as the cht_bsw_nau8824
machine driver programs the link to TDM 4 slots 24 bit.

At first I thought it would be easier to just change the kernel to
use the standard I2S 2 channel 24 bit format as other codecs do,
but this causes problems with the right speaker/headphone channel
unless the chan mixer-control for this is changed from CH1 to CH0,
which requires UCM changes, so changing this at the kernel level will
break setups with older UCM files (and updating UCM will break older
kernels).

So we are stuck with the TDM 4 slots 24 bit format for these boards,
as we cannot change it without causing regressions.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 tools/topology/CMakeLists.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/topology/CMakeLists.txt b/tools/topology/CMakeLists.txt
index 57f908302..72f1c6ef4 100644
--- a/tools/topology/CMakeLists.txt
+++ b/tools/topology/CMakeLists.txt
@@ -63,6 +63,7 @@ set(TPLGS
 	"sof-byt-codec\;sof-cht-da7213\;-DCODEC=DA7213\;-DPLATFORM=cht-codec\;-DSSP_NUM=2"
 	"sof-byt-codec\;sof-cht-cx2072x\;-DCODEC=CX2072X\;-DPLATFORM=cht-codec\;-DSSP_NUM=2"
 	"sof-byt-codec\;sof-cht-es8316\;-DCODEC=ES8316\;-DPLATFORM=cht-codec\;-DSSP_NUM=2"
+	"sof-byt-codec-tdm4\;sof-cht-nau8824\;-DCODEC=NAU8824\;-DPLATFORM=cht-codec\;-DSSP_NUM=2"
 	"sof-cht-max98090\;sof-cht-max98090\;-DCODEC=MAX98090\;-DPLATFORM=cht-codec\;-DSSP_NUM=2"
 	"sof-cnl-rt274\;sof-cnl-rt274"
 	"sof-apl-tdf8532\;sof-apl-tdf8532"
-- 
2.28.0

