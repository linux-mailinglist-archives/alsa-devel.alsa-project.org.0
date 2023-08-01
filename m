Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AB076B6C1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 16:06:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 721457F8;
	Tue,  1 Aug 2023 16:05:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 721457F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690898769;
	bh=lI3n00luUKNfopH9HotLexiOPOuMEZpaKLOmB06ooZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BU507Ow0wcln26gPObwnDkXi6mS25soVYhDOLYWX3PsHCxGMiHLfPbVDqiy4DIklj
	 YHZD/WxtrjeihKyJmFwHTSk/nlvMEZbXNH0oiXMp9bZbs9tTAmKHrHd4q/T5038xLn
	 BzD1G1nFCx33pwMte8Fv+QE7/kNNgpHbO+5xVaZs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CE65F802BE; Tue,  1 Aug 2023 16:04:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48380F8016D;
	Tue,  1 Aug 2023 16:04:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD561F801D5; Tue,  1 Aug 2023 16:04:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30DF2F80149
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 16:04:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30DF2F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OEIpwVYk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 47857615B4;
	Tue,  1 Aug 2023 14:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7D0C433C7;
	Tue,  1 Aug 2023 14:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690898681;
	bh=lI3n00luUKNfopH9HotLexiOPOuMEZpaKLOmB06ooZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEIpwVYkDq+meyS+F0NrjUec5s/e0v8SK2Iox7Y/zdkxJGa9HYCY+Qqv7P4WEfWkA
	 kAoMlWAh+2te7rC1NLxY/R2kSiuXFh8wAvmYJibLgpADDbLlPyB16g5LTBMwjlEn1a
	 G7PJjbM8fcOMRLDsi16jWNwGtrtbOMeTtKdLWHh8mu10k+SjrM2XtaV5pAZ4wWEZs7
	 c9odn6bRGk8znCKs/8LH6xAP+wHnp1AXA5K2jOPPBq43w9OqfSl9oJB/cc8ZMmTL21
	 1GOld3yySZ0K5npTLbN0VCfgXuNIqRPpImE/uS3azcZEP9z1QH5rL1s+UctXocUCsK
	 NCSFJqIkD2kfQ==
Date: Tue, 1 Aug 2023 15:04:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-media@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/24] ALSA: Generic PCM copy ops using sockptr_t
Message-ID: <f4cee7c8-4399-41b2-bb3f-5d5dcac37ca8@sirena.org.uk>
References: <20230731154718.31048-1-tiwai@suse.de>
 <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
 <87h6pjj2ui.wl-tiwai@suse.de>
 <a02cf5c3-1fac-4ec6-9d9c-f8e8d0c067e0@sirena.org.uk>
 <87leeugbxm.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VsD3ApJSux4lzU26"
Content-Disposition: inline
In-Reply-To: <87leeugbxm.wl-tiwai@suse.de>
X-Cookie: I thought YOU silenced the guard!
Message-ID-Hash: POKG5KXYBR5PTLQHBPMKGMF3AFONT3XA
X-Message-ID-Hash: POKG5KXYBR5PTLQHBPMKGMF3AFONT3XA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/POKG5KXYBR5PTLQHBPMKGMF3AFONT3XA/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--VsD3ApJSux4lzU26
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 01, 2023 at 02:54:45PM +0200, Takashi Iwai wrote:

> That's true.  The question is how more widely it'll be used, then.

Indeed.

> Is something like below what you had in mind, too?

Yes, or Andy's suggestion of just copying without trying to put a
redirect in works for me too.  I imagine there might be some
bikeshedding of the name, your proposal seems fine to me.

--VsD3ApJSux4lzU26
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTJEPIACgkQJNaLcl1U
h9A8iAf/VmHGSowoYOko6J42O7KZJk6ZjskuMxi0WOqbX1goKvceOkJwETo8Cfzm
MrLOBWuTXcN5avbnlMHgH9HUEXcDXBFq+IUj/thURpKG+qdVrdqIwhKMzUcobR5T
DwqVPa45MfFzLxWBZwtl1nYXit0CAgTpar2lRq9GCWfHv3dwMGLNmvI67USOGHN0
3F8lmVRbVBzlZwOU+CTq+VBey5YGevoARVwdbbjdCnZwGYFWsO8OSRX+L207+mGa
LUEf7DHkkhqnQn8YNjYJmQD9al7Yp1DWBPA9P33bVWXXD22WlsbTDX5ofbJUOVrx
roVhdFa8eRp+iqemnmwT0/1rr0LHoA==
=qtD0
-----END PGP SIGNATURE-----

--VsD3ApJSux4lzU26--
