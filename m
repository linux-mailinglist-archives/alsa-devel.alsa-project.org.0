Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB997225E4
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 14:32:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EE5220C;
	Mon,  5 Jun 2023 14:31:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EE5220C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685968344;
	bh=6isVfj5HPelAM2be2XHB5El5FupDQSIzr5YS5JDTgZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W+lt9QKsM62n8My83DAe7cV9W28neiuEWWYPP6lF4Z+vEGaw/jygTebMUHrYs1EUB
	 CS4jOqRPqgqEMkGB15D5x8PdwejKqzdtKjpnLve5BSp0Ou8t4eKe/d6hJgmqCV/EPL
	 64zvjWordNRuUENIXNJ/fLBsEDewdUk+Da0UiK/o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF1B3F80527; Mon,  5 Jun 2023 14:31:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B63EAF8016C;
	Mon,  5 Jun 2023 14:31:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 171F2F80199; Mon,  5 Jun 2023 14:31:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF5C0F800ED
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 14:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF5C0F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=l97kzALj
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 87B0561788;
	Mon,  5 Jun 2023 12:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC430C433D2;
	Mon,  5 Jun 2023 12:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685968283;
	bh=6isVfj5HPelAM2be2XHB5El5FupDQSIzr5YS5JDTgZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l97kzALj15ApSmL//qWGveFbey5uNPPQnpCQo1PtBg5U47wX7+l7iiKvXecb+9fE0
	 iXoNZQURJiAam/Qjrq+iW9XRGcP/QbKiIF8gD+RX4TSqDGtYrcWv00TuM1/wKDdsWu
	 dHO6gfecoZGTncCzpNzh7S+AHBgdZzKpE/J1e0iAIacJYXQgO7DBJdEOXwirnOcjaN
	 BtZWdqPlj09OCKErTTpLVjSLdVPtaEvgLUqu2OmUxCwnUZFpcOJxBttlLupXvPqPcG
	 QcQQejaHz361G/uxwkA5hkc/76cYItMqWO+dDuKKnIhl1DCTZxynRMifHF7szzOMvL
	 HH3+IHywIVnmw==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1q69N6-0007jv-BS; Mon, 05 Jun 2023 14:31:40 +0200
Date: Mon, 5 Jun 2023 14:31:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, perex@perex.cz,
	tiwai@suse.com, lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/2] ASoC: codecs: wsa883x: do not set can_multi_write
 flag
Message-ID: <ZH3VrC0v4orFUEby@hovoldconsulting.com>
References: <20230523154605.4284-1-srinivas.kandagatla@linaro.org>
 <168492769030.49784.4719862081052299023.b4-ty@kernel.org>
 <ZH2YAmBY-GNKABSB@hovoldconsulting.com>
 <b3bc0a07-4dcb-4f50-a7b3-91a4a62fac56@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ho5/CO/HymAIgj7f"
Content-Disposition: inline
In-Reply-To: <b3bc0a07-4dcb-4f50-a7b3-91a4a62fac56@sirena.org.uk>
Message-ID-Hash: KBO3UAG2SQMXDS7ENDHK2UUGWZESPTUJ
X-Message-ID-Hash: KBO3UAG2SQMXDS7ENDHK2UUGWZESPTUJ
X-MailFrom: johan@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KBO3UAG2SQMXDS7ENDHK2UUGWZESPTUJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ho5/CO/HymAIgj7f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 01:24:04PM +0100, Mark Brown wrote:
> On Mon, Jun 05, 2023 at 10:08:34AM +0200, Johan Hovold wrote:
>=20
> > Is it possible to get also these fixes into 6.4 final?
>=20
> They're already queued for 6.4.

Indeed they are. Your patch-applied message said "Applied to ...
for-next" and I didn't check your repo before reporting.

Sorry about the noise.

Johan

--ho5/CO/HymAIgj7f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCZH3VqAAKCRALxc3C7H1l
CAGbAP4hE7Bw9ePN2pwJDEBzc+z2IL9HkzZkjz/LXt1LBxrD7wEAsVd+92arnoDs
ofsZ43NQKmj9G9qjzSpQs8GUWjbEZAg=
=80cZ
-----END PGP SIGNATURE-----

--ho5/CO/HymAIgj7f--
