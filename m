Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 087537CB664
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 00:14:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3A4F84A;
	Tue, 17 Oct 2023 00:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3A4F84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697494477;
	bh=9d2dbXiVZg4W6WYNSBv3s3mJZPt58PfKg/l2GDOEKjY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SUtb/ucI7zPO4ygqeWHsX5WMcftd8Lck3+xKtpSqVbSx98YzmCRgHIAqMP/BUMK1d
	 UY3Dtk2lOqsoAni++gVqVVpj2pjFxk/266XKUf9pWpAVksnvPsgCbpmoUSH6CNuR+q
	 /EPNBPlDbt40VN9gC+knhq0cfDOs+ER2CwQOLMpw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3397EF8055A; Tue, 17 Oct 2023 00:13:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3719F8024E;
	Tue, 17 Oct 2023 00:13:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 561D8F8025F; Tue, 17 Oct 2023 00:13:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00A2FF80166
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 00:13:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00A2FF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=l.guzenko@web.de header.a=rsa-sha256
 header.s=s29768273 header.b=DAuekgAZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1697494412; x=1698099212; i=l.guzenko@web.de;
 bh=9d2dbXiVZg4W6WYNSBv3s3mJZPt58PfKg/l2GDOEKjY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=DAuekgAZYxSjuyw8a23NurwX38n/tgADPiVhD1VsAtf5xtF/YkL9nKd0BWvT0heDtC+uxmB5tKu
 0kd2lxtJ48i/mY7stFipyx7wTqT9BBC1fsLZpFa4IQaJqjJX0QM3rfEaxRtbEUnacZYPMaRASSqRA
 xFlkDvPQWV1vYGH5EaHYUIj93ESnSoLn1ay+NwAuKU2JjcnHSJI3Ohdh2rod0WdbeNVgz0N0o1dNF
 qG1XRbWEVNNd1SlcY0xd5ZO3GuPqA064+fZ+iX1SgYcdWn36FoxEdv6NtYO8Mb0RN6zDeSijm4wTM
 LLjOVO8KyHEep22AMU50vcZvlX98aHfS7lqA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from luka-spectre.fritz.box ([82.220.110.137]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1Mw9xG-1ri8UK0xO8-00rxnr; Tue, 17 Oct 2023 00:13:32 +0200
From: Luka Guzenko <l.guzenko@web.de>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Luka Guzenko <l.guzenko@web.de>
Subject: [PATCH] ALSA: hda/relatek: Enable Mute LED on HP Laptop 15s-fq5xxx
Date: Tue, 17 Oct 2023 00:13:28 +0200
Message-ID: <20231016221328.1521674-1-l.guzenko@web.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m2Xut+5J8jWeT6Q0+Mz260CHBg2YtKnc/3PQTdhmDpLfQw/Ps6w
 qEXtM93Hw6xxy9M3/IGT3KNFG/xr2v2jzxhBuDM330s+T4tNmU/oMprumbEPPmoFo46D8nV
 hVgRCcCi1IrhUWSaCDbDw+Kzta77QTbtaOL5M/4VRfUNL1SR/sEh9TDg78ZF3moupCur4/A
 +INeqjrFxnA2YMUIeOm+g==
UI-OutboundReport: notjunk:1;M01:P0:q3Jcwj0BHyg=;mqTzrWDxOBCqUUTERR/u2HQVRCg
 weByuyYcJEVxZOw2uYVjJwTxrCOgF6HzM3V0XHrjsHEGFT5Zm4AkQmh56kOFQoOafFcZBihAy
 K6IKPhiygAzKRknqWK7VH/cpcQ2QpLTqlUPoFrB72bmUrcZc6xTxWak2NixQvlVwP5cA1UJus
 0JMgzHrXHsUA/ofwWzU6kmsLhfCREqRUfKLTMvvbsF29mIJgJlfNzqUq5VP5bSV4cqHvdAX86
 BylgACFev1EXFtlYWUjhFbm8qYCOoCHS4bHGXbTQJ9PQHlMYJuWOxNQCjC7Qq31vwImeXyYOg
 o5OpyV001meKNTjS/e+SuPUefSDe+wzfINER+UL7sI1DeBUOeq/HfkZ7jSapgW0NmnCvuT5Dr
 Mq8SlBpIWUNWRyJiZjjc8N5wGkEmsqxwZEZzPmHJYzpEx0dTgkx1e3n8t3vn2k4kYdFhCPll2
 f4pEhGX6mMybQTEpGFwh1UYNhUDRFzTzDZSo8NABP/n0zPtEj1RLdYp939bGgLMZn0vlcKsQ5
 49pYmNDBON/Xp3BQCecCO3G9yL4Pob2UdaAh1D15pR3NjM4f0RyPygrVzH0QMikmmKMuWU4Eb
 2nSb6gr3Ba91cJ8G3zSx/DQrKl7voXxqFDsDcJPjxeQYKt6irZeco0Q43ZSkEywkBMi1bydkb
 cSsF5C0RX7Wxv9uhmzuU0GM9TAkH/D85gH/HM1Roq6BgJpg0Ap8VPIdyPqPdd/FG1fHOnELtV
 PVQEkVuZpefjOQXDWl0tIuNf98rdnGOD8m2xQSWd5EO27JwMv347C4YcSWdIcw6P/Lygfd1wM
 UCtHzwVCPRjYjGJT2Cv2eioRK61dLqE/oZp6gJrO1FqYuXBF6zUfx3+DBmDkzsn7kpD9E9I/L
 aGVALb0+cpxxSzqqT1EJxNmIMiMJ6+KRj4L30BnrpJO+qJ+3j0Cn27CUF7ikv+YRXDsSFXL5L
 0gDKuw==
Message-ID-Hash: VVJ3PCNZHTFUHLVHBEMVUFNYJB6MQZ6G
X-Message-ID-Hash: VVJ3PCNZHTFUHLVHBEMVUFNYJB6MQZ6G
X-MailFrom: l.guzenko@web.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VVJ3PCNZHTFUHLVHBEMVUFNYJB6MQZ6G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This HP Laptop uses ALC236 codec with COEF 0x07 controlling the
mute LED. Enable existing quirk for this device.

Signed-off-by: Luka Guzenko <l.guzenko@web.de>
=2D--
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3eeecf67c17b..4b68d3df9473 100644
=2D-- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9722,6 +9722,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[]=
 =3D {
 	SND_PCI_QUIRK(0x103c, 0x89c6, "Zbook Fury 17 G9", ALC245_FIXUP_CS35L41_S=
PI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89ca, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VRE=
F),
 	SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)", ALC236_FI=
XUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx", ALC236_FIXUP_HP_MU=
TE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8a25, "HP Victus 16-d1xxx (MB 8A25)", ALC245_FIX=
UP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One", ALC285_FIXUP_HP_LIMIT_INT_MI=
C_BOOST),
 	SND_PCI_QUIRK(0x103c, 0x8aa0, "HP ProBook 440 G9 (MB 8A9E)", ALC236_FIXU=
P_HP_GPIO_LED),
=2D-
2.42.0

