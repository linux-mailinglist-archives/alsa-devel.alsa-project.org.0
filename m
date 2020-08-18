Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B97624834F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 12:46:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C4AB1758;
	Tue, 18 Aug 2020 12:46:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C4AB1758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597747615;
	bh=V2xRo09r41goWcHkv/TbZqQoAC4ijfdpV8AhWqNHVa8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UVzODmHSpS3j8gWzjmDLI6cnoalnrayhJwDX0EvJgIUoludO6qRH7lTjlx7JHsKuo
	 DzlZqZitKa9BPnkqYY2j4ucg3mrLxAMOWVlkMLOG5C6R5d8rIvKx+2i4nXBG+CtgF1
	 Heyve3G4TdT8TpKlbTIdNW9+9kjc6ezKMLifItOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ABDDF80228;
	Tue, 18 Aug 2020 12:45:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DA15F8023F; Tue, 18 Aug 2020 12:45:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA006F80114
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 12:45:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA006F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Fh5UJUtv"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4408204EA;
 Tue, 18 Aug 2020 10:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597747503;
 bh=V2xRo09r41goWcHkv/TbZqQoAC4ijfdpV8AhWqNHVa8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fh5UJUtv8etbELwMr2WpcfExLHbDpbyxc8JOao7kijScx1xcMrMp2cxAMpUru677p
 m9jcw94Zv7743Oy88oRexPOJWKKsp3xONJUS3/SWF4Dv6qL0cjeTppw8xJuMheqfxZ
 LTzaqXDgyTnnreT1mV1S2GX3/m2Q6XYGFyIC8AGc=
Date: Tue, 18 Aug 2020 11:44:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 00/10] sound: convert tasklets to use new tasklet_setup()
Message-ID: <20200818104432.GB5337@sirena.org.uk>
References: <20200817085703.25732-1-allen.cryptic@gmail.com>
 <s5hsgckl084.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline
In-Reply-To: <s5hsgckl084.wl-tiwai@suse.de>
X-Cookie: You're at Witt's End.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, keescook@chromium.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, clemens@ladisch.de,
 tiwai@suse.com, nicoleotsuka@gmail.com, Allen Pais <allen.cryptic@gmail.com>,
 Allen Pais <allen.lkml@gmail.com>, linuxppc-dev@lists.ozlabs.org
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


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 18, 2020 at 12:25:31PM +0200, Takashi Iwai wrote:

> Mark, may I apply those ASoC patches through my tree together with
> others?  Those seem targeting to 5.9, and I have a patch set to
> convert to tasklet for 5.10, which would be better manageable when
> based on top of those changes.

These patches which I wasn't CCed on and which need their subject lines
fixing :( .  With the subject lines fixed I guess so so

Acked-by: Mark Brown <broonie@kernel.org>

but judging from some of the other threads about similar patches that I
was randomly CCed on I'm not sure people like from_tasklet() so perhaps
there might be issues.

Allen, as documented in submitting-patches.rst please send patches to
the maintainers for the code you would like to change.  The normal
kernel workflow is that people apply patches from their inboxes, if they
aren't copied they are likely to not see the patch at all and it is much
more difficult to apply patches.

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl87sQ8ACgkQJNaLcl1U
h9AXXgf9Grt6q+diq7m3+Va9EPuojISFzp0rHACAAAE39g0r2Kzx/g53wYjT8uoA
Yr6dm9ajOxkGjqsZp4Zsp6iSabfuXuEAi9qBBBkCJlatDiEWwObS4X77VNUE82lo
U7d2ljdnsbtM/zTfYjc63OaAstv4bXWHm+NtjgJhiO155DifPsUOW8js8IPoSlN+
XDEPT0VVKs1syY90ef4oz7i/aTnOKLlGEejv1YHLRkvwmQyWbjZOo83UHSuB7IPB
GeTWC/+jE9ujCAKoCFmW8la4LWjfn8yV15s0LI7OFBFZZQoulBBhC7Dp316u5wsw
B2jWhNhnIJc8tG4nAuopeUqjHqIKYA==
=oDDH
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--
