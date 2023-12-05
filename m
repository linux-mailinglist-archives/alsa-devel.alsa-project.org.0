Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D1D804415
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 02:32:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 300E0A4A;
	Tue,  5 Dec 2023 02:32:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 300E0A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701739951;
	bh=+3kLOYNv/GXXheGVfBj20OoUvCUNlDd1UpFYQ6b3CSo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OQhmSK4NOWYxdv2IfHXhcX1SRwVlBTc84BZqAk9JlxMh7lUjAaLd1V4OH/jbAf0pQ
	 7olvMq+2zL+/uMM5Om9tjOzcR2CgfH+3zGifsrqUBvHCTX8axnzFAbiMTVS4oRbknu
	 VW8HHXs7+SXNOVDq0cl9+8jxpUPvRpOLEr8HfIQ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEE00F80578; Tue,  5 Dec 2023 02:31:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF1FAF80571;
	Tue,  5 Dec 2023 02:31:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C5D9F8024E; Tue,  5 Dec 2023 02:31:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 3BFD4F800AC
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 02:31:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BFD4F800AC
Received: from [192.168.2.4] (51b68398.dsl.pool.telekom.hu
 [::ffff:81.182.131.152])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000071433.00000000656E7D7D.001150F6;
 Tue, 05 Dec 2023 02:31:41 +0100
Message-ID: <974d41f6c703d9b65ebcd75a2c659cecf13bd877.camel@irl.hu>
Subject: Re: [PATCH 2/2] ALSA: hda/tas2563: Add tas2563 HDA driver
From: Gergo Koteles <soyer@irl.hu>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
  Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Date: Tue, 05 Dec 2023 02:31:40 +0100
In-Reply-To: <90765ee0-a814-4852-9b2a-020cda98d930@linux.intel.com>
References: <cover.1701733441.git.soyer@irl.hu>
	 <4a2f31d4eb8479789ceb1daf2e93ec0e25c23171.1701733441.git.soyer@irl.hu>
	 <90765ee0-a814-4852-9b2a-020cda98d930@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0
Message-ID-Hash: K5KKYYBV5Y2TGJGJS7GRXGCWUG7UEIJ4
X-Message-ID-Hash: K5KKYYBV5Y2TGJGJS7GRXGCWUG7UEIJ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K5KKYYBV5Y2TGJGJS7GRXGCWUG7UEIJ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre-Louis,

On Mon, 2023-12-04 at 18:22 -0600, Pierre-Louis Bossart wrote:
>=20
>=20
> >=20
> > -	 tas2781_generic_fixup(cdc, action, "i2c", "TIAS2781");
> > +	 tas2xxx_generic_fixup(cdc, action, "i2c", "TIAS2781");
> > +}
>=20
> this sort of rename should be part of a separate patch IMHO, it'd be
> easier to review.
>=20
Okey.

> > +
> > +static void tas2563_fixup_i2c(struct hda_codec *cdc,
> > +	const struct hda_fixup *fix, int action)
> > +{
> > +	 tas2xxx_generic_fixup(cdc, action, "i2c", "INT8866");
>=20
> Any specific reason to use an Intel ACPI identifier? Why not use
> "TIAS2563" ?
>=20
INT8866 is in the ACPI.
I don't know why Lenovo uses this name.
I think it's more internal than intel.

   Scope (_SB.I2CD)
    {
        Device (TAS)
        {
            Name (_HID, "INT8866")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource
Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x004C, ControllerInitiated,
0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    I2cSerialBusV2 (0x004D, ControllerInitiated,
0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioInt (Edge, ActiveLow, SharedAndWake, PullNone,
0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0020
                        }
                })
                Return (RBUF) /* \_SB_.I2CD.TAS_._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }
    }


> > +#define TAS2563_REG_INIT_N 12
>=20
> newline
>=20
> > +static const struct reg_default tas2563_reg_init[TAS2563_MAX_CHANNELS]
> > +	[TAS2563_REG_INIT_N] =3D {
> > +	{
> > +		{ TAS2562_TDM_CFG2, 0x5a },
> > +		{ TAS2562_TDM_CFG4, 0xf3 },
> > +		{ TAS2562_TDM_CFG5, 0x42 },
> > +		{ TAS2562_TDM_CFG6, 0x40 },
> > +		{ TAS2562_BOOST_CFG1, 0xd4 },
> > +		{ TAS2562_BOOST_CFG3, 0xa4 },
> > +		{ TAS2562_REG(0x00, 0x36), 0x0b },
> > +		{ TAS2562_REG(0x00, 0x38), 0x21 },
> > +		{ TAS2562_REG(0x00, 0x3c), 0x58 },
> > +		{ TAS2562_BOOST_CFG4, 0xb6 },
> > +		{ TAS2562_ASI_CONFIG3, 0x04},
> > +		{ TAS2562_REG(0x00, 0x47), 0xb1 },
>=20
> > +/* Update the calibrate data, including speaker impedance, f0, etc, in=
to algo.
>=20
> update the calibration data,
>=20
> > + * Calibrate data is done by manufacturer in the factory. These data a=
re used
>=20
> The manufacturer calibrates the data in the factory.
>=20
> > + * by Algo for calucating the speaker temperature, speaker membrance e=
xcursion
>=20
> calculating
>=20
> membrane
>=20
>=20
> > +static int tas2563_hda_i2c_probe(struct i2c_client *client)
> > +{
> > +	struct tas2563_data *tas2563;
> > +	int ret;
> > +
> > +	tas2563 =3D devm_kzalloc(&client->dev, sizeof(struct tas2563_data),
> > +		GFP_KERNEL);
> > +	if (!tas2563)
> > +		return -ENOMEM;
> > +	tas2563->dev =3D &client->dev;
> > +	tas2563->client =3D client;
> > +
> > +	dev_set_drvdata(tas2563->dev, tas2563);
> > +
> > +	ret =3D tas2563_read_acpi(tas2563);
> > +	if (ret)
> > +		return dev_err_probe(tas2563->dev, ret,
> > +			"Platform not supported\n");
> > +
> > +	for (int i =3D 0; i < tas2563->ndev; ++i) {
> > +		struct tas2563_dev *tasdev =3D &tas2563->tasdevs[i];
> > +
> > +		ret =3D tas2563_tasdev_read_efi(tas2563, tasdev);
> > +		if (ret)
> > +			return dev_err_probe(tas2563->dev, ret,
> > +				"Calibration data cannot be read from EFI\n");
> > +
> > +		ret =3D tas2563_tasdev_init_client(tas2563, tasdev);
> > +		if (ret)
> > +			return dev_err_probe(tas2563->dev, ret,
> > +				"Failed to init i2c client\n");
> > +
> > +		ret =3D tas2563_tasdev_init_regmap(tas2563, tasdev);
> > +		if (ret)
> > +			return dev_err_probe(tas2563->dev, ret,
> > +				"Failed to allocate register map\n");
> > +	}
> > +
> > +	ret =3D component_add(tas2563->dev, &tas2563_hda_comp_ops);
> > +	if (ret) {
> > +		return dev_err_probe(tas2563->dev, ret,
> > +			"Register component failed\n");
> > +	}
>=20
> I wonder how many of those tests actually depend on deferred probe, and
> if this isn't a case of copy-paste "just in case"?
>=20
> > +
> > +	pm_runtime_set_autosuspend_delay(tas2563->dev, 3000);
> > +	pm_runtime_use_autosuspend(tas2563->dev);
> > +	pm_runtime_mark_last_busy(tas2563->dev);
> > +	pm_runtime_set_active(tas2563->dev);
> > +	pm_runtime_get_noresume(tas2563->dev);
> > +	pm_runtime_enable(tas2563->dev);
> > +
> > +	pm_runtime_put_autosuspend(tas2563->dev);
>=20
> the sequence get_noresume/enable/put_autosuspend makes no sense to me.
> doing a get_noresume *before* enable should do exactly nothing, and
> releasing the resource would already be handled with autosuspend based
> on the last_busy mark.
>=20
I copied this from the tas2781-hda driver, I'll dig into this more.

> > +
> > +	return 0;
> > +}
> > +
> > +static void tas2563_hda_i2c_remove(struct i2c_client *client)
> > +{
> > +	struct tas2563_data *tas2563 =3D dev_get_drvdata(&client->dev);
> > +
> > +	pm_runtime_get_sync(tas2563->dev);
> > +	pm_runtime_disable(tas2563->dev);
> > +
> > +	component_del(tas2563->dev, &tas2563_hda_comp_ops);
> > +
> > +	pm_runtime_put_noidle(tas2563->dev);
>=20
> that pm_runtime sequence also makes no sense to me, if you disable
> pm_runtime the last command is useless/no-op.
>=20
> > +}
> > +
> > +static int tas2563_system_suspend(struct device *dev)
> > +{
> > +	struct tas2563_data *tas2563 =3D dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	dev_dbg(tas2563->dev, "System Suspend\n");
> > +
> > +	ret =3D pm_runtime_force_suspend(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static int tas2563_system_resume(struct device *dev)
> > +{
> > +	int ret;
> > +	struct tas2563_data *tas2563 =3D dev_get_drvdata(dev);
> > +
> > +	dev_dbg(tas2563->dev, "System Resume\n");
> > +
> > +	ret =3D pm_runtime_force_resume(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (int i =3D 0; i < tas2563->ndev; ++i)
> > +		tas2563_tasdev_setup(tas2563, &tas2563->tasdevs[i]);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct dev_pm_ops tas2563_hda_pm_ops =3D {
> > +	SYSTEM_SLEEP_PM_OPS(tas2563_system_suspend, tas2563_system_resume)
>=20
> where's the pm_runtime stuff?
>=20

The amp stores its state in software shutdown mode.
The tas2563_hda_playback_hook wakes/shutdowns the amp, not the
pm_runtime.

> > +};
>=20

Regards,

Gergo
