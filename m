Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9239B4E5645
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 17:23:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D6F216B8;
	Wed, 23 Mar 2022 17:22:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D6F216B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648052598;
	bh=Uo0i4i4i2xbxwNsCMR2BRGClWi9I6/uRfjIoHuPEja8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rIaH5rUHkKgmeuLOvz5f8NLgsJrp/m008c2wA7g/Jp/TYCQ+GwVBZW0bsE+21YHkS
	 FT34vIXYmTA0V2w1oLpZqtb+1jmLc60sUU09coXv20gsjAQ35F8WmBwXdY4mC8v5+9
	 W8891E+sP7r7wZ8UI1ARB0JoxDYbm/J9ptvtSbNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62DFEF800F5;
	Wed, 23 Mar 2022 17:22:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C31AF802DB; Wed, 23 Mar 2022 17:22:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45DE1F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 17:22:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45DE1F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Fdw1Aza3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 00535B81F12;
 Wed, 23 Mar 2022 16:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE22C340E8;
 Wed, 23 Mar 2022 16:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648052524;
 bh=Uo0i4i4i2xbxwNsCMR2BRGClWi9I6/uRfjIoHuPEja8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fdw1Aza3MZ/b/LZNSvKRTVCPfyWNT/1XogaOiF3JSFxqfWUKNzQ86b/ZJflc0pwsG
 SNVvhD8U0+6qCGptSAUFvBve3+4sG+LoPj6E0OcF/gBKe1KR593JmJ6uPF1ItdCzVZ
 v4l/XQNmvw07TbRlKumjRaa0fXcPxE8Zk3YbUjjU6NUwpxKpk36/iXf6Yi8vev+QDd
 xvjfaE90DwTDWgB8EbnX9wq+SpKxkOdlVso0q+a7CieYS+RNSFp6zfx9mBth6qn2Mu
 0rXpflo2KoyML99T4DdivPNfeR/tqoLjqT108H7IS4A7T3pAoKXp9uWRlaj4GccXU/
 zhBsOW/t6//Rw==
Date: Wed, 23 Mar 2022 16:21:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Baisong Zhong <zhongbaisong@huawei.com>
Subject: Re: [PATCH -next] ASoC: tlv320adc3xxx: Fix build error when GPIOLIB
 is not set
Message-ID: <YjtJJvHeslMokYEE@sirena.org.uk>
References: <20220323141737.211198-1-zhongbaisong@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/hNKK5MSDdSwIhvh"
Content-Disposition: inline
In-Reply-To: <20220323141737.211198-1-zhongbaisong@huawei.com>
X-Cookie: Nice guys get sick.
Cc: drhodes@opensource.cirrus.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, cy_huang@richtek.com,
 ricardw@axis.com, srinivas.kandagatla@linaro.org, pbrobinson@gmail.com,
 hdegoede@redhat.com, lukas.bulwahn@gmail.com
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


--/hNKK5MSDdSwIhvh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 23, 2022 at 10:17:36PM +0800, Baisong Zhong wrote:

>  config SND_SOC_TLV320ADC3XXX
>  	tristate "Texas Instruments TLV320ADC3001/3101 audio ADC"
> -	depends on I2C
> +	depends on I2C && GPIOLIB

This is bogus, the device clearly doesn't require GPIOs to be useful and
so there shouldn't be a dependency on gpiolib which normally stubs out.
In general for APIs with stubs adding a config dependency is not the right
thing to do.

I suspect it's just a missing header.

--/hNKK5MSDdSwIhvh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmI7SSUACgkQJNaLcl1U
h9A/QQf9HthQ+od5c57RtcMoI2FTFI050WaVHrS5j+q94FcxpF04tiiy/T6TAcL4
Jdhhuj+9uCiradP0kN2Iir+vdEg0C1/UzlGRnVKOCE3xTD0WlYbXjpj5nkkl1Htn
FwPuRgypVqIQ1ye5ErNQ/78heHPWk4Xb6lKzHlFHQOMusxoaTKyGjhNCPTo7Nkai
exdjk/u5/bz+JMj6jHSzYzPB6zm8pWYeoiKk8FVN/zIEEdmW2hqPR7Uf3rO5BYOQ
1WVs8SSn4pa5GDUvZLEHkBWSEal6UCR8JDPb1cqKy7W+u9voq043IDmLkTyZR42C
mnfZMVSNFHTWMH9/pwStF0BbDM6+5A==
=qPXX
-----END PGP SIGNATURE-----

--/hNKK5MSDdSwIhvh--
