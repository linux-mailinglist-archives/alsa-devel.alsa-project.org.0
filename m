Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 914F16E0D42
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 14:12:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE7B6EE9;
	Thu, 13 Apr 2023 14:11:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE7B6EE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681387921;
	bh=f6nYDA5zDRXQnkwED6X9yup3CORZV103/yGCf4txjPc=;
	h=Date:Subject:From:To:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pJ6slMMBUaquVb+hJSW4Yhm6poLCt+FpV+dYza3R1mf4Kd2ylqmgH+6Di9P4cKiuF
	 iCk2s7F9n7t45f+CvqEuBxzIiV4XmmhH1Uf1/c8poHjOwoRJosnlv7ReksEkFhyzHR
	 X+llNxUjg/5fnm4cSl479FzAiXsMvtwYASxePee0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34B44F8032B;
	Thu, 13 Apr 2023 14:11:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C1A2F8032B; Thu, 13 Apr 2023 14:11:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71AD9F80100;
	Thu, 13 Apr 2023 14:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71AD9F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=tKjlRPdZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1681387852; i=markus.elfring@web.de;
	bh=f6nYDA5zDRXQnkwED6X9yup3CORZV103/yGCf4txjPc=;
	h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
	b=tKjlRPdZjPKBAdf7fBm3uzaI1qFHgTU0nzidZX94t4vdiqa/NW4jLZkxTlIP81xSG
	 dMdSG4j2/TXRsWRlIKKRIIOuVztqMyD0pJVrUCMd1rkznj0ttY0kRwvnK1pkgBYDw7
	 99Nycmd5CjsgN41diirZPtzMDMf4RXlgh7jFfgJ3bM3u+TWPksJXDFoBl/yMnkFLSg
	 BuVjx7TeJNGvvcZh5Ri7dPF3bp5Z0FZbWcryODPkj+CsXRA1dZ+PHNH4cXfQhcxWZ7
	 vb/0Q78dkP5qz5eILH1bfBH/CGn/SlrDzMyZB05Eeo7Kcj15AhkDT/kRxetdC7bvFY
	 2mxeKp2t8R12Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mvbn2-1qbsVu1Z5C-00szHQ; Thu, 13
 Apr 2023 14:10:52 +0200
Message-ID: <46d8e10e-25dc-dfd7-3e39-92b86058126a@web.de>
Date: Thu, 13 Apr 2023 14:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH] ASoC: SOF: topology: Move a variable assignment behind
 condition checks in sof_dai_load()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Keyon Jie <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
In-Reply-To: <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Jl8V/9KAdzFRpvpfkQ77MacaWQTbsQVWDIxp9a6wDHu/uFJ6E0K
 wrnq8t9va+6xer9T+IgUPfTITJurni3ae6KdAmI2E+md4NCvSinWzw3+xvTc/RDb28CUj4w
 HNwdAU9Sim6wlfoLqbVFKie1SgubPls8/hPURw/Gqew3Lxco2rtWKomirG6tPQOVjlRtn4C
 htR1uE0iGve8rHfDMe2WA==
UI-OutboundReport: notjunk:1;M01:P0:1rUQBhxaU1g=;htIlgbUHh7Ouq5VoS3wyz8BV2jR
 ARn+fkYyic62xVTX7XdqFjZkl8s2ekhbbUQs91Ve177CSlIj4SYljG9CL5gCOxurZE4jD2cOT
 xr7aQaaQ2O4Gf0Rqtu9Uwl4a1SgRnPEU+5NjHOAINDCi2cSPRAIZNk6IlsPLfT9s2R7HZb1Je
 l6wrvL5c3nBDz9HQWxe6Ddl/UfbzSEEEgFcCWCOU9Xe0h9BMjRDCuY7RUve9sZdyZFI5+et1V
 7mBrHogZGTgrhgxUL/KGB73n14zdPabzkO97VkABEUK8LE1MnKQGY70ClmXdozcQvQl6jPW/c
 a2+E4aUi9lCosVTfn8lgTo/C5sCVjyumOBK4zQnjP8euEQSsRWYiqjRWd4fjOEjewFk7DpJUN
 zWSEQzdBMLGmwmzZpJ+BdEpY+2NFCiwlsoOLCBO1bqS9yOQUX4wEo+dneT5SL2IZgsYEQpbQL
 nYM6t+ApeMYnKQwL0xX+EDEAjY6Na9ADXL5yxYWNo6plCf9V6iptSDM4pIYfqmkj0819lrMmL
 tFkHxRX/7CayZASNnn7QA2QN5EL2s8A6lzX9t9ZykBYhEtBqME4Nv1wDIXyG8vOY5Xm2kYQG/
 iHCdO5ByR8tz7r9sGn6glElofiqa3/4eTKNau6Heo0/o7ZCA/z5n2Y1qrJ/qsslljc5MpRe/y
 IwJZWT2e2DSVsCa6Wg/g4QFzXdHF3HLPr1n8zXquONmevH4bTJr1ADI2i9rMtelryJJGs0dyo
 k8D4GdtYLLMRJ7pOe02RxImCqz7RIFFjqffGf1d+q0ezTwtdV8lNvDVvKS9BUcPfdbTJNRrzX
 tx70Y9SCJlgIixKGD83vhg9NOOdaEsjOgaFxo9/DoF6UomkUjPHKeuykO1SlJ6bcuWnMUSNME
 gOpV7452deRG7GiGBOonwrTf1mRBu+sRJlRF4QmhA65NAmmJuGOmmF7Vp
Message-ID-Hash: LSDEHHF6FIUCCX7TDJMILQZPN4YZNTCX
X-Message-ID-Hash: LSDEHHF6FIUCCX7TDJMILQZPN4YZNTCX
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LSDEHHF6FIUCCX7TDJMILQZPN4YZNTCX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Date: Thu, 13 Apr 2023 13:56:44 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Csof_dai_load=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the local variable =E2=80=9Cprivate=E2=80=9D behind some condition che=
cks.

This issue was detected by using the Coccinelle software.

Fixes: c5232c0171428f005a3204e1c264231fb5999b28 ("ASoC: SOF: topology: par=
se and store d0i3_compatible flag")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 sound/soc/sof/topology.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index d3d536b0a8f5..3fffe3826160 100644
=2D-- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1680,7 +1680,7 @@ static int sof_dai_load(struct snd_soc_component *sc=
omp, int index,
 	struct snd_sof_dev *sdev =3D snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_pcm_ops *ipc_pcm_ops =3D sof_ipc_get_ops(sdev, pcm)=
;
 	struct snd_soc_tplg_stream_caps *caps;
-	struct snd_soc_tplg_private *private =3D &pcm->priv;
+	struct snd_soc_tplg_private *private;
 	struct snd_sof_pcm *spcm;
 	int stream;
 	int ret;
@@ -1716,6 +1716,7 @@ static int sof_dai_load(struct snd_soc_component *sc=
omp, int index,
 	dai_drv->dobj.private =3D spcm;
 	list_add(&spcm->list, &sdev->pcm_list);

+	private =3D &pcm->priv;
 	ret =3D sof_parse_tokens(scomp, spcm, stream_tokens,
 			       ARRAY_SIZE(stream_tokens), private->array,
 			       le32_to_cpu(private->size));
=2D-
2.40.0

