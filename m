Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ED6B46C7C
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Sep 2025 14:13:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B740601F3;
	Sat,  6 Sep 2025 14:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B740601F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757160834;
	bh=gVq4aknE4F2Hu/FUFAH19yK/uKyKkcQIRaVzweqhS4o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pRSmKXjPi/hlFgsHFwzCOURteJ9H3TlG4l+ndLI4vcGMY8i39mhBk6/PMBiL8zxmm
	 bvORmt6W6sf/u1AnW7HFgOnTcKINsZ1LxXRh3VJ7xhvpk9U0WkqRETmDgdaX0yJaNs
	 KPJD4H8PXLzd/x4dEeUTbDHT0jKeZCLsvPKkJarE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C59EF805BE; Sat,  6 Sep 2025 14:13:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4540F805BA;
	Sat,  6 Sep 2025 14:13:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 748DAF804FC; Sat,  6 Sep 2025 14:13:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 60053F800AE
	for <alsa-devel@alsa-project.org>; Sat,  6 Sep 2025 14:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60053F800AE
Received: from [192.168.2.4] (51b699de.dsl.pool.telekom.hu
 [::ffff:81.182.153.222])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000088D6A.0000000068BC254D.0024C3D3;
 Sat, 06 Sep 2025 14:13:01 +0200
Message-ID: <a102c7b1db0aaab8457032dde493a37b39a100db.camel@irl.hu>
Subject: Re: [PATCH v3] ALSA: hda/tas2781: Fix the order of TAS2781
 calibrated-data
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, tiwai@suse.de
Cc: broonie@kernel.org, andriy.shevchenko@linux.intel.com,
  13564923607@139.com, 13916275206@139.com,
  alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
  baojun.xu@ti.com, Baojun.Xu@fpt.com
Date: Sat, 06 Sep 2025 14:13:00 +0200
In-Reply-To: <20250906091923.1760-1-shenghao-ding@ti.com>
References: <20250906091923.1760-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
Message-ID-Hash: ECD6C22Q5UYGUMHKDVORZVIOTLMVXYXG
X-Message-ID-Hash: ECD6C22Q5UYGUMHKDVORZVIOTLMVXYXG
X-MailFrom: soyer@irl.hu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ECD6C22Q5UYGUMHKDVORZVIOTLMVXYXG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shenghao,

On Sat, 2025-09-06 at 17:19 +0800, Shenghao Ding wrote:
> A bug reported by one of my customers that the order of TAS2781
> calibrated-data is incorrect, the correct way is to move R0_Low
> and insert it between R0 and InvR0.
>=20
> Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-=
data getting function for SPI and I2C into the tas2781_hda lib")
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
>=20
> ---
> v3:
>  - Take Tiwai's advice on cali_cnv() to make it more simpler.
> v2:
>  - Submit to sound branch maintianed by Tiwai instead of linux-next branc=
h
>  - Drop other fix
> ---
>  sound/hda/codecs/side-codecs/tas2781_hda.c | 25 +++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>=20
> diff --git a/sound/hda/codecs/side-codecs/tas2781_hda.c b/sound/hda/codec=
s/side-codecs/tas2781_hda.c
> index f46d2e06c64f..f4a44c6b0234 100644
> --- a/sound/hda/codecs/side-codecs/tas2781_hda.c
> +++ b/sound/hda/codecs/side-codecs/tas2781_hda.c
> @@ -33,6 +33,23 @@ const efi_guid_t tasdev_fct_efi_guid[] =3D {
>  };
>  EXPORT_SYMBOL_NS_GPL(tasdev_fct_efi_guid, "SND_HDA_SCODEC_TAS2781");
> =20
> +/*
> + * The order of calibrated-data writing function is a bit different from=
 the
> + * order in UEFI. Here is the conversion to match the order of calibrate=
d-data
> + * writing function.
> + */
> +static void cali_cnv(unsigned char *data, unsigned int base, int offset)

unused base?

> +{
> +	struct cali_reg reg_data;
> +
> +	memcpy(&reg_data, data, sizeof(reg_data));

data points to cali_data?

> +	/* the data order has to be swapped between r0_low_reg and inv0_reg */
> +	swap(reg_data.r0_low_reg, reg_data.invr0_reg);
> +
> +	cpu_to_be32_array((__force __be32 *)(data + offset + 1),
> +		(u32 *)&reg_data, TASDEV_CALIB_N);
> +}
> +
>  static void tas2781_apply_calib(struct tasdevice_priv *p)
>  {
>  	struct calidata *cali_data =3D &p->cali_data;
> @@ -103,8 +120,7 @@ static void tas2781_apply_calib(struct tasdevice_priv=
 *p)
> =20
>  				data[l] =3D k;
>  				oft++;
> -				for (i =3D 0; i < TASDEV_CALIB_N * 4; i++)
> -					data[l + i + 1] =3D data[4 * oft + i];
> +				cali_cnv(data, 4 * oft, l);
>  				k++;
>  			}
>  		}
> @@ -130,9 +146,8 @@ static void tas2781_apply_calib(struct tasdevice_priv=
 *p)
> =20
>  		for (j =3D p->ndev - 1; j >=3D 0; j--) {
>  			l =3D j * (cali_data->cali_dat_sz_per_dev + 1);
> -			for (i =3D TASDEV_CALIB_N * 4; i > 0 ; i--)
> -				data[l + i] =3D data[p->index * 5 + i];
> -			data[l+i] =3D j;
> +			cali_cnv(data, cali_data->cali_dat_sz_per_dev * j, l);
> +			data[l] =3D j;
>  		}
>  	}
> =20

Gergo
