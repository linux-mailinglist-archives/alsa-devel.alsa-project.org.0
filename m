Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8782221DB
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 13:56:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 891E41660;
	Thu, 16 Jul 2020 13:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 891E41660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594900607;
	bh=Oeh7WSpi477fFQQHax7bHGj4fuGivnyeFm85Q3qS/9M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KjqCcUeszZtvCpSunp23SYBsNEpvBqnUqfqiZf7imQLIJGiZHbjAh3YOUouMi7Euj
	 2vw8FMTFb9Bc1w8bk3nWcaM3hybTztvHNJKNdWwj9+C8tXyhGa/LOFaSvSQK4ngx9o
	 oIDP+tCP6iPqYYFnDY/Qz/nS+0/6h9X6G6SWJmyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A36D5F8016F;
	Thu, 16 Jul 2020 13:55:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C002FF801EC; Thu, 16 Jul 2020 13:55:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 580B3F80110
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 13:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 580B3F80110
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1jw2T4-0008MI-6D; Thu, 16 Jul 2020 21:54:27 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 16 Jul 2020 21:54:26 +1000
Date: Thu, 16 Jul 2020 21:54:26 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v2 0/5] crypto: add sha256() function
Message-ID: <20200716115426.GD31166@gondor.apana.org.au>
References: <20200708163943.52071-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708163943.52071-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 alsa-devel@alsa-project.org, linux-efi@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@google.com>,
 Mat Martineau <mathew.j.martineau@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-crypto@vger.kernel.org,
 sparclinux@vger.kernel.org, Matthieu Baerts <matthieu.baerts@tessares.net>,
 Guenter Roeck <groeck@chromium.org>, mptcp@lists.01.org,
 Ard Biesheuvel <ardb@kernel.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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

On Wed, Jul 08, 2020 at 09:39:38AM -0700, Eric Biggers wrote:
> This series adds a function sha256() to the sha256 library so that users
> who want to compute a hash in one step can just call sha256() instead of
> sha256_init() + sha256_update() + sha256_final().
> 
> Patches 3-5 then convert some users to use it.
> 
> Changed v1 => v2:
>   - Added sparc patch to fix a build breakage caused by a
>     static variable already named "sha256".
>   - Added Reviewed-by, Acked-by, and Tested-by tags.
> 
> Eric Biggers (5):
>   crypto: sparc - rename sha256 to sha256_alg
>   crypto: lib/sha256 - add sha256() function
>   efi: use sha256() instead of open coding
>   mptcp: use sha256() instead of open coding
>   ASoC: cros_ec_codec: use sha256() instead of open coding
> 
>  arch/sparc/crypto/sha256_glue.c          | 14 ++++++------
>  drivers/firmware/efi/embedded-firmware.c |  9 +++-----
>  include/crypto/sha.h                     |  1 +
>  lib/crypto/sha256.c                      | 10 +++++++++
>  net/mptcp/crypto.c                       | 15 +++----------
>  sound/soc/codecs/cros_ec_codec.c         | 27 ++----------------------
>  6 files changed, 26 insertions(+), 50 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
