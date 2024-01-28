Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C6983F633
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jan 2024 16:58:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B24DD82C;
	Sun, 28 Jan 2024 16:57:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B24DD82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706457487;
	bh=GFS4F0OefxoOXjJnNopMDwR/bp9rgwp1BO9HRQFGLes=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DVeSWJ6ZgYcijEcL/H+d56xT/hpTbzFwns1WydjwfgplHk0c5ryZfccOaz4n9jr5c
	 HVX/NW7qGIVQnbtTMFvsPog09Xq86J12Wr047xnloi1SWG6sFX4feFdOjb0VZO3BS3
	 XMR6I9fBHamaCl7xzUGhLkYpk9kT2HyPBWvPZBLE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86053F80564; Sun, 28 Jan 2024 16:57:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A399BF8055C;
	Sun, 28 Jan 2024 16:57:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ED85F80310; Sun, 28 Jan 2024 16:57:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33ABDF80149
	for <alsa-devel@alsa-project.org>; Sun, 28 Jan 2024 16:57:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33ABDF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=l.guzenko@web.de header.a=rsa-sha256
 header.s=s29768273 header.b=oGFND3vc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1706457436; x=1707062236; i=l.guzenko@web.de;
	bh=GFS4F0OefxoOXjJnNopMDwR/bp9rgwp1BO9HRQFGLes=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=oGFND3vc5jt5BFEIX0PsPmoVix1E06UYyOfec8U87k+8eq1djVxi2EoNryq3tBhr
	 1AYRLV4lk4wksHZ/4tgnm9OdhKmzUvDiw8n+3likow42+/8yzqVcRlMZM/eXxXFAr
	 QYvULxIQC0sjhGyJMUdGvkMNgzBSCSCpCWToyBL+wSx8lnnk3Z5ETZvBhPzeeWjWW
	 AqPKk/+zLnOzxO1Fo97hDr4k/yENcE+JzuUCNh301hnsavAOrhp6eykEzX2P4sS8r
	 zhUopN7OmPxoSFY/3huG3qzbVg/PqeDOib/QJNFin7NcpLdHcMEmFAjhyy8mnwJQN
	 mQA0Lvo7McyaCKhFuQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from luka-spectre.fritz.box ([78.51.251.250]) by smtp.web.de
 (mrweb106 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MRk4e-1reSaU0aaY-00TNem; Sun, 28 Jan 2024 16:57:16 +0100
From: Luka Guzenko <l.guzenko@web.de>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Luka Guzenko <l.guzenko@web.de>
Subject: [PATCH] ALSA: hda/realtek: Enable Mute LED on HP Laptop 14-fq0xxx
Date: Sun, 28 Jan 2024 16:57:04 +0100
Message-ID: <20240128155704.2333812-1-l.guzenko@web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:I8Fom4DyIjORlkYYIjOgd3x3ac0zGP5cFmWQ1/kwnbPjVWpPew5
 hg+Gy7hpKpHkjoFw8zCAbvXVQjy9+RZIhZWqIxWdmu/LxBdTWrOGPtckt7mEwVoubaOR3oW
 4usUuEgZGPYu+7zPwFCb4udKsmHQHPf0UcLvNiFOkho6DkmzT820blsrNXjuGomYBdoXIme
 T6vqazPYITvaI2byUjwKQ==
UI-OutboundReport: notjunk:1;M01:P0:HTLPyXCyhFs=;cPQ3PlqVxSG6pIMGL/NTeirKysV
 EWvM4gq+Ac5F6a5AAas5JG4jMbZZMkpcg9yvL+oKnBaNM9huN8cdSsChr/jYK7rkyVYpOQkfH
 QFXaHKjVgR2I+K30UP3XJFLPuo55OFVhOiNkd0mJ/Q3FuVz7Ol6y6Ec7vnD6YbQVvf3jsxqP3
 m+TVrPpWBMCAoC19oLBaLeu/yoen1vrcLphEmRuCJ378nRgsi2yP+HncAn4OHP+1xI0VCylQp
 pXBMvyn/BsnaAid1g5eApBw9T5g/Ol1TwpsndnzZ5t0U/UJIQohiffwDoJVy1qcq/Cu7xFnJn
 0rWD+KfyTyln+82rjbOAnhxB/mvEEL/wB/Dk6EyJjfpJE37yQksbFDzg4rBImL7TUX33SIa8G
 MMZGh73HrJ+UDo3Oggeb53bgaL78+fuQEjY/Z3UTX0gcjlrsVOnTGXIOGUYvyGIoQOgAT5mD/
 gKCfi9Bou2QjU70YlBMU3HMv2ih515BldnkQEXmZwxtWx8xJ6EqU2x6uG1e0XZxX+ZRkMop02
 s/zW7TcOFmAVgZqDqidE2w6XZ9mkuntMn13CYHS/Ml4ECo19AARSOLIJLph0WVXFAbdfUsmRK
 4S11B5ROS4EeUzSD14nULp+TToafR5NymijBF+0Vxcf+LCKgCvqdGNNx2NYZbhZLoAWGHu8/G
 g1SdLmhp2Ni73KI+KlBbizQkicso+5BtEyU6ktHt4p5i/D5v93Dc860z3rjaOpXQJlzobx5bc
 5Ea14zGbMPtXNkCtSBhCPfzb3ZrDeLFZ/FOTsmbLgwdNLwclYuSNp4ZxDWzN6BJgRBEuZYequ
 oSTd4x8BKfsVx9xa9A/sjr+JS8MOoqXRn+T5+8Gb+Bs2Z+X8lZoD9y/sLGFgesld5hk4vJilq
 +S+i3CsD3SNIg76C26VqHDc4fd7MLDyuaj01q7l1wjfABQNMNh1bZEt3atqQaS5+5gRMQEL9A
 TCSnLXHmktQlzfO1/akmBcg6VTw=
Message-ID-Hash: 3WDSFDYGHBV7YALM3OAO3F2ASIJ5H652
X-Message-ID-Hash: 3WDSFDYGHBV7YALM3OAO3F2ASIJ5H652
X-MailFrom: l.guzenko@web.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3WDSFDYGHBV7YALM3OAO3F2ASIJ5H652/>
List-Archive: <>
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
index f6f16622f9cc..0d2fbb8b24b3 100644
=2D-- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9852,6 +9852,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[]=
 =3D {
 	SND_PCI_QUIRK(0x103c, 0x8786, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8787, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MUT=
E_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_FI=
XUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e7, "HP ProBook 450 G8 Notebook PC", ALC236_FI=
XUP_HP_GPIO_LED),
=2D-
2.43.0

