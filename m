Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 160C329CB58
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 22:36:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FA0D16C1;
	Tue, 27 Oct 2020 22:35:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FA0D16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603834597;
	bh=CezU/dgj5+5orBpUNPrDSyKMRKG0im0x8YN75ut3nvo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vYGG3xKhJKJ7Y63v7Za76GadZRZdxtKg6xXKg571a0jy5meIg/CrzAdAMPES3nxfr
	 QOcHv/qJCCY1T0F0ZtsVcSmF9DTxllWZ2d7mWkQuwO93CLjerEhL1S0DMutTco1XuV
	 2bm3LjTEwoO3RV01NiUjPtbGqxI6dwIrmGJ9oreQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 344FFF80086;
	Tue, 27 Oct 2020 22:35:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9016EF8020D; Tue, 27 Oct 2020 22:35:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC4B6F80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 22:34:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC4B6F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="sbDvA38l"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Nz1cpbLS"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 931105803F4;
 Tue, 27 Oct 2020 17:34:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 27 Oct 2020 17:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=CezU/dgj5+5orBpUNPrDSyKMRKG
 0im0x8YN75ut3nvo=; b=sbDvA38lKlV3Myf7YFDHWT7g2d8dUkSuLFD84ZYAKVL
 +WVldz6qL8WCE/Uzj/8+qUDzbCPMi+9cWfJqcbSksccvEX3RgUk47VrQDf3OM245
 MmVU1MNmNfLhlqthIV7RebrjsLy/hiifeGuaxtA0upHDVNPOmmzDQxUHWE9fRKoP
 XhTUHdQwW4e6VKEFw9ULtKSrk1s25lG7ZZ8E1eZWqCZgFe+oxQ4yEJwMfKwLjh0B
 UwUc6kYieyzS2KrAQJYWbz+t2f+I3OZfiQ7H///vrEfkTfTF58Qy2DcYrTLsVM0d
 mvKufPfT6xnXYZLeZGAaV6p2xn+Cxk6UL5Rs2HE8SQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=CezU/d
 gj5+5orBpUNPrDSyKMRKG0im0x8YN75ut3nvo=; b=Nz1cpbLS25Dw7CsQif2C2s
 RL8tHiZ3e1Lws1hPpcYS/IqnDMc8ZFiB6DVrhLn7N3q2ZiKuuQPNcOUTpleRJwzM
 HPp9eOlAsgC7U44TeBzu07VNrNB1i3bTW3zvOF1iZmv/0cwznnqGeUnahoz+8+yf
 Sc+E9U5kgLNjkU0fI5/zJK+1E9oXClS9OnF6G2g+RXe3Pyl+cPZfTCfIMqBeZsuE
 030++v/mKaaqcfcbOetaknwSmDWnj9MwfSQ3jlJhgfAmGSVsDZIaesE6LQyFMfOT
 58hHeYHkcoxepRbjEPRoLncUyPcNA6ZC/ktwtUJV82xMz2q9L40Il9kS0cZxCMdw
 ==
X-ME-Sender: <xms:eZKYXwNy_8kp7QIDC_165xZQOn5t2Kd2IQqBiWOLkjMO2xLUqCicXA>
 <xme:eZKYX29Z7H5lh_RmePqHVxOQipDdsCBfknwF25LWPnFgzOhH32zZvUCS_mRjxxA0o
 -8I_nEmMeznNVLdVAM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeelgdduhedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:eZKYX3QmsA5eVPmhEes7rjlMCGTku1exXMkHulPUewAUKk5dtwOmYQ>
 <xmx:eZKYX4sDYNMH5lYzPGbxXyLheQSAo_tpKVIN1V6JigvzQuS438Iyuw>
 <xmx:eZKYX4coeE2inv7SzSVoH1U94EzJOsgbxQq1RBBuVM40aG2Wr16J0Q>
 <xmx:fJKYX5XqZSmy_VErqnXBPkdDc_HVlz8MsSpIdmc2KMWeLJTScVauow>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6712E3280060;
 Tue, 27 Oct 2020 17:34:49 -0400 (EDT)
Date: Tue, 27 Oct 2020 22:34:47 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] drm/vc4: hdmi: Avoid sleeping in atomic context
Message-ID: <20201027213447.3fhnkqqik3pbhw5d@gilmour.lan>
References: <20201027101558.427256-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rg67p2rixirimeqk"
Content-Disposition: inline
In-Reply-To: <20201027101558.427256-1-maxime@cerno.tech>
Cc: alsa-devel@alsa-project.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
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


--rg67p2rixirimeqk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2020 at 11:15:58AM +0100, Maxime Ripard wrote:
> When running the trigger hook, ALSA by default will take a spinlock, and
> thus will run the trigger hook in atomic context.
>=20
> However, our HDMI driver will send the infoframes as part of the trigger
> hook, and part of that process is to wait for a bit to be cleared for up =
to
> 100ms. To be nicer to the system, that wait has some usleep_range that
> interact poorly with the atomic context.
>=20
> There's several ways we can fix this, but the more obvious one is to make
> ALSA take a mutex instead by setting the nonatomic flag on the DAI link.
> That doesn't work though, since now the cyclic callback installed by the
> dmaengine helpers in ALSA will take a mutex, while that callback is run by
> dmaengine's virt-chan code in a tasklet where sleeping is not allowed
> either.
>=20
> Given the delay we need to poll the bit for, changing the usleep_range for
> a udelay and keep running it from a context where interrupts are disabled
> is not really a good option either.
>=20
> However, we can move the infoframe setup code in the hw_params hook, like
> is usually done in other HDMI controllers, that isn't protected by a
> spinlock and thus where we can sleep. Infoframes will be sent on a regular
> basis anyway, and since hw_params is where the audio parameters that end =
up
> in the infoframes are setup, this also makes a bit more sense.
>=20
> Fixes: bb7d78568814 ("drm/vc4: Add HDMI audio support")
> Suggested-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Applied to drm-misc-fixes

Maxime

--rg67p2rixirimeqk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5iSdwAKCRDj7w1vZxhR
xe5LAQD2z4jrHFI7lepdfsHTZyw73NdLCmF62GCIDGYB6AmypgD+KFUl+5dP9Xj/
iu2xv69jA6EvGgqK5hY1OaSNYbOXrwg=
=sECL
-----END PGP SIGNATURE-----

--rg67p2rixirimeqk--
