Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A72141F4EB
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 15:00:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18DCD16C0;
	Wed, 15 May 2019 14:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18DCD16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557925245;
	bh=GV9OSy8+W1mBZuLnAWeZcREF1qUobRoJdNvpnUU27xE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CL8ti6bpHJN2tege00zRDr4K90LqdMGft9yzPsrIC9mc0kHC380SMAHIhZFKtLT0L
	 U8DYbmrlCb2bTJ1CvK2TZIhX/q5j4WGymmaGozVdVmQJuBnofsBoNYee4LQ0/jwyYw
	 VucEvrKEk7+tm+QjZGVnSGuBUwexSvmNbiNboYOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FC3AF89684;
	Wed, 15 May 2019 14:59:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB46EF8968A; Wed, 15 May 2019 14:58:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from forward101p.mail.yandex.net (forward101p.mail.yandex.net
 [77.88.28.101])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 725D0F8078F
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 14:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 725D0F8078F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=emlid.com header.i=@emlid.com
 header.b="FpTs2rYC"
Received: from mxback10j.mail.yandex.net (mxback10j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::113])
 by forward101p.mail.yandex.net (Yandex) with ESMTP id 50C4932803CF;
 Wed, 15 May 2019 15:58:55 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net
 [2a02:6b8:0:1472:2741:0:8b6:6])
 by mxback10j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id bsLgkcNsk5-wrqWxH7u;
 Wed, 15 May 2019 15:58:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlid.com; s=mail;
 t=1557925134; bh=2W0zEgOCWDt4v9u1OadziJEpCceQZoKdy90nqGUwrWQ=;
 h=Subject:To:From:Message-Id:Cc:Date;
 b=FpTs2rYCKv9xevIpF1wJhV+sgP+MWg027Kdv53qNlxar8QmYEi0QAT3F2by/lxsu9
 QoDFBzIzNuUlYLy9lmo/J+S7O887/AjhKEbvEuEN8R+nFyZph4lsdu807+LeH4ggmt
 sVk9rxC7+Yh37NtrIZJEc2bIs/CN0nhRBkC84v1Y=
Authentication-Results: mxback10j.mail.yandex.net;
 dkim=pass header.i=@emlid.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 rpGlbIVyzP-wqGSgVWX; Wed, 15 May 2019 15:58:52 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client certificate not present)
From: Georgii Staroselskii <georgii.staroselskii@emlid.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 maxime.ripard@bootlin.com, wens@csie.org, dannym@scratchpost.org
Date: Wed, 15 May 2019 15:58:40 +0300
Message-Id: <1557925120-31498-1-git-send-email-georgii.staroselskii@emlid.com>
X-Mailer: git-send-email 2.7.4
Cc: georgii.staroselskii@emlid.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH] ASoC: sun4i-codec: fix first delay on Speaker
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

This commit fixes the same issue as bf14da7 but for another codepath.
The issue can be triggered by having Speaker in codec audio routing.

&codec {
        allwinner,pa-gpios = <&r_pio 0 11 GPIO_ACTIVE_HIGH>; /* PL11 */
        allwinner,audio-routing =
                "Speaker", "LINEOUT";

        status = "okay";
}

Signed-off-by: Georgii Staroselskii <georgii.staroselskii@emlid.com>
---
 sound/soc/sunxi/sun4i-codec.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 15d08e3..e0099519 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1329,6 +1329,15 @@ static int sun4i_codec_spk_event(struct snd_soc_dapm_widget *w,
 	gpiod_set_value_cansleep(scodec->gpio_pa,
 				 !!SND_SOC_DAPM_EVENT_ON(event));
 
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		/*
+		 * Need a delay to have the amplifier up. 700ms seems the best
+		 * compromise between the time to let the amplifier up and the
+		 * time not to feel this delay while playing a sound.
+		 */
+		msleep(700);
+	}
+
 	return 0;
 }
 
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
