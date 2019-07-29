Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D605579A6B
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 22:56:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60F991811;
	Mon, 29 Jul 2019 22:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60F991811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564433810;
	bh=gbHPJTc1xJ6KlQLz73/Mg7UlYxHdoZ3g1ClazAdlwBs=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o5y/EVGBg1dr/Ha3DJpfOQixk+7Q01mylsdUNQOmqhLh+mrmQXTZY80ltjjOY1O7B
	 65v7BVKkMSvUU8IVcg8j6JnhOl3r4PKFfqWIiFcThyEH5kzuAnn+2vAHT3ODYhdISI
	 KM89ZUoiY0VANlrBOlfIgRSdXGCIx+HmL2Xk+zhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A38D2F8048D;
	Mon, 29 Jul 2019 22:55:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCFE4F8048D; Mon, 29 Jul 2019 22:55:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from gateway36.websitewelcome.com (gateway36.websitewelcome.com
 [192.185.199.121])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4433EF803D5
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 22:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4433EF803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com
 header.b="k9oWOIqA"
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway36.websitewelcome.com (Postfix) with ESMTP id E1405400E9765
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 15:19:03 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id sCfZh0KmK2qH7sCfZh2hi8; Mon, 29 Jul 2019 15:54:57 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2qRqERqNiuX608wUGfvOMeMcVRj/FE6XROb7xahJa7o=; b=k9oWOIqAFg/2nRf4GJb6CvtGDX
 513mCkowh1otHfVo16g46ToXHrguzcFXITXPT4b8aE46vPfJBMn7y0HauqIlru0O839nCt1Ebu68p
 xgME2rRs75418TaFp9gm/ekGuBS8zBrkMfubFUmqzCo73KXX44znu7OH4g8zlwVocX0/DVzBWgwfP
 3ULmMGJ5wIYzwxrtuIzop64Mq4UV3LIO6RM2ntslHURsX0x4Ogvua2Vau6rjiS4Xu3iO+P/oi/xaT
 Nyl9YIDC7viwSlCL3iNQh8zj+1aX9If4fXTLmxz7jIQoDNxoEaSSuvMYkm9PpgLZA3l43qTEwh5Q5
 bz1kG6Rg==;
Received: from [187.192.11.120] (port=59750 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hsCfX-001L5i-D7; Mon, 29 Jul 2019 15:54:55 -0500
Date: Mon, 29 Jul 2019 15:54:54 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Message-ID: <20190729205454.GA5084@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hsCfX-001L5i-D7
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:59750
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 19
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [alsa-devel] [PATCH v2] sound: dmasound_atari: Mark expected switch
	fall-through
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

Mark switch cases where we are expecting to fall through.

This patch fixes the following warning (Building: m68k):

sound/oss/dmasound/dmasound_atari.c: warning: this statement may fall
through [-Wimplicit-fallthrough=]:  => 1449:24

Notice that, in this particular case, the code comment is
modified in accordance with what GCC is expecting to find.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
Changes in v2:
 - Update code so switch and case statements are at the same indent.

 sound/oss/dmasound/dmasound_atari.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/oss/dmasound/dmasound_atari.c b/sound/oss/dmasound/dmasound_atari.c
index 83653683fd68..823ccfa089b2 100644
--- a/sound/oss/dmasound/dmasound_atari.c
+++ b/sound/oss/dmasound/dmasound_atari.c
@@ -1432,25 +1432,25 @@ static int FalconMixerIoctl(u_int cmd, u_long arg)
 {
 	int data;
 	switch (cmd) {
-	    case SOUND_MIXER_READ_RECMASK:
+	case SOUND_MIXER_READ_RECMASK:
 		return IOCTL_OUT(arg, SOUND_MASK_MIC);
-	    case SOUND_MIXER_READ_DEVMASK:
+	case SOUND_MIXER_READ_DEVMASK:
 		return IOCTL_OUT(arg, SOUND_MASK_VOLUME | SOUND_MASK_MIC | SOUND_MASK_SPEAKER);
-	    case SOUND_MIXER_READ_STEREODEVS:
+	case SOUND_MIXER_READ_STEREODEVS:
 		return IOCTL_OUT(arg, SOUND_MASK_VOLUME | SOUND_MASK_MIC);
-	    case SOUND_MIXER_READ_VOLUME:
+	case SOUND_MIXER_READ_VOLUME:
 		return IOCTL_OUT(arg,
 			VOLUME_ATT_TO_VOXWARE(dmasound.volume_left) |
 			VOLUME_ATT_TO_VOXWARE(dmasound.volume_right) << 8);
-	    case SOUND_MIXER_READ_CAPS:
+	case SOUND_MIXER_READ_CAPS:
 		return IOCTL_OUT(arg, SOUND_CAP_EXCL_INPUT);
-	    case SOUND_MIXER_WRITE_MIC:
+	case SOUND_MIXER_WRITE_MIC:
 		IOCTL_IN(arg, data);
 		tt_dmasnd.input_gain =
 			RECLEVEL_VOXWARE_TO_GAIN(data & 0xff) << 4 |
 			RECLEVEL_VOXWARE_TO_GAIN(data >> 8 & 0xff);
-		/* fall thru, return set value */
-	    case SOUND_MIXER_READ_MIC:
+		/* fall through - return set value */
+	case SOUND_MIXER_READ_MIC:
 		return IOCTL_OUT(arg,
 			RECLEVEL_GAIN_TO_VOXWARE(tt_dmasnd.input_gain >> 4 & 0xf) |
 			RECLEVEL_GAIN_TO_VOXWARE(tt_dmasnd.input_gain & 0xf) << 8);
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
