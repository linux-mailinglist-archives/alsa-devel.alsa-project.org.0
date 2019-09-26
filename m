Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 855F7BF91F
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 20:24:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C2EB1768;
	Thu, 26 Sep 2019 20:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C2EB1768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569522293;
	bh=vEzUuyJt96CvwZS04TuKVXh8t96H6XvJS8T5tfV9v1Y=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y/r52I6yvFrnHTcYTpd5Isj3pEfpJiYEjjOKkdxuCMHd2yoTkh6MEfgEHHHc3lZTi
	 bg0cQOQpC6EKGKqlyWZgUTADI0StOCN8EwIcDd+1dqNJrY3ZezUc03pDXcB9Iuxm1F
	 c4G9eZaH6JaPfeiczUCBamMRoMzl7hoakYWuDrr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74C88F803F4;
	Thu, 26 Sep 2019 20:23:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48124F803F4; Thu, 26 Sep 2019 20:23:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F58DF80140
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 20:23:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F58DF80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="w9q+m6kd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L0EJVcfMhAB6/N4tPdvEVipe4vp4nRtTRv+xppqN8UE=; b=w9q+m6kd3SPFn6y7MTkeNY4Jn
 iWW/eDfgpO9FfCcmP2UsBb8wauAJzsPNeSDpxUEKoufIMcEq030SrcSQFrYrcK5ECS7Q04Xys9ID+
 uMTDlFAYizv1XHvFtIotrtW50IjuCS5hxhdMgoza8239aNer1Znhf6Qvu+dSj+POSucwQ=;
Received: from [12.157.10.118] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iDYPu-0004Rh-Fu; Thu, 26 Sep 2019 18:23:02 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id E4A53D02DD8; Thu, 26 Sep 2019 19:23:00 +0100 (BST)
Date: Thu, 26 Sep 2019 11:23:00 -0700
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20190926182300.GD2036@sirena.org.uk>
References: <1569539290-756-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
In-Reply-To: <1569539290-756-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Sanju R Mehta <sanju.mehta@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH 1/5] ASoC: amd: Registering device
 endpoints using MFD framework
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
Content-Type: multipart/mixed; boundary="===============4325178864150169629=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4325178864150169629==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OF9salbnfkEgqvaK"
Content-Disposition: inline


--OF9salbnfkEgqvaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 27, 2019 at 04:37:35AM +0530, Ravulapati Vishnu vardhan rao wrote:

> -#define ACP3x_PHY_BASE_ADDRESS 0x1240000
> -#define	ACP3x_I2S_MODE	0
> -#define	ACP3x_REG_START	0x1240000
> -#define	ACP3x_REG_END	0x1250200
> -#define I2S_MODE	0x04
> -#define	BT_TX_THRESHOLD 26
> -#define	BT_RX_THRESHOLD 25
> -#define ACP3x_POWER_ON 0x00
> -#define ACP3x_POWER_ON_IN_PROGRESS 0x01
> -#define ACP3x_POWER_OFF 0x02
> -#define ACP3x_POWER_OFF_IN_PROGRESS 0x03
> +#define ACP3x_DEVS		3
> +#define ACP3x_PHY_BASE_ADDRESS	0x1240000
> +#define	ACP3x_I2S_MODE		0
> +#define	ACP3x_REG_START		0x1240000
> +#define	ACP3x_REG_END		0x1250200

A large part of this appears to be unrelated indentation changes,
these should be split out into a separate patch.

> +static struct device *get_mfd_cell_dev(const char *device_name, int r)
> +{
> +	char auto_dev_name[25];
> +	struct device *dev;
> +
> +	snprintf(auto_dev_name, sizeof(auto_dev_name),
> +		 "%s.%d.auto", device_name, r);
> +	dev = bus_find_device_by_name(&platform_bus_type,
> +					NULL, auto_dev_name);
> +	dev_info(dev, "device %s added\n", auto_dev_name);

Remove this log message, it's going to be very noisy.

> +		r = mfd_add_hotplug_devices(adata->parent, adata->cell,	3);
> +		for (i = 0; i < 3 ; i++)
> +			dev = get_mfd_cell_dev(adata->cell[i].name, i);

What is this doing?  We never look at the result of this
get_mfd_cell_dev() and having a function like this suggests that
there's some abstraction issue here.

> +	kfree(adata->cell);
>  	iounmap(adata->acp3x_base);
> +	/*ignore device status and return driver probe error*/
> +	return -ENODEV;
>  release_regions:

This looks broken, as well as discarding error codes (making
things harder to diagnose) it means we stop unwinding things and
leave the rest of the resources lying around.

--OF9salbnfkEgqvaK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2NAgQACgkQJNaLcl1U
h9Cxogf+MiHsjaZBRHQqc3W+QzN0VRj5XNbwBnOYX/QIWj9Qxm9xuUqQK/N7Iwsp
HlvPLHQ1T/PDhEu+zA+EXWKRax2A56I+C/XyhnoqixUdtJolhiNB5Zw3y5MntaSY
zzDm+bvcfGLhm6pjDjvsqCKoPBqDcFrh6UbB042bcGvRXURvPZZIroogzbckGplD
fbRU1BcBrX5ra1yA3nQ+S0QHxbw3ZvwCntDbTMzmCPohGqCFznUxw3ixHoBEavv6
EjMSaar8T0mZbptkpbt0BAlIEug/M13HL7JqRPJ/7iRrU+QYEJqQtdR/RuxfNBsq
VVzy6HUsacBj2tH67Z+TZ+VOKdKKew==
=9AzB
-----END PGP SIGNATURE-----

--OF9salbnfkEgqvaK--

--===============4325178864150169629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4325178864150169629==--
