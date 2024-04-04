Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D49148984A4
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 12:06:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C925D2C7E;
	Thu,  4 Apr 2024 12:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C925D2C7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712225175;
	bh=YIwbIZ6D+FCvdDacAGPsNTeusqvHMyZJnVxHcW8EYOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EzVidhK6kO7XBA6jpbU3zuqnk2ydiysw3xghi7PgpYl5Z6n1nl66fHwWrR5OMAsxA
	 2rQZD7u+KoBpUC750zDjxnBD1o+y7t03zSVSxH41emMcr2maJSLIECuRoyW5UjgdxJ
	 vdj9hu4hwaAWLmndxWL8IeTVjMQtaqT97GEKP8MA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 400BCF8060B; Thu,  4 Apr 2024 12:03:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0556BF806F0;
	Thu,  4 Apr 2024 12:03:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB756F806C0; Thu,  4 Apr 2024 12:03:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8244AF8020D
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 12:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8244AF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=cT7YZLZW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712224851; x=1712829651;
	i=oswald.buddenhagen@gmx.de;
	bh=BKRzh0jN6jwk4FV1MW84OiCzx2QTtPr9DeRxFjCpOmA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=cT7YZLZWPy5Np4vNlFLrfX0BBUf9yI82l03CUNTprrP53a0cNAIo0gMuur4pEP4h
	 GYfLfs9lKmA7AaMEKo6rdhwEihynz+RQUfuODsBGl2xjFYote6DiRyBInJreiCIkM
	 qkkJuOofTvweVarGDLouXzVqnPNpufR2DG4bzDlSeqjgRIHA232NH0QewAD//lEuc
	 dt6pQB88jEXOoLfV9oCyiD7iqQpxwka/CEQgBfybRYi5re/PBLfRnFq+iMQTHmGeb
	 f/t7KPQk4ij7P7wcYXWu/XJrdwrvmUQESfM3OXSqBOej4arLArG2t+A1znwZV+af0
	 +z3SgFsi6yi86d+Xbw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.126]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEm2D-1s2z193DPH-00GFCH; Thu, 04
 Apr 2024 12:00:51 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsJto-RFI-00; Thu, 04 Apr 2024 12:00:48 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v2 04/17] ALSA: emux: fix init of patch_info.truesize in
 load_data()
Date: Thu,  4 Apr 2024 12:00:35 +0200
Message-ID: <20240404100048.819674-5-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:THqLUx/zdPTTmiYiRbsoIObrTwqA0wDrsgnqTSMSzR2Il0PRVhp
 zMPOIm/ixmw+aJ3iVp9Bca4YfIT9IwDh79JdN99Pg2LGNNjpGnGzDgTmK26vWHZwT3/0G59
 l7kZdhNg+O8mji6YwxA0usR8mIdQRjQl+XYN0iNarPyzm6PeUhwmV9iBYa3MOtMXMtnaEZq
 HxcoyskS6zeB21m0+HXhw==
UI-OutboundReport: notjunk:1;M01:P0:SrMp/VBSqek=;/Ps4LyF/1nmjeSTR2aYkkmIBCQd
 Y+FR12TtFN096RNyJB9vzgLb40ODnXOP1c8xF2FzG5ADR9cNAkiFCF5iAuNnZCkTfdYqbJIsR
 AsWs5Jfal4101PhPPDGq5kCcEtcfmQqrtmUD82+wN3pVE5vt8qWkGkKwbtq4sz5Dv5tTcrTBM
 gEqgxmU4a13gycDLQ5Wo17zrIuPgXVfPjKFiuPmo5MaL8ik+c3lHe4SAfPCbF06REHk7+eyu9
 V5uEWsfip3e118WgIyaTIJ0SOX2S0j4s0S7fW4fxsC7N/Nbl3jCO+kMQhNPkDffa7iGe2LOww
 MQCHr6aj8mIMBDC25TdO65xGsXH63iMaCfTNVPnuDjh+cM9bIaGW11nu5owC9a4xW6Mj3zk9d
 whPY3hW5NChRVuscHQh0UAZUNqEJXY3gq9ouP8kL/4f9BZPZcKjYubm6m2tBUOYZt+59SELet
 Ez6S3rXEIPNoZPM9/ts4jCt6dWFXBf/AcE6+rtwqAmX0L+EbKwGcwziSC5/PViPqUfsGSpRg0
 dbTmUZff7mEIuiP063/+sQPtyp+ZAhGPmjDOwKGwCOZOeiJPi6rMDRmZNVmj0jD0gXFIsmEN+
 PvH3q5UNUipb1NyZqfcONQlzLCIjINi1g9ZruEwuSNX/GcI9+YM3ScudUDF4whaQyBFD9eHiG
 jOQIG1hwYNmOmVfK5scRtUlznFEK9ouTN3GEe7Ngg6rfK4nxy56dz5jFjTEh0IEgrKYWwQ1yW
 YSYUUlOGIS5z0JKldGknlMhRnOm4Ict57I7l8QhSSprPeOUTKfw1Ss8Fx8rFTAqUqL2/ovtxo
 ZuE+8pPqrKFuKzqpAKDqwbnY4Kc0FoYExstNuitu9ERvQ=
Message-ID-Hash: ST3B3WG6ZKMVYZ5CKPZ2X5YWV3UMUZLT
X-Message-ID-Hash: ST3B3WG6ZKMVYZ5CKPZ2X5YWV3UMUZLT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ST3B3WG6ZKMVYZ5CKPZ2X5YWV3UMUZLT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The field is explicitly documented to be initialized by the driver
(which it actually is). Also, using patch_info.size would be actually
wrong for 16-bit data, as one field counts samples, while the other
counts bytes.

load_guspatch() already did it right.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/synth/emux/soundfont.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index e1e47518ac92..ad0231d7a39d 100644
=2D-- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -735,7 +735,7 @@ load_data(struct snd_sf_list *sflist, const void __use=
r *data, long count)
 	sp->v =3D sample_info;
 	sp->v.sf_id =3D sf->id;
 	sp->v.dummy =3D 0;
-	sp->v.truesize =3D sp->v.size;
+	sp->v.truesize =3D 0;

 	/*
 	 * If there is wave data then load it.
=2D-
2.42.0.419.g70bf8a5751

