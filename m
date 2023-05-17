Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10532706C6E
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 17:16:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBB431F7;
	Wed, 17 May 2023 17:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBB431F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684336578;
	bh=JXHlQGqLZnwEd+1ywgBD3qSPq+lFVpm0deC33quGJxg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=d3hN7bcBIIhEDPf++LhMTgfPlvDWv/r31tkgK6pXtxw0QcbE8XZYUWJaN3P3Jw7FC
	 xThmFJPKtxIwByQT7nBQwDZmi24Oae7BkH/8Lq4rUUGmmSlvDo3HsnqbWVgB8f7R/I
	 3Y/YgjX9o/w4OqwWXAVPnwlEWymoPS3r22fRFAJo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45E0CF80542; Wed, 17 May 2023 17:15:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06195F8025A;
	Wed, 17 May 2023 17:15:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5DFEF80272; Wed, 17 May 2023 17:15:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4ECEF8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 17:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4ECEF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=hU6gxKKp
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 999F4660574E;
	Wed, 17 May 2023 16:15:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684336521;
	bh=JXHlQGqLZnwEd+1ywgBD3qSPq+lFVpm0deC33quGJxg=;
	h=From:To:Cc:Subject:Date:From;
	b=hU6gxKKpauEvIDnRRvhNe5X+xvq1mbElAP7P78bkk/hHN4XTRExPEbV+YZ3Pzhtid
	 kKq19X8KSghlsJ399B8CEZafU6kvVxFno7r6UGH+R2DBgq8QUdvrC6qDrCyhdhl0CW
	 Q/Jy9PIGGy4HAtAzB/Pzto/dUnSC2l4QAe9h/LsXsJ/Yz8XirEyQfAtP8CzMgjG8T0
	 j6bPn2QLepvjETscRoG1aV4+9GcnZTs3VzscIdM88AxfkjKOPTHeImTgIBFTHTx6zq
	 tWvrb/HDXVO7OY2eRSXaPzukoqLGZp4l27t/Yl50Ec2cXqRak34CuP/WjdzTV3iKzT
	 oMYE3MMzvdNew==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	wenst@chromium.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] ASoC: mediatek: mt8192-mt6359: Remove " Jack" from Headphone
 pin name
Date: Wed, 17 May 2023 17:15:16 +0200
Message-Id: <20230517151516.343037-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DV4BY7GK6OJ56R3V4NTLUH5MHIPNUSEK
X-Message-ID-Hash: DV4BY7GK6OJ56R3V4NTLUH5MHIPNUSEK
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DV4BY7GK6OJ56R3V4NTLUH5MHIPNUSEK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Function jack_kctl_name_gen() will remove the redundant " Jack" from
the name, if present, and then it will add it back, so that all of
the controls are named "(pin-name) Jack".

Remove " Jack" from the Headphone pin name to spare some CPU cycles.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 5e163e23a207..4e0d5bf12b47 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -46,7 +46,7 @@ struct mt8192_mt6359_priv {
 /* Headset jack detection DAPM pins */
 static struct snd_soc_jack_pin mt8192_jack_pins[] = {
 	{
-		.pin = "Headphone Jack",
+		.pin = "Headphone",
 		.mask = SND_JACK_HEADPHONE,
 	},
 	{
-- 
2.40.1

