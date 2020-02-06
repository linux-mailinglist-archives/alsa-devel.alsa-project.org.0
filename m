Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6CA154984
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 17:44:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E515116A2;
	Thu,  6 Feb 2020 17:43:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E515116A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581007485;
	bh=DCXtIoNKqGhpnKYf25+c0Gz/Yqc52MPxDxPn03m0wlg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iNXl6OsjwcRYYuxPEFRxgKyAmpRd5W1Zo7XWBuPbGGpSURrgbNTnoqrnmuZWy0QH3
	 I95oVkCGgUWeABTKQywOjE5kwy+pEdN3/YaD8XiWDCQxZ1lGDKqHaCZzzo8PDZF/Bv
	 8jv66thWXg94QpadeNbYUDuyQ3cKBLMiQXbWxQMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 757B3F8029B;
	Thu,  6 Feb 2020 17:40:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1FBEF80279; Thu,  6 Feb 2020 17:39:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C19EF80248
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 17:39:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C19EF80248
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5BAE8AFBF
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 16:39:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  6 Feb 2020 17:39:45 +0100
Message-Id: <20200206163945.6797-9-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200206163945.6797-1-tiwai@suse.de>
References: <20200206163945.6797-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 8/8] ALSA: pcm: Minor refactoring
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

Make a common helper for validating the format type.
This reduces the number of cast in the code that are needed for
suppressing sparse warnings.

No functional changes, just minor refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_misc.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
index a6a541511534..cf3e8c26e00a 100644
--- a/sound/core/pcm_misc.c
+++ b/sound/core/pcm_misc.c
@@ -42,6 +42,11 @@ struct pcm_format_data {
 /* we do lots of calculations on snd_pcm_format_t; shut up sparse */
 #define INT	__force int
 
+static bool valid_format(snd_pcm_format_t format)
+{
+	return (INT)format >= 0 && (INT)format <= (INT)SNDRV_PCM_FORMAT_LAST;
+}
+
 static const struct pcm_format_data pcm_formats[(INT)SNDRV_PCM_FORMAT_LAST+1] = {
 	[SNDRV_PCM_FORMAT_S8] = {
 		.width = 8, .phys = 8, .le = -1, .signd = 1,
@@ -259,7 +264,7 @@ static const struct pcm_format_data pcm_formats[(INT)SNDRV_PCM_FORMAT_LAST+1] =
 int snd_pcm_format_signed(snd_pcm_format_t format)
 {
 	int val;
-	if ((INT)format < 0 || (INT)format > (INT)SNDRV_PCM_FORMAT_LAST)
+	if (!valid_format(format))
 		return -EINVAL;
 	if ((val = pcm_formats[(INT)format].signd) < 0)
 		return -EINVAL;
@@ -307,7 +312,7 @@ EXPORT_SYMBOL(snd_pcm_format_linear);
 int snd_pcm_format_little_endian(snd_pcm_format_t format)
 {
 	int val;
-	if ((INT)format < 0 || (INT)format > (INT)SNDRV_PCM_FORMAT_LAST)
+	if (!valid_format(format))
 		return -EINVAL;
 	if ((val = pcm_formats[(INT)format].le) < 0)
 		return -EINVAL;
@@ -343,7 +348,7 @@ EXPORT_SYMBOL(snd_pcm_format_big_endian);
 int snd_pcm_format_width(snd_pcm_format_t format)
 {
 	int val;
-	if ((INT)format < 0 || (INT)format > (INT)SNDRV_PCM_FORMAT_LAST)
+	if (!valid_format(format))
 		return -EINVAL;
 	if ((val = pcm_formats[(INT)format].width) == 0)
 		return -EINVAL;
@@ -361,7 +366,7 @@ EXPORT_SYMBOL(snd_pcm_format_width);
 int snd_pcm_format_physical_width(snd_pcm_format_t format)
 {
 	int val;
-	if ((INT)format < 0 || (INT)format > (INT)SNDRV_PCM_FORMAT_LAST)
+	if (!valid_format(format))
 		return -EINVAL;
 	if ((val = pcm_formats[(INT)format].phys) == 0)
 		return -EINVAL;
@@ -394,7 +399,7 @@ EXPORT_SYMBOL(snd_pcm_format_size);
  */
 const unsigned char *snd_pcm_format_silence_64(snd_pcm_format_t format)
 {
-	if ((INT)format < 0 || (INT)format > (INT)SNDRV_PCM_FORMAT_LAST)
+	if (!valid_format(format))
 		return NULL;
 	if (! pcm_formats[(INT)format].phys)
 		return NULL;
@@ -418,7 +423,7 @@ int snd_pcm_format_set_silence(snd_pcm_format_t format, void *data, unsigned int
 	unsigned char *dst;
 	const unsigned char *pat;
 
-	if ((INT)format < 0 || (INT)format > (INT)SNDRV_PCM_FORMAT_LAST)
+	if (!valid_format(format))
 		return -EINVAL;
 	if (samples == 0)
 		return 0;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
