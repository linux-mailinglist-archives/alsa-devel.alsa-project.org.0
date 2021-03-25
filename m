Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A19134867B
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 02:40:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBF3515E2;
	Thu, 25 Mar 2021 02:39:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBF3515E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616636424;
	bh=N6oojkOhFGh38qVvU392vFfNFEwS1lh3PmzBZS7BTns=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JpeKPrh04cD67YpembqtsbcKWkmgF+Rltv6BL3bE4eotH3FhL6wTPAPS8BIWYQUYj
	 4l4lSQv8F0RjAOhBXxmDrZSk8a5U9Jlv/7xYOjgsTOKq2eR3KbcVkR+J+LNnVknLgi
	 ztNtHAQKILYuGxEsSagtoktdeVmA+nf69p49kwJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B76CF80246;
	Thu, 25 Mar 2021 02:38:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D576CF8016B; Thu, 25 Mar 2021 02:38:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30E24F80104
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 02:38:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30E24F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RyzpV1OA"
Received: by mail-qk1-x72f.google.com with SMTP id 7so331117qka.7
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 18:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=22p7hVps/LjWuOtuEANiPMyT7pKr9z7q78KN2cTKkCo=;
 b=RyzpV1OANLxsZNO31S9C5Y4xlUPrkIlyvremD4rudrE+JjgUEnT5niMqNT5MBWgA9u
 zmPdFOWXWa61tst+Bb3Nq2m9MTPedDdxNjPM0zVHYp5BXdDrAtiVIMF5l7l2TnKKwvLs
 c9S0K3UxS8s0YwGIsT6jjMrFxYBxIjQEjX80KhWn402Em7HV5prQrazZZ7ns/xiY7Khd
 ZG3X+78i5JIjEkb6+lnQr3a5hg3+FKIi+vouIZ2vV0ashEV8k2t2Glwx1XgXXNa70RZm
 ORiFtF2AR5TYz9Ij74LTCaCIEFYvjQXVq/7glyeyBPBpLoRi8AVNDQAe5ypI3pFNEB/H
 n/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=22p7hVps/LjWuOtuEANiPMyT7pKr9z7q78KN2cTKkCo=;
 b=qSNGq5gh0u4x+6NGwpylcoucRYgrIuB1C54+CWrq2vse6aDaz9wnU0tTZ+RPgFlCTw
 9X6NrfTDR0U7u65Qx6ivzZ8dRZegbrpEs75KbBQakYeLOLWZD2V2xoEWh2kchyECayZd
 vl3rk9aKPLg6oomRAnWjp68oS/SAYYCCXQ+w8DBk6Ah6B3c5yjWmELnFIvZivgQr9DYC
 Mn0ccIev40uM4Kd2q9z8mnjO+KeTNXWK0GEfqTJjH1yv49HGFD8GHABG34wZwdKRcDWQ
 Psorg+8xj0MddpWA6HDNBT8m84E71zGQxFc8+EAoqVGAt+9HUDdXrd/co5QGemKEfNny
 6quA==
X-Gm-Message-State: AOAM531HZwnHL+HaZpehKVeoDO88hnWvJxwWV4oAqgH/Mo3FkQptHoay
 v+iYIBGnCXGsPyjKHq6ncaI=
X-Google-Smtp-Source: ABdhPJyDGZvxR5iJ66pVH/QFNIHNDh9rZGLL+D/VKL2JDKfcm8jOR3rXKZY6QbdSAYSlpnGnonTFLQ==
X-Received: by 2002:a37:30f:: with SMTP id 15mr6139386qkd.494.1616636304932;
 Wed, 24 Mar 2021 18:38:24 -0700 (PDT)
Received: from Slackware ([156.146.55.193])
 by smtp.gmail.com with ESMTPSA id j26sm2705561qtp.30.2021.03.24.18.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 18:38:23 -0700 (PDT)
Date: Thu, 25 Mar 2021 07:07:41 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] ALSA: pcm: A typo fix
Message-ID: <YFvpZSTPKX4aDxGZ@Slackware>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, perex@perex.cz,
 tiwai@suse.com, broonie@kernel.org, mirq-linux@rere.qmqm.pl,
 lars@metafoo.de, joe@perches.com, huawei@kernel.org,
 viro@zeniv.linux.org.uk, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20210324065612.31362-1-unixbhaskar@gmail.com>
 <6d2e91a2-a013-c9b1-8725-1715253d0646@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LJ7YcVQXqsqt/q7E"
Content-Disposition: inline
In-Reply-To: <6d2e91a2-a013-c9b1-8725-1715253d0646@infradead.org>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, linux-kernel@vger.kernel.org,
 tiwai@suse.com, huawei@kernel.org, mirq-linux@rere.qmqm.pl, broonie@kernel.org,
 viro@zeniv.linux.org.uk, joe@perches.com
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


--LJ7YcVQXqsqt/q7E
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 10:51 Wed 24 Mar 2021, Randy Dunlap wrote:
>On 3/23/21 11:56 PM, Bhaskar Chowdhury wrote:
>>
>> s/unconditonally/unconditionally/
>>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  sound/core/pcm_native.c | 80 ++++++++++++++++++++---------------------
>>  1 file changed, 40 insertions(+), 40 deletions(-)
>>
>> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
>> index 17a85f4815d5..9884961bca7d 100644
>> --- a/sound/core/pcm_native.c
>> +++ b/sound/core/pcm_native.c
>>
>> -	return 0; /* unconditonally stop all substreams */
>> +	return 0; /* unconditionally stop all substreams */
>>  }
>>
>> --
>
>Please fix line 1472 (in linux-next) while you are touching this file:
>
> * Return: Zero if succesful, or a negative error code.
>
>
Thanks, fixed in linux-next and sent a V2
>--
>~Randy
>

--LJ7YcVQXqsqt/q7E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBb6VkACgkQsjqdtxFL
KRXLoQf/ayvSvk+UYxqr+uE6cxssqzuDrobvKdODaJagQRj6jVE2QCUx9pyIfLgV
0AWTsBNCKO1mqUpqFFvw3WUJMURRwqrYau4R/kNm5EGWcaWgtAXBoP4EVN3eT663
UDYTMaUkNozfU7gAHnviI6+Y6KPPZUzPsYc+D0q968nd1llW7JpHdVn6avx/BQBw
PGLTjiYce+VwMdrJ1aNEFXoC8bEc+TaweMGY3NEX8M/u/QCuaTxCRa92TwM7gaGU
5l0fceqHWhDEJ7yq/E3/pkC2OCCCtl7d+xQCUt2st6IakMWesHcwd5Gs7WBbO3fB
ytyiPO4w7NjKX669eZhf1KRGOCbR2Q==
=aPYT
-----END PGP SIGNATURE-----

--LJ7YcVQXqsqt/q7E--
