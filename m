Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F0747C405
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 17:42:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A852179A;
	Tue, 21 Dec 2021 17:41:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A852179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640104942;
	bh=JA2XthLwZ7lLTOnJ+u7LAbaKjOnIJFmoqSmlZzwHHlg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nVN8Qe2nWj6kto8C0EFN7tWRu3w9PgPgrZwKhAdtoRT7iKVPyVln3GXgUKnnmq9ZA
	 Xzm+cvsvPdXBQRUj7Q6FyEHnANm4ZY38VyF9rxXlbkfSIMXkTxmHsFuw+sB7F3xjvV
	 Vc/GdWaiSgy9LCUWrgvize/LM8pV7FMYTmdwtf6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A513FF800B5;
	Tue, 21 Dec 2021 17:41:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DCCDF80118; Tue, 21 Dec 2021 17:41:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8AEBF8010B
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 17:41:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8AEBF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DjeCYWWY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 12464B81722;
 Tue, 21 Dec 2021 16:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0594C36AE8;
 Tue, 21 Dec 2021 16:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640104883;
 bh=JA2XthLwZ7lLTOnJ+u7LAbaKjOnIJFmoqSmlZzwHHlg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DjeCYWWYUNUV56UhX22pxyu2UjhqvrVBGsj8Lv7/lFRD8kvXCkCkzaQC0IsagL+l9
 JNhqDVeFQwmi4AA2l80xBU8PX9Mp2kk756E4QSAW1NvQvrQsHxYWvTKAtbnfWWRkp1
 ZwJow86sZOvuYF5K9tuigA8iveFUZ6yewjFlUKrTict5pY4uUlX00FzhhhwTMwwclf
 ufKQuXlhk7tJwkJwgX9SgHeM/0VsI2OZlyzZauTJ5WZiuVAUvVXWyvKJdotlvDau6f
 UVjeRf70evnnxtGOFK84WVfbb5rXEEd48R72JBxFHx4CzGUf8v8CWzL++/LMqq9SIq
 HgPZAMbtm1hkw==
Date: Tue, 21 Dec 2021 16:41:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] dt-bindings: sound: tegra-audio-rt5677: Correct example
Message-ID: <YcIDrlhopQXFomzU@sirena.org.uk>
References: <20211216160229.17049-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uyGpmtvI5umEZmqU"
Content-Disposition: inline
In-Reply-To: <20211216160229.17049-1-digetx@gmail.com>
X-Cookie: knowledge, n.:
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
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


--uyGpmtvI5umEZmqU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 16, 2021 at 07:02:29PM +0300, Dmitry Osipenko wrote:
> Remove non-existent properties from the example of the binding. These
> properties were borrower from the old txt binding, but they were never

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--uyGpmtvI5umEZmqU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHCA64ACgkQJNaLcl1U
h9CskQf9H4IdMGrIuSb7/r9gEvwcPTaKSI9wGbd6jzbFPU/4byXuCujCjWN+VY/8
giajs0QgQLeo8IcBryD9h7EeIre7nA5IDQhVKwGLb2tJV88HgXUzsel9lJcJnPOQ
q8apMEzFQxM1VE9kba+yYAWOR3XBFJMrRrHNq/G/ObN2X/dajoK8M9IZkdQHtbmc
pkyo4xPwi7iaUzkGhArqtrVH8wDb0LH950HtoOkK26rI78aKtyTJ1XqBru44Hpf9
lYKzRRY8ijsadMcsKmSkjlU9KvDqJLEF0dx7DaafGh6Dx7VHw96QvEbyxTedIvoH
5jysj9q0P+uvc7XmPppYHUUhJ2ZJrg==
=67kT
-----END PGP SIGNATURE-----

--uyGpmtvI5umEZmqU--
