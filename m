Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 636B933FA46
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 22:07:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF77A16AA;
	Wed, 17 Mar 2021 22:06:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF77A16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616015232;
	bh=jjRvmN6LnZWd7Pg/uJ3nKtg2PF98sTAyBtnv4fDFBvM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qzKQK+xkvbXy8TwyRFTdrfzcDWcmHoxEAzcgTeo5QdKuzmivQvZuo8XIIhZLBdeFs
	 BX8yDeDfTSWYirsC/E/hqHMSPeiEzEuwn0LPmPIWTY3/XO4WcWN3QfmNiAu0y1U3Wz
	 pLidPxOgW7jLCJcm5KCPLVnpHorFjnGyWWpcu7YY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3736CF8023C;
	Wed, 17 Mar 2021 22:05:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1736F8021C; Wed, 17 Mar 2021 22:05:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FF62F80124
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 22:05:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FF62F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V1eRqTDm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C918B64E89;
 Wed, 17 Mar 2021 21:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616015134;
 bh=jjRvmN6LnZWd7Pg/uJ3nKtg2PF98sTAyBtnv4fDFBvM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V1eRqTDmqSEjWDcyjvC35B+M9qNiEP64iysLEAs8PpwwWgcu3rUCoHwNN9/7Y3QgZ
 oqpMU2Nbsf7TxUqe9qqeIhpJ/tfXCzFSpFUodaumF3AXhFq6Tj+W3gNeH7n5loOhzF
 0L5Babg4QKQjI/1InHs8RIBplcrj2f+LWLtSVjR0FsyblowVABAvBBzpNLWviPSp+q
 clyZl+zjVglP/+eRnKDL5HhzFvc3f8Prj24MXF5E2YNrec7q4CLQ9EpFhLvyukVOJV
 Ji2bzvehAnBt9sT2gaQei8+9h45EoAtm+jjb6ngSXrtzQ44JvwixrcVN4ylJeZFG83
 Ss9HVmhIIX4Ng==
Date: Wed, 17 Mar 2021 21:05:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: Add Rockchip rk817 audio CODEC support
Message-ID: <20210317210530.GH5559@sirena.org.uk>
References: <20210317202117.29926-1-macromorgan@hotmail.com>
 <SN6PR06MB53424766F673FC2427CD9AD1A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20210317204453.GF5559@sirena.org.uk>
 <SN6PR06MB534202C2ADB33A0CD0AF77C0A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h3LYUU6HlUDSAOzy"
Content-Disposition: inline
In-Reply-To: <SN6PR06MB534202C2ADB33A0CD0AF77C0A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Cookie: Please ignore previous fortune.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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


--h3LYUU6HlUDSAOzy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 17, 2021 at 03:56:54PM -0500, Chris Morgan wrote:

> The compatible is still needed so that it can be registered with the mfd device itself in the cell.

I can't parse this?  What does "registered with the mfd device itself in
the cell" mean?  If you register a MFD cell then the function device
will instantaite based on platform bus matching.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--h3LYUU6HlUDSAOzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBSbxkACgkQJNaLcl1U
h9AXAwf/ZSTq0Yu+WGVY/CLNNZ9BO/pz33T0w27nf0EqxPKYkSF5s1ZVPhmdsIvO
LnBo8u/unJAEz7lxRG+1A1EL22Jqa/8ZwBtYkGKONfe2qLlBWygTqwDmhApKWukQ
TL1PHYTOOk2k/7pjU3oJN4tEfoFE6Eb1pZpbUPnQE7uDuSOGgVjiJIvYRSCx3urv
A5Xz4zgI7OqQ9C6oif8Zd9ymEYem5FX+nZHbp2KaiY5C95BpnkJONPBmsn4dkzdr
5Jjgr997n/CF2868qDFZn5zWJ0NuYbBHrwHRDVECH529tCW0tWsRpo119fqsL9Fn
njSYIPn4OBnapLZKstVUOcVQ6Q/9SA==
=mSxh
-----END PGP SIGNATURE-----

--h3LYUU6HlUDSAOzy--
