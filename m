Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3885C893A18
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:14:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7656622A4;
	Mon,  1 Apr 2024 12:14:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7656622A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711966460;
	bh=kV2UMXcSZ1GZPncixx8W95Jh7r+Kyy4j5solPuM4SVY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AfQyRfE3qV/QHvfcTfIfUkK3G5k+fL93SAjpu8QwhFGmZwWqJOOiL+757V7fS13ZD
	 eYrTYXvUXrWXEFX4rL1uBjoCAaoUg112qC3C4kBbAmHc2TztdVBA5AQY9gXNHsch4P
	 /Ngldt7YBaCKJhNjY5Ln1U63Lbfmi5gcS4W4gN74=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C92A8F80578; Mon,  1 Apr 2024 12:13:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67979F80587;
	Mon,  1 Apr 2024 12:13:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11E31F80236; Mon,  1 Apr 2024 12:13:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6EDB7F8016E
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EDB7F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=npWtpJyq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711966420; x=1712571220;
	i=oswald.buddenhagen@gmx.de;
	bh=MtGF6AXggt1+MtIlJ0/ypEhpUrd5SetPyuoTI/iTLU0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=npWtpJyqecXVB1N2DytI+1qQPOk8uFDZEdEY7IjLsMuPm7pOO8OB1tee9oIwo1Cu
	 Pq3anRSmFMN1Z7zFF9oj83UERCV/jQYPxkz6uST52vE8L7S8F9tOa+4JmbKnH1W66
	 Rou7tll3pqdVvjc2rXU81AiqP4wMUysSyTlhkUfZYAPD/1JK7Orb62JO/xIdSATj2
	 /9Y8GEvK09e5kfdsI6hAnEnuF6nLtkOrqiUdnX6c6jCA+irUpwxCCEpI739tumDHy
	 dqqJFY0VJ/eUzunG0+cSAhea/ZCxw+biqKCnwtuFhoVIW6JgnoOmWg18MdoeWmkKn
	 CrvZ2XvXYvRO6++MDQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysW2-1slpd00m0I-00vznc; Mon, 01
 Apr 2024 12:13:40 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEfb-7nk-00; Mon, 01 Apr 2024 12:13:39 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Manuel Lauss <mano@roarinelk.homelinux.net>
Subject: [PATCH] ALSA: soc/au1x: declare that FIFO is reported in frames
Date: Mon,  1 Apr 2024 12:13:39 +0200
Message-ID: <20240401101339.506639-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EZW5rDxjQmu3T2J6V7VKdGH9dg8+lc6qNjZoi6uP+96tD+FJwkw
 N2e0IdEuAKpPa0I4YWqPsMwqoxygpS19ea+yn/WnRgoDcRcr+X2jtXOZu77Pz+M7QC770h+
 1TFOi3Ts3KVDNr1BHX5GeoLPbfugB2A9XGXErf2SK8/uyMcVvO6ssTFA4yufkjG6QeSGlMj
 F/SIx3KptR7fvqRIPVcJg==
UI-OutboundReport: notjunk:1;M01:P0:S4FZbGvUmw0=;vKDN+Lp+itY/r5uVWQVxCxp/zgt
 M1HgKBoiwc/6aJpdPQNk7HftNE0i08L7XZQnXslg/Dns+Z5rVcsLmCTeb/4g7whlUvl8Wm+Kv
 zaqzTTcRzEkidEVN7lCHcv7Kq1EOPLwAjLd5ZnPOL7xDlQK5O2czpRcJmFWqlLH60zasELIGD
 O+OXxq3K3LnDO9ojrPHtgcQMPAHOxdt5VOfdQYxDuGrbwO1aOEV28g3m5Uu41e9p1OTwmrA5m
 Ax4pv7u/eQKgHOPdTc1Q6750aFqv+9t57uhhlv063Ia+KUUHA8752NOoAIH5jqNmac7BCQ1kQ
 l5PWGOoFADBJGytiZBq36HMEVTktOxhDaxyD0k0FZ7+tQ/xNGmwxXjh9FkzVaIvJfArqRuumK
 gZPIFR5p4fsucN+U4UeHXQvpxpDAoIRwktp813r38Dc1qIdbvu5e+r+JpAYXTZIuP/HKRJmsh
 RKAnAdNu20tBEKO9QEfbrpGNeFnFSWuw+sWbN7sBRSe7PF+/WNGvV+Qe9xFm9XbFpwdl5dNWe
 NG62IZjPHmiq9uF68afojC2JSF/mSy3stKE8veSuMIfzmiaZ6aw5kQPmFxxmHbuI8rJ2B7TeC
 Vg7lrykWs6qAabchLK1LvEg/92Djmp4q639jGTwl5j4wglt7HO9HyOXbvqhI0hXKKWYG7Vikx
 aHqvYYYxZW//rc+HgA9x2cF2ZO7zDKkg9bKEL/XBQYB4nDRH6fUEug9AHsLgdlWGb9jwPWxbr
 UsWknWBlXf3bp7lRgJakbgprw/5agWAGkcW2FeBMenElNwepEAFRQR29Zxh+IwcRfSRZOVigG
 tc/HzOBNCy1GlDbeeYy6MuQ6DwbWHfH/V6tE5ZpmRXMqE=
Message-ID-Hash: 5ONYSIPFEIITSK4BC4KM6LREXZLGX6V5
X-Message-ID-Hash: 5ONYSIPFEIITSK4BC4KM6LREXZLGX6V5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ONYSIPFEIITSK4BC4KM6LREXZLGX6V5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--

Is this right? The comment on the field says "fifo entries of AC97/I2S
PSC", which suggests frames, but that may mean whatever.

Cc: Manuel Lauss <mano@roarinelk.homelinux.net>
=2D--
 sound/soc/au1x/dbdma2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/au1x/dbdma2.c b/sound/soc/au1x/dbdma2.c
index ea01d6490cec..2c8c01a5fb8f 100644
=2D-- a/sound/soc/au1x/dbdma2.c
+++ b/sound/soc/au1x/dbdma2.c
@@ -66,7 +66,8 @@ struct au1xpsc_audio_dmadata {
 /* PCM hardware DMA capabilities - platform specific */
 static const struct snd_pcm_hardware au1xpsc_pcm_hardware =3D {
 	.info		  =3D SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
-			    SNDRV_PCM_INFO_INTERLEAVED | SNDRV_PCM_INFO_BATCH,
+			    SNDRV_PCM_INFO_INTERLEAVED | SNDRV_PCM_INFO_BATCH |
+			    SNDRV_PCM_INFO_FIFO_IN_FRAMES,
 	.period_bytes_min =3D AU1XPSC_PERIOD_MIN_BYTES,
 	.period_bytes_max =3D 4096 * 1024 - 1,
 	.periods_min	  =3D 2,
=2D-
2.42.0.419.g70bf8a5751

