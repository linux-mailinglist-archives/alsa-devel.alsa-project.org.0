Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB04E483B04
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jan 2022 04:37:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66BA71689;
	Tue,  4 Jan 2022 04:36:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66BA71689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641267422;
	bh=B5r5bKWv+AN1AcrwGgolaeGf2bckAxoWiPn+7bud1g8=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=IirXMxqY+RQcw9PJym3KTb88MvXeje1QYmzoaYeZ28MoZTMPWnB8Mcyq/tu8D6qf9
	 WvQ3h1RBPmfcV0l1xlqZd6VQUwv5/ihWJpEd6lqAWub5pXXQUXbyqloYS2DdytVQv2
	 aoPNIbXvKG3dpZQffCyv2qVa5sP5UJDtC+fd4bsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B74B8F8007E;
	Tue,  4 Jan 2022 04:35:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DB51F80310; Tue,  4 Jan 2022 04:35:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDB35F80089
 for <alsa-devel@alsa-project.org>; Tue,  4 Jan 2022 04:35:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDB35F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="e8erSZ46"
Date: Tue, 04 Jan 2022 03:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail2; t=1641267343;
 bh=CtQiq4lflRfXZBK4qlNWgLY+8xhc4BjhH8iVZ3/Y3hs=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:From:To:Cc;
 b=e8erSZ46x1E4Wc474MWY29MhGWwH4AXLAtxL7/jy08a0b5zfwSUsQV5eZkvudLf91
 KQwACSRHzKs0u9bi/UEH2C7fizGnhQDejKlVQUUxNTavpLUzNNP5Ji8JvJAJeXb7J/
 hc0h8y53A7BvjMYx5HrEGapInv2k2aU6ooYkk+YKw7WfNb1mveQ+28mm2Q1CidkCMV
 k+RzZ+BRQZOrP8WLHrWGx1b4p5vPA7koXTHWDTS9XKy/MxkUOeOQsjgRnwAxewSd+z
 MisQ57h6FtQytUMsnHuaKgmaRmcc+XzLPDpqPwEk5dHS13iLrodpQNjewNIrgo/aU+
 ISDGVCZc9ELkg==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
From: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH] ASoC: wcd9335: Keep a RX port value for each SLIM RX mux
Message-ID: <20220104033356.343685-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Currently, rx_port_value is a single unsigned int that gets overwritten
when slim_rx_mux_put() is called for any RX mux, then the same value is
read when slim_rx_mux_get() is called for any of them. This results in
slim_rx_mux_get() reporting the last value set by slim_rx_mux_put()
regardless of which SLIM RX mux is in question.

Turn rx_port_value into an array and store a separate value for each
SLIM RX mux.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 sound/soc/codecs/wcd9335.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index bc5d68c53e5a..1e60db4056ad 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -341,7 +341,7 @@ struct wcd9335_codec {
 =09int reset_gpio;
 =09struct regulator_bulk_data supplies[WCD9335_MAX_SUPPLY];
=20
-=09unsigned int rx_port_value;
+=09unsigned int rx_port_value[WCD9335_RX_MAX];
 =09unsigned int tx_port_value;
 =09int hph_l_gain;
 =09int hph_r_gain;
@@ -1269,10 +1269,11 @@ static const struct snd_kcontrol_new sb_tx8_mux =3D
 static int slim_rx_mux_get(struct snd_kcontrol *kc,
 =09=09=09   struct snd_ctl_elem_value *ucontrol)
 {
-=09struct snd_soc_dapm_context *dapm =3D snd_soc_dapm_kcontrol_dapm(kc);
-=09struct wcd9335_codec *wcd =3D dev_get_drvdata(dapm->dev);
+=09struct snd_soc_dapm_widget *w =3D snd_soc_dapm_kcontrol_widget(kc);
+=09struct wcd9335_codec *wcd =3D dev_get_drvdata(w->dapm->dev);
+=09u32 port_id =3D w->shift;
=20
-=09ucontrol->value.enumerated.item[0] =3D wcd->rx_port_value;
+=09ucontrol->value.enumerated.item[0] =3D wcd->rx_port_value[port_id];
=20
 =09return 0;
 }
@@ -1286,9 +1287,9 @@ static int slim_rx_mux_put(struct snd_kcontrol *kc,
 =09struct snd_soc_dapm_update *update =3D NULL;
 =09u32 port_id =3D w->shift;
=20
-=09wcd->rx_port_value =3D ucontrol->value.enumerated.item[0];
+=09wcd->rx_port_value[port_id] =3D ucontrol->value.enumerated.item[0];
=20
-=09switch (wcd->rx_port_value) {
+=09switch (wcd->rx_port_value[port_id]) {
 =09case 0:
 =09=09list_del_init(&wcd->rx_chs[port_id].list);
 =09=09break;
@@ -1309,11 +1310,11 @@ static int slim_rx_mux_put(struct snd_kcontrol *kc,
 =09=09=09      &wcd->dai[AIF4_PB].slim_ch_list);
 =09=09break;
 =09default:
-=09=09dev_err(wcd->dev, "Unknown AIF %d\n", wcd->rx_port_value);
+=09=09dev_err(wcd->dev, "Unknown AIF %d\n", wcd->rx_port_value[port_id]);
 =09=09goto err;
 =09}
=20
-=09snd_soc_dapm_mux_update_power(w->dapm, kc, wcd->rx_port_value,
+=09snd_soc_dapm_mux_update_power(w->dapm, kc, wcd->rx_port_value[port_id],
 =09=09=09=09      e, update);
=20
 =09return 0;
--=20
2.34.1


