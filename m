Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E30576141F
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 13:16:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EA561509;
	Tue, 25 Jul 2023 13:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EA561509
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690283803;
	bh=JgvVNzBT8P4UzxGtOp1DNJMrISv/OE1o39OgkVldOMw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K0WIiuGtUHVVRoSkrsYQX4Md23zl3FfzMROJ8rsRUNL0OQwClzF866mQaQXlo/fju
	 JEjpOxRT9xaosVx3CMWJOt33C5NBZvs58NSmlWoNZ2bY0annB3z03jheya3l2InoXU
	 aWmzFTtAX+W8vmT7Q/4I1jFUPDFKCeYwkuxRM6CU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A72F3F80535; Tue, 25 Jul 2023 13:15:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EA31F80163;
	Tue, 25 Jul 2023 13:15:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61B7BF8019B; Tue, 25 Jul 2023 13:15:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 559F2F80153
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 13:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 559F2F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=l.guzenko@web.de header.a=rsa-sha256
 header.s=s29768273 header.b=dEYrdzC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1690283742; x=1690888542; i=l.guzenko@web.de;
 bh=JgvVNzBT8P4UzxGtOp1DNJMrISv/OE1o39OgkVldOMw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=dEYrdzC0Be2BPl24rBXGnj4QZLod/vTYNL7pYBUaPMGXymHmSo6xcK9Jsd7B97Fr39EDOf+
 Rvw4bNk09KCmfTxhq6/OSkmemK4eKL/UvWu5r+iWFnq7QR5HiboqelQ3XzYzNV3+tsHcgM9xR
 WP/H8FMfPgHDHeVCQPqfG1J8WufPqf5eSD5HygrsY0gpFp/FWf81WQasAAB1mXjBDqk0P3yfa
 Doyeq78QPeQ8AeOTdjiXCytZif219+fEKzgpCBWM+qtI3sINShRL+C6aPB9dkxaVc9Jdk/Kaz
 de+NqVGLiJ+I8yOUhoEr0ECsuZNIhB6yWNL1UGYiwPyltEdAZ2TA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([77.190.186.198]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MvKbd-1q6Jah0cTZ-00rKLt; Tue, 25 Jul 2023 13:15:42 +0200
From: Luka Guzenko <l.guzenko@web.de>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Luka Guzenko <l.guzenko@web.de>
Subject: [PATCH] ALSA: hda/relatek: Enable Mute LED on HP 250 G8
Date: Tue, 25 Jul 2023 13:15:09 +0200
Message-ID: <20230725111509.623773-1-l.guzenko@web.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dP2sA9hxbvF2xuNjNlapa1Rw2atOLZirE9LfTzImJDaUZEgB2Yj
 3Av8+8ZDt6aygMnHuQyGZ2Qvy1gtCkc2btrpOsMh0E/r0YJjVWXtauVeOFTniXYrOFnUev4
 6iv/f8dj+Hy1a5XnVpO9K/VcsCbiKY6N5TCcY1jdx1nBpT4G7TpC93EelRfAXmhOlqj0m27
 Pc6yA44/WCn8xl1iD2xsw==
UI-OutboundReport: notjunk:1;M01:P0:HN3HGk2ZQPM=;RaJpNN5hQpL8UGQu9RE6L1Kfk97
 m+pdLywbn8REMEEdAVO0MSEeRE6xVoiDdhDPj5xBW7RNUTR9gMxMAYAfSWSSMsJz5sg6xJG0I
 dFXiZOdc/8ipsA13t6vBWBfBHNgSN2+rw/f5EzvZPQ3Ari85EnvqPkyqeKg43dj4OyvvKhH8g
 +RFDUn8YSOAe60yx5ML2+UasNdqAjmF6nHHv2VOAb+eT0f3Vc/Iszl31dnZwtAHoPRuP99NOr
 pYhLPEkpzU2O95MwIzwxg7z3P5YDnoiCOlksiW1hDKRvUNVqjlMpmgUcA6qKzbyK2TrN0bg6l
 EOg6tTIqzbbmkPNtzGCTUTFVL4nI/vCczwZBBUigrtbZoqjddyQF+82E824GPGWvHKAqdHF1m
 Tdd7YLzzKnLKMCn5gJbNXhOF7UWbJAxxQzGYmx902ICUNPzS+5VH94wiFTvbZJjbVA9723p7r
 1t3rjbp10VKWHBirKnI8aEmIwaXB5yw++Kh1AUBZzglh4pm81jSpBlSTue4s24e5YHw4J0v13
 +BjkLlOj7zTCk+KSD6JdolU9WNCrH2DNFm7zxiUI9Zd9rBzJiSOuPAfLNbpruhP7r9g5wbn7i
 2BfZ5SlbQ4degSCqVwK6xC6SFV/LH9eyBJ12BopxnHdRU2JkUXbY2la1CaTpsaz0gjooibTBY
 3hqsnfSSNpZyupv/1wYp/DQFaqKcifBroS/xwLX4kZIvPwWFi76hK7q84DB/xAbFsYT3cQBwe
 S7JRz2RWPEpwOqrXZWSvoWzT5OgHrb9XSvxxQxzRXvp8H/KLqxA0NodDIu34QwC5L7HK1D67M
 1X+xQy2DDAUnw2ZLKARv7HWS5fqR0JUVbQU/zhptJh+EoVTdM1vGnKhopHDvVzJCUq4YLrLxm
 Ef29/DoBJOdI269eG2tEhAVeP+2qAXGI74Scn7b+Cg5QP2FRceA3hhTeSpDJOzjbcT6YsWApR
 cg5Gjimf6gyFZZT9rZ3ps75uAU4=
Message-ID-Hash: RWVAUHQQJOWOIU3FLPJYDHGU5KL3LLLB
X-Message-ID-Hash: RWVAUHQQJOWOIU3FLPJYDHGU5KL3LLLB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RWVAUHQQJOWOIU3FLPJYDHGU5KL3LLLB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This HP Notebook used ALC236 codec with COEF 0x07 idx 1 controlling
the mute LED. Enable already existing quirk for this device.

Signed-off-by: Luka Guzenko <l.guzenko@web.de>
=2D--
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 52ea7d757d6a..9a65dfb00cb2 100644
=2D-- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9541,6 +9541,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[]=
 =3D {
 	SND_PCI_QUIRK(0x103c, 0x880d, "HP EliteBook 830 G8 Notebook PC", ALC285_=
FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8811, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_=
HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x8812, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_=
HP_SPECTRE_X360_EB1),
+	SND_PCI_QUIRK(0x103c, 0x881d, "HP 250 G8 Notebook PC", ALC236_FIXUP_HP_M=
UTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285_=
FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8847, "HP EliteBook x360 830 G8 Notebook PC", AL=
C285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x884b, "HP EliteBook 840 Aero G8 Notebook PC", AL=
C285_FIXUP_HP_GPIO_LED),
=2D-
2.41.0

