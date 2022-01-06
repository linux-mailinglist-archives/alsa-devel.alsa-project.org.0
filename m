Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E03E486478
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 13:39:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F10BD1866;
	Thu,  6 Jan 2022 13:39:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F10BD1866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641472797;
	bh=mHOlJaipswBgRC3zE4CDcDt7phcijeQAZ9WHCyZuXY8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dMjgPcIwUpUYeCrozUEltC+JNFpSNvK+eLbrF0s8dPeMH/jDE3+9f52dlrGEz5U3y
	 wMVMTq8SqwIgUZ3eu5c3JPcVoVLZ3Cubq4wUPh0lGkZ/ieGNWJ3I38Eq0ybzm8CEuG
	 pjs103kLCcSB5jSYRfRdhL5lcJ0grG+/jhQ2aqY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 636EEF80158;
	Thu,  6 Jan 2022 13:38:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2116CF80155; Thu,  6 Jan 2022 13:38:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F638F800AE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 13:38:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F638F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="LskM8Mmy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641472721;
 bh=mHOlJaipswBgRC3zE4CDcDt7phcijeQAZ9WHCyZuXY8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=LskM8MmyhxBlKKprXo0cr6zeYZ1lu24JXRRhViTu8XlmhVLdscYb0xBm2CJ3uKw0i
 oMr5iUt5Qg7HXuPSJp4zPlDJqv6iV4/3kP3j8ZiZXL49/3CjLTnCCpbdq20rOX07Fr
 YFHtA70p2uBrp47bYsdMVfjWdh+OOEggThqs0sfo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from wave.lan ([95.91.248.70]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2E1M-1mNm1O3i5W-013f3d; Thu, 06
 Jan 2022 13:38:40 +0100
From: Stefan Sauer <st_kost@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: virmidi: Remove duplicated code
Date: Thu,  6 Jan 2022 13:38:21 +0100
Message-Id: <20220106123821.16691-1-st_kost@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LibY9frHGRZ3vs1wdFQwTOLjHJCIpiOP32scdfw8jnJVgJuyydx
 eKsdw8VBTfyFpTJIWeDY/N9vdEOo8NhyIpj1U8uvBGmBa3PwlhmIeVEomdrlkbr/LAFqg3u
 pYQ609kBIaSBPljeqKz+lYEAWv3J+r+d1BWMxE5rYrdm3oaDbnKsd+8hO14PjI5u2ZzO2X5
 Tz+42kHNKUMmCVe3q0+cg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fAFnrM+ctpE=:MY9ORZ53XYLUbHSdwLMNSl
 4BMZ0CGMAi8pKQsAjCnwFrgVPjVieGotKgP8fyTX8h8+jZdaqh0o8g7kYshwskpuAgdEAURyY
 bH2CyrnCPkk8nZOO77LPuZ9nEj8PLIQlNkPfuDOExuiHl2LMA65Urd7q9szaSW6D6K5tsyBXt
 TjqcocOuoLOUH+OBDiK83D6IHaQySPnZJ1ZcSZHcC4txAxDQK57afY6ShROIpYWgso72Id6Xk
 0kjXnrFK9y2za/wmt1vyKZQdHAiN1LbyE7JKBa2fGfj2w6QFyo2VJ18GDRARgTKiiBihp1MI/
 73CjkMxFdzUDK0ZaZjngOdlmsyNOFEa02KgjAvdyBjayV/8YX2eLCbP9rZa0RucKQyxYAw4qO
 H2ZvzBySGqdaLnO7CBEhv9LKxpugJRsRzXd4A5aGQtltEHaG0AF5yEauiWmANudcQDPunXf/B
 evalpKQ6Jz7om5b+Y1WV6clT33/4skz65N6xIQS8oW2G2+c79aZFQ0vlf1MoSL67ONnKpdntM
 oKqcfzR2BKdUIX6stm6YTp7yVQqpCGzIZcJ6f6y61haJA6fHE3JqZ2RNh5iDrZubtCEqRbwZE
 PUSQdNHAMgV/8gJnfBadWen2pkhTXZr4QR8MmxCx559uAsyDLqYDqOE1FQBCbRfTeuj20NsxZ
 n2cSydm2UQpCnkxhyB+7gbUXWMLa6SQhAy/Rjn+ybiDtzeROk58CmMZlPZpY4dS8ckq1GAUD3
 URm0kEtzlv8NCQMFEEg6Sz7L4o6SZL0r5pEAWdOx88hGIIeRCRoa509oQtuuWHIN/hkRRni4h
 /56NbInZUdkArGFOsG732L3pRzQqbKEjHGpQZFGN0Yo1leDRwUJthjok0nhHYAiCOyAPsMPfh
 x7+lNYON1zWTDZkAY7qgtd1sIPkA0V/sTalZzC4h7jNc86qgMWbHnSYHS38UEDVDBPZ35eSWN
 yAOqnNjD6/wHbOmQ20YO6DrwvhPUBNGbQaRVBJ10AImxC2d6rr6YvyQWyxeivck+DPqwqGduB
 1Z6GNJTB+qywpVfNVrRmeuv5JTjkSSz81tufCHmySHoLl5L6raaJgs9SG6T3U8OhrEckILvfb
 tORDv7CmFsRrq4=
Cc: Stefan Sauer <st_kost@gmx.de>
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

seq_virmidi.c: snd_virmidi_new() is already setting seq_mode to
SNDRV_VIRMIDI_SEQ_DISPATCH.

Signed-off-by: Stefan Sauer <st_kost@gmx.de>
=2D--
 sound/drivers/virmidi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/drivers/virmidi.c b/sound/drivers/virmidi.c
index 7f7eed6faaae..58012de90c38 100644
=2D-- a/sound/drivers/virmidi.c
+++ b/sound/drivers/virmidi.c
@@ -90,15 +90,12 @@ static int snd_virmidi_probe(struct platform_device *d=
evptr)
 	}
 	for (idx =3D 0; idx < midi_devs[dev]; idx++) {
 		struct snd_rawmidi *rmidi;
-		struct snd_virmidi_dev *rdev;

 		err =3D snd_virmidi_new(card, idx, &rmidi);
 		if (err < 0)
 			return err;
-		rdev =3D rmidi->private_data;
 		vmidi->midi[idx] =3D rmidi;
 		strcpy(rmidi->name, "Virtual Raw MIDI");
-		rdev->seq_mode =3D SNDRV_VIRMIDI_SEQ_DISPATCH;
 	}

 	strcpy(card->driver, "VirMIDI");
=2D-
2.34.1

