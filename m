Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A17392C4C9
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 12:49:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23F1117D5;
	Tue, 28 May 2019 12:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23F1117D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559040596;
	bh=Pwy4xev1VQRirDtM1PRca80Du0SjCYL5G9piG9on9bE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iFr46VnJzTNDgkmqQ/kjNxPWSruSSDwH6IAytfU6iD52uyRDlfnCHxISdG8MWPVPZ
	 OISNIAghkF+8byEfOJze9VFgZWOUDAr8ANrPpug03l2bxWj4ynulUC1WZgj0qeOg9s
	 RSwCZhhfZ9vii5oUdu9L+ttT23+Vu27LlTrOhSjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDFDFF89708;
	Tue, 28 May 2019 12:48:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67925F89706; Tue, 28 May 2019 12:48:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from forward102p.mail.yandex.net (forward102p.mail.yandex.net
 [77.88.28.102])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAE0CF896B8
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 12:47:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAE0CF896B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=emlid.com header.i=@emlid.com
 header.b="mk+kjWb0"
Received: from mxback12j.mail.yandex.net (mxback12j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::87])
 by forward102p.mail.yandex.net (Yandex) with ESMTP id 880021D40BB7;
 Tue, 28 May 2019 13:47:56 +0300 (MSK)
Received: from smtp4p.mail.yandex.net (smtp4p.mail.yandex.net
 [2a02:6b8:0:1402::15:6])
 by mxback12j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id FY1s6RDynA-ls9Gkqrn;
 Tue, 28 May 2019 13:47:56 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlid.com; s=mail;
 t=1559040476; bh=Is/MIvi4jfDkUP+QCZKxpOOi4A6PloqEim41KKUSFQI=;
 h=Subject:To:From:Message-Id:Cc:Date;
 b=mk+kjWb0EdrqLncti5Yr4SSG1jWO9VAvGH5iMQZMPrtZ+uI2MwlatQNG6uTOVwWW2
 p8XgkQy73ogqo768svZG8nEtCb90QcAUt2a4Xod2pz/QXuHnb8evEgpy5C2TPEvfdf
 cEjPSQkeyKUEVj8/9nT0hk05qczAw1hhHeXtfiIo=
Authentication-Results: mxback12j.mail.yandex.net;
 dkim=pass header.i=@emlid.com
Received: by smtp4p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 yGoKdH2rqr-lqmSh4ee; Tue, 28 May 2019 13:47:53 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client certificate not present)
From: Georgii Staroselskii <georgii.staroselskii@emlid.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 maxime.ripard@bootlin.com, wens@csie.org, dannym@scratchpost.org
Date: Tue, 28 May 2019 13:47:39 +0300
Message-Id: <1559040459-16488-1-git-send-email-georgii.staroselskii@emlid.com>
X-Mailer: git-send-email 2.7.4
Cc: georgii.staroselskii@emlid.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v2] ASoC: sun4i-codec: fix first delay on
	Speaker
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

Allwinner DAC seems to have a delay in the Speaker audio routing. When
playing a sound for the first time, the sound gets chopped. On a second
play the sound is played correctly. After some time (~5s) the issue gets
back.

This commit seems to be fixing the same issue as bf14da7 but
for another codepath.

This is the DTS that was used to debug the problem.

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
index f2deffe..9e1f00e 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1320,6 +1320,15 @@ static int sun4i_codec_spk_event(struct snd_soc_dapm_widget *w,
 	gpiod_set_value_cansleep(scodec->gpio_pa,
 				 !!SND_SOC_DAPM_EVENT_ON(event));
 
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		/*
+		 * Need a delay to wait for DAC to push the data. 700ms seems
+		 * to be the best compromise not to feel this delay while
+		 * playing a sound.
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
