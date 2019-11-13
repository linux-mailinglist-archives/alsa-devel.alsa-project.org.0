Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ADBFA487
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 03:18:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72DA4165F;
	Wed, 13 Nov 2019 03:18:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72DA4165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573611530;
	bh=DxYDq3vEvlkHWbfXLc33pXe+/VrqE44M/t7NwNVpgyw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rFV1CtUr1RyzCEugUjF/QMHo9IsOFiAteRigPyW1WN6hZbdI8iqaDN2qdP8TJj81T
	 Z82NcyLREWxu9OjwWx/hewHQsHNzhX9SN+SYQbQ+tVU+urtKCDN7a1Gh8KhRQIhnrp
	 8S41iaxzxAVCgC+zhY38awncYFeyt8Yn5LPX79hs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CA70F8044C;
	Wed, 13 Nov 2019 03:17:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE957F804CF; Wed, 13 Nov 2019 03:17:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 515AAF8044C
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 03:16:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 515AAF8044C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="C/6sf+uZ"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb67610000>; Tue, 12 Nov 2019 18:16:01 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 18:16:57 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 18:16:57 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 02:16:56 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 13 Nov 2019 02:16:56 +0000
Received: from henryl-tu10x.nvidia.com (Not Verified[10.19.109.97]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dcb67970000>; Tue, 12 Nov 2019 18:16:56 -0800
From: Henry Lin <henryl@nvidia.com>
To: 
Date: Wed, 13 Nov 2019 10:14:19 +0800
Message-ID: <20191113021420.13377-1-henryl@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112065108.7766-1-henryl@nvidia.com>
References: <20191112065108.7766-1-henryl@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573611361; bh=Tujpg7WZBoOThKGX8MEAml/VB3Yc83jertZP/WdKXl0=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=C/6sf+uZj2gOMh/+HER/DbH5WOlnwdrXdu1S2kYhz3Kqc89ZAAQhoOb5k85XqhhvC
 zWY60Wd/cdyrsszASUdpJmdmOJSLpmnCE0HOHB6Ld1KH2aa40KJPP+kqE/9dgPOy4M
 S3B0nML7ZS27bkJ0DiQjuH0X+ohSrp6o5a/aOScVdxj5xK4NMzlFpOdliYYVriki45
 pMn76QfDjqIX+6NGPq5rlRl69ZjxGym+QgaAoslIKGQAK6zrDvr44DA311pJqXoPQc
 I3iyVcxdgyj0hRlIq0JD7pk+NawUf0zX1SsrG/rsrXCN5+KCPP3kXCwn8/4eACPeZ8
 XMwUJvgDueUEQ==
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Richard Fontana <rfontana@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Henry Lin <henryl@nvidia.com>, Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH v2] usb-audio: not submit urb for stopped
	endpoint
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

While output urb's snd_complete_urb() is executing, calling
prepare_outbound_urb() may cause endpoint stopped before
prepare_outbound_urb() returns and result in next urb submitted
to stopped endpoint. usb-audio driver cannot re-use it afterwards as
the urb is still hold by usb stack.

This change checks EP_FLAG_RUNNING flag after prepare_outbound_urb() again
to let snd_complete_urb() know the endpoint already stopped and does not
submit next urb. Below kind of error will be fixed:

[  213.153103] usb 1-2: timeout: still 1 active urbs on EP #1
[  213.164121] usb 1-2: cannot submit urb 0, error -16: unknown error

Signed-off-by: Henry Lin <henryl@nvidia.com>
---
 sound/usb/endpoint.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index a2ab8e8d3a93..4a9a2f6ef5a4 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -388,6 +388,9 @@ static void snd_complete_urb(struct urb *urb)
 		}
 
 		prepare_outbound_urb(ep, ctx);
+		/* can be stopped during prepare callback */
+		if (unlikely(!test_bit(EP_FLAG_RUNNING, &ep->flags)))
+			goto exit_clear;
 	} else {
 		retire_inbound_urb(ep, ctx);
 		/* can be stopped during retire callback */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
