Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E18E64B9E1
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 17:36:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8628180D;
	Tue, 13 Dec 2022 17:35:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8628180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670949385;
	bh=qihIQCMPrJTCAef4qkglbnoZxzlmXFeUf906h3WI2bE=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RX0hK0rwOiJQqMki61ijOzA0g3lnWmS4HJYpFI9/GY1JCnjhEmki1KTpCBrC2O+6Y
	 Pyjkg7lrf221clEk6D7C7n8kY0KI5kpK5zpbzefUVmeIkubyhSDQXC1p4OmXFGsXoW
	 O6gCVthXeJGA5jjRrzmP5SZ4WGZ2cPce1BR97O7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FF8EF80141;
	Tue, 13 Dec 2022 17:35:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CE68F804E2; Tue, 13 Dec 2022 17:35:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68529F80141
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 17:35:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68529F80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fO1G6bGV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE640615E6;
 Tue, 13 Dec 2022 16:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82E0C433D2;
 Tue, 13 Dec 2022 16:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670949321;
 bh=qihIQCMPrJTCAef4qkglbnoZxzlmXFeUf906h3WI2bE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fO1G6bGV/KeloymJW66oTo+yy+4yiT37YGEdNR/LT98AlF2QyOlkQ4lyIzmmC9Yja
 YOMMnFWSG203NY/ONt2prT6lxOZ7dDs76fJ4cV9KlRU9lNIMTFQqee3CuTxvGGo5NQ
 dx9q+nHopU1j+ic41SEa4x8AxO5czV+M4yY/zXLn32x4e9JwgBEkZAg9Aho7/3SDye
 MCUA7Lg5uMvgdGaHcRZaFOpW+bWxkcnTVNd1eKn+ATVb1Vww+u+adQt9TcwZ4L0ox1
 Gu2W+dwVSoudhK9Qx6pFfylt/zuhILMN/mvj9FPRYb4BGTMcbiN5PU6HASzBE7Z7Od
 8cbCBwqUtCjnQ==
Date: Tue, 13 Dec 2022 16:35:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu =?utf-8?B?KOS/nuWutumRqyk=?= <Jiaxin.Yu@mediatek.com>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Message-ID: <Y5ipwqzHKTK8UdlC@sirena.org.uk>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
 <20221125094413.4940-2-jiaxin.yu@mediatek.com>
 <Y4Cysgk5Gic5ae9B@sirena.org.uk>
 <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
 <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
 <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
 <Y4jHAJgmz/P58Q/C@sirena.org.uk>
 <7023a2c7b471d6888d9079563a6c01f22599201f.camel@mediatek.com>
 <Y43e+EsNCrCpZSIH@sirena.org.uk>
 <dc50d0b21795acbcc44c77e5fd81e7cb92c65c67.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/zKtWsydBRDCvDgl"
Content-Disposition: inline
In-Reply-To: <dc50d0b21795acbcc44c77e5fd81e7cb92c65c67.camel@mediatek.com>
X-Cookie: Edwin Meese made me wear CORDOVANS!!
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 Chunxu Li =?utf-8?B?KOadjuaYpeaXrSk=?= <Chunxu.Li@mediatek.com>,
 Allen-KH Cheng =?utf-8?B?KOeoi+WGoOWLsyk=?= <Allen-KH.Cheng@mediatek.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--/zKtWsydBRDCvDgl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2022 at 02:23:32PM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=E9=
=91=AB) wrote:
> On Mon, 2022-12-05 at 12:07 +0000, Mark Brown wrote:
> > On Mon, Dec 05, 2022 at 09:34:17AM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=
=E9=91=AB) wrote:

> > No, I mean that if you want to control the enable and disable of the
> > output path you should implement a DAPM widget.

> May I ask which driver file to add a new DAPM widget? Is it the bridge
> ic driver like it6505.c? Or is it linke the "SDB" added in this patch?

I would expect this to follow a similar pattern to everything else with
hdmi-codec.c and have the actual ASoC stuff in there with a callback
exposed to the rest of the world.

> Yes, I should add a new set of events, such as:

> enum {
>     HDMI_CODEC_TRIGGER_EVENT_STOP,
>     HDMI_CODEC_TRIGGER_EVENT_START,
>     HDMI_CODEC_TRIGGER_EVENT_SUSPEND,
>     HDMI_CODEC_TRIGGER_EVENT_RESUME,
> }

> Then provide handles for these events in the it6505 driver. Am I right?

I'd expect more like on/off for a DAPM widget (the DAPM callbacks are
pre/post on/off) but yes.

--/zKtWsydBRDCvDgl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOYqcEACgkQJNaLcl1U
h9BIcwf+IZPAQvqXRw2Cg6HsT7fk7Rmm2c4pKUU8NYJA7vobVG315cVSIGTIXIqD
ImaHqf5kMeCNdt5eX5Hox3j5q3b2drkrcyHP6rj44Bb7lzqhHadpfXi9XaX7DT4d
FrmlVfM2gwCXMSKbsKKPHXdqABIi86R5bN79MxoAhgbfisu5OmIrm6ZvYYvLXSlC
nAXcEMeIKZGzhSQIEZCAQ0koNeKZAdmHz435pKjqYWCMbzCsTvXDOJq5GBB8rsiH
lsuMIxHbyBoPUZdhuPj0WAzBMgAY9Kir3RQ1+Xd3epA9LYpWHn+bqotaAqEIlP7Y
1c1+QoUZgnbL7M8UCa5+mryUEIhzGA==
=uzkH
-----END PGP SIGNATURE-----

--/zKtWsydBRDCvDgl--
