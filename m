Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B713A0C4
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 18:50:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C34C9167D;
	Sat,  8 Jun 2019 18:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C34C9167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560012609;
	bh=7VI5Rz1MCmmLMLCdxPXvaLZYBifKrXRxMZshfYWekvE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uj7yDkT1pq2Jf+Ji56AdTGdZ3jPV/pDOJa5P9PxEoNaaF2GgR6Yl6/v+u3Pm3bfz+
	 hwohAw8a2yQ6Gw9TwiPr+jor0xaDw12j7Rjrm04ow0+Kr2kDrp6s886gKVo/5Qf7az
	 BczHgr+pgBQPudPYRwHlXuhz2TyL58H9os6C7ab8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F24EF896CE;
	Sat,  8 Jun 2019 18:40:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3A6FF896DD; Wed,  5 Jun 2019 12:02:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B78F3F808E7
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 12:02:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B78F3F808E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dorjVI3a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u3C13c87086hMiV9w85rPm7zIsQPWFDde0xcEZuXQO4=; b=dorjVI3a+BwPR4KW5H82UKRlg
 Q9KqAanswJa5R2Wb689KlEmobdDfNHeCIoIrmt5I/PSgctZsHRi60Lg3gnFmHSNLPuQAliaq0R9s2
 vaYe1Hr5IKUF5PPoEbYIxmcmqmsGkWm/Qs6VhqrIEdJ0/Z6P1uHRVEgDVNJ/doyVFZ37k=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYSkO-0008Uv-UU; Wed, 05 Jun 2019 10:02:21 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 7EA0A440046; Wed,  5 Jun 2019 11:02:20 +0100 (BST)
Date: Wed, 5 Jun 2019 11:02:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <20190605100220.GN2456@sirena.org.uk>
References: <20190604152019.16100-1-enric.balletbo@collabora.com>
 <20190604152019.16100-7-enric.balletbo@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20190604152019.16100-7-enric.balletbo@collabora.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 08 Jun 2019 18:39:50 +0200
Cc: gwendal@chromium.org, Heiko Stuebner <heiko@sntech.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 alsa-devel@alsa-project.org, Sebastian Reichel <sre@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-i2c@vger.kernel.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Guenter Roeck <groeck@chromium.org>,
 Ravi Chandra Sadineni <ravisadineni@chromium.org>, kernel@collabora.com,
 Fabien Lahoudere <fabien.lahoudere@collabora.com>,
 Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, linux-rtc@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, dtor@chromium.org,
 Brian Norris <briannorris@chromium.org>, Evan Green <evgreen@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Wolfram Sang <wsa@the-dreams.de>,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 linux-pm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jiri Kosina <jikos@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Lee Jones <lee.jones@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benson Leung <bleung@chromium.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Colin Ian King <colin.king@canonical.com>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [alsa-devel] [PATCH 06/10] mfd / platform: cros_ec: Reorganize
 platform and mfd includes
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
Content-Type: multipart/mixed; boundary="===============6528093490203177506=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6528093490203177506==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RnxXMyWEPIZsopkG"
Content-Disposition: inline


--RnxXMyWEPIZsopkG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 04, 2019 at 05:20:15PM +0200, Enric Balletbo i Serra wrote:
> There is a bit of mess between cros-ec mfd includes and platform
> includes. For example, we have a linux/mfd/cros_ec.h include that
> exports the interface implemented in platform/chrome/cros_ec_proto.c. Or

Acked-by: Mark Brown <broonie@kernel.org>

--RnxXMyWEPIZsopkG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz3kysACgkQJNaLcl1U
h9BVMAf+I/I3bNW13EZ789wBAFxmn5KXFbH0t6CdJDgbILW9HMsGSKGbJXJRTRDG
GGeIfMEYK0lv5boeQbArMfoX/kkuVYHVj/71aQVsgC53JIBFFxHS2zEfzrFzgN+R
sNsvROQYmO1T5gOySrMN+AsqPwnu3CR2LgMPRqsvguCPduIfXzEM3afJQuRh2lAW
a5Im4U6GQX5cez1MGDHB3/Mk8fH194coSUTUtH134gpeA5LWemALrlDCRsfdSbw2
G2oeM++LQIDx2VcKfRKWfqvKhC1Ajp5FdiZw6Z7lo6+BXFHKSVupSjKAhtIdT4gj
RVhPy7IzR78PM8sLvDnqD6CyTHtuXQ==
=7p/R
-----END PGP SIGNATURE-----

--RnxXMyWEPIZsopkG--

--===============6528093490203177506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6528093490203177506==--
