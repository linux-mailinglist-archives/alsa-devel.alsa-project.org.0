Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D9F914A3C
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 14:37:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFE0F822;
	Mon, 24 Jun 2024 14:37:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFE0F822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719232637;
	bh=VhurbZFA7Gb2R3cH1kKEN0MzJ83p+dO1GdwBiN0/gWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HgauiOC8VFjpW0SzbSQl9Xa3ylFe3IAZ9CJaXWhYhWZ+hSB1mtD2KqWrtc5JY9wPo
	 wbRCvG5Bh9JI7RY6fQcp0ixUndHf2fbsg3B7CBOW3MLXCykQylcMbWx4/b4rLrqqtQ
	 iUjxSqsGeDdMOuoxdUMOj5UG65R70tm/04cu1xb0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75F57F80154; Mon, 24 Jun 2024 14:36:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78930F805AF;
	Mon, 24 Jun 2024 14:36:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82D54F80495; Mon, 24 Jun 2024 14:36:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9EA44F800E4
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 14:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EA44F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=V4gMb4kg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0257460B34;
	Mon, 24 Jun 2024 12:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFB6C32781;
	Mon, 24 Jun 2024 12:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719232590;
	bh=VhurbZFA7Gb2R3cH1kKEN0MzJ83p+dO1GdwBiN0/gWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4gMb4kgV4cGzMttn8KHyuP8htrKOo4XQD2tUbLsqByayHguV46787kuw4Mi9jjyc
	 D3lxr1Q66qpkY8irbGfqo/hybxWFN12QIlUoNkPWkrjTu/NtsL9s6r1UR6bkokuHcI
	 daHlrICrdsCzeQYZO+Qp6AsrFWqsxkzcXbvV2cNZT0Uccn9O9ZowrH8PJ4m7kfBEZt
	 25xqGr/cYHY/QaS3Zbp49IAP+V+D4Kiy8P4wTsafs/WatZI0PbK6U80FYI1afzLQKU
	 STziVuCXOvwQ1PTW9IDIDjH95A6hJG4lHIGuOQ4XqfWJjmj/GV8ZSlIwbwVQw3uVml
	 NbWGQl8ngvWWQ==
Date: Mon, 24 Jun 2024 13:36:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: SOF: ipc4-topology: Use correct queue_id for
 requesting input pin format
Message-ID: <ec992bf9-667c-48a4-81ed-3a1232123987@sirena.org.uk>
References: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
 <20240624121519.91703-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5pBrGhTLrwRGNC0f"
Content-Disposition: inline
In-Reply-To: <20240624121519.91703-3-pierre-louis.bossart@linux.intel.com>
X-Cookie: Allow 6 to 8 weeks for delivery.
Message-ID-Hash: QLWX3NKTFB4PRV422OGFN6D2MEKB76RH
X-Message-ID-Hash: QLWX3NKTFB4PRV422OGFN6D2MEKB76RH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QLWX3NKTFB4PRV422OGFN6D2MEKB76RH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--5pBrGhTLrwRGNC0f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 24, 2024 at 02:15:18PM +0200, Pierre-Louis Bossart wrote:
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v6.8+
> ---

Please put fixes at the start of serieses, or send them separately -
it makes things much easier to handle if they're separate.  This ensures
that the fixes don't end up with spurious dependencies on non-fix
changes.

--5pBrGhTLrwRGNC0f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ5aEkACgkQJNaLcl1U
h9CWEwf/Wtk/DTzMdgsjQzFf2YB0zOwvpw0DSBQgZpLSkWnOvPb0k6o/wsMhK07l
AtUfI6rSUzBTQ6fBhRDyLvYMGGDeyDZXcP8zQUUbk83zws7Mq9dSbBZR2JB8r9UK
D39PW7vG4mz7U8xWeiZUQcvpkDFb0gPCjXCd0DcZrRmBl1KPFwRYjQ6nogAZ0nVy
xvwwQEpmnp9yLMriXcBz53npaaiHj8CnGkwbp8i7tDn1ZOte/JM9LNYeJCI34ZIN
iQyezU3Wo4CRdFvPw1kqY0N6wRcgi1f8hrnYz5A2oQoekmEpIR7Xoo9mFFpJvWNg
H25FDFbhmMOLCH6c0FhZ5+phfpsj4A==
=zJlx
-----END PGP SIGNATURE-----

--5pBrGhTLrwRGNC0f--
