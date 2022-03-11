Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F6B4D6144
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 13:11:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80C4416EB;
	Fri, 11 Mar 2022 13:10:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80C4416EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647000694;
	bh=Ur93CJUxBfj4EB0p87oU3mgD4W82nvCcP2juVouRA8o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P+rDcmr21WUc34mV00sWoTV91m962dgWRxsJupN+QHJc7A32PN0uSPt2s5KmOv4EB
	 kxkCNOZ4fiXreOtPYWan/vRHyVGZOCDQ4bEedjdSrzFQ8iuFpcy5PPQo68EvJmpdDf
	 Auxalzb0Ca8di22vOyAf52E3tNTWWLNJ0GhDYum8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9214F80085;
	Fri, 11 Mar 2022 13:10:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EC46F80227; Fri, 11 Mar 2022 13:10:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06731F8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 13:10:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06731F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fhSRhbSF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2B86E61C0C;
 Fri, 11 Mar 2022 12:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0647C340E9;
 Fri, 11 Mar 2022 12:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647000617;
 bh=Ur93CJUxBfj4EB0p87oU3mgD4W82nvCcP2juVouRA8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fhSRhbSFGGBVDRb5GhaeS3hsxSz9S2mTiBu//OuD7d/NZ0/+/34aZcFiwPXUNlnL5
 qHh0Qe6VfMI+c4gPk5OR5GNZlZLl4VzX8w4MeOXTH4IS9xuxZJ9tx/Zyx3giVx2FFI
 Bol6uncnSi7Nd9v4Yuz0Y6jnLx40+xoxPr7FoYuqlKOtUH1U1kxls0m2cD6VoRKMJ9
 xKXzdh5aN67XQ2VDnej6lf41dtbOwxWTJzWI7723cv0I8Tq9Lz5IqZ64xFHStbWZbt
 xLl4j/6j5/QJdt7jCQx+qLjiJSGfTVYr+Bi/HonUnLYdJIM0uLYrtHV4VorvP/+AfR
 GgxKctHevTYNg==
Date: Fri, 11 Mar 2022 12:10:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v4 11/17] ASoC: Intel: avs: Firmware resources management
 utilities
Message-ID: <Yis8I8frENyvEbxW@sirena.org.uk>
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
 <20220309204029.89040-12-cezary.rojewski@intel.com>
 <5e47e4dd-bef1-8c3c-ba28-d651fc2dae9a@linux.intel.com>
 <7e3f87d1-d50c-63a3-9e06-c6a38d3a4cb8@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="axG43NmZqeRVZ0bZ"
Content-Disposition: inline
In-Reply-To: <7e3f87d1-d50c-63a3-9e06-c6a38d3a4cb8@intel.com>
X-Cookie: A fool and his money are soon popular.
Cc: alsa-devel@alsa-project.org, rad@semihalf.com, upstream@semihalf.com,
 harshapriya.n@intel.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 hdegoede@redhat.com, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--axG43NmZqeRVZ0bZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 10, 2022 at 06:11:31PM +0100, Cezary Rojewski wrote:

> I don't believe any of the comments provided are a strong reason for
> re-send. Given that last revisions were mostly related to addressing
> comments, rewords and explaining stuff, series is in good shape and ready
> for merge. As I already stated, team continues to work on the subject and
> there are more patch-series to come.

It'd be good to get the WARN()s fixed.

--axG43NmZqeRVZ0bZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIrPCIACgkQJNaLcl1U
h9CFfwf+L3vxs7pzPPUGU8ym+47IgeR0tTl6de5cfwsVCgl48AKfWlRPtFK67KVa
NzpIxP51zkQyurNywFFaYGbbWik6z5Onhr+HvEcTaNQRnx949Bcqu8ExOwvrZ/Ja
ViT4JRyxbBjUQXifIj/5yvFSIO/3Os48CtgEuUWqOimV7276uze/8y2ijX2hcUjj
A9WcsXTK57LXIZiVb7LUrdqR6rgrFkxl6Kspa0opK8fKIPk1v5aDF88uYa5SUEf1
HVNXR/Rz2XnowlZCOAj7TqvuZZsvKbcx5sgTzBVkPjlhtCuvRFXHIB0ZvDZvLo24
9x3Bi7MaiFrdeDYDGJ32CAzUs/EcpQ==
=/CC5
-----END PGP SIGNATURE-----

--axG43NmZqeRVZ0bZ--
