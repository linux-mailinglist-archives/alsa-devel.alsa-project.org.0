Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC8B2BB0EE
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:50:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C85017B8;
	Fri, 20 Nov 2020 17:49:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C85017B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605891041;
	bh=0QsL6dl2tb2xv6pFSblcn/OMOr8ebKPJNnHN0KNHn2w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mAVBlkpj7wIlrNr/bW676gN+Oclxh8zxG2UK5He6GOSfHPf/goLnqr9xEnOq8+FkX
	 /0XHwdIXiY6fy75gz2BbADGYEwIINqDZ5DSxrJqdqt3DNIDTC3Qn/aH3m34S8DCLtI
	 rASZ2xC3ji8d34v0TYDTc1PKhgVND+7+TBU9fD5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 772F2F8016D;
	Fri, 20 Nov 2020 17:49:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73CC6F8016C; Fri, 20 Nov 2020 17:49:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EF71F800C5
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:49:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EF71F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pCOo329y"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 17B18206FB;
 Fri, 20 Nov 2020 16:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605890942;
 bh=0QsL6dl2tb2xv6pFSblcn/OMOr8ebKPJNnHN0KNHn2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pCOo329yVnMBWXd9XWNSp6ve0GEEoHoGIZGvIv6m02ulMy/qfVjihATs0nUbBWamR
 plifH4oekeCVPhBC7safZJB5ImOZDIVFywtsRLtqFjE45wENz6r6HRs3aHbOGemktg
 NPoRK2s0ZpRF9Kyx5N23Mv1drqDu7tiSBK0qOeSE=
Date: Fri, 20 Nov 2020 16:48:41 +0000
From: Mark Brown <broonie@kernel.org>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Message-ID: <20201120164841.GF6751@sirena.org.uk>
References: <20201113164946.GD4828@sirena.org.uk>
 <2cf7075b-bd51-21a5-2058-3a98e6c488a7@redhat.com>
 <d462c890495e4dda8698b5ba5eb50066@intel.com>
 <f62abcd8-b67f-774b-61b5-e08cfc3d2cc7@linux.intel.com>
 <s5h1rgst6z4.wl-tiwai@suse.de>
 <0286c6975f24432082f609d45adaa14c@intel.com>
 <0badb36f-3089-dc34-f7b0-75a73b856f0d@linux.intel.com>
 <d57fa3716a974eb9ba585ddd85dbe14c@intel.com>
 <cd8e5c2f-e1c2-7fbb-bee1-cc76ec14a801@linux.intel.com>
 <d94ccf9a3c61460db88f256df1fa3240@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WkfBGePaEyrk4zXB"
Content-Disposition: inline
In-Reply-To: <d94ccf9a3c61460db88f256df1fa3240@intel.com>
X-Cookie: Have at you!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--WkfBGePaEyrk4zXB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 03:40:21PM +0000, Rojewski, Cezary wrote:
> On 2020-11-18 9:25 PM, Pierre-Louis Bossart wrote:

> > It helps everyone to have a single build, e.g. 'make allmodconfig' or=
=20
> > 'make allyesconfig' would select all possible drivers and bots can run=
=20
> > wild.

> Why should bots care about not recommended code?
> I'm against adding external dependency (intel-dsp-config) for
> catpt for reasons I'd mentioned several times already.

People care about any code that's in the kernel, especially people doing
anything treewide.  The fewer configurations people need to build to get
code coverage the better.

--WkfBGePaEyrk4zXB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+382gACgkQJNaLcl1U
h9CJ8Af/bAfhRTD8dNva3ttcVjxvBZwKu9q92QisWaPbAVr4L76J7qOPTA4KYL9d
7NFZe7sMtshM9TyOnnOsLb/zj3wt+I+TAODaN4i2tHOu6vdX99a6RiPMakb8hKKB
FvHL7UquD3ksaeX3Dz1HBWbzJmOovCpb2uV3Yi9yzXcd2StlLqM+9KHwLF0ycDAX
kJpxNd2bQizwgsKs2rth7CloZC+K4oXXVr8PETWDu/YwGkCGtMEjDshA6VQHLct6
BAuEZ3qzFjyA3mY37qVzaBBlbYXOcSFKzG23GocdjeqK2Uap3XWgo1+5XfZfQvd6
8Z4M6Kt0zJrBG0r6CnNSbs8FqOsMpw==
=74Wu
-----END PGP SIGNATURE-----

--WkfBGePaEyrk4zXB--
