Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB151F4378
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 19:53:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A519B1671;
	Tue,  9 Jun 2020 19:53:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A519B1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591725233;
	bh=TgO873VK1uWIKP3ppDJ9nGZ4WoqU168LVpBfn9JCTYE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vH/W7/oQ1A2BDLzio9IEQOOasS98AWKCWF10WTqe6LiY3dM/pkA4DTivbRpBpPjVn
	 Nd8eh5mv9W4IAdAG9iTkIxM8PwT4vpM/9THWiqJXSobFHMzK6BRMkwMmcqK13T6AIi
	 z+sK1wF9Jwwn3dg9goelCp3PrWoTg+A6GWqC/H20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3DCAF80088;
	Tue,  9 Jun 2020 19:52:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34277F8028C; Tue,  9 Jun 2020 19:52:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61859F80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 19:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61859F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="flY6tw4s"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F3D05207C3;
 Tue,  9 Jun 2020 17:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591725125;
 bh=TgO873VK1uWIKP3ppDJ9nGZ4WoqU168LVpBfn9JCTYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=flY6tw4scXwcHAh5ndeODhVjKU39UiDaLUXkNgJF/VeacAKgTqHUSgyi7yWttmL2C
 dM9+M9jBx7AUtHP71uzwM8FS45GEfL+rpx7XhyaPu/XscJ137rzdA/NcQT7giIjpj6
 csJPNwgawxwvmK6IpC14ubbfssZ6sBrSNQmrMXks=
Date: Tue, 9 Jun 2020 18:52:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC PATCH 0/2] TAS2563 DSP Firmware Loader
Message-ID: <20200609175203.GP4583@sirena.org.uk>
References: <20200609172841.22541-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uQ3BaAlxDi9XKvis"
Content-Disposition: inline
In-Reply-To: <20200609172841.22541-1-dmurphy@ti.com>
X-Cookie: Be careful!  Is it classified?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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


--uQ3BaAlxDi9XKvis
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 09, 2020 at 12:28:39PM -0500, Dan Murphy wrote:

> These programs and configurations are selectable via files under the I2C dev
> node.  There may be a better way to select this through ALSA controls but I was
> unable to find a good example of this.  This is why this is an RFC patchset.

I think you can just use enums for most of this - what you want to do I
think is parse the firmware, build templates for the controls and then
add them with snd_soc_add_component_controls().  Userspace *should* cope
with controls being hotplugged.

--uQ3BaAlxDi9XKvis
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7fzEIACgkQJNaLcl1U
h9Bd3Qf+M45/dHXuPejpoJQrP/PmR/7OYTmNoSJSL7fxpGkoxNV4A5VdPFEM7ZmP
rfspDqlxdJ9jDVZhCyTaRzlFP9VaklY/9EFupR5qc6ms6ZKdjYrcjWc98Cqlk+d1
RAN0Y4oxlqfxAZZKlw6ZHFLCMBHdV/vkOBGNZdiiaBqAFprXUVnqlevuGW8Lv7s3
yDf1Te02bvervNfinPb53nj6QtFoBwixBR8E8zdKINv1ZP8q31YF7c8j/0tvyMkQ
LZ6OhieBzZeb4YFR7/sieJVpr60qnUKefrtUaPWaJLrFtPb8vuuPmVK+jO4AQ4gF
5WqFDT0NEUZuTrTzITUHxyZZkRbq9Q==
=8iWz
-----END PGP SIGNATURE-----

--uQ3BaAlxDi9XKvis--
