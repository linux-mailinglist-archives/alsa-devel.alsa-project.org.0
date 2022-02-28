Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FA94C9F95
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:44:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D4FE1E7F;
	Wed,  2 Mar 2022 09:43:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D4FE1E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210663;
	bh=xwpZD4gZhTKAz2WFv6X6JMrNMSyputHa5miIKZ7mnV4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R0rey6vjJMJ6js0Sjb7abam453AtB7ZVb40a/pb3u+4MK4Ru2ccbaXBhsuTG2nb/X
	 TISu5Y5p8ukH5Odx38WLFxYyxRHio83xfwoPAKw9CjYnqf3e8E6ba8ct69J9sRrn9g
	 ffDVE/v5+CiN2cnhd5CPjal1KaFHRQ+N6HxEyF2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1D2AF805FA;
	Wed,  2 Mar 2022 09:34:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B42BF8013C; Mon, 28 Feb 2022 14:08:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47F87F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 14:08:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47F87F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FDHaYinV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 12319B8114E;
 Mon, 28 Feb 2022 13:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4116C340EE;
 Mon, 28 Feb 2022 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646053683;
 bh=xwpZD4gZhTKAz2WFv6X6JMrNMSyputHa5miIKZ7mnV4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FDHaYinVMNM6kACb7E2Qy0TXd85azTDlvzFKosdq2q5aXpNxj4+0bCHnUOyq7qvCX
 SdYowwLghSSD7m9p89L9IHLNURvZvuumE6Vu3Y7iNzNocmQHWUzg83s0qB+weG5HB0
 +kvmS/aLHNI/6Nqh49ZcJOvFivLCHBHTVfK80/WeRhDxjAD3RPcXkp71y1CkrubPcT
 TYf9kmUe4enaJ9QLuu5EOG9nUHW7bKk6BlwMqnVjYo83gCrxYJUvbhawoVypGiHk6k
 f1g5of4zmfYtpdOQJOHVTh9uxD0U5bue4hdKW1TR99VKgbXAKo0qKyQa7hTJW5HG6p
 WxhALj7z+X8eQ==
Date: Mon, 28 Feb 2022 13:07:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 07/11] spi: Use helper for safer setting of
 driver_override
Message-ID: <YhzJKKCxnx9DvliT@sirena.org.uk>
References: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
 <20220227135329.145862-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IskqWBy0ijhzVzPO"
Content-Disposition: inline
In-Reply-To: <20220227135329.145862-1-krzysztof.kozlowski@canonical.com>
X-Cookie: Killing turkeys causes winter.
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:35 +0100
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Abel Vesa <abel.vesa@nxp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dexuan Cui <decui@microsoft.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-spi@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, Shawn Guo <shawnguo@kernel.org>
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


--IskqWBy0ijhzVzPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 27, 2022 at 02:53:25PM +0100, Krzysztof Kozlowski wrote:
> Use a helper for seting driver_override to reduce amount of duplicated
> code.

Reviwed-by: Mark Brown <broonie@kernel.org>

--IskqWBy0ijhzVzPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIcyScACgkQJNaLcl1U
h9Ao0gf+JDpig6VFnyylTAGyA+EFJ7fmHFbvWhVF0t9hjFi5sLRAs8Z3+hLLKVej
zLVg+PMT7lEK9f1Cya6K7+gCq6ukWeVmmFBvuEA5Mn++s0vTXTuvx7VPQ8I7paXG
iePQNfdjxSxtdDUM+zinbF3mL8p4PcKUzqKlYEGeYvhxM2KxJx8a01GSsgKU1rNC
8ynKO/iKprh+dyGZOBcXM/m3OJDmQ0YEQi9uVQFGaznJ/yE4YjoBnCc7gj7uF2gB
3VAYxVi8Uj4ZMLOq0HPkR6QYxtneVT0Gly46I5Mg5BJZHdJ4yGkOOhaqZ0E4gwXI
YsZPSj+FAaJ1fM7xBMDL23NN8cHicw==
=Gb02
-----END PGP SIGNATURE-----

--IskqWBy0ijhzVzPO--
