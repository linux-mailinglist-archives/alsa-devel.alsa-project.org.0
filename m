Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDF6826389
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jan 2024 09:58:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F048B154F;
	Sun,  7 Jan 2024 09:58:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F048B154F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704617902;
	bh=ehawtbA1G6P8hgV9kX0SSq4hQvp6gdhNC80SxSlC0AE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vitcaXAQBfLUcD+7vHxVvzGrY6qyKTS73bWGhMtlvGptlYylN2nHYN6UOgudZEwr8
	 an+6AlLknbsl8+Q3uwPFToyCq6ojWmL3DHbvtGd00hPZkCsPBJqJKE7kBsdUzEjV2q
	 y4MWAhKFKlnbah8+3YU4EvPeZaRPBTklaC1rqtd4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C091F805EF; Sun,  7 Jan 2024 09:55:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04F05F800F5;
	Sun,  7 Jan 2024 09:55:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AA23F804B0; Sat,  6 Jan 2024 18:17:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BE48F802DB
	for <alsa-devel@alsa-project.org>; Sat,  6 Jan 2024 18:17:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BE48F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.com header.i=erick.archer@gmx.com
 header.a=rsa-sha256 header.s=s31663417 header.b=aoZPsGMF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
	s=s31663417; t=1704561417; x=1705166217; i=erick.archer@gmx.com;
	bh=ehawtbA1G6P8hgV9kX0SSq4hQvp6gdhNC80SxSlC0AE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=aoZPsGMF6ZMfBEoL2/qHofT2uOjiPgFUqG5wk1Vy/8CEMW1oVszREPdcrHj0zIP5
	 9za3BitnciTds2PyGVDnLtEN2lNqC4fT3G+hqa2gIB7WQVT9jFMtVZbQhdDrYXrtV
	 2mfzhlhSM6q6f+bZ3/J2CBBEjQi3LUtdwfepQIxIDrllBVH7Ck1Sf5j8WurgzAfQS
	 hsp8NTjzKVTf8dGA/qBgUBVtZeWcJo7G+pGbzcx3qLZ2w/jEKIgRJZvMIS9rLv4ZR
	 /9xSG/VBJX7TP+xriI/DEomFLZ4ri+ujDqxXmXbZXiXJgYaiJ7PdsI9QX+PjbUymN
	 rTPEir7w0/jJSD0GxQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([79.157.194.183]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1N6bfw-1r8ORT1GJi-0182oO; Sat, 06 Jan 2024 18:16:57 +0100
From: Erick Archer <erick.archer@gmx.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
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
Subject: [PATCH] ASoC: qcom: Use devm_kcalloc() instead of devm_kzalloc()
Date: Sat,  6 Jan 2024 18:16:35 +0100
Message-Id: <20240106171635.19881-1-erick.archer@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YRX4UVilIzmkB5A8GIVf10FiBsGh6WtPr5VToXbmFOaw0S2ugbb
 z2dkXSIyYbYgrRi1oVJTiH6xqePO/kv4eP7B6QISv2/3THWf8OGgTmtl+sXddgC4m17w4OW
 +pdh2oIH1MK0DRvyNRcxhycFxsLv67BIwUbDDJdxTMoNxpwccvn77hQsJChFG340ZyNiVvZ
 KHlI8VftKZqtJs8frTCKQ==
UI-OutboundReport: notjunk:1;M01:P0:dhj4uTJ6JLU=;HTpuL9fUftftpUlblsMaGyxbzUB
 9hSH8hjNOg6tGgETMAD32HmYfZqIAGNd5zc5vzHkcOCDo6p3INnNa6PCN31ICKU7Q+lnTwRfY
 ayTByhpaANvXVTrDyPKA0AZWcCFDwJQ+755rbAKvgN83jW1ZwcN9PukO3qJpnOuYVI/aBw4dI
 wLqkKcBvdGQficN5FQlt1N50vHvkaf3cs90FbHX/FBZjmlA2wBb/MtgjOxv3go+w6ptC46gjN
 xu6QdFqm74J0qWdbv1YVRwf5GX/LIZk/R52K7aTj1NGwBHlUyq3f0443IOvu/DZ4dqDVOw4tj
 sWT+ExWRijtse2TgXQ/M3Sm03TWp2vwNrIYjL0fmY227P+TXUPpnrE2w+kgUji7uNu86q8Xh+
 gzNgsVUFBIlhP0nKdGq0gaO+FhCyFEvsxEwYPAP6IQD1R0SEMd2jbwl/fFAwzion45/KAPGik
 Jjmu9cVWNEufoa5EGGmSTw2s7raIkatHKsyR9itZXruxPRAKKtyvom5hJhlKjrv+tDcRMhiq7
 b2PzbXNzkTrD63pdLkYmmP8xd6Ctp0oVs+6JDblL8UrrBorKHCge2UtXjYmluZhBma750wXgi
 3s/AsHaebWbn/jGYgxcBV3VklTiGtRDtPfRoRTmvMKD2rEpJW57gz4GSftNjWsJzj8rqV5o0f
 cKfPtTZ/urXBVZoxBuMUntQW4bv89UUPkq7n4gVJNsT7F5Fb1yBMZuAEAj7uNa8G64tHM5shi
 5HdhlsZ/j2xcmKAOf4rgCFWRfoVU57WDKiXA6qkKfQ1EjTVW1wN16EKFEMgClvi1lzSNQ6Dxf
 IhQemX8pVrmTI08KraB2iW/LX/q74Q0TSSBJEoevE55Xd4Il1bj7vE2HEAxzjlI2t7eFIgPmt
 7lNsIJOvDBckGfP9ErALrixKyFgfrXaZ6ZAfMJVOJ7r5iT0Tk0xUx0Zbo2CZvx5jrETLkfQ/o
 PBjU/g44i8aaV2uxQSIzC9ivgc4=
X-MailFrom: erick.archer@gmx.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: P44I35B6PBQPIZNAIKO4WR6GBZZNG3U4
X-Message-ID-Hash: P44I35B6PBQPIZNAIKO4WR6GBZZNG3U4
X-Mailman-Approved-At: Sun, 07 Jan 2024 08:54:23 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P44I35B6PBQPIZNAIKO4WR6GBZZNG3U4/>
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
 sound/soc/qcom/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 756706d5b493..747041fa7866 100644
=2D-- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -73,7 +73,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	link =3D card->dai_link;

 	for_each_available_child_of_node(dev->of_node, np) {
-		dlc =3D devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
+		dlc =3D devm_kcalloc(dev, 2, sizeof(*dlc), GFP_KERNEL);
 		if (!dlc) {
 			ret =3D -ENOMEM;
 			goto err_put_np;
=2D-
2.25.1

