Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE0E63F7B5
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 19:45:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3852D174E;
	Thu,  1 Dec 2022 19:44:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3852D174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669920325;
	bh=8Wa22vlIxqVif+YEexm4N5G0Rd6iBZ12UZO/kMJlisM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DZRGNVJ6tU7ax/aMnVNMugiUTXRw92bBEgfLHQ0deE3OT1EKPQAYlkYfQBvwtvZJL
	 j+OiTielizQW5ylXf+X5HGR3iocTkclo+TS18Xj2cPdIQOYJj8vBkVL03Vp+APgQ3f
	 DaNR8MEylnR4fEqM8+MPa6nQ1s584lsg9se7uyMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8319F804B1;
	Thu,  1 Dec 2022 19:44:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29DA6F8028D; Thu,  1 Dec 2022 19:44:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6151BF80118
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 19:44:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6151BF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o060qC+W"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 81824B81FCD;
 Thu,  1 Dec 2022 18:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EAFC433C1;
 Thu,  1 Dec 2022 18:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669920262;
 bh=8Wa22vlIxqVif+YEexm4N5G0Rd6iBZ12UZO/kMJlisM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o060qC+WesGG7xYXaauKt1r6m3dGhrfZZBJuixDk7j1JsVNF29q/OYWUTL1T6OsLu
 ceD6BT5eGvQkrKsFMvnrhh06SFl96cbT24Xr+YMes45lNPbpMH1qY9AhVCgK3OVUhg
 3Wexq8mBN8PMT+UD17M2isspjmvt5rjRsQHZD/KPyW1KkRw8Ew3L7LuaN97JmBftok
 2fqo38/7PWR6+TeR12eBk4WskHLS2ygZrEDDjlOuBXo9tRBMDmbRxILAW3bDfDMFjx
 3h+x/YXn3chps16e3xcaUbpiEcpZO6TeyUnmAsU44W9Z1sCTdsVi5e5GxTn8Z71Zam
 aRqchK1Qgxpsg==
Date: Thu, 1 Dec 2022 18:44:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v1 0/6] kselftest/alsa: pcm-test improvements
Message-ID: <Y4j2AS/UuLwqxARU@sirena.org.uk>
References: <20221130000608.519574-1-broonie@kernel.org>
 <a55212fc-a676-2335-b861-94ba8d10f207@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SOEil+iW0YdK9KEO"
Content-Disposition: inline
In-Reply-To: <a55212fc-a676-2335-b861-94ba8d10f207@perex.cz>
X-Cookie: Leveraging always beats prototyping.
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


--SOEil+iW0YdK9KEO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 01, 2022 at 06:42:22PM +0100, Jaroslav Kysela wrote:

> The current code allows to override "test.time1 {} test.time2 {}" blocks in
> the configuration files which is equivalent to "test { time1 {} time2 {} }".

Right, I was leaving that in place but just renaming so that the intent
of the test was clearer and expanding the standard coverage - trying to
make it clearer what the test was trying to accomplish when someone
comes along trying to do something later on.  It did however cross my
mind that we might be better off having the tests read from the config
file be in addition to the standard tests rather than overriding them,
I think that'd work out a lot clearer in the end.

> This changeset will introduce configuration lookups like
> "pcm.0.0.PLAYBACK.44k1.2.big {}" which creates another configuration
> structure. The '.' (compound level delimiter) should not be used in the test
> name.

I see, we could use another delimiter there easily enough (though if we
segregated the built in and loaded test configurations I'm not sure it'd
matter so much).

> My original idea for the next improvement was to parse the
> "pcm.0.0.PLAYBACK.test" compound and gather the tests for the given pcm. If
> this compound is missing, we can continue with the hard-coded defaults.

While it is useful to be able to specify additional tests through
configuration I don't think we should be relying on that for coverage,
we should have a more substantial baseline of tests so that systems like
KernelCI get reasonable coverage without having to get changes
individually integrated for boards (and then wait for them to filter out
into the trees being tested).  It doesn't scale out so well over the
number of systems that we might be running on, especially if we come up
with new tests and have to loop back over existing boards, and isn't
really idiomatic for kselftest.

I'm also a bit worried about the way we currently override the built in
tests, it creates additional potential for confusion when looking at
results if the test might've been turned into something different by the
configuration file.

> About the skips - the test should probably keep to support also the exact
> parameters. For example - if the hardware must support 6 channels, it should
> not be a skip but an error. Everything may be broken, including the PCM
> configuration refining.

Yes, there's a tension there between hard coded tests and the explicitly
specified per board ones.  I think the solution here is to add two tests
for things we read from the configuration file rather than just adding
by default, one verifying that we managed to configure the settings we
asked for and one for the actual test.

> I just sent the patch with my changes for comments [1]. It's just the base
> code which may be extended with your requirements. The skips may be
> implemented using configuration field like 'skip_if_rate_error yes' or so.
> Let me know, if I can stack your changes on top, or perhaps, you may be
> willing to adapt them.

--SOEil+iW0YdK9KEO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOI9gAACgkQJNaLcl1U
h9B/jQf8DMxv5OpmFAq0vIExqHv3nDip4HRsjAwLbj3Egv9RcjdKpGNjjCpvHZof
NB8QXCfPW3YejcROBd984HkQIoqyt1DXycYd5qi52pfbjFxy+KCiv/Tqr2cArUiQ
O/H0/ZGKbZOmhPd6KVR9aTJrVsV3W9NdlKc43FhI5aJVeF2AV5WR777ypeeRPTO+
oEK0PcJMaUyX9ms/xwUGSc4n8HHrmiSDx2zU6b2bSNgq7kasGAsSWBl3jDzeNypR
WcXgO8Jb+OiQjyYdw0PTBK7eeOQ9UxidjmVRcvjwUyN8hbbPeb9i2bPhn4pzQ/Zy
8ys5B5xz/6zpfxeQB5FMXnrGP3PTZA==
=TB2E
-----END PGP SIGNATURE-----

--SOEil+iW0YdK9KEO--
