Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E767702121
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 03:29:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B31411FC;
	Mon, 15 May 2023 03:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B31411FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684114185;
	bh=I20Qcx+0QMlKTWmytfbz1TfDFmdsrpzG804q+DcMxT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dg8aux59nW9qNEKLEQ28Dft26muRnWVQWeTELdMOETAEyq0TAmP97R7cJwUrlqCZX
	 WAbqVRu4jaYjLoN4XmSJ/KE7pPI6TG8ygVl1l/pHTrpHFd1kj80gai+bEh+c5SJe8F
	 fdVHAPORhQf1Jq2+dG/J2XZP6x/nwtNIg2vEvXSM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15DF7F8025A; Mon, 15 May 2023 03:28:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9DD7F8025A;
	Mon, 15 May 2023 03:28:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB698F80272; Mon, 15 May 2023 03:28:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2CFCF8016A
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 03:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2CFCF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G1Y2xdQf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F411560C0A;
	Mon, 15 May 2023 01:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14340C433EF;
	Mon, 15 May 2023 01:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684114115;
	bh=I20Qcx+0QMlKTWmytfbz1TfDFmdsrpzG804q+DcMxT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G1Y2xdQfgmvkV3nlC0SWXnCZv8HEt7Eax23r2n7MNPoTbqzv/MyK3LUaH4mVX9nfx
	 +WQQ8nB54nSKvq1alqJITAVnLKiEL59gzUn1tQ4DT3DnCvU+WQyRwne2QkaBN8vvLa
	 OIAXkd3qBS/l1upiwA5SBn5NKWo7K0d77fqqUzJN0fyKqdri3RrGPA803A6g8riOtT
	 FpHDa+Tmkmkr1ZuLD+LZu8lcg19G+ucHnotuRi5srfdmH75F/m9MIoWJ1cqAXZNyrZ
	 MBPgJ3eB5XhqUpwVvtqGhIR8w6JYa8J7WrDw+mOOY/BifTtXRGuJEYqw1PV00I+loP
	 zd4xXi4/X080A==
Date: Mon, 15 May 2023 10:28:32 +0900
From: Mark Brown <broonie@kernel.org>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: corbet@lwn.net, akpm@linux-foundation.org, perex@perex.cz,
	tiwai@suse.com, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org, himadrispandya@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH 3/3] selftests: ALSA: Add test for the 'valsa' driver
Message-ID: <ZGGKwA10shGGUr87@finisterre.sirena.org.uk>
References: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
 <20230513202037.158777-3-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7tubSUVrD+xV4Inh"
Content-Disposition: inline
In-Reply-To: <20230513202037.158777-3-ivan.orlov0322@gmail.com>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: 5QKUPZCEOJWVTMIFSYQMSBZSA2UKH4KE
X-Message-ID-Hash: 5QKUPZCEOJWVTMIFSYQMSBZSA2UKH4KE
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5QKUPZCEOJWVTMIFSYQMSBZSA2UKH4KE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7tubSUVrD+xV4Inh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 14, 2023 at 12:20:37AM +0400, Ivan Orlov wrote:

> +uid=$(id -u)
> +if [ $uid -ne 0 ]; then
> +	echo "$0: Must be run as root"
> +	exit 1
> +fi

It is not an error to run the selftest as a non-root user, the test
should be skipped.

> +modprobe snd-valsa

We don't check if the module was already loaded.

> +if [ ! -e /sys/kernel/debug/valsa/pc_test ]; then
> +	mount -t debugfs none /sys/kernel/debug
> +
> +	if [ ! -e /sys/kernel/debug/valsa/pc_test ]; then
> +		echo "$0: Error mounting debugfs"
> +		exit 4
> +	fi
> +fi

This will unconditionally attempt to mount debugfs in a standard
location and won't clean up after itself, if the system didn't have
debugfs mounted for some reason then this will leave it sitting there.

> +success="1"
> +arecord -D hw:CARD=valsa,DEV=0 -c 1 --buffer-size=8192 -f S16_LE -r 8000 --duration=4 out.wav
> +
> +if [[ $(< /sys/kernel/debug/valsa/ioctl_test) == "$success" ]]; then
> +	echo "$0: ioctl test: success"
> +else
> +	echo "$0: ioctl test: fail"
> +fi

Would it not be better to have a C program that actually calls the ioctl
rather than a custom debugfs thing that may or may not be wired up to do
the same thing as an ioctl would?  It seems like other than whatever
this ioctl test actually does this is all just a simplified version of
the existing pcm-test.

--7tubSUVrD+xV4Inh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRhir8ACgkQJNaLcl1U
h9DDEQf+IjmNUuTXgXNfQLkMLf76FazxTesXhLu7ittBq9lGs7S5/GQaJ8QTMgzC
TddmGnsS6C774id02yqhg4QU04zGQQ66amxkeAcdylaQZlK8e7U4UwKtXHq4UTDU
X79NmH2oYOE6keq6GYZ7r1KsmfOMD0flHA6+vuq2Lak8PEHms/OlHvQtyNmA7DTE
YUYAzmBzh+zGmq5dbWloNGsJgmdgdcXh6x8eIMDiCDiCo4JKekDXNlY0f/G7wLuh
3U5d9Ud/q2VmgXeCMLkCzKR7o9F1p4ym3MLLM2Up9GevfInfJwTih6XyvtW8WKyR
GdU4RbkyizlI7hiqcmOyBJR1b0Ypcw==
=E/Qm
-----END PGP SIGNATURE-----

--7tubSUVrD+xV4Inh--
