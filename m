Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1523934D284
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 16:40:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F0471688;
	Mon, 29 Mar 2021 16:39:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F0471688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617028833;
	bh=q/tgUKyQ/gdmr80BB/z/FJzNAF8dyaLAhP9BdaSIoVk=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LXEpUZVEBIVDOpZzfaN2YZgf0r3evfrCcf3ujotlh0E8JK98TVTbEvwVIkISvKz3C
	 f07l7j2JeHs8mQOo4Aj50Dq2wcjlj4fqMgCRslYLC7RGZEq9PHRBzGkUvhXPuztT9w
	 IydguhClbCuw7Z+PebKZdWCekGu4w9jZ3ZSDeqyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA227F8016E;
	Mon, 29 Mar 2021 16:38:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C310F802E3; Mon, 29 Mar 2021 16:38:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PDS_BAD_THREAD_QP_64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from a27-132.smtp-out.us-west-2.amazonses.com
 (a27-132.smtp-out.us-west-2.amazonses.com [54.240.27.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10B57F8016E
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 16:38:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10B57F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nh6z.net header.i=@nh6z.net
 header.b="U3HsH0ei"; 
 dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com
 header.b="BCdBWzD1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zzmz6pik4loqlrvo6grmnyszsx3fszus; d=nh6z.net; t=1617028687;
 h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
 bh=q/tgUKyQ/gdmr80BB/z/FJzNAF8dyaLAhP9BdaSIoVk=;
 b=U3HsH0eitV8UA9568k9X5kVEoQAJeur3ouabKP2q2N0J0V6vu4VXAV5SuYx+RRh5
 MtfAgRCsg/n2B+gVSPM/MjjkDvPrROQ3FP+X8LLDq8hm7MAlkEggz12I9BAaPv1sQJl
 N5qB6j1HHWI7md/KHC3zDS0pN2fSKX5EMKpbSVH0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1617028687;
 h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
 bh=q/tgUKyQ/gdmr80BB/z/FJzNAF8dyaLAhP9BdaSIoVk=;
 b=BCdBWzD16dTcTxxbO/+Xnun0+l/704ah/7pWM/vDEJMZKFrOE3hZ7YUfSgWBSjGS
 qKbS9bA0LENOebdrya9Mu88V3FbVXF+wa2KDbrgIHkK4FKawa0Nykl7D7YQ3ikroZKK
 immRcyd19Ldd05ss8X7w4gCfGQn61uwHJs/bbHls=
Subject: [PATCH 1/2] ASoC: tlv320aic32x4: Increase maximum register in regmap
From: =?UTF-8?Q?Annaliese_McDermond?= <nh6z@nh6z.net>
To: =?UTF-8?Q?alsa-devel=40alsa-project=2Eorg?= <alsa-devel@alsa-project.org>
Date: Mon, 29 Mar 2021 14:38:07 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210329143756.408604-1-nh6z@nh6z.net>
References: <20210329143756.408604-1-nh6z@nh6z.net> 
 <20210329143756.408604-2-nh6z@nh6z.net>
X-Mailer: Amazon WorkMail
Thread-Index: AQHXJKkg/ojtMl+8SNWm7v/u1huSVgAAADAz
Thread-Topic: [PATCH 1/2] ASoC: tlv320aic32x4: Increase maximum register in
 regmap
X-Original-Mailer: git-send-email 2.27.0
X-Wm-Sent-Timestamp: 1617028686
Message-ID: <010101787e6ba6f9-2c1aebbf-9224-4305-a52b-3c03d4434e8e-000000@us-west-2.amazonses.com>
X-SES-Outgoing: 2021.03.29-54.240.27.132
Feedback-ID: 1.us-west-2.An468LAV0jCjQDrDLvlZjeAthld7qrhZr+vow8irkvU=:AmazonSES
Cc: =?UTF-8?Q?team=40nwdigitalradio=2Ecom?= <team@nwdigitalradio.com>,
 =?UTF-8?Q?stable=40vger=2Ekernel=2Eorg?= <stable@vger.kernel.org>,
 =?UTF-8?Q?Annaliese_McDermond?= <nh6z@nh6z.net>
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

AIC32X4_REFPOWERUP was added as a register, but the maximum register valu=
e=0D=0Ain the regmap and regmap range was not correspondingly increased. =
 This=0D=0Acaused an error when this register was attempted to be written=
=2E=0D=0A=0D=0AFixes: ec96690 ("ASoC: tlv320aic32x4: Enable fast charge")=
=0D=0ACc: stable@vger.kernel.org=0D=0ASigned-off-by: Annaliese McDermond =
<nh6z@nh6z.net>=0D=0A---=0D=0A sound/soc/codecs/tlv320aic32x4.c | 4 ++--=0D=
=0A 1 file changed, 2 insertions(+), 2 deletions(-)=0D=0A=0D=0Adiff --git=
 a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c=0D=
=0Aindex f04f88c8d425..1ac3b3b12dc6 100644=0D=0A--- a/sound/soc/codecs/tl=
v320aic32x4.c=0D=0A+++ b/sound/soc/codecs/tlv320aic32x4.c=0D=0A@@ -577,12=
 +577,12 @@ static const struct regmap_range_cfg aic32x4_regmap_pages[] =3D=
 {=0D=0A =09=09.window_start =3D 0,=0D=0A =09=09.window_len =3D 128,=0D=0A=
 =09=09.range_min =3D 0,=0D=0A-=09=09.range_max =3D AIC32X4_RMICPGAVOL,=0D=
=0A+=09=09.range_max =3D AIC32X4_REFPOWERUP,=0D=0A =09},=0D=0A };=0D=0A=20=
=0D=0A const struct regmap_config aic32x4_regmap_config =3D {=0D=0A-=09.m=
ax_register =3D AIC32X4_RMICPGAVOL,=0D=0A+=09.max_register =3D AIC32X4_RE=
FPOWERUP,=0D=0A =09.ranges =3D aic32x4_regmap_pages,=0D=0A =09.num_ranges=
 =3D ARRAY_SIZE(aic32x4_regmap_pages),=0D=0A };=0D=0A--=20=0D=0A2.27.0=0D=
=0A=0D=0A
