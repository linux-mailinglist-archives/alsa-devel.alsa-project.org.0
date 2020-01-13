Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D9713AB03
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:28:02 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D410721BF;
	Mon, 13 Jan 2020 16:54:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D410721BF
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B77FF801EB;
	Mon, 13 Jan 2020 16:53:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B5E6F801EB; Mon, 13 Jan 2020 16:53:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 090C4F800B9
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 16:53:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 090C4F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="YHz+pZ1l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aEQXcauEtwtBTMlxbZX7udfUWpI37znKKr88yDEAqxQ=; b=YHz+pZ1lLirdpU1tTN1eAEZ2r
 IKMucJkzS5KpRS42TeZub17Go3/m4+Xkn5fk9nhWtKp4qqjQyjd1r3LaIiKeX6KJXflCOXbC1xFzR
 tmuyU8lo7BM7sfjZHKTJFEx0qmxLii1sMLT3GN3YFn9kxPMQCfVmki8F+sTgc5FHcSKYk=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ir221-0003bw-8n; Mon, 13 Jan 2020 15:53:33 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id A2941D01965; Mon, 13 Jan 2020 15:53:32 +0000 (GMT)
Date: Mon, 13 Jan 2020 15:53:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Jeff Chang <richtek.jeff.chang@gmail.com>
Message-ID: <20200113155332.GO3897@sirena.org.uk>
References: <1578644496-16575-1-git-send-email-richtek.jeff.chang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1578644496-16575-1-git-send-email-richtek.jeff.chang@gmail.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, jeff_chang@richtek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v5] ASoC: Add MediaTek MT6660 Speaker Amp
	Driver
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
Content-Type: multipart/mixed; boundary="===============7422197128449167042=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7422197128449167042==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/TUrtqMIkCP4YtJm"
Content-Disposition: inline


--/TUrtqMIkCP4YtJm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 10, 2020 at 04:21:36PM +0800, Jeff Chang wrote:

> +	- rt,init_setting_num : The initial register setting element number.
> +
> +	- rt,init_setting_addr : the addreses array for INIT Setting table.
> +
> +	- rt,init_setting_mask : the mask array for INIT Setting table.
> +
> +	- rt,init_setting_val : the value array for INIT Setting table.

I'm not 100% clear what this is indended to be used for but given
that it's just raw register writes it's hard to see how it can be
used well in a general driver - it basically means we have no
idea how the chip might be configured in any given system which
*might* be fine but it could break some assumption the driver
makes about the state of the system on some particular OS or
version.  If there are some system specific tuning parameters
that need to be set as raw values it would be safer to do that by
just including the data in DT (eg, "X bytes of data to be written
starting at register Y to tune component Z" type stuff) or by
exposing individual parameters for things that are documentable.
Allowing a completely unconstrained sequence of register writes
doesn't seem like a good idea.

If possible it might be best to send a version of the driver that
doesn't let this stuff be configured at all then a patch on top
of that which configures all this stuff, the rest of the driver
looks good now.

--/TUrtqMIkCP4YtJm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4cknsACgkQJNaLcl1U
h9BTeAf8C55cmcfxY+HHqvC1iVVcYfUzf1wTdh3zed7cpd624wm6yrjvr2UzzcR4
t/LEvnTIeZTPFvorQNMaZLDM5KWU8YWrll6SM6deiXo2dv5uAFzs2XGY+eRvTnN3
HjcX+dnQlvd7ZCekd/b7M03IhNGIx5VY3QDDhbDTDrHA26wpil5GT3seJhV0yXsM
w1+ITl4WshJ1kDwE8+jIBG5j7FfR/4ig3ZDb2iP2frIKn7r12AJDlQXfM/pf3vpm
IXFs+JX8tyuHEU35AyG1vMOoReF0/UDGvgKI0m0hiV7E9W37FHfB+bJS64sSmnTv
4EUo2bTKPCiJv7BxPJVngMSK1D+qeA==
=xYed
-----END PGP SIGNATURE-----

--/TUrtqMIkCP4YtJm--

--===============7422197128449167042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7422197128449167042==--
