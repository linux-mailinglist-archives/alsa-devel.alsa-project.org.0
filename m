Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B46554A757E
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 17:09:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 220B71723;
	Wed,  2 Feb 2022 17:08:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 220B71723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643818177;
	bh=Taw8anlxrAi1vv/lJm/+dkTIciBenQIReP9yg67eSR4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ilk5RxDN2+LrbDoh9dKBkroWei0YG1hh0kCv/+9FHqKCNd3SBiAL56XaTjL92slbc
	 IgMP+1Q4BfY3BMRyvz8qMmgWECp6wDZD76SkcJu/Rqdk/6lH/4sTuxc9BWfDrPeVdY
	 zqnWlv2d9VAuQsW5eLZY54rJBBtOzBtTCbCPFGI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EC84F80095;
	Wed,  2 Feb 2022 17:08:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CD8BF804B0; Wed,  2 Feb 2022 17:08:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_35,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCBFCF80095
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 17:08:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCBFCF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X0sZPB9X"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C539161657;
 Wed,  2 Feb 2022 16:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64608C004E1;
 Wed,  2 Feb 2022 16:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643818100;
 bh=Taw8anlxrAi1vv/lJm/+dkTIciBenQIReP9yg67eSR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X0sZPB9XEU6WyY0Uf6zMJjdTt7QpVhtr/ZKbZZF5A0YvON8m5nhR/lTo1KBsh8nHW
 YTJgaH4RXQLm00/GTlPUaWudFymdL1dsUbNHGr/rdMuJcEtQ8HJOr5ToV40Rj6arbA
 v2N4WUPyGfhKRAA0+zUCjoGwX6rS55vV3B9TZmQNq1Qg4PVLzd2hOLxEPcWaJkBJT0
 y8cCerjfN8aDo8xAsO+5Kpzeb4zo0PvbOVD5B89nB4jFa0lnnU6CLTF2QyzOOvoRpj
 gIGQqFJSR5ZNPztKco0DsKeeB/ftXKjcPcX/d2j8EDLaCRGjJJMTTtsTGD27aNAcE5
 MblGqqB0Up8hQ==
Date: Wed, 2 Feb 2022 16:08:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [RFC 00/37] ASoC: Intel: AVS - Audio DSP for cAVS
Message-ID: <YfqsbnroVj8ln66g@sirena.org.uk>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
 <YcXFwTmP6k1Zfbw9@sirena.org.uk>
 <fecf5a0a-c2b6-f4a0-b4b1-d8243ea324a0@intel.com>
 <YfQhIoXTkzO9AEQc@sirena.org.uk>
 <ccb2f9f0-e9fa-3215-f623-bac58b4c9633@intel.com>
 <7695fc34-143d-7715-85cb-7790386bbacc@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="F0ZgYQbfFSwtQZG8"
Content-Disposition: inline
In-Reply-To: <7695fc34-143d-7715-85cb-7790386bbacc@linux.intel.com>
X-Cookie: Quack!
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, peter.ujfalusi@linux.intel.com, rad@semihalf.com,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 hdegoede@redhat.com, ranjani.sridharan@linux.intel.com, tiwai@suse.com,
 yung-chuan.liao@linux.intel.com, cujomalainey@chromium.org, lma@semihalf.com
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


--F0ZgYQbfFSwtQZG8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 02, 2022 at 02:26:01PM +0100, Amadeusz S=C5=82awi=C5=84ski wrot=
e:

> Although Cezary wrote that avs_path_reset/_pause/_run maps nicely to trig=
ger
> operation it's not direct mapping. AVS FW has requirements on order of
> operations on pipelines (which are grouped in paths on kernel side). For
> example on TRIGGER_STOP we need to first pause all pipelines before issui=
ng
> reset to any of them. This is required by FW, so that if there are two
> pipelines it doesn't pause and reset one of them, while the other one is
> still in running state, as this causes xruns on FW side.

=2E..

> I would say that such behavior doesn't translate nicely to generic API.

This doesn't sound particularly strange, it's not a million miles away
=66rom the requirements we have from hardware around keeping clocks alive.

> I tried looking once again at how one would split the path concept to make
> it more generic, but it is hard. On one hand paths are tied to AVS driver
> topology design, on the other hand we have (mentioned above) FW
> requirements.

Please understand that it is incredibly common for people to belive that
their system is somehow unique and needs to special case things that on
further examination turn out to be perfectly reasonable to handle in a
generic fashion.  Sometimes it's simply a case of just needing to do the
work, sometimes small enhancements are needed to the generic framework
and sometimes it's a case of refactoring the code so that some bits land
in generic code and some bits land in the driver.  Especially with
enormous amounts of code like you've got here there's a natural bias
towards wanting to make minimal changes.

> now for the concept of paths the most interesting field is
> "path_tmpl2_path0_ppl0_bindid0_tuples" as it describes to which path we w=
ant
> to bind. It is done this way as FW modules internally have pins, and while
> in most cases one wants to just bind on pin 0, sometimes there is a need =
to
> describe more complicated connections. And so we circled back to FW
> requirements.

The idea of an algorithm having multiple inputs or outputs seems logical
and generic - the examples that spring to mind are things like mixers,
beam forming or echo/noise cancellation.  These seem like they're going
to be present in a wide range of DSP firmwares.

--F0ZgYQbfFSwtQZG8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmH6rG0ACgkQJNaLcl1U
h9AYpAf+LKUtq6Nz9doB1KbkhHzC6SdPoVca8r2eqXkL73rD2qj39Aie3XVs3PKn
3TayzOqoxYv5ZMzI7uGTD5ZSUY6xn7YU2evErH8vQ5K4lChi6+PVfNGGz+oC6uPj
x8MqvwuTaJAC5W/D9jJT9RooDv6TiZlIGeo3C1DLRm5jEbS2T+hJbsoDzj2mPlOh
15do/Q5hir4OUy+BHjXHh0USjMVo5AW6w59p9pDpCYzLCqXU69rsXzbxKy/JuIra
ofozXd8tOO2BChf5Yc0Rj1NNHkyvePTTeD5X+4sFZGZ25AndDULgEneTRdEjqHTy
Ay3g2CtA8OZMQOV8HWVjAAoa1QoxwQ==
=WZ8C
-----END PGP SIGNATURE-----

--F0ZgYQbfFSwtQZG8--
