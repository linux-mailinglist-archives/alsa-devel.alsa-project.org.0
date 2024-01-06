Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D88826388
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jan 2024 09:58:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5828F152F;
	Sun,  7 Jan 2024 09:57:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5828F152F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704617885;
	bh=e0hTcOOsR2RlK2Db6LVueiP/okSfxGYoljbOBYdnEEc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tJEwkwxPTmI3D6pAgMCxH5b+RTUpKDMIl/FQTn3gAcWY2jWEUNI52HoyprNYoCnAi
	 bxowlxrf6r06eB3py1Amc7yE+K1ElqumS2jLleYPvujfmQgLmjIuKiHDi074FAkYG+
	 PHvdBxLSfR8AT+AE650x2CgyUHFV5MuqCDuJLoaI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98586F80733; Sun,  7 Jan 2024 09:55:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4BC0F80735;
	Sun,  7 Jan 2024 09:55:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FD70F804B0; Sat,  6 Jan 2024 17:28:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E7F3F80238
	for <alsa-devel@alsa-project.org>; Sat,  6 Jan 2024 17:28:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E7F3F80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.com header.i=erick.archer@gmx.com
 header.a=rsa-sha256 header.s=s31663417 header.b=o5Q2aPRI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
	s=s31663417; t=1704558513; x=1705163313; i=erick.archer@gmx.com;
	bh=e0hTcOOsR2RlK2Db6LVueiP/okSfxGYoljbOBYdnEEc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=o5Q2aPRIR0doNwIOWKP7y3nN7/7K0nX6kqVVjAgqHBDfTyb9LDtmoU6H0tU6r2R/
	 6NaA3TPwqnnrpUNWiQrvbXPhwbOKDBXTwMlV3RuA857vk4+Qxc9VCVVmwZ0svJw9y
	 7ckioRsuoA0+nHXHSge1o5rcmVHybJQvT6/kCmim0wav+GtTPij++zaBHepTgIfci
	 ksArFuktycokVf9aAYqmCTpt/nUkzG3UfYvAuFYEc3fUhg6oJgs3zn+tQAXDy73TK
	 NY0U0sobHB2FbGYCqJVewxjMmHt8akxumqgSzd8eXEb0yv57Tn4rFXXoLMDWiAikY
	 Y2G3B/2pnVDZcql+cA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([79.157.194.183]) by mail.gmx.net
 (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1N2V4J-1rCXvz3Vlf-013sJX; Sat, 06 Jan 2024 17:28:33 +0100
From: Erick Archer <erick.archer@gmx.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Erick Archer <erick.archer@gmx.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] ASoC: ti: Use devm_kcalloc() instead of devm_kzalloc()
Date: Sat,  6 Jan 2024 17:27:52 +0100
Message-Id: <20240106162752.18599-1-erick.archer@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:J9Z2yJ/wHte/ThnemlRGX6DPdngNYkEu5Qmuu/TGsQ8JKiVmBNd
 6q6JnJK6keaY+rBVn7TTtmK84OcBNuF5vnT5G4jvLwLJSfAO7jWJpnGhEvk08CTPfHOQPmX
 Lto0JUk1oMdf/wEimKI8LglRKgqilAChkvBcQd6ACUhECvTMZ7IKbnyxbh3WrcAiyuLJdP4
 jCvhm6oCcV8RBB1Ji+4qg==
UI-OutboundReport: notjunk:1;M01:P0:Tg/f7GjQ5YU=;TdqW4FC/+MrquMk23XdxfWu2lHR
 g2MLe95BV+DYAwonE0gIbvxdJwOShhn7OswR9fwILcCN615FOmEGuIWjFVhyln4ew5g/sFYHX
 wHzpfjy9cLiiDivcPgw9Swmn/vu1JTazYOUQX36WDVlodE6d3wtZxn0Y1aOJ7gL9gg8Kdj8f9
 mW+YIEq2oONNCgApI3u1d7XsWae0n5touxq35HqRLZ9pt7VFBD+qqD5HDjHHDB3x6vBX5Tq99
 QTgf0uBwibbfNfq1MP8FaeKlesNR7vLvTwt/TrTN6ysYRj9hZPHfVWNY4Ae+2fH1jTv8awFKQ
 QmfxdjrQorKxTvjD25nAIAYIrQBBslz2sFxHVJov2rY4xYx5rghjbvCPnQMopZ/jfxS7xCYQ2
 mpLgRv5sK/bx5ddfHwAV2nWarOTuumbkFnOyh74sOTFem9le672UaeTcRHBXVDz+3EXEoDBQq
 eKo03gewcOALgtOsJn00iD7ZyrdqXFc0kVn6R9s9agi5IFxLnLW2Iy/xxZJzb4bDaSg751BOb
 BipGzoC8llWXessJW+2ZBBPZYVHy57O0fqLHHoGMqUlPek2WXLwndXztaqfClTvPFMpdetoqy
 EvvX0Hm01m41He1YupvZuRuVhJEy8LAjkblGWrvKLHnCcl2JH34cNasBNsxF2eqVpiThEMi7v
 +gYhf3SLvWmY2TfWH2vYhcOTUxpg1UhC8LulFXNz+3EyGAOifXTwC9T5DbuoR/j5iOuCpUirC
 yuCPIscCKNvq/QhfcWJmK0F9iMegD1cht3eVOy2NHvrYTir6kVHYP6atbv1sINvHrZ1IcGjDc
 S76zz7+mTU1SO40/bd1S4LBeSMU0NaeIBbnQ41GRAS4RgMNkeGmheo9lLexV3dJz8qy5H9b0j
 tS9JmCtdJTkAAa7zesMUtftS5MYzG76IyxSsQ9YZ+RBquMnXG5QGOM44EYlWS6noq5ODfRTN5
 48bciHh1M6tSaOrBBqqZ2d9xFUs=
X-MailFrom: erick.archer@gmx.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PTO2UZ34GGHAAWAHY2ANBWA2KI7KYRBJ
X-Message-ID-Hash: PTO2UZ34GGHAAWAHY2ANBWA2KI7KYRBJ
X-Mailman-Approved-At: Sun, 07 Jan 2024 08:54:23 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PTO2UZ34GGHAAWAHY2ANBWA2KI7KYRBJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use 2-factor multiplication argument form devm_kcalloc() instead
of devm_kzalloc().

Link: https://github.com/KSPP/linux/issues/162
Signed-off-by: Erick Archer <erick.archer@gmx.com>
=2D--
 sound/soc/ti/j721e-evm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index b4b158dc736e..d9d1e021f5b2 100644
=2D-- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -649,7 +649,7 @@ static int j721e_soc_probe_cpb(struct j721e_priv *priv=
, int *link_idx,
 	 * Link 2: McASP10 <- pcm3168a_1 ADC
 	 */
 	comp_count =3D 6;
-	compnent =3D devm_kzalloc(priv->dev, comp_count * sizeof(*compnent),
+	compnent =3D devm_kcalloc(priv->dev, comp_count, sizeof(*compnent),
 				GFP_KERNEL);
 	if (!compnent) {
 		ret =3D -ENOMEM;
@@ -763,7 +763,7 @@ static int j721e_soc_probe_ivi(struct j721e_priv *priv=
, int *link_idx,
 	 *		   \ pcm3168a_b ADC
 	 */
 	comp_count =3D 8;
-	compnent =3D devm_kzalloc(priv->dev, comp_count * sizeof(*compnent),
+	compnent =3D devm_kcalloc(priv->dev, comp_count, sizeof(*compnent),
 				GFP_KERNEL);
 	if (!compnent) {
 		ret =3D -ENOMEM;
=2D-
2.25.1

