Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F9410F37F
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 00:34:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 873E51660;
	Tue,  3 Dec 2019 00:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 873E51660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575329689;
	bh=17D8Oze3e4sv1OXaeeLo5+ZG2FLgFhHStGK9nL11h74=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mZgmM36pbQspiuNUawQz3BMV6+/eKxdJjX4J7G7Sx8sHEiHV9KknsMgsVmMouuzHQ
	 YW7G6RqMwqwxe6QL2DcRoN0WwTcKnth30mqzXalHCwi6Eg4haZcwjptGDcjCdn/mPT
	 /+9v2tJi1pXnQxOdeCVbK2q1xSZfG979e2Caj3o0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCCFFF80217;
	Tue,  3 Dec 2019 00:33:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECD83F80214; Tue,  3 Dec 2019 00:33:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A3DCF800F0
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 00:33:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A3DCF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="cRAxm2E5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dR1pr/QJeTge74krgjlYVc/XtSbgI69Wb6sUWs++sSo=; b=cRAxm2E5hYvEvO+otgm6rX/a+
 WvFxyaN4WsuxCdiLEKPusAaGiEnPPX9lNysfs8Mj+/0oiHOgJi7RZMKzMndzsQ05JHA7x8tN1yh2h
 +Kwo6aPaSwkR+2fcxuZRGDW7eG3ClBtQ4bZmYtKCKZLdBZDHIEAekk26nDq4LRigvkOtU=;
Received: from 94.196.177.28.threembb.co.uk ([94.196.177.28]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ibvBb-00079g-Re; Mon, 02 Dec 2019 23:32:59 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 630CFD0026A; Mon,  2 Dec 2019 23:32:57 +0000 (GMT)
Date: Mon, 2 Dec 2019 23:32:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191202233257.GG1998@sirena.org.uk>
References: <20191126142815.21856-1-pierre-louis.bossart@linux.intel.com>
 <d86b3869-274c-e96e-69d6-9122dc044ae3@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <d86b3869-274c-e96e-69d6-9122dc044ae3@linux.intel.com>
X-Cookie: Cleanliness is next to impossible.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 00/10] ASoC: SOF: initial cleanup for DT
 and multi-client support
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
Content-Type: multipart/mixed; boundary="===============0804971874913748852=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0804971874913748852==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hTiIB9CRvBOLTyqY"
Content-Disposition: inline


--hTiIB9CRvBOLTyqY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 02, 2019 at 02:39:31PM -0600, Pierre-Louis Bossart wrote:

> > Daniel Baluta (2):
> >    ASoC: SOF: Make creation of machine device from SOF core optional

> This patch conflicts with Jaroslav's "[PATCH] ASoC: intel/skl/hda - export
> number of digital microphones via control components"

> I will resubmit a v2 when Jaroslav's patches are available in Mark's tree.
> For SOF development Jaroslav's changes were already applied and the confl=
ict
> solved already.

If you want to respin this series with Jaroslav's patches also
wrapped in that'd work just as well and get everything merged
quicker.  I've just got stuff in my to apply queue so far, not
actually applied anything that you can't see in git.  Waiting
till after the merge window is also fine but if you did the
merge/rebase already seems like you may as well post.

>=20
> >    ASoC: SOF: Remove unused drv_name in sof_pdata
> >=20
> > Ranjani Sridharan (8):
> >    ASoC: SOF: topology: remove snd_sof_init_topology()
> >    ASoC: SOF: core: modify the signature for snd_sof_create_page_table
> >    ASoC: SOF: core: move check for runtime callbacks to core
> >    ASoC: SOF: Introduce default_fw_filename member in sof_dev_desc
> >    ASoC: SOF: partition audio-related parts from SOF core
> >    ASoC: SOF: intel: hda: Modify signature for hda_codec_probe_bus()
> >    ASoC: SOF: remove nocodec_fw_filename
> >    ASoC: SOF: nocodec: Amend arguments for sof_nocodec_setup()

--hTiIB9CRvBOLTyqY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3lnyMACgkQJNaLcl1U
h9DkOQf+Oy4HJZaTdADI0fUxz5z0Fq255X9lbTE5+EVlWRaRq45YQCvoLaMXPIBq
y/4ZRbq/bq5zYWEmiGnXiI/Y8jbUXeTUNy5gr6HmsvC68OLlJPkXfLhDAgZrA7PB
satwKsTP8li0LOCZWEiw3nak3T5Vf2T6XtoHsCcS6oY20rDOGXB1MKmKZlSUHH4j
UPGAZspJqZRO1TcNeqWv7V+Ij3xMFuMPgfH794K41747i+nMETyUKR5Z1BXOrN+5
fB6Fqjendor2tOhNa0uNN1AXtG3+LjGGCTkPg6CpyLJ1bBfZ7Z+WQZ0AfXBAO9FV
C4nHawX9QWyusGkJ5pMVo6ObNx5GjA==
=OCGj
-----END PGP SIGNATURE-----

--hTiIB9CRvBOLTyqY--

--===============0804971874913748852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0804971874913748852==--
