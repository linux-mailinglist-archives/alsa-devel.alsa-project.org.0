Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B788A898494
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 12:03:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0D952C51;
	Thu,  4 Apr 2024 12:03:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0D952C51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712224993;
	bh=jPDkcBk/SJQNsvgeAqqI70H4V8gh3/HjBiCRa6Z+XSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=imGHHQOc4/INgWqeevha9lx3xuIumnIQp6Vs/ux9CQeaKXwFpGnpbRCSGfDcvwR0Z
	 5uS6z0qig4sT0K9ejBsa9qbEXKYOR66GJuaAwuBxwvOJA3ORwBuoUx00CwORqAJduu
	 lDws33C0vdsW/Yg5i3ll2ip3jK9nPjNxiGvlEOjM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66808F80605; Thu,  4 Apr 2024 12:02:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 723B0F805F6;
	Thu,  4 Apr 2024 12:02:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CF0EF8056F; Thu,  4 Apr 2024 12:01:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AB20F8016E
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 12:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AB20F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=bhc8dMFd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712224851; x=1712829651;
	i=oswald.buddenhagen@gmx.de;
	bh=aHgNEoh2oL/YTOIIO+HEgQH655EOrifvL+ft5bV2Fk4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=bhc8dMFdfi9uULHWv4AqH1pa0hts7BadyuhLZuWqeG9C0AiDA0fOA7n1xArCG/xk
	 tLbNgj0VRI65gFimPb+6kbgoIXJHAhfS/ZMgdA46CGtm23N3Q0bfixN8GMbtMxb6F
	 dxmB7AnSqvG/0KDu1O8i07w3i/xqHzG7A9lWLw+FVnVu64QjltgdsdbTmVVJP8PHJ
	 iTWNnr+H7UJdlWbXgC7fYs9TCPHm0KkGdp4VUAqS2zulMxK1vVo1GUfwc28+1Y8uK
	 9PiJl7bl7Ig7m5bRa2wmWSgXNxrznlJk4GvHdWb1oFNW70JwljmiLXaYkec6BPkmA
	 fEj0xMbuCjFN+gIE6A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.126]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOzT4-1sAvc43DY4-00PQZ8; Thu, 04
 Apr 2024 12:00:51 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsJto-RF3-00; Thu, 04 Apr 2024 12:00:48 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v2 01/17] ALSA: emux: fix /proc teardown at module unload
Date: Thu,  4 Apr 2024 12:00:32 +0200
Message-ID: <20240404100048.819674-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9BB6sT8NluweYbfKeAlUhV6mZPJsC0qCYIqNyScjVOxoXaUpjTg
 N9QMybeVDNCF8+udhpW/QGECDtqpe4uBU0DJWfIas4dl7CY8UCyRZUMEpNAYe6JwR+zYFiT
 IIqP7CL3YmtWlEW6TGcEO7dqXYrBtbNJ4ap0Emh3mPKOtKkewShUGRO/8afPy+mTNyXayVE
 QeoOW7XouN28UInV/VcJg==
UI-OutboundReport: notjunk:1;M01:P0:gNy0a7E3U/Y=;vFFwMlskXs0zN7BowtfmFeoxudW
 6V9wGAQjagrF6JzNkTaw6sXzwfL/N/w1Yv3P4AS6xSUgER2/M6QaO/mX/RPVykHlp5QV9OSXk
 6VmCPNB5g9rEWAGUsDuztgdpagDsmNTmjL8aDKkXFdQ1E+CbOB1a+G1sfLJf/eUkgZOpsYNSt
 Xv9BJy0i9JU9UGuxW+QvzVRo/Wetzo4p9D00q+NT+yBQSSV/xQFvf09/LrTDBSU/Dgdy2hiUg
 LP/uT0NFXZgvrttnLXRemmZc6LWc3q26jksWEKz7pzUV65zcjLH8/9MaGqVkYvvDCgcIstQST
 NnUdTdW3Y4TIfKEPPO4UpgzTa1D0rUzL0S/c/QBdggyM9Bwgi2TiY47L27dDBV/PlkT7Y3YYQ
 5ubYH7/TP9Oz8GIUr6rU+UYvU7+CoUXlk3A9EpJMYhtG1vlGEm1uJivrzI1BjEWucB8CdajXw
 iuE7NSScR2vP1DQKi0cOQn1GzVFqeSKUCbJd2jJe9pmWJQYSMaqSpnpAB9wZn4MKch0punAEW
 LSJnSq08nIGUfBeuCax28GKQh6iMic0kbbKWnJqDOfepR1YvmxfRWGXGHA0e6tBNuXl1IH0JC
 HVfR9/KyYoVDfv1SHcwaO1r+OHC6iCeOdPO72pcVrySvpqKaAxiWKHbTzK9nxLt5YY5+ORNpA
 tD8t4YVY8VgvzJPxHoM+F9LI4Jn9EPmv1zXTsamxTfg+rUAD58na2aLH90HNDyhnQx6PHbk1G
 hPa6jxItJHnqzBg43V6Muazbl+KdpTikiDcI5/rCASEDhxiq8i+ox0Lf59rxlH1JZ+TmlAUCd
 ywJ8K/10ycPvJypB2GohiiNX6aTM0mou1l4tmusFPYIBQ=
Message-ID-Hash: UPTVQ6IAXCPBWY7EZXPV5I2RVBML4X2L
X-Message-ID-Hash: UPTVQ6IAXCPBWY7EZXPV5I2RVBML4X2L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UPTVQ6IAXCPBWY7EZXPV5I2RVBML4X2L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We forgot to remember the wavetable /proc entry, so we'd fail to free it
at module unload.

This matters only when only the synth module is unloaded, as unloading
the card driver would tear down the sub-entry anyway.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/synth/emux/emux_proc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/synth/emux/emux_proc.c b/sound/synth/emux/emux_proc.c
index 7993e6a01e54..820351f52551 100644
=2D-- a/sound/synth/emux/emux_proc.c
+++ b/sound/synth/emux/emux_proc.c
@@ -102,6 +102,7 @@ void snd_emux_proc_init(struct snd_emux *emu, struct s=
nd_card *card, int device)
 	entry->content =3D SNDRV_INFO_CONTENT_TEXT;
 	entry->private_data =3D emu;
 	entry->c.text.read =3D snd_emux_proc_info_read;
+	emu->proc =3D entry;
 }

 void snd_emux_proc_free(struct snd_emux *emu)
=2D-
2.42.0.419.g70bf8a5751

