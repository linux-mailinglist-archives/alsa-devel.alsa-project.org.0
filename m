Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBA83B0B1F
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 19:08:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD508169D;
	Tue, 22 Jun 2021 19:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD508169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624381707;
	bh=xyEPY7GuuG1769GlWf419l+lZxBO9frFDb9VuH8BCdg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=doNoXku3r3A8PN86gIe4UdPAIifX0kN0LQ22ryo7hsQNj3CQWIqQ61M4DgqkzWCUx
	 R6asgMZDedZLYcpZocjBugKzsO1tui65SoQWQSaiNAglk5f0TFYbYKEwL9n67tP3Wv
	 uIt8vaasOVPGZqMw8HjPD5kGOVJoKXZrPQToS1RE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71BDCF8051B;
	Tue, 22 Jun 2021 19:04:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E9EEF80528; Tue, 22 Jun 2021 19:04:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D1A9F80526
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 19:04:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D1A9F80526
Received: by m.b4.vu (Postfix, from userid 1000)
 id 9DCF761E286E; Wed, 23 Jun 2021 02:34:09 +0930 (ACST)
Date: Wed, 23 Jun 2021 02:34:09 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 16/17] ALSA: usb-audio: scarlett2: Update get_config to do
 endian conversion
Message-ID: <cbc8b6eedd859dd27086ab4126d724a86dd50bcb.1624379707.git.g@b4.vu>
References: <cover.1624379707.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624379707.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hin-Tak Leung <htl10@users.sourceforge.net>,
 Vladimir Sadovnikov <sadko4u@gmail.com>
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

For configuration items with a size of 16, scarlett2_usb_get_config()
was filling *buf with little-endian data. Update it to convert to CPU
endian. This function is not currently used so affects nothing yet;
will be used by the upcoming talkback feature.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index ffa2ee8d034c..f26ab6c39859 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -1170,7 +1170,13 @@ static int scarlett2_usb_get_config(
 	/* For byte-sized parameters, retrieve directly into buf */
 	if (config_item->size >= 8) {
 		size = config_item->size / 8 * count;
-		return scarlett2_usb_get(mixer, config_item->offset, buf, size);
+		err = scarlett2_usb_get(mixer, config_item->offset, buf, size);
+		if (err < 0)
+			return err;
+		if (size == 2)
+			for (i = 0; i < count; i++, (u16 *)buf++)
+				*(u16 *)buf = le16_to_cpu(*(__le16 *)buf);
+		return 0;
 	}
 
 	/* For bit-sized parameters, retrieve into value */
-- 
2.31.1

