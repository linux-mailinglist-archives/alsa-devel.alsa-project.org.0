Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FC325A9F3
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 13:04:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F30631835;
	Wed,  2 Sep 2020 13:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F30631835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599044672;
	bh=/96qgCR3mfNvN+1iDBfVpYHsssSY4lebzEc9IAH7Dmk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JyYKEjN7mgFmEDtz2l3DbtjIeCm4aykefFoPsjfbviwg8RaUL2x1AUidLeMEroKgE
	 7KnatgomV6mBimAE3Men1YWW3JqBxO9CbVE31Rw5rcue0gLyAN0NnJxQzE+jMPnmVR
	 roz+R+6Rf4uRJtykUFuFhjokp99lSkySEjM1PVuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADEF1F802DD;
	Wed,  2 Sep 2020 13:01:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE5DBF802DB; Wed,  2 Sep 2020 13:01:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42D7BF801DA
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 13:01:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42D7BF801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zV9jGmh7"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5FF88207D3;
 Wed,  2 Sep 2020 11:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599044464;
 bh=/96qgCR3mfNvN+1iDBfVpYHsssSY4lebzEc9IAH7Dmk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zV9jGmh7unapsEHtykkj4r3hf8tgnrWnjlC+6GUexrcUjaXk8e/7NXwupVoM8qCi0
 CJEnVybMYP49bJmuSMIQAcng64pSkWItjqJo7ohCKcKguszBFaw/Cc1o9k0yuL2fty
 9j3Led9+CWmzMvPkZADL1tGVZI+LRVPW9T2yqDik=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: himadrispandya@gmail.com,
	dvyukov@google.com,
	linux-usb@vger.kernel.org
Subject: [PATCH 9/9] sound: hiface: convert to use new usb_control functions...
Date: Wed,  2 Sep 2020 13:01:13 +0200
Message-Id: <20200902110115.1994491-12-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
References: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, johan.hedberg@gmail.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, marcel@holtmann.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, stern@rowland.harvard.ed,
 linux-bluetooth@vger.kernel.org
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

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/usb/hiface/pcm.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/usb/hiface/pcm.c b/sound/usb/hiface/pcm.c
index a148caa5f48e..feab3f4834c2 100644
--- a/sound/usb/hiface/pcm.c
+++ b/sound/usb/hiface/pcm.c
@@ -156,14 +156,12 @@ static int hiface_pcm_set_rate(struct pcm_runtime *rt, unsigned int rate)
 	 * This control message doesn't have any ack from the
 	 * other side
 	 */
-	ret = usb_control_msg(device, usb_sndctrlpipe(device, 0),
-			      HIFACE_SET_RATE_REQUEST,
-			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_OTHER,
-			      rate_value, 0, NULL, 0, 100);
-	if (ret < 0) {
+	ret = usb_control_msg_send(device, 0,
+				   HIFACE_SET_RATE_REQUEST,
+				   USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_OTHER,
+				   rate_value, 0, NULL, 0, 100);
+	if (ret)
 		dev_err(&device->dev, "Error setting samplerate %d.\n", rate);
-		return ret;
-	}
 
 	return 0;
 }
-- 
2.28.0

