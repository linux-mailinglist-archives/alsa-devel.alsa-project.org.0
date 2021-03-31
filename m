Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C40E835063B
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 20:23:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46236166B;
	Wed, 31 Mar 2021 20:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46236166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617215013;
	bh=SET2MMom8yUlyhPewodmsitZ5ujJwagHgJ3dqXYrK/Q=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VaMlZ41t6QCPAIAierRRjeHHRAiS60BX3TITeQNqgQlcChMFCEPrLJAlAQnBwQXpf
	 sru3mTrEMnQhlcipeGueDuXrPwqtgQm6I3ZChBj0NuC1lCc7UBCJ/PXbysfi+pi6e1
	 BsiAObWv0RutrQd0zlQg2Ggf7nPb94HUYabJ2Bgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F758F80423;
	Wed, 31 Mar 2021 20:21:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B07CF8013F; Wed, 31 Mar 2021 20:21:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PDS_BAD_THREAD_QP_64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from a27-90.smtp-out.us-west-2.amazonses.com
 (a27-90.smtp-out.us-west-2.amazonses.com [54.240.27.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62ED7F8013F
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 20:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62ED7F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nh6z.net header.i=@nh6z.net
 header.b="Lsg4WPK3"; 
 dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com
 header.b="LXE7qu57"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zzmz6pik4loqlrvo6grmnyszsx3fszus; d=nh6z.net; t=1617214898;
 h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
 bh=SET2MMom8yUlyhPewodmsitZ5ujJwagHgJ3dqXYrK/Q=;
 b=Lsg4WPK3BZXJCQJf+DgEoHL3fGFcyHVkfk/+Cf2vTMzQsX8BuqiI/c98cvrRM1bk
 YmA9ziqKEX8etJixAupCS1OVbin58N1q6vlz3S5Hjzb9bVWxFttyug94ByMMwamdnag
 3KiIP3MWT2aYV+McusctFC7McgbkOaO9pWHRYK8U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1617214898;
 h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
 bh=SET2MMom8yUlyhPewodmsitZ5ujJwagHgJ3dqXYrK/Q=;
 b=LXE7qu57foLttk3bI+2OUCRrjDkGVW/qaYGKud304quHKt1ya5DYltGwLca/2mhy
 /o/QMA8waOVI/ykXgOhgXoEzhZbdfVs1vx0w/UD6jbnHD1XMetLtzxd4u5CFAENgj4m
 bElqZcpYKt6DXQOwau+3RjgRFNhlLouvGCnIUIbU=
Subject: [PATCH v2 2/2] ASoC: tlv320aic32x4: Register clocks before
 registering component
From: =?UTF-8?Q?Annaliese_McDermond?= <nh6z@nh6z.net>
To: =?UTF-8?Q?alsa-devel=40alsa-project=2Eorg?= <alsa-devel@alsa-project.org>, 
 =?UTF-8?Q?broonie=40kernel=2Eorg?= <broonie@kernel.org>, 
 =?UTF-8?Q?lgirdwood=40gmail=2Ecom?= <lgirdwood@gmail.com>, 
 =?UTF-8?Q?perex=40perex=2Ecz?= <perex@perex.cz>, =?UTF-8?Q?tiwai=40suse=2E?=
 =?UTF-8?Q?com?= <tiwai@suse.com>
Date: Wed, 31 Mar 2021 18:21:38 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210331182125.413693-1-nh6z@nh6z.net>
References: <20210331182125.413693-1-nh6z@nh6z.net> 
 <20210331182125.413693-3-nh6z@nh6z.net>
X-Mailer: Amazon WorkMail
Thread-Index: AQHXJlqutU2ZzEf5Tk+l1YBnPdSJ8wAAAHbh
Thread-Topic: [PATCH v2 2/2] ASoC: tlv320aic32x4: Register clocks before
 registering component
X-Original-Mailer: git-send-email 2.27.0
X-Wm-Sent-Timestamp: 1617214897
Message-ID: <0101017889850206-dcac4cce-8cc8-4a21-80e9-4e4bef44b981-000000@us-west-2.amazonses.com>
X-SES-Outgoing: 2021.03.31-54.240.27.90
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
me aic32x4_componet_probe actually runs.=0D=0A=0D=0AFixes: d1c859d314d8 (=
"ASoC: codec: tlv3204: Increased maximum supported channels")=0D=0ACc: st=
able@vger.kernel.org=0D=0ASigned-off-by: Annaliese McDermond <nh6z@nh6z.n=
et>=0D=0A---=0D=0A sound/soc/codecs/tlv320aic32x4.c | 8 ++++----=0D=0A 1 =
file changed, 4 insertions(+), 4 deletions(-)=0D=0A=0D=0Adiff --git a/sou=
nd/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c=0D=0Aind=
ex 1ac3b3b12dc6..b689f26fc4be 100644=0D=0A--- a/sound/soc/codecs/tlv320ai=
c32x4.c=0D=0A+++ b/sound/soc/codecs/tlv320aic32x4.c=0D=0A@@ -1243,6 +1243=
,10 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap)=0D=0A=
 =09if (ret)=0D=0A =09=09goto err_disable_regulators;=0D=0A=20=0D=0A+=09r=
et =3D aic32x4_register_clocks(dev, aic32x4->mclk_name);=0D=0A+=09if (ret=
)=0D=0A+=09=09goto err_disable_regulators;=0D=0A+=0D=0A =09ret =3D devm_s=
nd_soc_register_component(dev,=0D=0A =09=09=09&soc_component_dev_aic32x4,=
 &aic32x4_dai, 1);=0D=0A =09if (ret) {=0D=0A@@ -1250,10 +1254,6 @@ int ai=
c32x4_probe(struct device *dev, struct regmap *regmap)=0D=0A =09=09goto e=
rr_disable_regulators;=0D=0A =09}=0D=0A=20=0D=0A-=09ret =3D aic32x4_regis=
ter_clocks(dev, aic32x4->mclk_name);=0D=0A-=09if (ret)=0D=0A-=09=09goto e=
rr_disable_regulators;=0D=0A-=0D=0A =09return 0;=0D=0A=20=0D=0A err_disab=
le_regulators:=0D=0A--=20=0D=0A2.27.0=0D=0A=0D=0A
