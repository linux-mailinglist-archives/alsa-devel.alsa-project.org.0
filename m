Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EBC28B4C1
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 14:41:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39B21168D;
	Mon, 12 Oct 2020 14:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39B21168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602506463;
	bh=Bf+vtpDdcfJ69XbfAgLrDZJ4ggp7ghaPR3BJ3QNNLgM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ncVObSjBu2NikW6AcMWHBpDX0qcbvTdC8Qyf0DWrDI1a3xa/ibnjCLjEKIzfUVvhn
	 c7VGLCdWPlC7A2jBpdWCugM2AaoIPgo0hRGPsidDmRAc9a2+u9Cinb3tuN5RbFTksW
	 tF/xlKJvK3WidmooXIj66wgm9/YA+U/zKhvTVN04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90CF8F8021D;
	Mon, 12 Oct 2020 14:39:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0725FF80217; Mon, 12 Oct 2020 14:39:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A12EBF800F6
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 14:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A12EBF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CoC8lM2Y"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 762DA2076E;
 Mon, 12 Oct 2020 12:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602506352;
 bh=Bf+vtpDdcfJ69XbfAgLrDZJ4ggp7ghaPR3BJ3QNNLgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CoC8lM2YGEYzTrlKT3qU+CIoCc316Q7nCBW2+bawIpuHAgSg2lb1a20H7XByQIhYv
 Pdeh+MopUD+Pd9MzJs0jGKEnVZ4QKITN00gomrd1gghYjTreunU/gCMZVmR1Z3AMG0
 accQbOXqjrawvUf1MOznswRQu8FTgFHtEB5tgSKw=
Date: Mon, 12 Oct 2020 13:39:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 00/13] ASoC: Intel: Remove obsolete solutions and
 components
Message-ID: <20201012123907.GB4332@sirena.org.uk>
References: <20201006064907.16277-1-cezary.rojewski@intel.com>
 <cf1fb47d-412f-48fd-4501-e63f1db32bc1@redhat.com>
 <s5ha6wrretr.wl-tiwai@suse.de>
 <20201012113626.GA4332@sirena.org.uk>
 <bda70fe7-ac16-8215-5506-c4144064bcfd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline
In-Reply-To: <bda70fe7-ac16-8215-5506-c4144064bcfd@redhat.com>
X-Cookie: Fremen add life to spice!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, filip.proborszcz@intel.com,
 krzysztof.hejmowski@intel.com, filip.kaczmarski@intel.com,
 Takashi Iwai <tiwai@suse.de>, lgirdwood@gmail.com, ppapierkowski@habana.ai,
 marcin.barlik@intel.com, zwisler@google.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, harshapriya.n@intel.com,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com, tiwai@suse.com,
 andriy.shevchenko@linux.intel.com, cujomalainey@chromium.org,
 vamshi.krishna.gopal@intel.com
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


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 12, 2020 at 01:53:54PM +0200, Hans de Goede wrote:

> My ASoC interest is 99% Intel Bay Trail / Cherry Trail support, so
> I'm not on alsa-devel list since that gets a lot more then just that.

> IOW I'm relying on being Cc-ed, which might not be the best tactic
> I guess.

Might be sensible to add you to the reviwers for at least the machine
driver so you're more likely to get copied on things?

> Anyways, the Bay Trail / Cherry Trail changes here are 100% ok with me.
> I pointed out the Haswell / Broadwell bits since I was taking a look
> anyways, I don't really have a strong opinion on those, I've never seen
> a  Haswell / Broadwell machine actually using the SST/ASoC code,
> all those which I have seen use the HDA driver.

OK, that's good.

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+ETmoACgkQJNaLcl1U
h9CWKQf/evTaam+fWAKF5Y+ydIcxmGyUZjoCs9c3pyD1dDrowF4MCJAIA4LWsvQt
IrzHlocIXUPK5UYijGI4rCfJpW/l8JxnF5IaDFNzS0eZzlpxiVx5W/HzW3ySMWg7
3ClBjLkAJf2Sl7GEEqSrqZBfrfCTpiuNjoaM3O190XuzuCHNKArbFbyPUu8bQnoS
/dHgnbPC+fuHIelCn966WBQmcE/F+L+37txgxoThLEO1kO3+2mPopyp4PuTm+FUe
J+vBxMuGEg/1QCM7OnRgeaUQkjpX9mp3/PzpeGWvnDOPe4BOKEiHq5u4EPZ8Rw+/
Uy9TOCbqSyNji2z28Q2z09rznBUWXg==
=aJCL
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
