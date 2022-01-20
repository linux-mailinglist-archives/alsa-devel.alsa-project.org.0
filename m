Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 336F64955CC
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 22:10:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 935902D1D;
	Thu, 20 Jan 2022 22:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 935902D1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642713044;
	bh=gvKJNFWH+rntYZyayUFG04Y21zNp8GkFCMeuh1tSq1o=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uhU7X6xRWzK6qAFo4qVRX31a2Nl76jIgNT/NnKUzm7xrM/q73+Ch9NmQuLwyafN2f
	 vzOMKLStJpK3FO34Gm4URqQd+ibsLVbG56b0BE2Ye2tM75UmphsMIn4Cv20oJLvfKD
	 bBlNAsvZhQf+fRc1rtLfsqUI0layOkS3xgPlOAww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05ED6F8007E;
	Thu, 20 Jan 2022 22:09:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9C11F8012E; Thu, 20 Jan 2022 22:09:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED39CF8007E
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 22:09:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED39CF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rTNcSXOa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 22B0A61835;
 Thu, 20 Jan 2022 21:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DEC3C340E0;
 Thu, 20 Jan 2022 21:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642712966;
 bh=gvKJNFWH+rntYZyayUFG04Y21zNp8GkFCMeuh1tSq1o=;
 h=Date:From:To:Cc:Subject:From;
 b=rTNcSXOaMkn7HtA/lElfF2YmeFt5wt3AfTQtPpIiBkZ6WE7Z30VhfKlE2ETkyEzkA
 mVI3CN7lWYa6DpY1+rv0szN+INL2Ts4o1mZjxmV03qpvoCoUE0CJhmMUth91es9r5F
 k7EwNDgqRSP6NzqgmoudknZ0BC/QbxEHIR/5bHcsaLQvgH9o8D+ubX7urAZrdV6Bh9
 T03m0TiN3BDnCe1UXk84KlftBFKVV8ZvJmDY8GAOxCejCRY98U/PYU5rQaCzwxQb3O
 OZGoQrOHXjlE4mKWLATHx66Sw5kbl1zE7t3UKhUgt7j8IGIHYPlLTEBhNadVOw4Wy9
 Hb+7Ee+WMA9Gw==
Date: Thu, 20 Jan 2022 15:16:00 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: "Geoffrey D. Bennett" <g@b4.vu>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2][next] ALSA: usb-audio: scarlett2: Use struct_size()
 helper in scarlett2_usb()
Message-ID: <20220120211600.GA28841@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>
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

Make use of the struct_size() helper instead of an open-coded version,
in order to avoid any potential type mistakes or integer overflows that,
in the worst scenario, could lead to heap overflows.

Also, address the following sparse warnings:
sound/usb/mixer_scarlett_gen2.c:1064:28: warning: using sizeof on a flexible structure
sound/usb/mixer_scarlett_gen2.c:1065:29: warning: using sizeof on a flexible structure

Link: https://github.com/KSPP/linux/issues/174
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Use correct format specifier %zu for type size_t argument.

 sound/usb/mixer_scarlett_gen2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 53ebabf42472..7ff8a4817c67 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -1061,9 +1061,9 @@ static int scarlett2_usb(
 {
 	struct scarlett2_data *private = mixer->private_data;
 	struct usb_device *dev = mixer->chip->dev;
-	u16 req_buf_size = sizeof(struct scarlett2_usb_packet) + req_size;
-	u16 resp_buf_size = sizeof(struct scarlett2_usb_packet) + resp_size;
 	struct scarlett2_usb_packet *req, *resp = NULL;
+	size_t req_buf_size = struct_size(req, data, req_size);
+	size_t resp_buf_size = struct_size(resp, data, resp_size);
 	int err;
 
 	req = kmalloc(req_buf_size, GFP_KERNEL);
@@ -1111,7 +1111,7 @@ static int scarlett2_usb(
 		usb_audio_err(
 			mixer->chip,
 			"Scarlett Gen 2/3 USB response result cmd %x was %d "
-			"expected %d\n",
+			"expected %zu\n",
 			cmd, err, resp_buf_size);
 		err = -EINVAL;
 		goto unlock;
-- 
2.27.0

