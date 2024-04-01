Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2553C893AE5
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 14:23:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92086236A;
	Mon,  1 Apr 2024 14:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92086236A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711974235;
	bh=i1MKyT8QO4wIu40gxuXDJvXDfvxGsy3bkylSqyBrOAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GtH6F3d1Y7Rt/ET2PvUIh1shb91DMhnHHmSA5lkn5thAQhj4JicuEA/EtOCiu0e3I
	 OBiND4ErDSfvcmzUlD/bCNxHaocq5KxB1uCMYJIAt6hanw4MCYwPiOC3UEqz9fyIQI
	 dPNhDxC8wNIjduUlL4wjpTiHKyidynYUjsznVRVo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 141FCF806A6; Mon,  1 Apr 2024 14:22:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D7BEF8068F;
	Mon,  1 Apr 2024 14:22:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88091F805F4; Mon,  1 Apr 2024 14:21:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B179FF8016E
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 14:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B179FF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=FXRMH7v9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711974089; x=1712578889;
	i=oswald.buddenhagen@gmx.de;
	bh=yMNH/+4MdRULa5SQu4CR7W2OySNlVuYrctHNpEh3LHE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=FXRMH7v9JUcpUi37qnLz1YKk6dRVDG1voJegIbxGXxKPAm1ZPnEOcVjsyAWgQf1t
	 J0Vryawmh3jT28Z7vtnO4nL+J8Ul07F43/M+JGHAGsbrZ0O/LGkMVX8o2YI8IIi2l
	 xesIfcaH91VN9ujPMxTwBfMeuReYBiEMpid1qNk2TnhEabMMnAd3hEDEtN39eFTcX
	 r+I/rUig8vuZM5xn0A5kbdBCkCdVDkDhCgVdqzWZ8HjeL2fIpZ6j/StZ04hGHILPC
	 PqJrAd8BIoN63N3oITTkid4e+afDdMh2263nJVnrP5BbzTvAMbcXQjbzW2vsbs5Lm
	 elV7QkTYn//NQbMKNA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHG8g-1s4RxZ1c2a-00DKUn; Mon, 01
 Apr 2024 14:21:29 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7ei-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 12/18] ALSA: emu10k1: shrink blank space in front of wavetable
 samples
Date: Mon,  1 Apr 2024 12:07:36 +0200
Message-ID: <20240401100742.506001-13-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3jjOhjoZdXKDdMZCp/anVt6oJaQG32lf4dayvytu92ct20UGLdD
 RhN87uICWLrvPWzcRd1jPyiN3qpqRwPzA5SW01golfFsBglSp9oa+xQYB809OcOLxnx0GwY
 x/xQJH3mzLUoR1+yfrUOjiOxCg49Q3hgbVaMD8Fq29wpsFwtSAya0lFeuUfHmpZpfwyGLYh
 tno/K2m1W6S6UgFJcpB2A==
UI-OutboundReport: notjunk:1;M01:P0:qSNe2GTVKUU=;FWSI5E3php6opP6cXAoF/GgLs6C
 a+/gsjmB53eGX0xP3NHIwgu9KCg6vj4gNxhUyfzA+XnjAxf5m+JC5dBakgLAn49MP4Qi0w2md
 VZhi55sgoBfeH/r4lXT4tFb0GE3OpHUW1gcL9SbQPB1HZsbK56rFiaLAl1IL7jSIuzNYMvtx3
 lGAAVgd1ChHt7cC7WUTT9DA71VON7PBWMEmEmhEcJdAcGYFBrYvbWVBPOkKitCfdkjFFsJSdC
 NNEt7+RU11LcGYB90lmp2lAG2Qkz6eZ0W2HeeNf6tCoJbpqx3rPn6HM0gELu8ARmthG2jPclg
 y0Zcj2eusQ1c1pYAst384F7DTMkvGm9vL5M04JD0zULs39p7jCRAb6jiseG9qgU5G9nmRUh88
 C6XwSngbPRrZ0OiqBDPGAA/dCYm0uPcqL2XWF9XRtLSnKMdKpLXVisyc/gItD5twcu6JuO5aq
 Xmm8QYqK5onHnui57bFGHp9Upz2TWsjBsnaJps4vL57VB5Pv3QPNUgD6G0Sz4TjFoh87hsB64
 jPnqVlhggfeDYi49/9hxEzur3WU4NVFV6l/Uun8+Cibx1eXS9i6qClNKSZ4m0yROMVgxpGByS
 XBc5CvCXVnARzEKqzOx/2fM/Hm5hXI0Dd5pdA/Dc6g070iXwuSgYMmATG0q7mVSojYWhlAZyi
 9ol9wkdt7jmD2EIGDzpFx6YLWdu2/fT6nI0u5CHl1Uc0kTksfYBuh4HN3qc6l3eNU5vP8w4iC
 GOxnA8QJCayh0MiuiK18wSU72Td9Bjs/fqFLuNA2F0oyOsF3J7fOuWvnmc1ta40R9XezLgQSR
 cpWzfI5fQy8Ik/p/GzqQdhRcrTvVapE2VGAeq0eJfYaIk=
Message-ID-Hash: 4QLD2P7OV2NBTCE5K2PDZ5PVCDL76KSA
X-Message-ID-Hash: 4QLD2P7OV2NBTCE5K2PDZ5PVCDL76KSA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4QLD2P7OV2NBTCE5K2PDZ5PVCDL76KSA/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is no need for it to be 32 samples - 3 will do just fine (which is
the interpolator's epsilon). The old size was presumably meant to
compensate for the cache's presence, but we're now handling that
properly.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/pci/emu10k1/emu10k1_patch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1=
_patch.c
index eb3d1ef8a33a..a2ba6246dbc7 100644
=2D-- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -16,7 +16,7 @@
 #define BLANK_LOOP_START	4
 #define BLANK_LOOP_END		8
 #define BLANK_LOOP_SIZE		12
-#define BLANK_HEAD_SIZE		32
+#define BLANK_HEAD_SIZE		3

 /*
  * allocate a sample block and copy data from userspace
=2D-
2.42.0.419.g70bf8a5751

