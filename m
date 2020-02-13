Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1301615BD9C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 12:22:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A7981673;
	Thu, 13 Feb 2020 12:21:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A7981673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581592968;
	bh=SmdBO+r1H4R4DWIOjw87XJxk6insD6WTSC1ey3aKvZw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k9ynncwnMWv4LTt+ob3+DRdgXTIwtDtnKJf6oYH5LdWSO/6l02FbR+Y1Rq7Kmfch8
	 6LwkpcogV6n+c9YOvrkBZAV6+qvVIyB7iFno14FNAK7OMYuPD1dY3IP+KnqIa+5/wO
	 DjDhnHuLgx3tgDuqShV5S3u+z8y1eVc8UYrOAuFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E7D8F80146;
	Thu, 13 Feb 2020 12:21:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50352F801DA; Thu, 13 Feb 2020 12:21:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CE3DF80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 12:21:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CE3DF80139
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7C1E7B196;
 Thu, 13 Feb 2020 11:21:01 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu, 13 Feb 2020 12:20:58 +0100
Message-Id: <20200213112059.18745-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200213112059.18745-1-tiwai@suse.de>
References: <20200213112059.18745-1-tiwai@suse.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 1/2] usb: audio-v2: Add
	uac2_effect_unit_descriptor definition
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The UAC2 Effect Unit Descriptor has a slightly different definition
from other similar ones like Processing Unit or Extension Unit.
Define it here so that it can be used in USB-audio driver in a later
patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/linux/usb/audio-v2.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/usb/audio-v2.h b/include/linux/usb/audio-v2.h
index ba4b3e3327ff..cb9900b34b67 100644
--- a/include/linux/usb/audio-v2.h
+++ b/include/linux/usb/audio-v2.h
@@ -156,6 +156,18 @@ struct uac2_feature_unit_descriptor {
 	__u8 bmaControls[0]; /* variable length */
 } __attribute__((packed));
 
+/* 4.7.2.10 Effect Unit Descriptor */
+
+struct uac2_effect_unit_descriptor {
+	__u8 bLength;
+	__u8 bDescriptorType;
+	__u8 bDescriptorSubtype;
+	__u8 bUnitID;
+	__le16 wEffectType;
+	__u8 bSourceID;
+	__u8 bmaControls[]; /* variable length */
+} __attribute__((packed));
+
 /* 4.9.2 Class-Specific AS Interface Descriptor */
 
 struct uac2_as_header_descriptor {
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
