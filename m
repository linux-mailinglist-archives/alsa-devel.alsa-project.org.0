Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACAA12B592
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 16:23:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B24E1725;
	Fri, 27 Dec 2019 16:22:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B24E1725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577460198;
	bh=p/8gPAUMPwuMS0bHdHFy11C08dqlv8THAW4d4R+gYCk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uV0JMjSgAiLY6DIZIvqz0imEldluVS0US+uuCLKF/z4d1kf84ybZ3UckJfXTuCXHJ
	 oX+Xi2mlcX/1Ws5mJPIZMuRcJgd24zXUxHxZJZjyDcvWk/0lzjx6Sj8Tjzu4H1EgIe
	 sJIUZt6EVCl0uodSQvODZJB1pve9/wyl928CIYJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE880F800E3;
	Fri, 27 Dec 2019 16:21:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5951F80132; Fri, 27 Dec 2019 16:21:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,MIME_BASE64_TEXT,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A061F800E3
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 16:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A061F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="Mbj9NLOp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1577460081;
 bh=v3G485xxBEo3Cum4SQHR6DjKkNv1OjWEtlHcjeyT33o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Mbj9NLOppltN6yvIvUfj6khIv4KYpcSGxS9QhXn2KTtgtij3z5d9f783Z+e3rdV3k
 Yf9mbbbMum6w2xwKaL5TM8dbq4SxXf2KJcIhv/782qoSbIC/M4uJZMLfn9FeZ544nI
 vmYMCO3OOTMwLUg56qr6+d4Zu8YdVIiP2yLmcCBA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.247]) by mail.gmx.com
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MS3ir-1jDEAl40dP-00TQeZ; Fri, 27 Dec 2019 16:21:21 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: linux-kernel@vger.kernel.org
Date: Fri, 27 Dec 2019 16:20:56 +0100
Message-Id: <20191227152056.9903-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:JPR7Yh/nE2L7BcQ/QhBP0f+6BAatPm4RrsDC8Faa/IZBqz+5LK9
 0Tz3d0ZdtzhqK6gKdD6/NL6QfPdwx02dYu8hSr85SISdb2haDdW8SAol8bCUsvGStOPtmSD
 w/+TVwT+6kxlR96bCDTU+GZCf11jFHm+n0//HVe7wtGR49DJuIOR9FLaIHMLuj+2qysM76S
 MQXAvGNi+kRploBjMqpbw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:M04zpNXRc+4=:pFARzSYrMSaSWj3JOUjzDD
 zZKAnBVEfh0UdbxhIUWxUPUyanSDuFF/PVULmGgGCv3+dqybsMe6Byzw/DUClwQ8n4r+j329c
 R0QD/mDb1eXztoA36kKN3on9Zqr4SX5b57xQVzNjZ8NVRqZvcBUbbELWnBIPQ0vwMTNr7zdiX
 mNgrDg/f/m99Eo/m32y744ygiwuZn4ymkCl9BJF9JcDz6d1jkzOF1ApdA5zot+I1jJIoIcMMy
 cREdP6hnJZFJCZrQeT8wlTGqwG1nSjvFn8JMNO/ebpmrQOiB6ArFAUzOzC/aYW7Yqn9V72hLU
 LT+vFxrsoqIdsfGTe5kWLRUE/etTZAbMu4/KMBD7+3g//3O1PjYnRERuq6hrmzLa38B/NqpZG
 TbBrPhdQCX7E3yLgdHcqvAgHLTkHuFJWDIzHukxGglBCepGto5ujZZHNAuihfTtV48dPA4koA
 YlaQ5VaWg5Fa1ySKMsmumEH+jcsJI92P2T0aehGhkXFWJQqQNZGLg//qPgYjuHPYB4PXRWqdW
 lRPgkph9xCviRCagVqHlllWguRMsTe8J6i9JYlEHxz+eQXkdz5IM4Ur1+l0Gyr7X5zt93RY0i
 XVZktxwqxNL7YFXxKt5VajeRwgi/oK18RlOdDPGUHDfXKpg16alo0+aNu2bcMW1lTQEQL6ePO
 JayOqgeKuCv78rUGA0GHRiPBvjN4Nup/5DMD/GEY6KV/OO/AlGtOSH0Hv02Pu9EHmp63BsUh1
 0DfDctW3Td+OfcfgWwa6Mj9syY2Me8jmVylUBzYCtqcZk1B40CcbvODCCCVwfPINilH3jw9Kn
 cQ8OXWHXduD12f9xuQZeTtNeU9C2nWcCPyEtAS7LkpgUKVye9RYDA+sxoN2E+eV5tLqCFwvxF
 OIFJoh/dT6JUyCr1/kkY7IJtTqHAMZBFVCvuNnLdlM40yQMkS941sKliHJlawOsd3ccHgobX2
 I93+hitZ0Q0zf59VXWWK0pESWOcE6+h2sa9QlrVnU5pr8yWCAZ2acUqDcIZdnQPJw+RK5uAAs
 FYtBeGavyABpc3grY2TkH+P2Yp4dIBNHpk7q4xkNLHJ4Z+sZMXEUP84buR6rtx87Wz/M0E7ga
 SCcgKQ50TBlSW7git9DY1nl4N8BdtK0TfC83mpgw13KF+7jdy1M01EQjZlwUJx6p7C4vROXGH
 MsNoDmMTblz2SS6huC9eGWHXgFvrtTLLTB2sppax5qbwI1m6M1nthGuuW4EowY1/XbOBNYdS2
 LYxq3Ywcke7vqQlRhOfvRuwgcFVvCsqRcTEl5fw==
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Annaliese McDermond <nh6z@nh6z.net>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Peter Seiderer <ps.report@gmx.net>
Subject: [alsa-devel] [PATCH v1] ASoC: tlv320aic32x4: handle regmap_read
	error gracefully
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Fixes:

[    5.169310] Division by zero in kernel.
[    5.200998] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.3.18-20191021-1+ #14
[    5.203049] cdc_acm 2-1.6:1.0: ttyACM0: USB ACM device
[    5.208198] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[    5.220084] Backtrace:
[    5.222628] [<8010f60c>] (dump_backtrace) from [<8010f9a8>] (show_stack+0x20/0x24)
[    5.230348]  r7:810a1c6c r6:00000000 r5:60000013 r4:810a1c6c
[    5.236097] [<8010f988>] (show_stack) from [<809e06a0>] (dump_stack+0xac/0xd8)
[    5.243469] [<809e05f4>] (dump_stack) from [<8010f780>] (__div0+0x24/0x28)
[    5.250431]  r9:8111adc8 r8:ae631180 r7:aebd27c0 r6:ae631e40 r5:00000000 r4:81006508
[    5.258325] [<8010f75c>] (__div0) from [<809de7ac>] (Ldiv0+0x8/0x10)
[    5.264841] [<8085c7e0>] (clk_aic32x4_div_recalc_rate) from [<805ba70c>] (__clk_register+0x2f8/0x7e4)
[    5.274141]  r5:80dd065c r4:ae6bd480
[    5.277869] [<805ba414>] (__clk_register) from [<805bace0>] (devm_clk_register+0x58/0x8c)
[    5.286130]  r10:81006508 r9:810946d4 r8:00000000 r7:ae8de1c0 r6:ae631ac0 r5:ae631e40
[    5.294103]  r4:ae8d8020
[    5.296724] [<805bac88>] (devm_clk_register) from [<8085cea8>] (aic32x4_register_clocks+0x120/0x14c)
[    5.306004]  r7:ae8de1c0 r6:ae8d8020 r5:ae631e40 r4:810946c0
[    5.311818] [<8085cd88>] (aic32x4_register_clocks) from [<8085bf60>] (aic32x4_probe+0x94/0x468)
[    5.320602]  r10:81094730 r9:00000000 r8:af361fc0 r7:bfd6d040 r6:00000000 r5:ae8d8020
[    5.328574]  r4:af361e40
[    5.331195] [<8085becc>] (aic32x4_probe) from [<8085cf60>] (aic32x4_i2c_probe+0x6c/0x88)
[    5.339434]  r8:00000000 r7:ae8d8000 r6:81094730 r5:ae8d8000 r4:81006508
[    5.346288] [<8085cef4>] (aic32x4_i2c_probe) from [<807554b0>] (i2c_device_probe+0x2ac/0x2f0)
[    5.354894]  r5:8085cef4 r4:ae8d8020
[    5.358625] [<80755204>] (i2c_device_probe) from [<80678e34>] (really_probe+0x11c/0x428)
[    5.366802]  r9:00000000 r8:810b3e78 r7:00000000 r6:8111e020 r5:ae8d8020 r4:8111e01c
[    5.374694] [<80678d18>] (really_probe) from [<80679388>] (driver_probe_device+0x88/0x1e0)
[    5.383106]  r10:80f63860 r9:ffffe000 r8:ffffe000 r7:80679794 r6:81094730 r5:81094730
[    5.391080]  r4:ae8d8020
[    5.393702] [<80679300>] (driver_probe_device) from [<8067978c>] (device_driver_attach+0x68/0x70)
[    5.402724]  r9:ffffe000 r8:ffffe000 r7:80679794 r6:81094730 r5:00000000 r4:ae8d8020
[    5.410555] [<80679724>] (device_driver_attach) from [<80679858>] (__driver_attach+0xc4/0x164)
[    5.419313]  r7:80679794 r6:ae8d8020 r5:81094730 r4:00000000
[    5.425123] [<80679794>] (__driver_attach) from [<80676a14>] (bus_for_each_dev+0x84/0xc4)
[    5.433384]  r7:80679794 r6:81094730 r5:81006508 r4:ae8dc0c0
[    5.439192] [<80676990>] (bus_for_each_dev) from [<80678668>] (driver_attach+0x2c/0x30)
[    5.447279]  r7:00000000 r6:af361500 r5:8107fd94 r4:81094730
[    5.453087] [<8067863c>] (driver_attach) from [<80677fc4>] (bus_add_driver+0x1d0/0x210)
[    5.461240] [<80677df4>] (bus_add_driver) from [<80679f34>] (driver_register+0x84/0x118)
[    5.469414]  r7:00000000 r6:80f4ac9c r5:81006508 r4:81094730
[    5.475224] [<80679eb0>] (driver_register) from [<80755dfc>] (i2c_register_driver+0x4c/0xb8)
[    5.483807]  r5:81006508 r4:81094714
[    5.487472] [<80755db0>] (i2c_register_driver) from [<80f4acc0>] (aic32x4_i2c_driver_init+0x24/0x28)
[    5.496750]  r5:81006508 r4:810a7180
[    5.500415] [<80f4ac9c>] (aic32x4_i2c_driver_init) from [<80103288>] (do_one_initcall+0x64/0x2d0)
[    5.509442] [<80103224>] (do_one_initcall) from [<80f014a8>] (kernel_init_freeable+0x300/0x390)
[    5.518287]  r8:810c7300 r7:810c7300 r6:00000007 r5:80f920c4 r4:80f63840
[    5.525079] [<80f011a8>] (kernel_init_freeable) from [<809f892c>] (kernel_init+0x18/0x124)
[    5.533490]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:809f8914
[    5.541461]  r4:00000000
[    5.544084] [<809f8914>] (kernel_init) from [<801010b4>] (ret_from_fork+0x14/0x20)
[    5.551800] Exception stack(0xaf115fb0 to 0xaf115ff8)
[    5.556935] 5fa0:                                     00000000 00000000 00000000 00000000
[    5.565262] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    5.573522] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    5.580283]  r5:809f8914 r4:00000000

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 sound/soc/codecs/tlv320aic32x4-clk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
index 156c153c12ab..7a82e3448780 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -338,7 +338,8 @@ static unsigned long clk_aic32x4_div_recalc_rate(struct clk_hw *hw,
 
 	unsigned int val;
 
-	regmap_read(div->regmap, div->reg, &val);
+	if (regmap_read(div->regmap, div->reg, &val))
+		return 0;
 
 	return DIV_ROUND_UP(parent_rate, val & AIC32X4_DIV_MASK);
 }
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
