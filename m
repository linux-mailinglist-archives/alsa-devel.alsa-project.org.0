Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FB22F8A82
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Jan 2021 02:36:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 622F0180F;
	Sat, 16 Jan 2021 02:35:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 622F0180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610760971;
	bh=DQQZnUMbUtwZPh7yTU29MprFxwRzkiuslGETPcaqJo8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GieiPKnnK0YG+rNOTZzJYLCDu9xy2gRTrWli0j/U05zBQVtWEYXVlA9ZAaB6y0OBo
	 /HKyhNcCMuuoHTM0UnZozUWA+Tx1mQRkE/yp30SMYcArYtga3IiEMUYflCE8J0jM0b
	 zSocRbqIi0ZXeOqSO6nS88CzyJNL0ffHkc/xWZD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AA82F801ED;
	Sat, 16 Jan 2021 02:34:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98146F801ED; Sat, 16 Jan 2021 02:34:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9881DF80113
 for <alsa-devel@alsa-project.org>; Sat, 16 Jan 2021 02:34:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9881DF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="cog9hvUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1610760854;
 bh=DQQZnUMbUtwZPh7yTU29MprFxwRzkiuslGETPcaqJo8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=cog9hvUmq55W6byV1TS48av1bEZ7PXysxyCGgKApmcCYynqhCO2lQn+h+AiGRA94t
 OgFJF5T/QNSzaxG0TCp9IELKiKgIHidDZDYj4TI+sSO2r45QpCqrFoVM+uCAX92MlI
 QQK0T1mGyDe8XSmyupOPDj5Zc6wq9neOT53Ctsk0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.209]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0X8u-1lwyQ61BB6-00wRfe; Sat, 16
 Jan 2021 02:34:14 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: devicetree@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: mt8192-mt6359: Fix indentation
Date: Sat, 16 Jan 2021 02:34:03 +0100
Message-Id: <20210116013403.3490518-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Pw6fFpTH4JgulBV4NAW8Xpyamk7kKZTHxe+JZ4cc993vURc1kCj
 7EySxi7Gz78sAu5+8TKulKiDoT2+ooilj9mV/eUYqsZNVDTaK24TueQik0HEwxhLaiYO4bk
 6n97hGj7Ss3y2IbPuuhsoi+0Y7OHlbRAyMvn1FGGtfqknwAbxeDQFeYqVdcaCOMfFkAxczn
 RCvSujcPzFrr4RsfqbLEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IPBpfBkRmAk=:zl2DPbIfK5owXrw1MFdPo9
 jw90m3gH6cgXufM313n574GMBIwSMGynz3n+S/ZuZrze3DN9v/dcqv2O14pJ8o3VACuorRSKk
 V9u8sgGEE+cLqabZrDM5mkn73R7Vdh6NyuNfCkglJHBsI92A4gifOTCDmqV1AlsaMm0zn/p2e
 rIC+ddHeq4x73wQxbeEkyvjI0YTb+9ffoJbfKaKxSWcRZNdfOlPD+L4ytL/w7bTJR7KTiQJot
 V4wglot2Gu/IHfIREXDDg4+RgrpmhpAX47LOmpHgBH/avkJeVUp8XKHdyFAGCOZ4Tkk/y0W++
 0ZOyQgtTQnAY43gkhofYd/Uuuy/xnu7zS7aR/7iP7zUguOifpre9pcAEIvaxG6/fVe01XOd0N
 6bODbQRUBlkpOv3oRYABJ9DVqxD06cuF49mkEPQFCVyY5nd96mGyZxYfGiu2yRR/jDr7RIQFC
 dB67pKUqHKj9VyNkzefS2hCL0X3lYpECvsu9T5J5o0IM9edWdmW2DJD6uPxsv+rjAO0CEdR4R
 Pp6eOGTrZTQgsPAWjWO1EUZ6kXz7FePk4bObyR3e1qPsE1BjqoaDfmJSqNVXd72njM9HoUZK3
 P0M1DirTom+CxISI0hHxtrSwrZwX2LjV3Mb+9FQQRdh1mgr1xqH3AaQB5pD1zzzIDUjzVuT1W
 cTLIJos3piVPQNdVWUQH6MLx95Mz8rtSkHDejh1QsdoaUX+QHrq3tdzQR3BCPq5ozhZaGBgXf
 /lFubO7bQExU69QcPWDKW0CHjMsRPBTCkYCM3k8mxYE6PEXQSJ1SMPI4dixbQTcyJDVRgnq3S
 sL/xCXPGVgb95m9DOp+jPVwLJkwLVFFJl2U3FRCKRUGzce2snZth40I2UG7vZw/18rat8XlI9
 wzNrHJFgtZIJY4hMc7NQ==
Cc: alsa-devel@alsa-project.org, Shane Chien <shane.chien@mediatek.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

The items of the 'maintainers' list are indented with three spaces.
Use the usual two spaces instead, for consistency and to silence
yamllint.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 .../bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-=
rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015=
-rt5682.yaml
index bf8c8ba25009d..54650823b29a4 100644
=2D-- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt568=
2.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.=
yaml
@@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Mediatek MT8192 with MT6359, RT1015 and RT5682 ASoC sound card dri=
ver

 maintainers:
-   - Jiaxin Yu <jiaxin.yu@mediatek.com>
-   - Shane Chien <shane.chien@mediatek.com>
+  - Jiaxin Yu <jiaxin.yu@mediatek.com>
+  - Shane Chien <shane.chien@mediatek.com>

 description:
   This binding describes the MT8192 sound card.
=2D-
2.29.2

