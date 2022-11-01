Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B3261518F
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 19:31:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 119641698;
	Tue,  1 Nov 2022 19:30:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 119641698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667327460;
	bh=2Z4x/4asWO7Y/xYJ7/7XAssvwSiS4yuALn3npzOSSso=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jfsq9LRsv5R/GucmI/FuVgmhtUU0VM1PfVhz+3ofwZWs7bCHk8TwXCuw9HW8gkIrV
	 XSvmv+DS3x/gFlmeR6b1HmkWb+Zjo8VNiB/v1kL7YVdzM/Ofm9ngM+RJYLExIOWpEF
	 qB5TUEvKEu4DeWWdOPwCDNI1p4074UtgH/e7BpIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B18DEF80423;
	Tue,  1 Nov 2022 19:30:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29F2CF80423; Tue,  1 Nov 2022 19:30:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF543F8028D
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 19:30:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF543F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IEJcskDs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 808D5B81EEB;
 Tue,  1 Nov 2022 18:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BD5C433C1;
 Tue,  1 Nov 2022 18:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667327399;
 bh=2Z4x/4asWO7Y/xYJ7/7XAssvwSiS4yuALn3npzOSSso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IEJcskDsRhQ8HqPN1u9nAxdmgEC1+XC9ByQAxhvXx5Rjk/PLOGsv4O1EFQW9crAY+
 3uB4/hAF0zkumdoi4jFhIwy3kchQBMqwRDtg56J3PIwKALfwzVwbZ8KCYW1G57DY3w
 2GzmhqO35VhR/EUwYLvfbkiba6UV090S61oS34ufplLaksaA0l3u1l2YdnWGf2lJ4S
 0Qey+JrKyF8g9WidE/a+SynK2HEkw5I9BT+9lLkPBrb5LqtlKUbwYjHVlcF6v+RIqL
 HBbmjiPq4L6Arfjc3RXFcCoqW/PDWO4M/aACKCKtgoik3WVbmx8one76yyyS7Jm3zq
 f8pNEOU9mcdXA==
Date: Tue, 1 Nov 2022 18:29:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH] ASOC: SOF: Intel: hda-codec: fix possible memory leak in
 hda_codec_device_init()
Message-ID: <Y2Flon6lR10x/rys@sirena.org.uk>
References: <20221020034752.2392283-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Zcl3nutga3nMdDY1"
Content-Disposition: inline
In-Reply-To: <20221020034752.2392283-1-yangyingliang@huawei.com>
X-Cookie: Your lucky color has faded.
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, cezary.rojewski@intel.com,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com
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


--Zcl3nutga3nMdDY1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 20, 2022 at 11:47:52AM +0800, Yang Yingliang wrote:
> If snd_hdac_device_register() fails, 'codec' is leaked, free it
> in snd_hdac_device_exit(). And device_initialize() is called in
> snd_hdac_device_init(), it should call put_device() to give up
> reference or the name allocated in dev_set_name() is leaked.
> The snd_hdac_device_exit() will be called in dev->release().

This doesn't apply against current code, please check and resend.

--Zcl3nutga3nMdDY1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNhZaEACgkQJNaLcl1U
h9DZLgf3eeBp5qoTJ/aNcOT66wNYYReucNTm6v1E0576woNlzu4lBDanLLwXg+9w
0s5ufAsqgUEj28OzXk/akoiDrXfDXAF+uvVbYl452UtUEdGRN3jE6yZj+OIJmSCu
9qv3wwAS4Iv+XlbXWFA2vBx0ecJAvUk5CN4xRyojT+sMy/QW/QBUvOCgPR6MxC3X
y7Y2qCN4+TgH7o8UQYV4ZHYSg12/Zy6gBay2K4N6BgyfpgaY5FibGyN94kuoNQb4
uDnT7wsXmwD/HJtpRV6Y5ZOkfvuuGlXE02pIVfEM01hms8h4X87voDWMbF7lnyGP
Y0BH8bRb8xHcPSXjpr/dGIKdqq/V
=yfSD
-----END PGP SIGNATURE-----

--Zcl3nutga3nMdDY1--
