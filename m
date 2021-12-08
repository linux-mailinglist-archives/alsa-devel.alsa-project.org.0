Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A13846DB63
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 19:41:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08A07251D;
	Wed,  8 Dec 2021 19:40:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08A07251D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638988884;
	bh=qg7tK4XkdsAtUIRtwJYp+FmwaKvcGXkqB7uE9WmRf7U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VXw05q9jPYBJBEgozSgw2w5PPyRprZ4/rh4imAxHayiSgi3VTrS0h7jDDhnBbIHr7
	 h7XSjv+G83wH4EmDWjaSE3ybZcjoAjePpfDfGZaBGRAlUn2OzSROheSwSPybe5WM9b
	 Fcd2EIirV+6QMp/Hw+wy4QUsKKY/gPx7vMLBEKfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F32DF80217;
	Wed,  8 Dec 2021 19:40:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B47FF80217; Wed,  8 Dec 2021 19:40:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A62BFF80217
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 19:40:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A62BFF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tAHWuE5X"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7D8EFCE2033;
 Wed,  8 Dec 2021 18:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43EF1C341C7;
 Wed,  8 Dec 2021 18:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638988796;
 bh=qg7tK4XkdsAtUIRtwJYp+FmwaKvcGXkqB7uE9WmRf7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tAHWuE5XulXWELwI5J1v+8rJRzYLKu/th6ertmSRihsiV2kS6Hry3bVhQRNAAV3NU
 zA64K9U0QwdL+Nb0IVcCEnOGxWCCahXJlo2qf0SpNpYUGY5OetqE1P3HF8GuCCCyml
 vcEJCA+OHwsU4Prpkl28xyFFVoxedEhRs/yjrwJCN/JapfnVOWD5d9f2t05OVRNtxD
 FqJQyJw9t9O9hcEjHBaOsZiQQs2yJOA7bi+qdN194wXOgO1a2PRNje4bxZ+TBabqm5
 iT0sKPrbhiuROdJk8MGE7LZHIWfu5839e6AmoFsTx3KTkCzn4XaDCYUysLOF1u68dp
 3k7/K9wso9IdQ==
Date: Wed, 8 Dec 2021 18:39:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] kselftest: alsa: Add simplistic test for ALSA mixer
 controls kselftest
Message-ID: <YbD7+C74DFlZEokt@sirena.org.uk>
References: <20211206160305.194011-1-broonie@kernel.org>
 <de0c5677-c2cf-d1ab-68c5-2f410d17b66c@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aRILJPDDQZM38Bc7"
Content-Disposition: inline
In-Reply-To: <de0c5677-c2cf-d1ab-68c5-2f410d17b66c@linuxfoundation.org>
X-Cookie: Alex Haley was adopted!
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
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


--aRILJPDDQZM38Bc7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 10:42:35AM -0700, Shuah Khan wrote:
> On 12/6/21 9:03 AM, Mark Brown wrote:

> > +SOUND - ALSA SELFTESTS
> > +M:	Mark Brown <broonie@kernel.org>
> > +L:	alsa-devel@alsa-project.org (moderated for non-subscribers)

> Please add linux-kselftest list as well here.

get_maintainers pulls it in from the wider entry (the mention of
alsa-devel is reudnant too).

> > +int num_cards =3D 0;
> > +int num_controls =3D 0;
> > +struct card_data *card_list =3D NULL;
> > +struct ctl_data *ctl_list =3D NULL;

> No need to initailize the above globals.

They're not declared static so the initial value is undefined.

> > +void find_controls(void)
> > +{
> > +	char name[32];

> Use SYSFS_PATH_MAX =3D 255 like other tools do?

This isn't a path, it's an ALSA limit for a name that is embedded in a
struct (snd_ctl_card_info->name).  There's no magic define for these
lengths.

> > +
> > +			ctl_data->next =3D ctl_list;
> > +			ctl_list =3D ctl_data;
> > +		}
> > +
> > +	next_card:

> No need to indent the label

No need but it looks wrong otherwise - it's certainly what I'd expect
for normal kernel code.

> > +	if (snd_ctl_elem_info_is_inactive(ctl->info)) {
> > +		ksft_print_msg("%s is inactive\n", ctl->name);
> > +		ksft_test_result_skip("get_value.%d.%d\n",
> > +				      ctl->card->card, ctl->elem);
>=20
> The two messages could be combined?

The user facing control names almost always have spaces in them so while
it's useful to have them for diagnostic purposes I don't think it's a
good idea to put them in the KTAP test names, that's likely to confuse
things trying to work with the KTAP output.  The general pattern I'm
following for these tests is to print one or more diagnostic lines
explaining why a tests was skipped or failed with the human readable
control name so people can hopefully figure out what's going on and have
the KTAP facing name that tooling will deal with be a consistent
test.card.control format for parsers and databases dealing with test
results en masse.

> > +bool test_ctl_write_valid_boolean(struct ctl_data *ctl)
> > +{
> > +	int err, i, j;
> > +	bool fail =3D false;
> > +	snd_ctl_elem_value_t *val;
>=20
> Add blank line after declarations.
>=20
> > +	snd_ctl_elem_value_alloca(&val);

This is idiomatic for alsa-lib code.

> > +int main(void)
> > +{
> > +	struct ctl_data *ctl;
> > +
> > +	ksft_print_header();

> Add a check for root and skil the test.

There is no need for this test to run as root in most configurations,
it is common to provide direct access to the sound cards to some or all
users - for example with desktop distros the entire userspace audio
subsystem normally runs as the logged in user by default.  alsa-lib's
card enumeration should deal with any permissions problems accessing
cards in the system cleanly.  If the user running the test can't access
any cards or the cards that can be accessed don't have any controls to
test then we will find no controls during enumeration, report a plan to
do zero tests and then exit cleanly which seems reasonable to me.  If we
do need to explicitly bomb out rather than report zero tests we should
be doing it based on the number of controls we find rather than the user
we're running as.

--aRILJPDDQZM38Bc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGw+/cACgkQJNaLcl1U
h9ATXwf/RFucHFfZAKm1nsoZEt1MUBOS9jAryVUkGvnvwmoNV+DO2DrnD0dPFQf3
LU3JcjG+IXSQbI0sHEjXAeRz3jR7q58OwcR8Bsd64Bl7znV380FF4bIThuMXy4D5
q1LhgRWA7jCl5t1zChQBoFasomX6QsympY7wmW39IEX5Lu5e/91flf1udLHYGiQe
c9Dgk+7/bO1I45j/ajRNgu6Vsx59mk4E7s45FkPYPPRSkhX8OFGho4yDYEgJsWNn
/xZDb8evoq/r0c2Tthuhozsg0o7JqJz+yD6/CzeBvfFCOeWuu2t5XKNq8nFE7Qbm
5tUFrgwJc6mt/skc34LwU/lXNhP/eQ==
=AFXz
-----END PGP SIGNATURE-----

--aRILJPDDQZM38Bc7--
