Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFBA750668
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:41:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BBDA207;
	Wed, 12 Jul 2023 13:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BBDA207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689162080;
	bh=AQKFgFokFJZ0D36WLuYt5xFZyXkBiD6JEbk0Lhmm5io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OZXB7whHpMmDeHPxktDA1Iqewr+zW1XdeiHJj2U7NnnhKhVuICT2XLD/t3EWzlBqZ
	 KTLQwYdaiX+sEh6OYmZRkWtwEd5uTmGL7DvXa1AsGf5P32UpGxhRok9VbNrWApFA6s
	 kplGcKBw5ubAgVG8NlMmCtpxnjip7wNSweklpBYM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3509F8047D; Wed, 12 Jul 2023 13:40:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A9E7F80236;
	Wed, 12 Jul 2023 13:40:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA9B1F80249; Wed, 12 Jul 2023 13:40:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7634F80153;
	Wed, 12 Jul 2023 13:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7634F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tNYsi7/R
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B017A6177B;
	Wed, 12 Jul 2023 11:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C670DC433C7;
	Wed, 12 Jul 2023 11:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689162017;
	bh=AQKFgFokFJZ0D36WLuYt5xFZyXkBiD6JEbk0Lhmm5io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tNYsi7/R58vyE3izPZ+M7HJtjrydR8H4ltCg0EEm1BFxAmEL0Lsbsraqy77rNgI88
	 uX1LGUK4vN9I6A20Kseq2/FC9+t0uX8YGAM0KxYsJV6wlD37huBSgX8C1SB76wP3cq
	 XUufv8Ae5CiMOV3QHJqXTMRi5zk+Son23cDSMeMnWLEVAn/NWYnqpEu1/9zKQtJ7+A
	 JC9ZjjGdhaL8qFD05bvoOx+sGQ5tVXwhYZN1TMhpQydlYOflj8Km8/9wYFS64lG7ja
	 HOq7eu2x1pc8QKHqNUwquIu9XTdVT83f7Mbw1mJ2XjgOJkjgnxinXkCuK4ZclBVZve
	 YmlqTyNcHPWmA==
Date: Wed, 12 Jul 2023 12:40:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Mastan Katragadda <mastan.katragadda@amd.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Hiregoudar, Basavaraj" <Basavaraj.Hiregoudar@amd.com>,
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
	"Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
	"kondaveeti, Arungopal" <Arungopal.kondaveeti@amd.com>,
	"Reddy, V sujith kumar" <Vsujithkumar.Reddy@amd.com>,
	"Prasad, Prasad" <venkataprasad.potturu@amd.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Paul Olaru <paul.olaru@nxp.com>,
	"moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] ASoC: SOF: amd: refactor PSP smn_read
Message-ID: <fa7e890b-f268-4b32-bb17-46b1e7a5cab5@sirena.org.uk>
References: <20230630070544.2167421-1-Mastan.Katragadda@amd.com>
 <20230630070544.2167421-2-Mastan.Katragadda@amd.com>
 <f3b7d7fd-2ce4-a579-0570-d55b04950140@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eU1hy69DHhto7nHm"
Content-Disposition: inline
In-Reply-To: <f3b7d7fd-2ce4-a579-0570-d55b04950140@amd.com>
X-Cookie: Dammit Jim, I'm an actor, not a doctor.
Message-ID-Hash: MLTFIN3O2Z2QTWLDKYVGTA7XCDPZL4EM
X-Message-ID-Hash: MLTFIN3O2Z2QTWLDKYVGTA7XCDPZL4EM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MLTFIN3O2Z2QTWLDKYVGTA7XCDPZL4EM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--eU1hy69DHhto7nHm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 04:38:46PM +0530, Mastan Katragadda wrote:
>=20
> On 30/06/23 12:35, Mastan Katragadda wrote:
> > Use the read_poll_timeout marco for PSP smn_read calls.
> This patch has not been merged.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

> > Signed-off-by: Mastan Katragadda <Mastan.Katragadda@amd.com>

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--eU1hy69DHhto7nHm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSukRYACgkQJNaLcl1U
h9Cngwf/dct2rAH3pitDj4DNfze5HGZm+l4oqJQLMAjQulG2irV1Dd5uJrRh5MN/
leAU5ohLd68XSdmn7LMt5Vmokj4DG7ugVO17pQmKw7RukJSqyYuMn1wTWDq5/MaF
ySY16FHhSJiQqMUsVPu3TIlJMeeqk5gJo+Zad0HSkH6O3bQzoSEQdHxXDn8op73M
cwOJ944vq85V2ZhGSnZ+txZbGBY1TpQLx1ppyabUR9/DT1GDcviTx72yOHqeMM/g
dn/YmFke3OlgQ5gSy5wjPk5nF3X3+65/w95MmOmKiZD5vZsTUz9UusUKRBSqloeC
eLiafzfNZluMy0rEAQqfCeESh4cSlQ==
=yt9v
-----END PGP SIGNATURE-----

--eU1hy69DHhto7nHm--
