Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD98679E87C
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 14:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CBF9A4C;
	Wed, 13 Sep 2023 14:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CBF9A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694609982;
	bh=Dm8nPuZvFh0PS3q5tY1maihWmD+gVq1qHqcDYEbybag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dxg97GSTF71L8DOYzDAmjXBeZLWIQZXdlXF/4Fq6F1kbttVL4av/uWY4JN0ON3N//
	 Ktcxun5pPX8D/daBkcM/sKTLtJ7fR/CB7131SxCNaU09lOKVdoSZDpVvlr52obglpb
	 88EERC2QoxkeZUw2PEWAcOI6FQQpKfemdf59TGCg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBE9DF80537; Wed, 13 Sep 2023 14:58:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66FF2F8007C;
	Wed, 13 Sep 2023 14:58:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A18DDF80425; Wed, 13 Sep 2023 14:58:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D741F80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 14:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D741F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IVtCamP8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B5DAB61924;
	Wed, 13 Sep 2023 12:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC443C433C8;
	Wed, 13 Sep 2023 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694609912;
	bh=Dm8nPuZvFh0PS3q5tY1maihWmD+gVq1qHqcDYEbybag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVtCamP8iz+I2giT9zMKAjS2SBf1eYvu3XQunocMDBLGluzwPONUi4rgZXGfOah1N
	 dDURtGrmzQIBVa8UR5t5YFAtw5c67zowXZcO3FOCdVXJ78hCD+MkNNusqJwTACdXZn
	 kp8YWupGS0Pk4Ss9gPHnfHX+jqvWOh6AXq+15SefYYx5sU2/ppx5xo8xPNhTuLpGet
	 RqXD/qQ6GtD9ZgGXvHdTr06r9YY+vAgjTVjfR8BS5PeP1kyPjDNapTfEWQ20ZF8eXF
	 nC5/Khz09WnmWo1E/XQ0FMHPvQaXv0DRaUAIGXHyEfdcdDI6MBEGsV3Io4iLu/Vs7Q
	 DD9DlVIhmGvcA==
Date: Wed, 13 Sep 2023 13:58:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	pierre-louis.bossart@linux.intel.com,
	yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com,
	peter.ujfalusi@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 1/4] ASoC: soc-card: Add storage for PCI SSID
Message-ID: <66a4381b-1a35-495f-a74a-1da0af1334c1@sirena.org.uk>
References: <20230912163207.3498161-1-rf@opensource.cirrus.com>
 <20230912163207.3498161-2-rf@opensource.cirrus.com>
 <92b2b69e-3175-651f-45bb-d9ae11eaec82@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k8z/zzyoNTrEHxEA"
Content-Disposition: inline
In-Reply-To: <92b2b69e-3175-651f-45bb-d9ae11eaec82@linux.intel.com>
X-Cookie: You will be surrounded by luxury.
Message-ID-Hash: BRF33GNIO7WCNMP2OE5BXYEN5IUJ2NY5
X-Message-ID-Hash: BRF33GNIO7WCNMP2OE5BXYEN5IUJ2NY5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BRF33GNIO7WCNMP2OE5BXYEN5IUJ2NY5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--k8z/zzyoNTrEHxEA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 12:56:03PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> On 9/12/2023 6:32 PM, Richard Fitzgerald wrote:

> > +#ifdef CONFIG_PCI
> > +	/*
> > +	 * PCI does not define 0 as invalid, so pci_subsystem_set indicates
> > +	 * whether a value has been written to these fields.
> > +	 */
> > +	unsigned short pci_subsystem_vendor;
> > +	unsigned short pci_subsystem_device;
> > +	bool pci_subsystem_set;
> > +#endif /* CONFIG_PCI */
> > +
> >   	char topology_shortname[32];
> >   	struct device *dev;

> This looks bit weird to me, snd_soc_card is _generic_ struct which is not
> device specific in any way, and now you add fields for PCI, can't this
> somehow be done using drvdata or something?

You're right that it's a bit messy but if we use driver data then it
becomes specific to a particular driver and there's a goal here to share
with subfunction drivers.  I was thinking we could refactor to a union
or otherwise extend if we find other users with a similar need.

--k8z/zzyoNTrEHxEA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUBsfEACgkQJNaLcl1U
h9AY/Qf/YSKmZXsq1uAETsqoTJwyPENEXumzubfY98BLa82pFZ16eFJP991TrQI9
3Ac1oKOmelk4tkUV6dHnYCf4vipVmW7gOalV09kGgVmfUk5cRBjKvMRG/wjp7EoT
MP6EmgUT29aS0MhVvtcvKYtAL7KHIOQQdTT+r/fkcN6dCvp5w6wyexy0ZPLnLno+
2OH+3IbuQ5cJqwBbdepRBoc1Y6NNllkUz/D0IuvUZQ8UBYeOhQCJcPZk9nSIfpl/
Z9wWpq++HJhCtCS3hxygKOw9k7UETmGsMkvdDTa0ivH41Jc3R1LfCh4iXp7op+JO
nOFVux2zyeFWHGJ0JG3q1gkwfj9Lzg==
=hQRp
-----END PGP SIGNATURE-----

--k8z/zzyoNTrEHxEA--
