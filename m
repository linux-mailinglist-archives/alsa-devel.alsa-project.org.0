Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 018DE63F922
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 21:31:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A3D61786;
	Thu,  1 Dec 2022 21:30:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A3D61786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669926662;
	bh=Od0AD5DBVzEiXrFV85VI5bd5miG2W796RKeGwL2sr/Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tM43WsQOImEOZ8R4z3NBmEgTVtXrmWqShy3Gd5OWZo6BlXTGfSY79MYeHsojMniJJ
	 13s6XNDXJuO9hp1faPqNalp19Iabt/3glVXE03Jbkw23d7v/BnTmYONWOPnKd16rS7
	 GF70Wf6Sel7Jc/zA3uGlj5qkwWOtdXyXhajaFJbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20F8EF80118;
	Thu,  1 Dec 2022 21:30:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0275DF8028D; Thu,  1 Dec 2022 21:30:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 351F5F80118
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 21:29:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 351F5F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mOEws95x"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 873BE62080;
 Thu,  1 Dec 2022 20:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FA4C433C1;
 Thu,  1 Dec 2022 20:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669926592;
 bh=Od0AD5DBVzEiXrFV85VI5bd5miG2W796RKeGwL2sr/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mOEws95xl5zLJaZb6aIAVA2mfdtDGM4Ib/f7wD/4DO0SiseRZQQSJ4nKQbO3N1+2c
 Vwjzm/beXXkoikLJdNN6szSogF7JSYX5pmJOhMUzWQGXZ55okTJrHT046XiaU63zn0
 21wEl9j4NLXYdHF7DsPzob28jBCqcSl6mlsluvztvS3zgUPTElAcIk/jDHVPqVQnUy
 ZrFTPSAWlmjNbJSkaUjIl50DHSBTQ1y74Kz6mw77+pusQFvQwo+PofYZCZnagrODxl
 TgU0yWG2yA1xlHhlho58lQiHEoYs1lKF/uZf1Ob+LxoZizVB5fjPx2oc24xxqxTgxa
 J5NAit4zKf8Lw==
Date: Thu, 1 Dec 2022 20:29:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v1 0/6] kselftest/alsa: pcm-test improvements
Message-ID: <Y4kOvNi5I8/GK1yU@sirena.org.uk>
References: <20221130000608.519574-1-broonie@kernel.org>
 <a55212fc-a676-2335-b861-94ba8d10f207@perex.cz>
 <87359zlz9t.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YYXR5ynsa7QqFwTf"
Content-Disposition: inline
In-Reply-To: <87359zlz9t.wl-tiwai@suse.de>
X-Cookie: Leveraging always beats prototyping.
Cc: alsa-devel@alsa-project.org, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
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


--YYXR5ynsa7QqFwTf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2022 at 08:06:22PM +0100, Takashi Iwai wrote:
> On Thu, 01 Dec 2022 18:42:22 +0100,
> Jaroslav Kysela wrote:
> >=20
> > Let me know, if I can stack your changes on top, or perhaps, you may
> > be willing to adapt them.
>=20
> As Mark has already sent a v2 series, I applied his v2 at first.
> Could you rebase and resubmit on top of my for-next branch?

Oh, this is getting a little confusing - I'd just picked Jaroslav's
patch into my tree and was in the middle redoing my ideas on top of his
code!  I might have something more later this evening...  I think we can
converge here, let me continue taking a look.

--YYXR5ynsa7QqFwTf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOJDrsACgkQJNaLcl1U
h9C/WAf8CLgm6NcrQknYcMIw1V3IqwqHTcxlDhTiq4NYafIjUOMXWaNSJVtPgu1V
TbroqPWv5McRKkXzB87ZKcwX6ITGMpDHbUjKqIBgt9Q9TrJF77GVYomDGPoQpHuz
btGf+zLCPowAeW6X2PUeRkP43VFOvDNbnzePJULqc4YJCt4+0dNwy32y+gRQeu+1
feYBc/B8GnmdzqKDZkFqtZfZN530GBDWJBAALk9E4OCrxGd/U4ZAk8Xk5rb+a5SM
4nUx3ypoUWVA6QXvVTMmytD956ic5bYtbX/FqRpYs+Wmc9RBe6O40TAdhvMuw4D2
z6UttiUWsHorXMYSBUhQvBCQX9kQYQ==
=3940
-----END PGP SIGNATURE-----

--YYXR5ynsa7QqFwTf--
