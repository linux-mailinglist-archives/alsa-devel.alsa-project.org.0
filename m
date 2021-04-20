Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E584C365A8B
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Apr 2021 15:49:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C7A31683;
	Tue, 20 Apr 2021 15:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C7A31683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618926544;
	bh=tXyHHAEAMQ3YjTZJPUDi/eV5bpLgtlgr46SY47C/EEc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=URMr4jbX0GxFpGJpGEc5PB3MOQCDtgRsgqCUaGeiaOu0q3Kg8UkqSFsfIzSSa9Sf/
	 wvLC/NWXGdUUu3lSu3NlQYiyBSEriX/WiXulrEfU+79sQUrmJ58lxabXHnFvmfBF6f
	 hJ2d+r+VT2ATULs83GRkXSJFKtGCdMbMTMHOT/4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D350AF80253;
	Tue, 20 Apr 2021 15:47:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4236BF80273; Tue, 20 Apr 2021 15:47:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8377EF8014D
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 15:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8377EF8014D
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lYqil-0005VO-PT; Tue, 20 Apr 2021 13:47:19 +0000
From: Colin King <colin.king@canonical.com>
To: Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb: midi: don't return -ENOMEM when
 usb_urb_ep_type_check fails
Date: Tue, 20 Apr 2021 14:47:19 +0100
Message-Id: <20210420134719.381409-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

Currently when the call to usb_urb_ep_type_check fails (returning -EINVAL)
the error return path returns -ENOMEM via the exit label "error". Other
uses of the same error exit label set the err variable to -ENOMEM but this
is not being used.  I believe the original intent was for the error exit
path to return the value in err rather than the hard coded -ENOMEM, so
return this rather than the hard coded -ENOMEM.

Addresses-Coverity: ("Unused value")
Fixes: 738d9edcfd44 ("ALSA: usb-audio: Add sanity checks for invalid EPs")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/usb/midi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 9efda4b06acb..a10ac75969a8 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1316,7 +1316,7 @@ static int snd_usbmidi_in_endpoint_create(struct snd_usb_midi *umidi,
 
  error:
 	snd_usbmidi_in_endpoint_delete(ep);
-	return -ENOMEM;
+	return err;
 }
 
 /*
-- 
2.30.2

