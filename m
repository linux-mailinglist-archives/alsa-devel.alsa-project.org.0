Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB338984A3
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 12:05:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 830952CBC;
	Thu,  4 Apr 2024 12:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 830952CBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712225156;
	bh=ptunjXYqX4p7CWPV8NdSfujnriOUxut6Sa5rdWHF1JI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LyLHfl/aGzIToRBdNfA3ecYCV/6/XBUTbAD0PfV2lm1xAWPSpH3FA6hUUZBI55iZF
	 hP+honn/rv6dzVqzbaZG3xqBunrGpZMeJlem/fbbTKJ+VdfWxpGXTYABHitEJak3D/
	 kZLSIIioNb74P0UToFqyj7XBzvI2XBCNsuhlE8vU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C55FF80606; Thu,  4 Apr 2024 12:03:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D07B9F806E3;
	Thu,  4 Apr 2024 12:03:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17972F806AA; Thu,  4 Apr 2024 12:03:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53726F80570
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 12:03:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53726F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=H9Hl6hqt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712224976; x=1712829776;
	i=oswald.buddenhagen@gmx.de;
	bh=i5SGJFWlFLgQYFLfk9ipHeSb5dL2GEn/l3xvsB3Xb7A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=H9Hl6hqtIHJU6iF9/6aB0+IkT7dZIYwq5V8Lvv8HA/n/UTgePVYszdKa3vUaPF2q
	 PWBMl1CW/BaJj9gRlGDMiCK5/XwzXx7Xw8A8h2g1ajwgkb05J+k8WqNx0+WwDGZVL
	 VFvfzlfI3BL2HaXBYW8n7OYlfVE50iyvSMVO8dZxOLeL47E0UBiG+hh0vQ0y5+3x+
	 UBy8SnpP/2UcYEGJyth39kOzYXlOO7zrxxH8t/1aBnK6fiOnPl+xUMBY9BxAwVr2k
	 ei8t2WCfU1egeEkZjZEL9rKzyugrkrA8r7L4rq5ek18mN4eWlfhETZ3m3ihNtNdND
	 nAeylXcwHUsEAtRngw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.126]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MowKc-1sawl40U9O-00qO2A; Thu, 04
 Apr 2024 12:02:56 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsJto-RGG-00; Thu, 04 Apr 2024 12:00:48 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v2 16/17] ALSA: emu10k1: shrink blank space in front of
 wavetable samples
Date: Thu,  4 Apr 2024 12:00:47 +0200
Message-ID: <20240404100048.819674-17-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c33L9W2v3XazVATdDNOtxDx6aezhkm44UNHjw78H6vfJlzxYy25
 pCYER/8vG1VOpFhuCa9XucuNq2HkQ/EtG+k5k2Nrgu+oxfFPkuOYVXas2NXQCR7twtSVzkN
 5RYVAUCtOds3o93IrXCfOLfYK5HGfz0VSWucvC4By93+i9DpLGhL2r5p+/nZNFMl63RV/ZF
 f/fVQq8Yiq2NJ6S9/gVgA==
UI-OutboundReport: notjunk:1;M01:P0:QDGEL0Scoh4=;QZpvas9D0Eet9//huWKGKAQ9cWf
 pMtpP3lyQddWdQviS2iab5OXKZqcACC+ZB0tUXqBUybszjzMkuaDm+SicRvFEAQVMw14JwJ2P
 qKgoZ5sVePuf56Koazg/ADHsuGkOd/JfyYfR1m4jtYtd8zFKw90EfptoAdNGaw9F9ylaD8Jkj
 7YarMGEDGqCwrj8ddqwsPcigWbo0tT583zDfnB/NO1Sjf2X8HQkn4vvBqMouhre59LtaX7M2b
 U/K8TCvxejYbcg6cgYTD/L8b898jnJhgjrXtCpSShumI4NnOo3reDWgcnxCes2yU13D1s11Sf
 fA7Wy+1/3z5x0Qn7AwRvD/csEAZC+r3KEc+gDvllJZJejIRHLzVzZelp1emdg9erqJgAdRFhc
 mUqMw4ilytSx9nBvVPmvkw9Ep1YIs/2avn4L0AFo/Hb1RzSTu7MlgPmHwOa2mL4fTNbGPcJlj
 GifDpm8YBVqLUeLRZZDLxj7bYn/UqOSMnxxZTkQqm7676CE2UlLI/JEenWqt1EHaswWhYBxvY
 kmKizxORzFR3HRlVRIGQWCnOvn05jPx7vSI6opVRm9ndTEnqbCRsBWCukWxJlGcerA4wPJgr+
 HfuJAmihQ6yEqeVJ1y18BCJDvl0VB9IWKizbvAcSAeXqFr6TgiYrc9pZry7xCsff7jVSHYXhf
 vuSqkBMHQ+U+g+og4Nk4T/EDYMw3FRhcYPOeAl61KRkGp85tW+12iIm8XZ/k6um/4EdNXfiKz
 LIvbvGiHM2+aEt96ad86KtsW9Dvq/JfrVAPBMxdVKUzVgxgGIuM7ysIg9U1AdJIzkRzEysFWm
 fRc2YD49ndoZKVIb2F9IBkM28h4H4ABP2driEXsGdGRBA=
Message-ID-Hash: 6IBVRRSNQT32XDTY5ON56A7XILJXH47M
X-Message-ID-Hash: 6IBVRRSNQT32XDTY5ON56A7XILJXH47M
X-MailFrom: oswald.buddenhagen@gmx.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6IBVRRSNQT32XDTY5ON56A7XILJXH47M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is no need for it to be 32 samples - 3 will do just fine (which is
the interpolator's epsilon). The old size was presumably meant to
compensate for the cache's presence, but we're now handling that
properly.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/pci/emu10k1/emu10k1_patch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1=
_patch.c
index 2a13fb32c1d2..dbfa89435ac2 100644
=2D-- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -16,7 +16,7 @@
 #define BLANK_LOOP_START	4
 #define BLANK_LOOP_END		8
 #define BLANK_LOOP_SIZE		12
-#define BLANK_HEAD_SIZE		32
+#define BLANK_HEAD_SIZE		3

 /*
  * allocate a sample block and copy data from userspace
=2D-
2.42.0.419.g70bf8a5751

