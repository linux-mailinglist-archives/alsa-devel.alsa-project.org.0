Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F9FB376FE
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Aug 2025 03:35:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75B316029A;
	Wed, 27 Aug 2025 03:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75B316029A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756258518;
	bh=EKvacJKZ+n/LI1Y2Vba84HtYOzBBJadJZPaJP6ikri4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UhPmwIBWItQ6nP19agFNCVy+IwnyXOWDnoU4isX9wMOMGppU0+5JkFVGx73PXndX/
	 i/IAwEmlvATQ/mDe9REiv25E+3wo+GWJtiTnKVb3YQWLfjJjuDvNTk6zsARccd5XhU
	 wjedMQhJc8+mSg6diSC+nb+0H5xkqRI+qYAP7Zz8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C176F805C9; Wed, 27 Aug 2025 03:34:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73DC5F805C9;
	Wed, 27 Aug 2025 03:34:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC971F80495; Wed, 27 Aug 2025 03:34:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id E25EAF80072
	for <alsa-devel@alsa-project.org>; Wed, 27 Aug 2025 03:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E25EAF80072
Received: from [192.168.2.4] (51b68eac.dsl.pool.telekom.hu
 [::ffff:81.182.142.172])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000088D34.0000000068AE609C.00233DD6;
 Wed, 27 Aug 2025 03:34:20 +0200
Message-ID: <8187d109eb70f6d459df63f3507a0be79efd9aa9.camel@irl.hu>
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Fix EFI name for calibration
 beginning with 1 instead of 0
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, tiwai@suse.de
Cc: broonie@kernel.org, andriy.shevchenko@linux.intel.com,
  13564923607@139.com, 13916275206@139.com,
  alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
  baojun.xu@ti.com, Baojun.Xu@fpt.com, jesse-ji@ti.com
Date: Wed, 27 Aug 2025 03:34:19 +0200
In-Reply-To: <20250826094105.1325-1-shenghao-ding@ti.com>
References: <20250826094105.1325-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
Message-ID-Hash: XOVS3G3JOFXXT67KW22NBGU7NYNWSOFL
X-Message-ID-Hash: XOVS3G3JOFXXT67KW22NBGU7NYNWSOFL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XOVS3G3JOFXXT67KW22NBGU7NYNWSOFL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shenghao,

On Tue, 2025-08-26 at 17:41 +0800, Shenghao Ding wrote:
> A bug reported by one of my customers that EFI name beginning with 0
> instead of 1.
>=20
> Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-=
data getting function for SPI and I2C into the tas2781_hda lib")
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
>=20
> ---
> v2:
>  - remove unrelated change
> v1:
>  - Fix EFI name beginning with 1 instead of 0
>  - Add extra comments on EFI name for calibration
>  - Remove an extra space
> ---
>  sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/c=
odecs/side-codecs/tas2781_hda_i2c.c
> index ed7771ab9475..635cbd8820ac 100644
> --- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> +++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> @@ -340,7 +340,8 @@ static int tas2563_save_calibration(struct tas2781_hd=
a *h)
>  		data[offset] =3D i;
>  		offset++;
>  		for (j =3D 0; j < TASDEV_CALIB_N; ++j) {
> -			ret =3D snprintf(var8, sizeof(var8), vars[j], i);
> +			/* EFI name for calibration started with 1, not 0 */
> +			ret =3D snprintf(var8, sizeof(var8), vars[j], i + 1);
> =20
>  			if (ret < 0 || ret >=3D sizeof(var8) - 1) {
>  				dev_err(p->dev, "%s: Read %s failed\n",
> @@ -349,7 +350,7 @@ static int tas2563_save_calibration(struct tas2781_hd=
a *h)
>  			}
>  			/*
>  			 * Our variable names are ASCII by construction, but
> -			 * EFI names are wide chars.  Convert and zero-pad.
> +			 * EFI names are wide chars. Convert and zero-pad.
>  			 */
>  			memset(efi_name, 0, sizeof(efi_name));
>  			for (k =3D 0; k < sizeof(var8) && var8[k]; k++)

In the tas2563_save_calibration() function the variables are read in
the following order: R0, InvR0, R0_Low, Power, TLim.
They are also included in cali_data in this order.

But the tasdev_load_calibrated_data() function reads them from
cali_data as R0, R0_Low, InvR0, Power, TLim.

And this may be true for tas2781 as well.

Could you check this also?

Thanks,
Gergo
