Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 366AF89A982
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 09:15:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80E862D29;
	Sat,  6 Apr 2024 09:15:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80E862D29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712387758;
	bh=vSdStWXaMF2AmqNZgs9LSwDod9v0StxfAyEnlvsdI50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rnd2HOJ47Sh3hgf+RS8XALZoeF/40foy6eaAPm0ptO/215Kxdu4fIzG7gbRodlLa2
	 Bl8PELl1XP+3l7aBcKKQYO26UIV+kvX9Qgk6Bh5swE1qCZ7rADtNh45pF/dIzRL78D
	 qBsEIJ8z9urummzFoeU3mMwKGg+SlHU4jKRjEhqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99854F8058C; Sat,  6 Apr 2024 09:15:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17202F8057D;
	Sat,  6 Apr 2024 09:15:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29C03F8020D; Sat,  6 Apr 2024 08:51:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16F9EF80238
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 08:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16F9EF80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=d1Bjq8ul
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712386113; x=1712990913;
	i=oswald.buddenhagen@gmx.de;
	bh=+L+guLsNZhLsW1/pGV/mleHLAA8DCmUh3bYNY/pzew4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=d1Bjq8ulg4DEFXdQRmaBSg9luqwM3FWNe+MZmjlINZKCn+QFAEjLhKwIYodGJHg8
	 79nwnn8kVF9k3syHya5FSuY685bLKViBm+amqvc+z59TUDMQZklK5zrwz1moS1htU
	 /Bcfl5jIt7PXKX8d/OQCC3EeDy3cI95grfdmy27jr3RcwZi5kyV8m7aziUoH+TzMZ
	 r9+oInTSEaHug2WON8E8BCbe2b07Dh4wuqUSIPW8wXfRrSmfA3DdyrHt5Ts4F93jR
	 3narzZ7TX6yHE8ituUHhxsAq6+aV05ZoKRmmnjcX1ym8DXHB6oF014K89E/9ec67m
	 m1ezBtoNLKv+Q9+LQQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.118]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLiCo-1sAWje3FCq-00HhoU; Sat, 06
 Apr 2024 08:48:33 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rszqo-Jql-00; Sat, 06 Apr 2024 08:48:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v3 04/17] ALSA: emux: fix init of patch_info.truesize in
 load_data()
Date: Sat,  6 Apr 2024 08:48:17 +0200
Message-ID: <20240406064830.1029573-5-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
References: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tYges1QnxTuElXmOCdxnzUAlgas9EAQk7u/rywiVm2411Idot7F
 gjBepBZyEOcpKAb5uWP94s1AJux4ciwrd+VlwhEM3l49bBqJfTsRrLDFvpKMsMqqkte9CmG
 eAyJDrw6HWHFUOxosaRWIgaeOmmn9NmSqZFVeOPrLc91aZJRxXNkO2UWk9fURUxv84pLvG9
 TGchMl76KsN7yjzT9UWKA==
UI-OutboundReport: notjunk:1;M01:P0:qdL6WnzOZ9w=;tguPp1/1KFE4VtkLkAyifk0K3FU
 T+Xzpwcd0ojXCa6fg/g1bmIMZqV0sceW9nZWSKMoc37jyy82Pj+q2kQDAN7mzGb2E9iO4UOiU
 Wk2rTYE8OZytADPITioMge0QY2GzhQ8xZgWi0lKSSzOPa8JnWNj48kAdxzpuMblCk/54T5B6t
 e0Oy5ok5wlz4/NxvvgOPkrv/TkdmiJ7Ro5SxMwbN5Rcq7s8CPamCP4awuhMupUS/UMhRIawic
 q77m84Lim9v9WSnlOPYUnQpaT4yUStsd3oYUAEHGuMq0hp0wGa1JtTWMiO+9F+0x0YPj77KWp
 WhMDvwVFkzziwmXrO6vj6ZnRn3ciwjvq6FGPxkkmMDUvTF0FzWO7ywQ8BfBytQD5BjOekZmDt
 CtW9IRvbdVD8oz7imXJPsNzyx0CnOp0dDsAZYmMPOpqyp2CAc9jmnf9XxXrX898p1JBT5pX9e
 PDaoyYcX4VF6mN4c57R6XrX9UGWXB6HX7V4S+1houcplGkV3VHCXiVQWnlDYSpB4VORiE+EJQ
 drKCWFmzrX3Sj+aMZ1jM4p0uG2ZOhLc07ktP5owS6SHW+YwU++k+OcMnv610tFTgKOEsd9+6+
 MMZP0ZasshDlvu8MnD7aq1uyTqFAta6m743fJkc1jbl43Bw3wXu8fkIiNEyMcxQtzL082/Y1K
 e6mgK1+e0mDlxy8gMhhk2fupb7ZM61fkHnWFlSRSgd3QGpM8w0Bl5Ve+4SU6AVvel0LybAz/I
 PSPY91cQCa9/9S4+NkPc9lfXax8BPM8kjCNwqaDwYYSS9aUBFz3DSjZpjXO5SjDDRKTUCHCSu
 Yft89w5T9Km1SlwT2Al7QftaixvjzpRPlmavWFH02qlBY=
Message-ID-Hash: 4RHOQCZ7K4DSCQYCNLX543QFWPZSXCGA
X-Message-ID-Hash: 4RHOQCZ7K4DSCQYCNLX543QFWPZSXCGA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RHOQCZ7K4DSCQYCNLX543QFWPZSXCGA/>
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
---
 sound/synth/emux/soundfont.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index e1e47518ac92..ad0231d7a39d 100644
--- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -735,7 +735,7 @@ load_data(struct snd_sf_list *sflist, const void __user=
 *data, long count)
 	sp->v =3D sample_info;
 	sp->v.sf_id =3D sf->id;
 	sp->v.dummy =3D 0;
-	sp->v.truesize =3D sp->v.size;
+	sp->v.truesize =3D 0;
=20
 	/*
 	 * If there is wave data then load it.
--=20
2.44.0.701.g2cf7baacf3.dirty

