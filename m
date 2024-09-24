Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5519845A5
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 14:11:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21A9A857;
	Tue, 24 Sep 2024 14:11:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21A9A857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727179919;
	bh=qspKubqS3d7ymXRdj2L5RA86RBJTk9T+B0dlwUVY4pM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e+lKiFDG1QJWSaex8Gg8OzA+MAdOzbnJoo2XfkxNdnHzAWTNJcM8pXqjY7XF2cKuD
	 /bGdw1M5tVyLmYsKeqF/0ZTbM94sTJFZ9nHLq+Qhs74sEnDjNv/EHozbM26peQn5VL
	 geePzjMyueRyJ0Wxif7C7+/O15p5cS5+pzxWcs2s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FBCFF805AC; Tue, 24 Sep 2024 14:11:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63486F802DB;
	Tue, 24 Sep 2024 14:11:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA845F802DB; Tue, 24 Sep 2024 14:11:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A25BEF80107
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 14:11:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A25BEF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QRlE6KTM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8C9F2A41AE7;
	Tue, 24 Sep 2024 12:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76391C4CEC4;
	Tue, 24 Sep 2024 12:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727179878;
	bh=qspKubqS3d7ymXRdj2L5RA86RBJTk9T+B0dlwUVY4pM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QRlE6KTMOYgDLztndHCipu8scsc8zUgffgl0rO1xbonlyQuqFbyO3oJT6R8S+TbaF
	 DQoTAsg04esw3WJMUNO89feV6nTFtPBEXZJJcOxp3Fo51QQkFAYQdWJ19zgZ14WDzH
	 7Z+uMgYAaB4U31SnKHUxtSpX7VBlgcAIaKWS/AAchA7+xi3YW5Bb0Y+VfzcnqVvWYZ
	 b4WMyFW1LKOiDUzhND5EuSd39jUsRSL1HdYeSsOpgZS5pfMwr8PdvpoEhxwkmt7uZf
	 /QYqv8bffSQUCNrlnOuDUGHa9AfUCAK2uwRfBmY/gBKw8ovs+AEfn9/vlSDk4b3BPd
	 ssuB0iI6mbw1w==
Date: Tue, 24 Sep 2024 14:11:13 +0200
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
	Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: rt721-sdca: Add RT721 SDCA driver
Message-ID: <ZvKsYUXJ42UZ_bhm@finisterre.sirena.org.uk>
References: <1538ca2e1df042a7b771cc387b438710@realtek.com>
 <65339ec1-ee9d-40cb-acd2-b6cfa0445c7e@linux.intel.com>
 <1297b09d51654ecfbec2d000175a2c78@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N+4mV6cwsVVu6vM6"
Content-Disposition: inline
In-Reply-To: <1297b09d51654ecfbec2d000175a2c78@realtek.com>
X-Cookie: Editing is a rewording activity.
Message-ID-Hash: 3WXTHFUVCIP546W3O6DQVQGH32GPZO24
X-Message-ID-Hash: 3WXTHFUVCIP546W3O6DQVQGH32GPZO24
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3WXTHFUVCIP546W3O6DQVQGH32GPZO24/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--N+4mV6cwsVVu6vM6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 11:54:25AM +0000, Jack Yu wrote:

> > That tells us it has 3 functions (jack, mic, amp), so what's different =
to RT722?
> > could we have a single driver for both parts? A lot of this driver seems
> > copy-pasted-renamed.

> RT721 has 3 functions just like RT722, but it's still a different codec a=
nd from internal discussion,
> we think it's better to separate the driver for future code management.

As I mentioned with the events it's possible there's some room for
factoring out some of the code for the common bits that are shared
between multiple devices.  Look at how Cirrus' Arizona drivers for
example, each chip has specific support in a separate driver but there's
a lot of shared code.

> > > +     /* Set RC calibration  */
> > > +     rt721_sdca_index_write(rt721, RT721_RC_CALIB_CTRL,
> > > +             RT721_RC_CALIB_CTRL0, 0x0b00);
> > > +     rt721_sdca_index_write(rt721, RT721_RC_CALIB_CTRL,
> > > +             RT721_RC_CALIB_CTRL0, 0x0b40);
> > > +     /* Fine tune PDE2A latency */
> > > +     regmap_write(rt721->regmap, 0x2f5c, 0x25); }

> > Humm, isn't all this supposed to be handled with blind writes? It seems=
 odd to
> > hard-code all this, no?

> It seems there is no api or function to support blind write from ACPI fro=
m latest upstream code,
> and we think it's easier for us to manage the different function's blind =
write.

It's always possible for you to add shared code for things like parsing
ACPI tables (any references to the spec for blind writes here?).

>=20
> >=20
> > > +static void rt721_sdca_amp_preset(struct rt721_sdca_priv *rt721) {;
> > > +     /* Power down group1/2/3_mic_pdb  */
> > > +     rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> > > +             RT721_MISC_POWER_CTL31, 0x8000);
> > > +     /* VREF_HV_EN_AUTO_FAST */
> > > +     rt721_sdca_index_write(rt721, RT721_ANA_POW_PART,
> > > +             RT721_VREF1_HV_CTRL1, 0xe000);
> > > +     /* Power up group1/2/3_mic_pdb */
> > > +     rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> > > +             RT721_MISC_POWER_CTL31, 0x8007);
> > > +     /* Reset dc_cal_top */
> > > +     regmap_write(rt721->mbq_regmap, 0x5810000, 0x6420);
> > > +     /* Turn back to normal dc_cal_top */
> > > +     regmap_write(rt721->mbq_regmap, 0x5810000, 0x6421);
> > > +     /* W1C Trigger Calibration */
> > > +     regmap_write(rt721->mbq_regmap, 0x5810000, 0xe421);
> > > +     /* DAC04 FU entity floating control  */
> > > +     rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> > > +             RT721_CH_FLOAT_CTL6, 0x5561);
> > > +     /* Set EAPD high */
> > > +     rt721_sdca_index_write(rt721, RT721_VENDOR_REG,
> > > +             RT721_GPIO_PAD_CTRL5, 0x8003);
> > > +     /* Enable vf707_r14 */
> > > +     regmap_write(rt721->regmap,
> > > +             SDW_SDCA_CTL(FUNC_NUM_AMP,
> > RT721_SDCA_ENT_OT23,
> > > +                     RT721_SDCA_CTL_VENDOR_DEF, 0), 0x04);
> > > +     /* FU 23 SPK mute control - L */
> > > +     regmap_write(rt721->regmap,
> > > +             SDW_SDCA_CTL(FUNC_NUM_AMP,
> > RT721_SDCA_ENT_PDE23,
> > > +                     RT721_SDCA_CTL_FU_MUTE, CH_01), 0x00);
> > > +     /* FU 23 SPK mute control - R */
> > > +     regmap_write(rt721->regmap,
> > > +             SDW_SDCA_CTL(FUNC_NUM_AMP,
> > RT721_SDCA_ENT_PDE23,
> > > +                     RT721_SDCA_CTL_FU_MUTE, CH_02), 0x00);
> > > +     /* FU 55 DAC04 mute control - L */
> > > +     regmap_write(rt721->regmap,
> > > +             SDW_SDCA_CTL(FUNC_NUM_AMP,
> > RT721_SDCA_ENT_FU55,
> > > +                     RT721_SDCA_CTL_FU_MUTE, CH_01), 0x00);
> > > +     /* FU 55 DAC04 mute control - R */
> > > +     regmap_write(rt721->regmap,
> > > +             SDW_SDCA_CTL(FUNC_NUM_AMP,
> > RT721_SDCA_ENT_FU55,
> > > +                     RT721_SDCA_CTL_FU_MUTE, CH_02), 0x00); }
> > > +
> > > +static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721) {
> > > +     /* Power down group1/2/3_mic_pdb  */
> > > +     rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> > > +             RT721_MISC_POWER_CTL31, 0x8000);
> > > +     /* VREF_HV_EN_AUTO_FAST */
> > > +     rt721_sdca_index_write(rt721, RT721_ANA_POW_PART,
> > > +             RT721_VREF1_HV_CTRL1, 0xe000);
> > > +     /* Power up group1/2/3_mic_pdb */
> > > +     rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> > > +             RT721_MISC_POWER_CTL31, 0x8007);
> > > +     /* GE0 mode related control */
> > > +     rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> > > +             RT721_GE_REL_CTRL1, 0x8011);
> > > +     /* Button A, B, C, D bypass mode */
> > > +     rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> > > +             RT721_UMP_HID_CTRL3, 0xcf00);
> > > +     /* HID1 slot enable */
> > > +     rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> > > +             RT721_UMP_HID_CTRL4, 0x000f);
> > > +     /* Report ID for HID1  */
> > > +     rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> > > +             RT721_UMP_HID_CTRL1, 0x1100);
> > > +     /* OSC/OOC for slot 2, 3 */
> > > +     rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> > > +             RT721_UMP_HID_CTRL5, 0x0c12);
> > > +     /* Set JD de-bounce clock control */
> > > +     rt721_sdca_index_write(rt721, RT721_JD_CTRL,
> > > +             RT721_JD_1PIN_GAT_CTRL2, 0xc002);
> > > +     /* RC calibration -1 */
> > > +     rt721_sdca_index_write(rt721, RT721_RC_CALIB_CTRL,
> > > +             RT721_RC_CALIB_CTRL0, 0x0b00);
> > > +     /* RC calibration -2 */
> > > +     rt721_sdca_index_write(rt721, RT721_RC_CALIB_CTRL,
> > > +             RT721_RC_CALIB_CTRL0, 0x0b40);
> > > +     /* pow_clk_12p288mhz_dre03 change to register mode */
> > > +     rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> > > +             RT721_UAJ_TOP_TCON14, 0x3333);
> > > +     /* Tune calibration timing control */
> > > +     regmap_write(rt721->mbq_regmap, 0x5810035, 0x0036);
> > > +     /* calibration HP amp output select control from Efuse */
> > > +     regmap_write(rt721->mbq_regmap, 0x5810030, 0xee00);
> > > +     /* FSM related control */
> > > +     rt721_sdca_index_write(rt721, RT721_CAP_PORT_CTRL,
> > > +             RT721_HP_AMP_2CH_CAL1, 0x0140);
> > > +     /* HP calibration related control */
> > > +     regmap_write(rt721->mbq_regmap, 0x5810000, 0x0021);
> > > +     /* W1C HP calibration*/
> > > +     regmap_write(rt721->mbq_regmap, 0x5810000, 0x8021);
> > > +     /* reg_sel_cin_hp_0010/0011 */
> > > +     rt721_sdca_index_write(rt721, RT721_CAP_PORT_CTRL,
> > > +             RT721_HP_AMP_2CH_CAL18, 0x5522);
> > > +     regmap_write(rt721->mbq_regmap, 0x5b10007, 0x2000);
> > > +     /* sel_sensing_lr_hp */
> > > +     regmap_write(rt721->mbq_regmap, 0x5B10017, 0x1b0f);
> > > +     /* Release HP-JD */
> > > +     rt721_sdca_index_write(rt721, RT721_CBJ_CTRL,
> > > +             RT721_CBJ_A0_GAT_CTRL1, 0x2a02);
> > > +     /* en_osw gating auto done bit */
> > > +     rt721_sdca_index_write(rt721, RT721_CAP_PORT_CTRL,
> > > +             RT721_HP_AMP_2CH_CAL4, 0xa105);
> > > +     /* pow_clk_en_sw_amp_detect_sel to register mode */
> > > +     rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> > > +             RT721_UAJ_TOP_TCON14, 0x3b33);
> > > +     /* cp_sw_hp to auto mode */
> > > +     regmap_write(rt721->mbq_regmap, 0x310400, 0x3023);
> > > +     /* pow_clk_en_sw_amp_detect power up */
> > > +     rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> > > +             RT721_UAJ_TOP_TCON14, 0x3f33);
> > > +     rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> > > +             RT721_UAJ_TOP_TCON13, 0x6048);
> > > +     /* switch size detect threshold */
> > > +     regmap_write(rt721->mbq_regmap, 0x310401, 0x3000);
> > > +     regmap_write(rt721->mbq_regmap, 0x310402, 0x1b00);
> > > +     /* en_hp_amp_detect auto mode */
> > > +     regmap_write(rt721->mbq_regmap, 0x310300, 0x000f);
> > > +     /* amp detect threshold */
> > > +     regmap_write(rt721->mbq_regmap, 0x310301, 0x3000);
> > > +     regmap_write(rt721->mbq_regmap, 0x310302, 0x1b00);
> > > +     /* gating_sdw_link_rst_n_1_cbj_reg */
> > > +     rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> > > +             RT721_UAJ_TOP_TCON17, 0x0008);
> > > +     /* CKXEN_SDAC chopper function */
> > > +     rt721_sdca_index_write(rt721, RT721_DAC_CTRL,
> > > +             RT721_DAC_2CH_CTRL3, 0x55ff);
> > > +     /* CKXSEL_SDAC chopper frequency */
> > > +     rt721_sdca_index_write(rt721, RT721_DAC_CTRL,
> > > +             RT721_DAC_2CH_CTRL4, 0xcc00);
> > > +     /* Bias current for SDAC */
> > > +     rt721_sdca_index_write(rt721, RT721_ANA_POW_PART,
> > > +             RT721_MBIAS_LV_CTRL2, 0x6677);
> > > +     /* VREF2 level selection */
> > > +     rt721_sdca_index_write(rt721, RT721_ANA_POW_PART,
> > > +             RT721_VREF2_LV_CTRL1, 0x7600);
> > > +     /* ADC09/MIC2 power entity floating control */
> > > +     rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> > > +             RT721_ENT_FLOAT_CTL2, 0x1234);
> > > +     /* LINE2 power entity floating control */
> > > +     rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> > > +             RT721_ENT_FLOAT_CTL3, 0x3512);
> > > +     /* DAC03/HP power entity floating control */
> > > +     rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> > > +             RT721_ENT_FLOAT_CTL1, 0x4040);
> > > +     /* ADC27 power entity floating control */
> > > +     rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> > > +             RT721_ENT_FLOAT_CTL4, 0x1201);
> > > +     /* Fine tune PDE40 latency */
> > > +     regmap_write(rt721->regmap, 0x2f58, 0x07); }
> >=20
> > same here, shouldn't this come from ACPI/blind write tables?
> >=20
> Same reply as above one.
>=20
> > > +enum rt721_sdca_jd_src {
> > > +     RT721_JD_NULL,
> > > +     RT721_JD1,
> > > +     RT721_JD2,
> > > +};
> >=20
> > is this supported in SDCA? I can't recall seeing this for other drivers.
> I'll remove this in next patch.

--N+4mV6cwsVVu6vM6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbyrGAACgkQJNaLcl1U
h9A5Wwf/eSzT3FSFioNh28wBOpbXbC6SXY54purhNq/vxE7aBCEwY/g4d5BHkLSN
dNoBtBOIawkVFjxUrybpWBla2MU8PlvauFp1jvKg5W5T/eRpcI9vspucrT16uiq5
/RAbJYYjd1Cz8K03f74MjCzFOVDgdfVzSNK7HjmGkTGfUJF8db/4IkQ+dIH8Llz+
bELfLmRYFijujwu+s4ZvXKhjVKFl6aWwiGHxnSHWVFsnLHN0iqdzZXlKc7iH8r0L
FayQHOqHAW+FnpHrue+kNpgGpTIS8kJMelBDJEthY/fcxe/bYuixrm60Loj2SNEQ
cpR1P0CH5SeHpCeWpUUYtUZYDRFeiw==
=tj4q
-----END PGP SIGNATURE-----

--N+4mV6cwsVVu6vM6--
