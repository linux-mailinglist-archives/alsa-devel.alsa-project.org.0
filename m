Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3026E494400
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 01:09:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DEC02FE0;
	Thu, 20 Jan 2022 01:08:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DEC02FE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642637345;
	bh=+jNT40e3buQeCRmePpis8mqyA1ni74XkL1YM5TAbY54=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p2l3K8TqcbVesUMumt59JEW7MvNCLkyNhLSra0de/5hLe6VfJSDCipf+00z0J1m9E
	 NGpqSEbPcb7IYIRD0kTVbWNzfXibUfCWC4ZXkF2wynIFpvSITIfVsoEAlvyu3IWH6M
	 +n360S/ErSc5ox0E7pibDpiwZagCbCJus5RGhEOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4D6DF80212;
	Thu, 20 Jan 2022 01:07:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C544F80100; Thu, 20 Jan 2022 01:07:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6554EF80100
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 01:07:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6554EF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JTBcBHa4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1BDFD6150C;
 Thu, 20 Jan 2022 00:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368AAC004E1;
 Thu, 20 Jan 2022 00:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642637269;
 bh=+jNT40e3buQeCRmePpis8mqyA1ni74XkL1YM5TAbY54=;
 h=Date:From:To:Cc:Subject:From;
 b=JTBcBHa4acX3Q639wJcpmIl4rnYEQ4aqTdDa0uzXy352Ey77I+vv5EgILkPaOlmhs
 I7yXrmWPRaiuW8lI3BHv7+oaDLTnIR+VZpoRQecr8XTCVkzCn8Dic0SDn0D9tW6Ucc
 HYaBtZdKYyXhFDzQZIG/2yqG0W+4c3bfm+kInN6MvMSqvGLWJWN4CHK6Qo//93Nh5g
 lqR4IAxkXOCBVqku2XIPqNZ3EPsSIzAOoyrssTsz+BjdJKlPXfc4jouHvQlRehPbxR
 dg0ZH4w+oxp1Cki/BaZkb226l/9MhbMEIK6eV1y0NWwsP+biM8Th0OOxP0aryLex7r
 cREtjeb16Guaw==
Date: Wed, 19 Jan 2022 18:14:23 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: "Geoffrey D. Bennett" <g@b4.vu>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH][next] ALSA: usb-audio: scarlett2: Use struct_size() helper
 in scarlett2_usb()
Message-ID: <20220120001423.GA69878@embeddedor>
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

Link: https://github.com/KSPP/linux/issues/160
Link: https://github.com/KSPP/linux/issues/174
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 sound/usb/mixer_scarlett_gen2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 53ebabf42472..311413f015f0 100644
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
+			"expected %lu\n",
 			cmd, err, resp_buf_size);
 		err = -EINVAL;
 		goto unlock;
-- 
2.27.0

