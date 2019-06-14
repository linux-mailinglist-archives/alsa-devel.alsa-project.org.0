Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F211A462FB
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 17:35:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C91C1886;
	Fri, 14 Jun 2019 17:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C91C1886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560526558;
	bh=jpCCjR+NgZ6mmnbX8fXmHoy2riXo0QlP/wCdPMIq/Iw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=twL3z9bCIGVT9zHVt6SX32sjHepoQ/bauqrN6l2NWtRD6XY40Na3dRU+S1BhVRHQX
	 b5FVp36FG5ji9++bXJI/mw7IfC222BcGhXeLrjwRHP4OiPwZnz+V4wtJow3QRrTpH+
	 UZ1Qyd4WyS9q7UWCbwAaMvvmMSlczhDEvw6lmshs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFE99F896E0;
	Fri, 14 Jun 2019 17:34:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC6C4F896E0; Fri, 14 Jun 2019 17:34:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A15DCF80794
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 17:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A15DCF80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="klrZsteh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=33FxBZ977NQBNk2WlOtnKxomAAduLfNpQe7M0y2MoBQ=; b=klrZstehWMpQAjmjUAjVkBYvf
 xjg6GOlz996Rh2EPwNMiY3MEoc/rnkSrCelGzOtmnk3k/7II7PjN/hmwhDPzXCJJORAUYKKVO20de
 nL7n1f/Ld8A9ljW3JZuLUdXC88O1d7V6KFU8Cpjvv2jFJbEiB8Q7InjDT3RnizmEijlP0=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hboDO-0008AG-P6; Fri, 14 Jun 2019 15:34:06 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id EE64C440046; Fri, 14 Jun 2019 16:34:05 +0100 (BST)
Date: Fri, 14 Jun 2019 16:34:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190614153405.GD5316@sirena.org.uk>
References: <20190614094756.2965-1-gregkh@linuxfoundation.org>
 <20190614094756.2965-5-gregkh@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20190614094756.2965-5-gregkh@linuxfoundation.org>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH 5/5] sound: soc: core: no need to check
 return value of debugfs_create functions
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
Content-Type: multipart/mixed; boundary="===============0326700869374457899=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0326700869374457899==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YgGp9RfepglW4nsE"
Content-Disposition: inline


--YgGp9RfepglW4nsE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 14, 2019 at 11:47:56AM +0200, Greg Kroah-Hartman wrote:

> Note, the soc-pcm "state" file has now moved to a subdirectory, as it is
> only a good idea to save the dentries for debugfs directories, not
> individual files, as the individual file debugfs functions are changing
> to not return a dentry.

It'd be better to split this out into a separate change for ease of
review.

> -	d = debugfs_create_file(w->name, 0444,
> -				dapm->debugfs_dapm, w,
> -				&dapm_widget_power_fops);
> -	if (!d)
> -		dev_warn(w->dapm->dev,
> -			"ASoC: Failed to create %s debugfs file\n",
> -			w->name);
> +	debugfs_create_file(w->name, 0444, dapm->debugfs_dapm, w,
> +			    &dapm_widget_power_fops);

The majority of this is removing error prints rather than code that
actively does something different.  If this was like kmalloc() where the
API is itself reported errors then this wouldn't be an issue but unless
I'm missing something debugfs fails silently so this means that if
something goes wrong it's going to be harder for the user to figure out
where the debugfs files they wanted to check went to.  I'm guessing you
don't want to add error prints in debugfs itself so I'd rather they
stayed here.

Yes, the error check is looking for NULL not an error pointer - it was
correct when written but I see that the debugfs API changed earlier this
year to return error pointers so we ought to fix that up.

--YgGp9RfepglW4nsE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0DvmkACgkQJNaLcl1U
h9C10Af/WWWQ0hXp7Kjf67OffaL0vmLFaq46sMjEYEyBCtiv7o+GusnMCNhRIlEG
4+tQgsu7wbGxclJaerAzGCzlaBAvjS9yCYbqrFZJzSETGZ0VaKjrw7MlepYUPB94
CBkKwCHoFTQpRm/b36BJd8hV5o8uhTlsf/gpbUFXJjPjH/20UWVCmi7Gonh8rTBU
L1It2817gidMIhiFg4Hc86WUGGK+JGM3ekyTvXd5zQix9tx1fmsiqmJs9Pr9s09F
HEnX9c4xmQLVtXNQOgD72KI7zCIrcAsTtcZd09rl+qOIN1DzCuEDemtqKN2/r8c6
7IQIKP/GluG2A/b9VhRgrXb41zS3Cw==
=ATS+
-----END PGP SIGNATURE-----

--YgGp9RfepglW4nsE--

--===============0326700869374457899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0326700869374457899==--
