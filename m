Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5797446254
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 17:16:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDE1A187C;
	Fri, 14 Jun 2019 17:15:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDE1A187C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560525363;
	bh=AQEVP7GI61b9aYlKSDV7CrwvqKnNZn/BTrX7rvdqGJE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g+et+RbPS0nDIFrmMcI0mSU7weGSI7Me420KoyZtP4UhW0fSXl7JHwWhYbebio0Bp
	 +1UaSnQfVKsIGVt6Ea9UWb5hfJAFntTb+Dnu3+ZEb4bkEcX7OkllCpqZ8KqfFs+3t9
	 nP7g+UmmbF6YG6d/DZupETIcXreGZMqgFl6DJPdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1482FF896CE;
	Fri, 14 Jun 2019 17:14:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A30B6F896E0; Fri, 14 Jun 2019 17:14:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E762DF80794
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 17:14:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E762DF80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="iTcxj+03"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cnHYTs0qYOr5SdxhGgAtNxW6ZBcoqI73V16utFglSIY=; b=iTcxj+03ycIRbEeFlyjBbJMvB
 NxYKrkdh8aKoah7zYtrlN2WMOg3haDY02+WjpxKm4axix+KKNgVy/xtZvSt4HVNYduqAa0wcEDZw7
 U6HfhidAiosKBnt3ap0Nz3A0rTcPP7nkmX86qHsI3HKV9bYXn5b4aVnVXhkIzNAeLEnac=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbnu7-00087T-6t; Fri, 14 Jun 2019 15:14:11 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 9B663440046; Fri, 14 Jun 2019 16:14:10 +0100 (BST)
Date: Fri, 14 Jun 2019 16:14:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190614151410.GC5316@sirena.org.uk>
References: <20190614094756.2965-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20190614094756.2965-1-gregkh@linuxfoundation.org>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/5] sound: SoC: sof: no need to check
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
Content-Type: multipart/mixed; boundary="===============4730397191691594013=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4730397191691594013==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X2rN3GNvz+yeh2G1"
Content-Disposition: inline


--X2rN3GNvz+yeh2G1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 11:47:52AM +0200, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.

> +++ b/sound/soc/sof/debug.c
> @@ -77,8 +77,7 @@ static ssize_t sof_dfsentry_read(struct file *file, cha=
r __user *buffer,
>  		if (!pm_runtime_active(sdev->dev) &&
>  		    dfse->access_type =3D=3D SOF_DEBUGFS_ACCESS_D0_ONLY) {
>  			dev_err(sdev->dev,
> -				"error: debugfs entry %s cannot be read in DSP D3\n",
> -				dfse->dfsentry->d_name.name);
> +				"error: debugfs entry cannot be read in DSP D3\n");
>  			kfree(buf);
>  			return -EINVAL;
>  		}

This appears to be an unrelated change with no description in the
changelog, please split it out into a separate change with a description
of the change.

> @@ -119,13 +119,8 @@ static int trace_debugfs_create(struct snd_sof_dev *=
sdev)
>  	dfse->size =3D sdev->dmatb.bytes;
>  	dfse->sdev =3D sdev;
> =20
> -	dfse->dfsentry =3D debugfs_create_file("trace", 0444, sdev->debugfs_roo=
t,
> -					     dfse, &sof_dfs_trace_fops);
> -	if (!dfse->dfsentry) {
> -		/* can't rely on debugfs, only log error and keep going */
> -		dev_err(sdev->dev,
> -			"error: cannot create debugfs entry for trace\n");
> -	}
> +	debugfs_create_file("trace", 0444, sdev->debugfs_root, dfse,
> +			    &sof_dfs_trace_fops);

I might be missing something but I can't see any error logging in
debugfs_create_file() so this isn't equivalent (though the current code
is broken, it should be using IS_ERR()).  Logging creation failures is
helpful to developers trying to figure out what happened to the trace
files they're trying to use.

--X2rN3GNvz+yeh2G1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0DucEACgkQJNaLcl1U
h9DcBQf/cyYj2+c9ec3uIgJuzwlTiySLaLJ3B3BoYXLPiBoyLbFpUZewrTZXw8j2
xSfZojAs5C7rYKGcIDiBFTXc5LTw6zlgbToEP6OZA/aw893qvNe6s121pYqTaTye
oXslK1jY2ZY+zAKqURXhJr/3MHNJE62KRCMn/H4zq6LJOafKadUkhHXDyDGMtSW+
g3m0UDGtB2YV/tOqKlqpKNl6Rt+ahd++mTcI2ScUoc7T1TuwnJ/xksi5Xrj7allK
i3oNLWHUJtLXYCNwufg5HEkDVss/BjIbbp283/MJxlMppUpASuuLPnOFC2MB07/S
65eKGsCgztc70KuWeGXkjkinf/9BdQ==
=jNCo
-----END PGP SIGNATURE-----

--X2rN3GNvz+yeh2G1--

--===============4730397191691594013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4730397191691594013==--
