Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BE96CDB3E
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 15:53:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 783F61F3;
	Wed, 29 Mar 2023 15:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 783F61F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680098026;
	bh=tY3+1vFhOirM40vPbYkObuXOJ7tqvmbmhcySnP4jWro=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZWVq+ly7NHHIu0UGPRJx8l+AF/WS14CCGRKnTlUHVWtrUk64sAvoCS4fZg8yYdL6Z
	 EUAvRLI0+ihvwCiQrl9Hhq72JAb4SEOJ182GUf3kEYgUt3IHbSsDOEJmnpjwpzfEFa
	 0T2xEUznBGgDRRjG0oPYSNam4iaT/qd1PqR407S4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7354F8024E;
	Wed, 29 Mar 2023 15:52:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A7BBF80272; Wed, 29 Mar 2023 15:52:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BCE26F80114
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 15:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCE26F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O4yhJzQl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A466C61A53;
	Wed, 29 Mar 2023 13:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFBCC433D2;
	Wed, 29 Mar 2023 13:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680097965;
	bh=tY3+1vFhOirM40vPbYkObuXOJ7tqvmbmhcySnP4jWro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O4yhJzQl5nKtyqlKnhAOGYjDqRWK23t8SVM6E5dPIsuLSBK2+nWmgnVsMY04FPK2D
	 uanmg7wiO++ULsgWYkPo5mbCXOFcrgSpMWYlp89IOgSsJSlZFG1Ov9viJaQdOEwFLd
	 sjB68lBIMUU1/VxFqMbCcjR29j5Xk0c9TwVOBVZ+kwPgwPBe+Pje5FU3F4JxzSjZdf
	 J8u9tQHTNjgIFVVYjIpth+KKaQOR46QXjWQ+CtKJ0vEMYiDkmvoFMBWw+/ueBqP/45
	 FdWlDXDWdZBi3uPuI3d3icvZLCC6UDYbxQcmyebxbmzpdLqx1kWCqY+4iPNAkMXdOO
	 2t9rxz8N/BFtQ==
Date: Wed, 29 Mar 2023 14:52:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Marian Postevca <posteuca@mutex.one>
Subject: Re: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables
 sound for systems with a ES8336 codec
Message-ID: <ZCRCqJ7oG6oefo9g@sirena.org.uk>
References: <20230320203519.20137-1-posteuca@mutex.one>
 <20230320203519.20137-4-posteuca@mutex.one>
 <141a3320-ff65-459f-9d00-c8bed691dcfc@sirena.org.uk>
 <87lejpwxzf.fsf@mutex.one>
 <ZBr9rJn50ovG1w9W@sirena.org.uk>
 <87ttycjyw3.fsf@mutex.one>
 <ZBty1CdPaWm0IcRi@sirena.org.uk>
 <87r0t9uc08.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FsDe0pyTf46JNN5d"
Content-Disposition: inline
In-Reply-To: <87r0t9uc08.fsf@mutex.one>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: WXEB7AZDSO47WSYE6TYTNYYTD2A7DGQO
X-Message-ID-Hash: WXEB7AZDSO47WSYE6TYTNYYTD2A7DGQO
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?utf-8?B?5rKI5LiA6LaF?= <zhuning0077@gmail.com>,
 yangxiaohua <yangxiaohua@everest-semi.com>,
 Zhu Ning <zhuning@everest-semi.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WXEB7AZDSO47WSYE6TYTNYYTD2A7DGQO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--FsDe0pyTf46JNN5d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 28, 2023 at 12:20:55AM +0300, Marian Postevca wrote:
> Mark Brown <broonie@kernel.org> writes:

> > Surely if nothing else a good first step would be to have the
> > CODEC driver do whatever disabling the jack does on suspend
> > without needing the machine driver to bodge things?

> I would go for properly analyzing what is going on and try to correctly fix it,
> but it's going to take some time for me to do it. During this time
> people with these laptops will not have working sound. Wouldn't it make

Did you try my suggestion of having the CODEC driver do whatever
is triggered by disabling the jack on suspend?  That should just
be simple code motion shouldn't it, not something that requires
extensive investigation?

> more sense to first deliver a working solution(even though it's not
> perfect) than to make them wait? Also this workaround is already present
> in the kernel, so it's not that critical that another driver uses it.

On the other hand if we're getting the same bodge done repeatedly
in a lot of machines that suggests it's something we should stop
spreading...

There was also the issue with automatically muting the speaker
when headphones are inserted which will affect UCM files.

--FsDe0pyTf46JNN5d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQkQqQACgkQJNaLcl1U
h9AOYwf/ZwnNSUNFjDGXksy8GfP2Xr84EbJeFIfVFR6AMp8OwyxywdjeNMR67cSx
yW9tIwQaJQhyo7CUOD76RdZm80yqAuZA9cK0IOc3Sg5epntjbQkF5rEhvoYTw7rV
tVM0TLzI8B/qaGLkDGyTjdfFn2M9GbkYrDPXnjta6Jrw56iC8uKiP2lGDTsjFTv2
dM4KxRY4KHhZjDqXEPFOlwoLF/cz+xkfBqFVpQea+D3UFeM+FabbHzsR4GkJYk0G
pUj0jx4WF4qHsxXUl2OnF4tmx4H+3l7NohncMqS2llTQwuK3yObBFLpnJc3hHTiT
1EsIVCwvdRpJBbP3JkCVgDilWVu8jQ==
=NZyJ
-----END PGP SIGNATURE-----

--FsDe0pyTf46JNN5d--
