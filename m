Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A80E0877
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 18:15:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8438F1671;
	Tue, 22 Oct 2019 18:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8438F1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571760933;
	bh=5vsbvO7Go/WY9wTuLPXz10e7M/aKOgeFEZN3Cf80T4g=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HNXBJGeBbFLG5UwjN7YW+Vqql4JXf8fWzv5K60miXsJIY7Hkg7xc2XnJgSBrlRDqR
	 +d3y8s+1zibud4btN78mJvcA3D5qYLQSJs6OmhDvHQgBwOMZuXk996q4UySh+cLxv7
	 EWk9WVLbZj6KoVYJ3aMgAB3VwoXjIn9QB1xOV/4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC67EF8031A;
	Tue, 22 Oct 2019 18:13:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C5E5F80112; Tue, 22 Oct 2019 18:13:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49D28F80112
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 18:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49D28F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="a/W28z+r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+/SeYBBx64JSiXqXfWGg6z2kixmz+ucqMqSDUCYYwkM=; b=a/W28z+rHPJtzprT1VrJ1Syjb
 moPXyYkGs2Vo26oW3nRZDWzyNanmdHxecN2jADysWE5VlRX4zbdFjtqbKaQvYG4s4x+nt0DH5rrLT
 Y/jzTv49U7dfyDU1TNdp9fzkRGjE/S2n1PmZ6B8VAEG5+1tCnwmYwy6NOCaUSPq6fPmcE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMwn1-0006zT-9V; Tue, 22 Oct 2019 16:13:43 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 25EF72743259; Tue, 22 Oct 2019 17:13:42 +0100 (BST)
Date: Tue, 22 Oct 2019 17:13:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@chromium.org>
Message-ID: <20191022161342.GI5554@sirena.co.uk>
References: <20191018200449.141123-1-cujomalainey@chromium.org>
 <20191018200449.141123-3-cujomalainey@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20191018200449.141123-3-cujomalainey@chromium.org>
X-Cookie: Whip it, whip it good!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Zhang <benzh@chromium.org>, Bard Liao <bardliao@realtek.com>
Subject: Re: [alsa-devel] [PATCH v2 02/12] ASoC: rt5677: Load firmware via
 SPI using delayed work
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
Content-Type: multipart/mixed; boundary="===============6513040044937344084=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6513040044937344084==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GBuTPvBEOL0MYPgd"
Content-Disposition: inline


--GBuTPvBEOL0MYPgd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 18, 2019 at 01:04:39PM -0700, Curtis Malainey wrote:

> When 'DSP VAD Switch' is turned on, rt5677_set_vad_source()
> enables the following digital path:

> DMIC L1 ->
> Mono DMIC L Mux ->
> Mono ADC2 L Mux ->
> Mono ADC MIXL ->
> VAD ADC Mux ->
> IB01 Mux

This still looks like something I'd expect to be configured by userspace
rather than hard coded in the driver, what happens on a system where
someone wants to do voice detection on another DMIC?

--GBuTPvBEOL0MYPgd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2vKrUACgkQJNaLcl1U
h9BRqQf+KrQkIkU/pRHXiwI2cW+3AJKCrleH6yL6IdLkZW3c77d+6vOvjHM3GE3A
msSiczG5nsUQ4B7Oj07PCPveXt9iQFOxc7ourVsaZIjAwRiTisamgVNZ2SE56Mac
VzJTI82VRhGnBJcwkLrkdAZXsXJknEaZ9QIv+sYmkfWw5p4zJCrS+f9NmuBihGfo
MQpae3JHUPsvdlF2FZbkrTjP3rNrmtKHniO8A9PsPE2sjQBeGBbXs+RG1Jb8eXOC
w/QBknQtDMxVJAtUIKoq5BWaOxNvrvPce/5SzhuUdoi98TmVWjhbn3sXrAb66x04
nCg0xVjnJU+Mmsp7ZtiAECMSnDxDiQ==
=DdGc
-----END PGP SIGNATURE-----

--GBuTPvBEOL0MYPgd--

--===============6513040044937344084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6513040044937344084==--
