Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8A52C2C8A
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 17:16:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82ABF16B1;
	Tue, 24 Nov 2020 17:15:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82ABF16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606234564;
	bh=D+VOLNIUYmLlf9Ah2kJxu796igckWvVd2iVepDXrEkY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ws0XR/92+0ZOwXYOzGUak+dDSYyFRqDP4nOX1zd8MZTAiqzc9Wq6O31b0XlG0oi9B
	 TxUQuJF5q4FDNTsNhmEjZDYMD5pjaR3d6YU1P8H5YP5QGex/H7Sh9qHTud41Eb3Z8u
	 +G9NEm9VuhxIj0S2bUDHA/NrDLtqagnIhD9us1co=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15515F8027C;
	Tue, 24 Nov 2020 17:14:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A62F8F8016A; Tue, 24 Nov 2020 17:14:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BB62F8015A
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 17:14:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BB62F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EDGZSf8X"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CB0B20715;
 Tue, 24 Nov 2020 16:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606234483;
 bh=D+VOLNIUYmLlf9Ah2kJxu796igckWvVd2iVepDXrEkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EDGZSf8XZ9Qs82rqrXZbGyra5u7QPfWY3EXo8+7/2sjqmFL0bxHxKgMAVdeBRgfJC
 puBEpFhkSCczfW078GQMTDXAfyQmszliZejdvcJD9A/dnMINUaCRIXV0Th22PTDD6p
 W22FNzx9rsskI7pehJIxaS1V7DesBLNal0AGYkAk=
Date: Tue, 24 Nov 2020 16:14:19 +0000
From: Mark Brown <broonie@kernel.org>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Message-ID: <20201124161419.GG4933@sirena.org.uk>
References: <d94ccf9a3c61460db88f256df1fa3240@intel.com>
 <20201120164841.GF6751@sirena.org.uk>
 <758af664b89545c5be83ca2bc81078fb@intel.com>
 <20201120180627.GI6751@sirena.org.uk>
 <c8cd5f98e7c941c1b87aaabb850ece4e@intel.com>
 <20201123173533.GL6322@sirena.org.uk>
 <41fbc38fa46f41f49b4ff846f9f7b5b2@intel.com>
 <20201124140119.GC4933@sirena.org.uk>
 <s5hsg8yrgcp.wl-tiwai@suse.de>
 <ed9b1430fdc54c2c9b49ac7a186b9c60@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="07FIeBX8hApXX6Bi"
Content-Disposition: inline
In-Reply-To: <ed9b1430fdc54c2c9b49ac7a186b9c60@intel.com>
X-Cookie: Who was that masked man?
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


--07FIeBX8hApXX6Bi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 24, 2020 at 04:07:19PM +0000, Rojewski, Cezary wrote:

> Believe removal of /sof/intel/bdw.c is in order?

Right, like I've said several times if we can remove all the other
support then we can remove the conditional code.

--07FIeBX8hApXX6Bi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+9MVoACgkQJNaLcl1U
h9CkzAf/dNRX/Q/FLkM4/n/pDbD3s9K6DgnDo9Qbc7bQ/dxyhqIOiSehQfDuAhRd
WPkZES5mOtKJ4872OkIMxyz6WlW06DlxGeoT/RcnQraTr/SGtY0Z2AEZOHgJCZUt
rJ/auorEfRMc4MQmXvC9myWeT9qc6DpszsTyGy52VpcyDtqHaISY8rQWhaSNp5DT
f6QZlaVEUMQPoxr7/Pe/qd79q1UDf4wWF5YgVF441NXNb/AgcF4P9oWC81GiTk9F
xVuSECXMfG/PIza+/Dneq4iJKjKBrLovvldp7ivO8sAZ8Bd4Sxgdi8sQvVx/NXiB
9EntSzegy7SqstsuOrSouiAe9tIaTg==
=3Egk
-----END PGP SIGNATURE-----

--07FIeBX8hApXX6Bi--
