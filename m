Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BC64EE37C
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 23:53:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1F9518C5;
	Thu, 31 Mar 2022 23:53:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1F9518C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648763633;
	bh=EQRewMTWyC0lEdt06pNixKtOWcJ7HxDKBWM4ByZP0Yk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NJEoUveKVgXnOGMC0WoHOi0V/Ncng+zQGwg3R1F6FRUt0lTVnefEMmor6GGGlchAp
	 lFw8TpMfcUtae5mphT/bRGL/vJEiWO4nCTQiAVp7GybVfpOWjo7TDzJJcJaMZ7x0Ib
	 W9Z/UXVZlFalMuHR/m+BrXVr+2twEMw04f9gYEvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4979EF80238;
	Thu, 31 Mar 2022 23:53:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 197A9F80238; Thu, 31 Mar 2022 23:53:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28422F800E4
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 23:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28422F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lTyVqB+Z"
Received: by mail-ej1-x62f.google.com with SMTP id c10so1958860ejs.13
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 14:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s7WvWGnp8e2+ZYg4JNgLcns/TOfiaFHz5BOyp+VBRH4=;
 b=lTyVqB+Zc0e84QnpugtFoYsU6sl7K9xjMJMkDzI/2MY0BSJekhavkyJQoQveEAWCdU
 U/29yUBVpmdYDctiBtXhoEYWP97aqmJaRfvJx/8zju1ldkj8caD+VGEQPmdRLcJPDfN3
 TzTBYCAxHgI0B99roIcLtlO2DXlv/SBgb11EHj0mpaudvCBRHBjt5HznTGbG92ak7BsM
 G6+xpDaBUobsstl3W8YTkgsQgbjsRot9Mkm4cRA8sWE2qbZPxCRxM6BqHi6Y/Tegc2Xa
 etQ78axO6I3D6qHS40dFndrk8PBpMN7wIudlaPGoTn/5TpyC4bAis2zdx9DTjQURPGeZ
 AR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s7WvWGnp8e2+ZYg4JNgLcns/TOfiaFHz5BOyp+VBRH4=;
 b=6bIxfWOmvpa3j8dO1mpDquSm+MzG4vaLyFoBfWrp22O10B8bQJm1ipW3IdTm3IMNqx
 sB5jpqeTLdhlGA+IbRbgP9WXe89otynuPZQWc6V8lLJPAIbjI4jstMpw3UicXa6/zXhb
 0MXjtnUiSeJ03Vtr5gFp5WUBYuDPVdzqWv4luxgDFnr0s6OHTAfhUIEeCT8HAqB4MDoy
 +gym5E7nZL6ScPVWA904Dl+LymGZcXrYNIDi/R8fKcmfMWdtDMBexthIGOgBSlKfODK3
 Iq3aPPrxfo9SlKSsqt//odjTghnQGetc5NV0/fEkzWhHB4RNBIxf4KoJ0mFs1J1iBAPm
 NnxA==
X-Gm-Message-State: AOAM532WVHdqVpMxuHpu6I0t87TZSEBySy9wXxlsLuDxktTQ+oyQqoRX
 zAp0os+8Jp8lP5lPnlcsbyE=
X-Google-Smtp-Source: ABdhPJwI7ID3mvkG8QYmKxcyThluj0R006fho7SSsOjVN+yoz3BWnxu+1Aod9ibwGRMZdf+o4SIDLg==
X-Received: by 2002:a17:906:e4c:b0:6e0:b002:2b2e with SMTP id
 q12-20020a1709060e4c00b006e0b0022b2emr6627609eji.690.1648763575022; 
 Thu, 31 Mar 2022 14:52:55 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 g20-20020aa7c594000000b004194b07bbfasm299980edq.10.2022.03.31.14.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 14:52:54 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH 1/3] ASoC: Intel: catpt: remove check of list iterator against
 head past the loop body
Date: Thu, 31 Mar 2022 23:50:01 +0200
Message-Id: <20220331215003.882143-1-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Bos,
 H.J." <h.j.bos@vu.nl>, Yang Yingliang <yangyingliang@huawei.com>,
 Orson Zhai <orsonzhai@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jakob Koschel <jakobkoschel@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Baolin Wang <baolin.wang7@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Mike Rapoport <rppt@kernel.org>
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

When list_for_each_entry() completes the iteration over the whole list
without breaking the loop, the iterator value will be a bogus pointer
computed based on the head element.

While it is safe to use the pointer to determine if it was computed
based on the head element, either with list_entry_is_head() or
&pos->member == head, using the iterator variable after the loop should
be avoided.

In preparation to limiting the scope of a list iterator to the list
traversal loop, use a dedicated pointer to point to the found element [1].

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 sound/soc/intel/catpt/pcm.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index a26000cd5ceb..b103b2d4026e 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -330,7 +330,8 @@ static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
 				     struct catpt_stream_runtime *stream)
 {
 	struct snd_soc_component *component = dai->component;
-	struct snd_kcontrol *pos;
+	struct snd_kcontrol *pos = NULL;
+	struct snd_kcontrol *iter;
 	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 	const char *name;
 	int ret;
@@ -354,12 +355,14 @@ static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
 		return 0;
 	}
 
-	list_for_each_entry(pos, &component->card->snd_card->controls, list) {
-		if (pos->private_data == component &&
-		    !strncmp(name, pos->id.name, sizeof(pos->id.name)))
+	list_for_each_entry(iter, &component->card->snd_card->controls, list) {
+		if (iter->private_data == component &&
+		    !strncmp(name, iter->id.name, sizeof(iter->id.name))) {
+			pos = iter;
 			break;
+		}
 	}
-	if (list_entry_is_head(pos, &component->card->snd_card->controls, list))
+	if (!pos)
 		return -ENOENT;
 
 	if (stream->template->type != CATPT_STRM_TYPE_LOOPBACK)

base-commit: f82da161ea75dc4db21b2499e4b1facd36dab275
-- 
2.25.1

