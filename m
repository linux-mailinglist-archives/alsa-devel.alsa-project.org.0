Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B8C8945E1
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 22:12:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A049211C;
	Mon,  1 Apr 2024 22:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A049211C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712002357;
	bh=pDtnJc65lmtvAwJzB35IDJuCnyQ5xu1B7F0TxGiFj4w=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=c7ioQK545XPbqVt5rrqIGZqIbeA6r+t0UjUQOYp8Pu3dZxNtqJhSXbcEylVPS+RAc
	 q2dmW+xeRumuRxiFzlR1Mksn5KfVl/q4SdD6AAjP/rlgajDDtSfERgQlWDIXCvt0UB
	 s46PH23eZlIJ1bOPFgA8Sk3qsxdVIVXxBBpw1Ob8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81921F805AD; Mon,  1 Apr 2024 22:12:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE5B7F805A1;
	Mon,  1 Apr 2024 22:12:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73F70F80236; Mon,  1 Apr 2024 22:12:00 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 69601F80130
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 22:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69601F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ENpG3uZI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712002312; x=1712607112;
	i=oswald.buddenhagen@gmx.de;
	bh=j5VNIX38lBDQkxQPfpx6MalVO1lvzDk9u/KVxIoHMqg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=ENpG3uZIjWW0rwsjlrwO82E2wzvbNKLP77R25c4+HhuUANi1oxTpi5ONVLL92dSi
	 mS93mLSJOtRG2NbTNZD/3fBAWGQqHd6x1542C/5/Xmr2+bWXnGfFhJ217S4Vln5Vj
	 CSXLB2Z/0O8qmKTqWeuTVaF6D4mwEDdU9gv9e+ds0v6NGf65xVZ7JST+xBdcqqf2a
	 Tots4V0PRIgBNiAAbxLRe5ThSKGF26K1AELxyeiqUSJ1+ZYLABjrfVt0lPwfM6AqM
	 /BLvR1sJtLrhShcdkyvo+p693xoEDN0K8lK3sBMfqlPsv1K8Jc1a8zklT/pOiTZA+
	 73wv4ZBC8voJ4YuaCw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MatVb-1sNhsx1qW3-00cS7N; Mon, 01
 Apr 2024 22:11:52 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrO0V-Lm8-00; Mon, 01 Apr 2024 22:11:51 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Manuel Lauss <manuel.lauss@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] ASoC: au1x: declare that FIFO is reported in frames
Date: Mon,  1 Apr 2024 22:11:51 +0200
Message-ID: <20240401201151.560355-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Tu4HgDKMEvY2DFUxGdJzkc7V37Go7vZBNlz5S4O2/Xu8o28GHwc
 q1SDQwfNNjxFbU5l2Q65k6/FRaODaRfFOJ6K42vjmOX3Zf2j2pdaibth3mVzDFMXexVlMpI
 530PG7EB1aHbjTVUavPwDMUflbeM1c4ybfJDbCiYcSGYmB1HzTQU/8/2LLe6AI7PfvGlE/h
 V6Mbu7LqQR3/Ui5QE/haw==
UI-OutboundReport: notjunk:1;M01:P0:XipLha2//qI=;3DmRonPsoGyX0yggFx185kI3ygh
 GYSZ+MUAlonQNW2Tt340J/ODlcrsvvfVxc89SLYe2jykVQdOXiEmsV9NKKkkOQMHpA7u+WPYp
 54jFhRpjQeUr+g0s045Z2JRwJJg6geo4dOSB/QlyhEW5QQRyLGHUG4c3OonqmZYhV1zSbBUw3
 yNKBRpW+hEOXGh4s+yQ0hZc5nXjDu1ITz37oXCCp1wel6vYF31P7u/d5WNb1Xo34U2y/Q59uC
 FzwPXLR7QF7+vziy3AhWCmOEpc5uBlKRKzhQnUEYmH6dwvQzA0BbKk03tqknlP7A1fKwKF6ll
 5tFE4xtuXwPi3R4HPzg7FweD2ruSHg2tuGShst4Q0zD4bXuWypdF5NwF5LeyRyr03fXQUgmVR
 xhc5in65f6g26QQZN/WNrnw4aMG5rp6pzaV89b0lcZVzBgT1UvOMSxzObQn6N50+RXf3vw7bf
 rrA4hepxzjMhvUh7B1utGSl5VoK70376eW1MjMo8ZYHQGBx8INKcdS7M10ySHKQvOkbyooOhv
 VkBf5e558rZFtgMqSuMN98M+5BAUkyKt3zBuoCsPUG31fRgXbCPaOWRwojYc7YqI7xrqMt7Ur
 2Ssilvrr9G5ucCg5lpJp+DtwEEb4s3QFzzYeF8Puk2+rg7VADG60SvL0NCYXJbriY4iXYOYWG
 CAWXedck5MFwUMbdrg5Yescsp/8axP/vveR2enxL0lOY/qyZTAz1WE7/gr+tM5qqzL6WfrPWR
 2WSXCKTnCeL6r7cfquIsDPqQhssVeruNM3egzGFfQVyU4T0dHV2erO/jmlRogfko+CwiOiWh6
 O+V49bYmWOUVyxcCfx4rsc7c3Cy20o2uRh80rEJNVmcmk=
Message-ID-Hash: UEYCW33OGFTDTCZPD3YCGMW5N2KU5ZXJ
X-Message-ID-Hash: UEYCW33OGFTDTCZPD3YCGMW5N2KU5ZXJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UEYCW33OGFTDTCZPD3YCGMW5N2KU5ZXJ/>
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
PSC", which doesn't suggest bytes. The data sheet speaks of "words" and
"byte masks", but without digging into it I can't tell how it would
behave with different sample widths and channel counts (which the driver
does not seem to limit _at all_? what am I missing?).

This is just something I stumbled over while surveying how different
drivers set the field. If this is actually a bug, it is minor.
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

