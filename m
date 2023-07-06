Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0A2749B9F
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 14:19:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F96183E;
	Thu,  6 Jul 2023 14:19:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F96183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688645997;
	bh=ozExOu5XO3lfJATKOxCayWXQFV4jBV+bqUwjfldZCR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oKZEy/Ma8CzTKXCIbQGS7LtwMc7k7ZNAlkMEW+kLzZYI3Q0b6oK30w42YOvQQfmvq
	 rANgguis8CRPd7kJVZrGZ4VOZ7Ct+EV/RpKLjme5vKYed9Gmuc6ctRzbxXxwnheUTA
	 hck6o/7/CtFxAE76qGCLm9ayoUCzsbgGT5YYMNb0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8956EF80125; Thu,  6 Jul 2023 14:19:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FEB5F8025F;
	Thu,  6 Jul 2023 14:19:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0968F80535; Thu,  6 Jul 2023 14:18:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B779DF80100
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 14:18:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B779DF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZJX6jVtM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7F95E618EB;
	Thu,  6 Jul 2023 12:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9556FC433C8;
	Thu,  6 Jul 2023 12:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688645934;
	bh=ozExOu5XO3lfJATKOxCayWXQFV4jBV+bqUwjfldZCR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJX6jVtMI7epnjU7mVdYEesEmctou3qq7gFSxsYGdDaW5xvvWHg5vLRugFljQAAoj
	 fwyfoUTZZZfS5+P8/4YrXyMcNkaVhrVFIKTtGxRKYInF3pgGJqzpy5CqizwkYMSiSY
	 6HE5nOmLDCmIw1es79aLMSIFHKKxUSdezM62m0OlLTTGQ+vmmpL0CHitXZQD5m2BVS
	 88WieJqJuvdFCYwGxoCOm3nbBg/x2645WGG/OrsS+//GaTLYGXX592AM+Scg7/CD4r
	 yZTTP+ubVvBLYKklaIBzBgluEkbRm5jGV8Xkry33QeDpz7TNGu5qVtGSXmacEaytAi
	 gLtGihTlJVz+A==
Date: Thu, 6 Jul 2023 13:18:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: codecs: SND_SOC_WCD934X should select
 REGMAP_IRQ
Message-ID: <f4bde99b-ac53-4ec6-98ea-e56a4c125a89@sirena.org.uk>
References: <cover.1688643442.git.geert@linux-m68k.org>
 <cafd878747e7951914a7d9fea33788a4a230d1f0.1688643442.git.geert@linux-m68k.org>
 <bd265a83-ca5e-4196-936e-0f753ea47a25@sirena.org.uk>
 <CAMuHMdUc-6ga7G5xuXXcKXU0ya3XBBM-tEJ3tZ-BY-oa+wozsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ecJqEW6WQ4xj01qT"
Content-Disposition: inline
In-Reply-To: 
 <CAMuHMdUc-6ga7G5xuXXcKXU0ya3XBBM-tEJ3tZ-BY-oa+wozsQ@mail.gmail.com>
X-Cookie: Don't read everything you believe.
Message-ID-Hash: 4OMLR7M27FXI2HFGYQDOTYOLQ32PCC7B
X-Message-ID-Hash: 4OMLR7M27FXI2HFGYQDOTYOLQ32PCC7B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4OMLR7M27FXI2HFGYQDOTYOLQ32PCC7B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ecJqEW6WQ4xj01qT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 06, 2023 at 02:15:57PM +0200, Geert Uytterhoeven wrote:

> Well, unless you have CONFIG_REGMAP=y due to some other reason, you
> won't reach the mentioned link error without applying [PATCH 2/3] first.

> It doesn't hurt to apply this patch independently, though.
> Do you want me to resend it (to your sound-persona) as a separate patch?

I've already split it out.

--ecJqEW6WQ4xj01qT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSmsSgACgkQJNaLcl1U
h9DiZwf+LRghgiXe8yXcuq0vH3jgiskjra/u/Op609XR6YiFf7mt8xQZvNoZa8/W
H5ypiOqFY+3UMoHkk2liYMaTTXZ3BQFJa/PmhmW+TGW8oG99S4l84OS0ZKwpMDN3
HxBHROB1V1UCdnbKNR7cGxRmuTVKZH7P8beTr4YbH3qJD+sNRqb9fcCbiBOuGPvL
9sMHKYOXPhccChhBOjLlJSESzz0WO8TLxsAHE75pPceweqZD37VDnErV0YQQkyPq
mIcM/uUC5GMVTcqidYv+o6JdwYqK1rvcLrmjjS3LVc5swE1yvX6aOBizPjYId0zu
E30bTGDZ8CBhjKgjPjuriDgAe0Kvqw==
=ZBDx
-----END PGP SIGNATURE-----

--ecJqEW6WQ4xj01qT--
