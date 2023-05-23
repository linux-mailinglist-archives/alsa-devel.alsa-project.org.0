Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 059A170E5DB
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 21:42:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91471204;
	Tue, 23 May 2023 21:41:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91471204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684870955;
	bh=0k+c3qp+hT/FnTIabF/tvyr485sFCPqurohdQ1Wmvg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ed7bS7wIKKVyovaSyljC68Q/pNv+oclzNTyaSOfyJvdrVVAgdGy0QBKMrnDYwFng2
	 Mgc3eoLIMCF5fNEDf5JGipvMYytV5tw1Pj6I0MKuyli8UjoVCobIVx1Cm8cPHoZKZ3
	 9EuKnSkADg+MoqukY7X7KNP95SsMWlZtLyBKmMWU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF6DCF80548; Tue, 23 May 2023 21:41:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E6EEF80249;
	Tue, 23 May 2023 21:41:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69DD3F8024E; Tue, 23 May 2023 21:41:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE68EF8016A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 21:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE68EF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YTWYaq3h
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 43181601D7;
	Tue, 23 May 2023 19:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D8EC433EF;
	Tue, 23 May 2023 19:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684870894;
	bh=0k+c3qp+hT/FnTIabF/tvyr485sFCPqurohdQ1Wmvg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YTWYaq3hcBNFbJEBhhlcfrhVNacPYmQemdO5J2oJyFCamj+S9mFXmcLKNMQ4veADS
	 Xh6Az6Ex1dQfeonR2xlXbtxBqnY4UUBlK62T+6JLln+YzuvwbJ8ujowyug7b0L7DsO
	 we9q1cH+VMYZ8W/9YqcnAFGGvAuZ6XGgoFHdXtut2xEAvmu++lAWxDsm9JzgPawolK
	 garDBhdL3brQxCRzbMj1yxZkmF67RAm4zH7VwqOZ0JE1L40AA8/HY2uTQyEFghVYVJ
	 JiMKre9XPM0ByACQ16d0CZIGB3YmSR8Rto9bCXhp2as6lpyK4BcDKFAqlrmQDWl5ad
	 /ejcOqyGF4aVQ==
Date: Tue, 23 May 2023 20:41:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rt5682: Use a maple tree based register cache
Message-ID: <92ec3b6d-999e-4b35-8bce-b0213824eb63@sirena.org.uk>
References: <20230419-asoc-rt5682-maple-v1-1-ed40369c9099@kernel.org>
 <1ce6bb84-3140-3953-e995-00eb7b16f386@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FkDjINFkwfZZX0BZ"
Content-Disposition: inline
In-Reply-To: <1ce6bb84-3140-3953-e995-00eb7b16f386@linux.intel.com>
X-Cookie: Beware of low-flying butterflies.
Message-ID-Hash: IYEUFWVNTQAZFMFDPXUIYPW4ADONHYDO
X-Message-ID-Hash: IYEUFWVNTQAZFMFDPXUIYPW4ADONHYDO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IYEUFWVNTQAZFMFDPXUIYPW4ADONHYDO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--FkDjINFkwfZZX0BZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 02:24:53PM -0500, Pierre-Louis Bossart wrote:

> I don't see any other changes to this codec driver and the first problem
> detected seemed to happen when we did an upstream merge last week.
> Unfortunately the last merge was on April 24 (sof-dev-rebase-20230424)
> which is just the day before this commit was added...

Try this:

=46rom 5953e9de359674ff2d95fe4c241bc7880d6d0d82 Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Tue, 23 May 2023 20:40:22 +0100
Subject: [PATCH] regmap: maple: Drop the RCU read lock while syncing regist=
ers

Unfortunately the maple tree requires us to explicitly lock it so we need
to take the RCU read lock while iterating. When syncing this means that we
end up trying to write out register values while holding the RCU read lock
which triggers lockdep issues since that is an atomic context but most
buses can't be used in atomic context. Pause the iteration and drop the
lock for each register we check to avoid this.

Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/base/regmap/regcache-maple.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regcache-maple.c b/drivers/base/regmap/reg=
cache-maple.c
index 2d2d5d7ee447..14f6f49af097 100644
--- a/drivers/base/regmap/regcache-maple.c
+++ b/drivers/base/regmap/regcache-maple.c
@@ -203,15 +203,18 @@ static int regcache_maple_sync(struct regmap *map, un=
signed int min,
=20
 	mas_for_each(&mas, entry, max) {
 		for (r =3D max(mas.index, lmin); r <=3D min(mas.last, lmax); r++) {
+			mas_pause(&mas);
+			rcu_read_unlock();
 			ret =3D regcache_sync_val(map, r, entry[r - mas.index]);
 			if (ret !=3D 0)
 				goto out;
+			rcu_read_lock();
 		}
 	}
=20
-out:
 	rcu_read_unlock();
=20
+out:
 	map->cache_bypass =3D false;
=20
 	return ret;
--=20
2.30.2


--FkDjINFkwfZZX0BZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRtFugACgkQJNaLcl1U
h9CWcgf9EaTd3BkCsWHJcyaj9CFfx161IAItun5Zers1a7vr2zo5DqQS8H9F2ROL
oGxOS9shq4q7MFCP0HDlLnI3UI+IkTUZruC777xkOc2mlbsWYGsXIPiaGuCuuUvH
2iZi9Fl+LPNVCQKMp7aqzSa7atoR34PVvFESsUALPjW9Rqd/y9O5E5XkCf/Nls5Q
zTfQ+QaTXuBjYgqEEpp6PEY6jug5OJmkjJ+qLBZ2qVgkeDFIyjti0kh/+68sAPwh
gTHldc2idDqnNAiAqznJ5djh7gMXdolT1RBM+YG1DK6nKrgIB1gpIiy70e0WWcFD
QXU1H6k0ROA8RdfaJqOxLYyiR++joQ==
=zZvr
-----END PGP SIGNATURE-----

--FkDjINFkwfZZX0BZ--
