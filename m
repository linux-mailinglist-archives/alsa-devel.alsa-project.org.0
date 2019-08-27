Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFB6A1E7C
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:10:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AC3716A3;
	Thu, 29 Aug 2019 17:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AC3716A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567091411;
	bh=D+IInPlJC2Ka7jQu2a3heQffdAtM4/IB1OdenIOkvQs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TMvjC5BdHGfgsSRxOjadX9PetA0CN3k6haH5I9eCJa1hljE6n/E/ibMuHLciU2u1+
	 GPq8lOfcIzWdr0jKuIh2JWMPPqKG+HilhSrtRdbGQawVFS/DsYPRqBuMsRCmcfE4jR
	 bCwfGPt10WN+cpwiYJXCxgK5mLvTTEz9Ki/zG3n8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FCD8F805F7;
	Tue, 27 Aug 2019 21:06:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64EADF805FD; Tue, 27 Aug 2019 21:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71C92F805F7
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 21:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71C92F805F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="PK+PEDKV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e57hFiONOj8fdoHfWVz9fzmZOay9ir/J3FboWr52mpM=; b=PK+PEDKVquDnMDi9x6cdQwZay
 Xf9AODaysqjluX7/BjEDcJRC89n/ApBedQw+nSSSVWd3Wn3hw4/hFU0VFyETmk4F+SFcbXWY46aTH
 c3hnlPGuhUHOQMHOfjUFpliqtFKYkmKHz692sMMM+tE/SiRkqvzn/CW0ZexPzVcyhcr6U=;
Received: from 188.28.18.107.threembb.co.uk ([188.28.18.107]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i2gnB-00011N-HK; Tue, 27 Aug 2019 19:06:09 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 3F5ECD02CE6; Tue, 27 Aug 2019 20:06:08 +0100 (BST)
Date: Tue, 27 Aug 2019 20:06:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190827190608.GL23391@sirena.co.uk>
References: <20190823102652.GM23391@sirena.co.uk>
 <c845fda4-c18d-2ca8-7337-6e6af74d239c@intel.com>
 <70222fac-8c4e-5ceb-3c49-7020196b59df@linux.intel.com>
 <2e2a34b8-2451-01f6-79a1-14f06d1ed059@intel.com>
 <9dfd3a96-f286-34d6-fe57-9b6b8740e424@linux.intel.com>
 <20190823213920.GW23391@sirena.co.uk>
 <57196fe6-9291-5518-9fb6-731b9b5c27ed@intel.com>
 <ab5f0c6a-8d16-0848-1ca7-96286334a9bc@intel.com>
 <330b6be6-21c2-2eb8-9959-7d494841b3d6@linux.intel.com>
 <15484165-d751-b60e-f703-de7c1fa1ad17@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <15484165-d751-b60e-f703-de7c1fa1ad17@linux.intel.com>
X-Cookie: Don't SANFORIZE me!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 "Kaczmarski, Filip" <filip.kaczmarski@intel.com>, tiwai@suse.com,
 lgirdwood@gmail.com, "Wasko, Michal" <michal.wasko@linux.intel.com>, "Wasko,
 Michal" <michal.wasko@intel.com>
Subject: Re: [alsa-devel] [PATCH 00/35] ASoC: Intel: Clenaup SST
 initialization
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
Content-Type: multipart/mixed; boundary="===============5162278177974028986=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5162278177974028986==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="slMCvwAS3D50yFKj"
Content-Disposition: inline


--slMCvwAS3D50yFKj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 26, 2019 at 11:51:32AM -0500, Pierre-Louis Bossart wrote:
> On 8/26/19 2:24 AM, Wasko, Michal wrote:

> > If the driver and FW update will be within the same kernel release then
> > IMHO
> > there should be no compatibility problem between those two components,
> > right?
> > This way kernel users willing to stick to old FW can stay on older
> > kernel version while
> > others can update and receive all the latest FW functionality that was
> > developed and enabled.

> I am not comfortable with precluding a kernel update because of a single
> firmware file. There are all sort of reasons for updating a kernel,
> security, sideband attacks and Android CDD compatibility being the most
> obvious ones.

Right, this is the whole ABI guarantee thing - we'd need an
incredibly strong reason to require a change in firmware for
upgrade of existing systems.


--slMCvwAS3D50yFKj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1lfx8ACgkQJNaLcl1U
h9CmSwf+MXgCTE4M7RFgm2V+02N5WY3CWVmmd838zI+RJ3su1MO/BcncRz0SM+xn
cHxr+rkye+BlBeGw/Md4pomLOojlQx9O0ds/fbP7JZreNxrIP6IoIyiNNb0g42Tw
yH4/UZFazTrVTzdiq6fXMJff7+UDN/CObGxCCG7v+MN0Gac7hiwCZlx6Za/uEl0k
CQ+KraB+kk5h3Hk8WR490IAU+naYcgc/vKGbabJRj9vLfqf0wuCNVG6pgwgmWyyU
NvWvmb39ZXqPMAAf+90qfxnXhmxQaSy6GgMCZT2RNhIDsEhwcjUtE7Ujxv7G3Sxm
dxZLPVLjc9EvoXYzuet4PKNFZtqV+A==
=swm3
-----END PGP SIGNATURE-----

--slMCvwAS3D50yFKj--

--===============5162278177974028986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5162278177974028986==--
