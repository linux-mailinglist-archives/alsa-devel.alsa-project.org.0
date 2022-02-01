Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 593504A68C0
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 00:48:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB0E417D8;
	Wed,  2 Feb 2022 00:47:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB0E417D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643759328;
	bh=Q8xBPOUco7AyhyFcpEjf5QtwQ6sfLa7OZ7E7rgmk1UM=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=PR626lnHGKAqGrIpRxTNzo1TAZWE/9pe/NlbEdWA1zVM0AA0BlOeFmhTgIg5S3x5E
	 q4SLn3dvLdSLIpTB9y4qLibU+cWPAkA7cjTk+T1bWxpub3M67jCLWqFJqUHOD8tsBR
	 MXqEUideFSRbio9P63tTrR2PbaFHwO9nSieMKhUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BE38F80089;
	Wed,  2 Feb 2022 00:47:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 598E4F80130; Wed,  2 Feb 2022 00:47:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEDF2F800F8
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 00:47:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEDF2F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="tmAslqzD"
Date: Tue, 01 Feb 2022 23:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail2; t=1643759249;
 bh=SzxGyHc0MaRHChzTCdfR+eLaUqpReD6n1FCyEvsk43k=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:From:To:Cc;
 b=tmAslqzDF4OjbdvUsLuPf4FNXsaYYBeeKrW/n1jjNzCxJEqFN0JH9hV8Nt35vwvpv
 yH5X7JsSkISNXfQNC6ErlJgbMS41nhEjfpJ4T1DB2N9JZKE4LJRj4z/hWVVWs6gwxq
 +MrMf2Zxf3Ip2CO8INk5EqTumceCNGXIn8dLSvelDcwDb+VfDUezocMYEVka/z+H3P
 T4TrGdV3ah18cG3w7rduXmaEj5T4yg/t9PI+XLU8rSJHR18Za5J18vzlCg2nhwPLnL
 f53dx+py7Awk6OZu69NQUzYGGGfN1yTNZqbCWlJ7UWihdZjEySJvP8G1OHwzx9l5Uw
 tJpj38djD++kg==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@protonmail.com>
Subject: [PATCH] ASoC: tas2770: Insert post reset delay
Message-ID: <20220201234612.74401-1-povik+lin@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org,
 =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@protonmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Frank Shi <shifu0704@thundersoft.com>,
 Ye Bin <yebin10@huawei.com>
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
Reply-To: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Per TAS2770 datasheet there must be a 1 ms delay from reset to first
command. So insert delays into the driver where appropriate.

Fixes: 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
Signed-off-by: Martin Povi=C5=A1er <povik+lin@protonmail.com>
---
 sound/soc/codecs/tas2770.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index b52c0861edc8..b397a2122dd4 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -38,10 +38,12 @@ static void tas2770_reset(struct tas2770_priv *tas2770)
 =09=09gpiod_set_value_cansleep(tas2770->reset_gpio, 0);
 =09=09msleep(20);
 =09=09gpiod_set_value_cansleep(tas2770->reset_gpio, 1);
+=09=09usleep_range(1000, 2000);
 =09}

 =09snd_soc_component_write(tas2770->component, TAS2770_SW_RST,
 =09=09TAS2770_RST);
+=09usleep_range(1000, 2000);
 }

 static int tas2770_set_bias_level(struct snd_soc_component *component,
@@ -110,6 +112,7 @@ static int tas2770_codec_resume(struct snd_soc_componen=
t *component)

 =09if (tas2770->sdz_gpio) {
 =09=09gpiod_set_value_cansleep(tas2770->sdz_gpio, 1);
+=09=09usleep_range(1000, 2000);
 =09} else {
 =09=09ret =3D snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
 =09=09=09=09=09=09    TAS2770_PWR_CTRL_MASK,
@@ -529,8 +532,10 @@ static int tas2770_codec_probe(struct snd_soc_componen=
t *component)

 =09tas2770->component =3D component;

-=09if (tas2770->sdz_gpio)
+=09if (tas2770->sdz_gpio) {
 =09=09gpiod_set_value_cansleep(tas2770->sdz_gpio, 1);
+=09=09usleep_range(1000, 2000);
+=09}

 =09tas2770_reset(tas2770);

--
2.33.0


