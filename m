Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E35A34D283
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 16:39:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B551A1684;
	Mon, 29 Mar 2021 16:39:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B551A1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617028798;
	bh=6QDlTzhgIg8bRCekF5YD0wses94UlKnnwhKWHNH9fvw=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N6XCq8ObefrH7y9J/XLdkyln6kZevB1Q7vJx4fVD1xSYtR6Rujt/wGX6I5N1ih/kF
	 uwAwgzGkOzZgP5JOv2e8sZc2br0xJwfZ4seH+C9LQ6y9/zolOMCa8/RxyOmoybALyb
	 gCNG35JFL5UqFecjQAg2RVyhrJjYMWFvEF7kAANU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F288FF800DD;
	Mon, 29 Mar 2021 16:38:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 038C7F80229; Mon, 29 Mar 2021 16:38:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PDS_BAD_THREAD_QP_64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from a27-93.smtp-out.us-west-2.amazonses.com
 (a27-93.smtp-out.us-west-2.amazonses.com [54.240.27.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AD4EF80141
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 16:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AD4EF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nh6z.net header.i=@nh6z.net
 header.b="CwO3ztsg"; 
 dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com
 header.b="LyZI+wCe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zzmz6pik4loqlrvo6grmnyszsx3fszus; d=nh6z.net; t=1617028686;
 h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
 bh=6QDlTzhgIg8bRCekF5YD0wses94UlKnnwhKWHNH9fvw=;
 b=CwO3ztsggD89iRsiWpAclw7dJnnP83skdQyalJDOFB/kv30qIw9JwItILIk6N0FL
 lIk1oPhu50PiPorxacaZxY7AsdXCBlMWZfXcDueOm4/iku/rYNhf7HKsHrEcsGDRfNG
 OJ1gOGczckX6jQFGeEk6/+a9+bm7fcKr2K1elKmU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1617028686;
 h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
 bh=6QDlTzhgIg8bRCekF5YD0wses94UlKnnwhKWHNH9fvw=;
 b=LyZI+wCeXRCH0ryN+bNLWx7qG3VY+omN1RNndPQ+bUKdOFjM6Eo/XBwHyjPLvC9o
 UfQ3bw2Rz5/hYpXUlU60TZmuysKr+770b6GK2oDwYPPHX7gAmb+vfOG1hPgArN89+i1
 H3IocA2LoVWZw3JxwoGfDyoPC9x3RFXHAzTkAWuU=
Subject: [PATCH 2/2] ASoC: tlv320aic32x4: Register clocks before registering
 component
From: =?UTF-8?Q?Annaliese_McDermond?= <nh6z@nh6z.net>
To: =?UTF-8?Q?alsa-devel=40alsa-project=2Eorg?= <alsa-devel@alsa-project.org>
Date: Mon, 29 Mar 2021 14:38:06 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210329143756.408604-1-nh6z@nh6z.net>
References: <20210329143756.408604-1-nh6z@nh6z.net> 
 <20210329143756.408604-3-nh6z@nh6z.net>
X-Mailer: Amazon WorkMail
Thread-Index: AQHXJKkg/ojtMl+8SNWm7v/u1huSVgAAAEpD
Thread-Topic: [PATCH 2/2] ASoC: tlv320aic32x4: Register clocks before
 registering component
X-Original-Mailer: git-send-email 2.27.0
X-Wm-Sent-Timestamp: 1617028686
Message-ID: <010101787e6ba3ea-c69f7c7b-b586-4a5a-8297-50be27ce3534-000000@us-west-2.amazonses.com>
X-SES-Outgoing: 2021.03.29-54.240.27.93
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

Clock registration must be performed before the component is=0D=0Aregiste=
red.  aic32x4_component_probe attempts to get all the=0D=0Aclocks right o=
ff the bat.  If the component is registered before=0D=0Athe clocks there =
is a race condition where the clocks may not=0D=0Abe registered by the ti=
me aic32x4_componet_probe actually runs.=0D=0A=0D=0AFixes: d1c859d ("ASoC=
: codec: tlv3204: Increased maximum supported channels")=0D=0ACc: stable@=
vger.kernel.org=0D=0ASigned-off-by: Annaliese McDermond <nh6z@nh6z.net>=0D=
=0A---=0D=0A sound/soc/codecs/tlv320aic32x4.c | 8 ++++----=0D=0A 1 file c=
hanged, 4 insertions(+), 4 deletions(-)=0D=0A=0D=0Adiff --git a/sound/soc=
/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c=0D=0Aindex 1ac=
3b3b12dc6..b689f26fc4be 100644=0D=0A--- a/sound/soc/codecs/tlv320aic32x4.=
c=0D=0A+++ b/sound/soc/codecs/tlv320aic32x4.c=0D=0A@@ -1243,6 +1243,10 @@=
 int aic32x4_probe(struct device *dev, struct regmap *regmap)=0D=0A =09if=
 (ret)=0D=0A =09=09goto err_disable_regulators;=0D=0A=20=0D=0A+=09ret =3D=
 aic32x4_register_clocks(dev, aic32x4->mclk_name);=0D=0A+=09if (ret)=0D=0A=
+=09=09goto err_disable_regulators;=0D=0A+=0D=0A =09ret =3D devm_snd_soc_=
register_component(dev,=0D=0A =09=09=09&soc_component_dev_aic32x4, &aic32=
x4_dai, 1);=0D=0A =09if (ret) {=0D=0A@@ -1250,10 +1254,6 @@ int aic32x4_p=
robe(struct device *dev, struct regmap *regmap)=0D=0A =09=09goto err_disa=
ble_regulators;=0D=0A =09}=0D=0A=20=0D=0A-=09ret =3D aic32x4_register_clo=
cks(dev, aic32x4->mclk_name);=0D=0A-=09if (ret)=0D=0A-=09=09goto err_disa=
ble_regulators;=0D=0A-=0D=0A =09return 0;=0D=0A=20=0D=0A err_disable_regu=
lators:=0D=0A--=20=0D=0A2.27.0=0D=0A=0D=0A
