Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDBE6E818E
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 20:56:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3109EEF;
	Wed, 19 Apr 2023 20:55:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3109EEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681930585;
	bh=meyP3spM9CIaAdQR02aUCe+9EVd6Xh2od0/piibKCs8=;
	h=Date:Subject:From:To:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tkcrqmu7IAmKE5Z/iJc79BlHGephl+tp66N2FPr9/uniuBqQb1i9YK926IQvLSFmY
	 M8P28ziKMdADyYXi89zLrxueNxzYyqda6AYgI4NV5S/OTVKm6XIsZHlTNN8rIjUtBF
	 avZe+fK9CtAuWSxjU02nhPiulIhyfAnZ3PKmXMFg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26ACBF80155;
	Wed, 19 Apr 2023 20:55:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BB41F80155; Wed, 19 Apr 2023 20:55:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8678F80053;
	Wed, 19 Apr 2023 20:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8678F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=NklUMVdg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1681930465; i=markus.elfring@web.de;
	bh=meyP3spM9CIaAdQR02aUCe+9EVd6Xh2od0/piibKCs8=;
	h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
	b=NklUMVdgYNzfkcgyFD6bhDyQEEonJUvEwjztasQSKwPN0JpqhgjAlvooSVwyyH+Ui
	 QJAqzVS9hISNABomz/tQUxum32IzvLeBfC7ye018pkn1bQnqDrfkTJfGkXrVFSfs67
	 GcAJvmuIolC7E4QUWEhjtNbT0Akl5au4ETmugJjw1J7d/bLXYLVOU0SUtpB7Vq0o3G
	 bmiWK+UgwBOG4vNWGsw6HC68pMSxQ/qMEKfALIQi08TSWBrNw9iwak+FVJijMaeOtj
	 9XiqhKDbZSuO48e293p3yuWo8oVugq5bvTsN2Z1FJQi8l1LJMaz5TEEnMw0etaGPXs
	 4vzBSxFYWcihw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MYtwy-1pkpCz2hmq-00Upt9; Wed, 19
 Apr 2023 20:54:25 +0200
Message-ID: <c18331ca-3de9-d433-f477-b04103958b9c@web.de>
Date: Wed, 19 Apr 2023 20:54:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH] ASoC: SOF: Intel: hda-stream: Move three variable assignments
 behind condition checks in hda_dsp_iccmax_stream_hw_params()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
In-Reply-To: <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IYQBToLg699SAsMkwtAw0odob9fWSTSNOHwQHRH447nzGR634WN
 QkFRK5byuGGDSossG2oXybajbF24CXmxUsCYV+MDL7sMhmeF3phvNyvQgxPGaIxSKJDmmVa
 Y4iB5VjQWMGetWgufQJOFC6dykYk7Ha/INdPSgh8TQnVRKodOtyO8BFfFhqBL279pG6PKlx
 pbTQVavszcavEQtQkL9+A==
UI-OutboundReport: notjunk:1;M01:P0:du4mSU0mPFo=;YlNUYiOYHd8/3bhCe2uueeIAS5l
 RETYmXtt3vfVVqbE0ciX29Qn3DigmJY8oDV+p4ILTJlb7IXHB351rgD3BA9LzMb44bv+cAs3T
 5yn/YEPEI/yyQWwDTDO3zQGzSBtmPwmKq59JJHyboLDEnbBfj/JPPGrnrQyzgm2892Ypu5Bqc
 fHkR6sOauN+7LNh57k8T12Rdj+3q2xKX/JPVoHp1j1L3oajjDTKFNP7zL5u6cUGx4FfxRS7kP
 1LmhN9So6FGDMX1BBZuh8801UUW5VTvWSL9v4Y0gcp3Duz1MmqKLRSqpVNRl+Vp6vyrpYCmit
 d/46tpOOfiM5q72LLrCXdnnUBgcu66K/8gtsewDmFTu69GW71UFZt20BBAdm+j1cxrmea38Ir
 pKjK++g3zJNgqqrKbJbGpUK1hbQ8mEFZ7lk4EHm0Vkx/WeWv7TN2s6KWy86NmD6Tf75eOetmo
 HXZrM9Rmd+YPzaj4I84hg6wwP2dEDbT8MeRk0kSr7NLZoFggjSql7tIZYy/AeuSbBkvSZzOqF
 n2Hw8BdgeERtzgKibiC7SO0Z5sFkaCQv8ze8UjvQQIliNMGBFjObGXRqOiiCL7DCfyKBM4hDm
 NUCwlMwdHQn0MkuuM8bH5lYeXMuS3dc9Yt+82a1qD/lZD/oltpPNhSlxemrPwAv0m8V3vZpSP
 eBLjo8orAaD8zIcIef6K+D0sDNYAUscnfeyMARNBhnolN39Jy6TWJHfmc+u9gBWgXMqzqiv/z
 TC7hCpg57Yli6TeVMAWbG7qCpUAWVj8zHWiu3tpy1oC3M3FoaNtXZlYBpwQXhzgiEciOAfFIn
 S6FKKb6o24/ynaWkSLS1izLrfKBgz61njpibp5XXcwcO0WOrGp6gIEzyiMFu2mPNuJmYOYEyw
 wfbmGS0upLzM5pUZ7KU9Cg47zRgR0GNZcp8bAS3dnt2yMF5yzCfNkMZm3
Message-ID-Hash: SD4YRNHEA6NFHMV34EV7DI43TRFMHROY
X-Message-ID-Hash: SD4YRNHEA6NFHMV34EV7DI43TRFMHROY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SD4YRNHEA6NFHMV34EV7DI43TRFMHROY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Date: Wed, 19 Apr 2023 20:42:19 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Chda_dsp_iccmax_stream_hw_params=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for three local variables behind some condition checks.

This issue was detected by using the Coccinelle software.

Fixes: 7d88b9608142f95ccdd3dfb190da4a5faddb1cc7 ("ASoC: SOF: Intel: hdac_e=
xt_stream: consistent prefixes for variables/members")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 sound/soc/sof/intel/hda-stream.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-st=
ream.c
index 79d818e6a0fa..9c44127014fc 100644
=2D-- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -407,10 +407,10 @@ int hda_dsp_iccmax_stream_hw_params(struct snd_sof_d=
ev *sdev, struct hdac_ext_st
 				    struct snd_dma_buffer *dmab,
 				    struct snd_pcm_hw_params *params)
 {
-	struct hdac_stream *hstream =3D &hext_stream->hstream;
-	int sd_offset =3D SOF_STREAM_SD_OFFSET(hstream);
+	struct hdac_stream *hstream;
+	int sd_offset;
 	int ret;
-	u32 mask =3D 0x1 << hstream->index;
+	u32 mask;

 	if (!hext_stream) {
 		dev_err(sdev->dev, "error: no stream available\n");
@@ -422,9 +422,12 @@ int hda_dsp_iccmax_stream_hw_params(struct snd_sof_de=
v *sdev, struct hdac_ext_st
 		return -ENODEV;
 	}

+	hstream =3D &hext_stream->hstream;
 	if (hstream->posbuf)
 		*hstream->posbuf =3D 0;

+	sd_offset =3D SOF_STREAM_SD_OFFSET(hstream);
+
 	/* reset BDL address */
 	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
 			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPL,
@@ -459,6 +462,8 @@ int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev=
 *sdev, struct hdac_ext_st
 				sd_offset + SOF_HDA_ADSP_REG_SD_LVI,
 				0xffff, (hstream->frags - 1));

+	mask =3D 0x1 << hstream->index;
+
 	/* decouple host and link DMA, enable DSP features */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
 				mask, mask);
=2D-
2.40.0

