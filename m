Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D92B26DD96C
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 13:32:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB7D9EE5;
	Tue, 11 Apr 2023 13:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB7D9EE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681212760;
	bh=TBpSFkNKJhrGaLD8k2bgCR9kqm83Y4dz0tYFH8ahTUQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PYr+rDwkm1RmTVMaeizRx3oWp17mjthKVSog6rZpa7dnCwwNKK1U3TomeBAC/VTI9
	 C9XGUNMnsGSzIJO02A2bmlV3GGxZP78We/yO5Ju1ZXukWPtI3YBRkjv9nz8gfj3U27
	 0AgpLPr7MQSfF80TVa5yZAnG9F2hYyE31Hzdy1hU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4865BF8025E;
	Tue, 11 Apr 2023 13:31:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD499F8032B; Tue, 11 Apr 2023 13:31:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E51A0F80100
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 13:31:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E51A0F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Zj1at8z0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 96E106114D;
	Tue, 11 Apr 2023 11:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9F6C433D2;
	Tue, 11 Apr 2023 11:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681212692;
	bh=TBpSFkNKJhrGaLD8k2bgCR9kqm83Y4dz0tYFH8ahTUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zj1at8z0aVSVg1kFrz1ka5HxjxRZHnab7ClIEOVZeH+mGEIHSQYTtbMwSGyhHOMQf
	 jfTatbRAZW+kA8Fq5QleZY9fCSs65LCsSldxFaXCzCeWMoRSke8/+zqTOHutkVdNcq
	 4rOd6zlgnC08Z5DT9mCjqitB8AgkplLJ0MqFViQ86US95VUbkO9999hgBEZQCxBqnf
	 kgUJQMmCN8Ndd3Z9iBl+aFubAFuPw8QR+Hv50lhtBwc/Q7wymuD1Y9FuQkLVR1xHdn
	 Z9tF9xrwtUSDkoBAR3oG4+DuVIG4O+1ASz792bD42nc4G+oYfDH9cJ7V5bsl0o+r9p
	 dBe2gdIkri6oQ==
Date: Tue, 11 Apr 2023 12:31:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <13916275206@139.com>
Subject: Re: [PATCH v12] ASoC: tas2781: Add tas2781 driver
Message-ID: <d52e07bc-9a94-47f9-a24f-84b0b741a6dd@sirena.org.uk>
References: <20230409214304.23710-1-13916275206@139.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B8sPpC8G1y9JJPew"
Content-Disposition: inline
In-Reply-To: <20230409214304.23710-1-13916275206@139.com>
X-Cookie: In the war of wits, he's unarmed.
Message-ID-Hash: G6DCDRNJY5XDRQIRXT45EC4JKM7CUJPN
X-Message-ID-Hash: G6DCDRNJY5XDRQIRXT45EC4JKM7CUJPN
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 kevin-lu@ti.com, shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com, navada@ti.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G6DCDRNJY5XDRQIRXT45EC4JKM7CUJPN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--B8sPpC8G1y9JJPew
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2023 at 05:43:04AM +0800, Shenghao Ding wrote:
> Create tas2781 driver.
>=20
> Signed-off-by: Shenghao Ding <13916275206@139.com>

As previously mentioned you need to send DT binding documentation along
with any change that adds new bindings.

--B8sPpC8G1y9JJPew
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ1RQ0ACgkQJNaLcl1U
h9CpvAf/ay+LCnG2kWeY8mUSuolFKPEr2IbQz4l/KcRCPt6RzBCyB/71aDSS3oqR
Ww3etDD9Q4OZenlaoq+bnF8fSNZT+DVmZMSX3ML9DGV6X6jYxsTmG0RnK44PPmr3
dLVWstldZlkmtDgxnGsrYAzY0OdlZUxgUmcjzPD7PoMy1MVgCdZQQik2yhcgaYRg
jeizXVfQZBrgvUyHl2uU4HNtuoNlp1i8hwTw/n4nlAuLPZPx6dm5nAG85TR1KaRD
zW8Mp/ZRXuhS2Bl8RS+PlSTZk6GNAChCoLcmpSyAnnReEv2vpg4lA/x14AAvHDxw
cyHn2TivvheTlezWWXGzzidsWysw5g==
=q+hC
-----END PGP SIGNATURE-----

--B8sPpC8G1y9JJPew--
