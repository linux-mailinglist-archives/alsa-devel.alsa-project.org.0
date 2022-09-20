Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0685BE62F
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 14:48:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 394E9827;
	Tue, 20 Sep 2022 14:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 394E9827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663678134;
	bh=RRwEDdzsiJwVDdN7Loshf7NwpcVUiSKtHEmbew7P/7g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TbTQFUOdYpTY9s9O3Vm25KhZumuSSlEno2kyOn49r2ZKRF83GV7YxzzN+7L2ak7+q
	 MrfindY89L2qQ7dlpitwhGWLGYt/CV2fb81ZM2UXO/XkBcbfPccTxdv8IYGJz5DWT7
	 3Judh6AMzY+eWx/4SWBznU7KpxJ/7u7ia+mVxTU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7782F80171;
	Tue, 20 Sep 2022 14:47:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3588AF80155; Tue, 20 Sep 2022 14:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1120EF800C9
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 14:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1120EF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="li2UayTE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F56661ED6;
 Tue, 20 Sep 2022 12:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59790C433C1;
 Tue, 20 Sep 2022 12:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663678064;
 bh=RRwEDdzsiJwVDdN7Loshf7NwpcVUiSKtHEmbew7P/7g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=li2UayTEQu/yxQ505S7nLcJCDTFYodPdE4nusON6PPEKrmQ4P/d9rWCnhgTHc6/Ut
 j7HxVnnAdbz6lwo5Dfvodbmx4NdNBqoLfiWcWabd8Q4+xTWz1uesP2W3tIO+wb5Uip
 mCfII3IO4S4eQ2yeYeOqAkzjLDEvmT9p66/lqdzEXjWxX+EW77nT8/w7zVHfXOMNC0
 aSyfB9MxCX3aB2WXDlMbXqV4xQEuccDVRlw909BbULoYHeMOw56YagXzVAmWQOJ8/G
 iKvePHZtdHoRutMKDorlwHyzrvaPt2s06hfLvNAFR87KgizUjtLdhq+BhAj/VLPwRX
 C+Ao4SSdFlxSQ==
Date: Tue, 20 Sep 2022 13:47:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Zhu <jason.zhu@rock-chips.com>
Subject: Re: [PATCH 1/1] ASoC: soc-dai: export some symbols
Message-ID: <Yym2aURe2+pA3ocn@sirena.org.uk>
References: <20220920034545.2820888-1-jason.zhu@rock-chips.com>
 <20220920034545.2820888-2-jason.zhu@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lT/HPWHa55bbCw1w"
Content-Disposition: inline
In-Reply-To: <20220920034545.2820888-2-jason.zhu@rock-chips.com>
X-Cookie: One FISHWICH coming up!!
Cc: sugar.zhang@rock-chips.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--lT/HPWHa55bbCw1w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 20, 2022 at 11:45:45AM +0800, Jason Zhu wrote:

> Sometimes we need to make some dais alive when close the card, like
> VAD, so these functions must be exported so that they can be called.

I'm not sure I fully understand the use case here - why wouldn't
the core know about the audio stream being kept active?  For
something like VAD I'd expect this to be just working like a
normal audio path, if there's a DSP consuming the audio stream
then it'll keep everything open.  If there is a good use case I
suspect it'll be clearer if you send the users along with this
patch.

--lT/HPWHa55bbCw1w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMptmUACgkQJNaLcl1U
h9Cvbwf/YoiX+CDKXy2Gu+Lgre+dvD73tpQ+9kBu2tkEiiykh+vXiQImSQWRiFo6
1WSUiE1Z5+Y6Br4M4HeBRZ6z/3H33ozQhUiBoLzVt5ErJix9GEsBXUv9owTet9pq
InUi5dD2VvnD0yZwN1p+QX+cN0aGsCScFYwtDpx80tGebYUTHZ9FtqoSSxPFKtDu
aZKiSWREGPA2T/S0/eH+oXlvjhu67SohqzLQxB1PNQ2NaW5UZEX2Z6pqeRjHfSfO
iWFWm+rCOelwB/PMUQZESB0DlX08sQLtOY34iS2/QsLkm3H3rryYW8yVgmRyo+QI
WpyDUJ4cXmm6a02NjlpyfHr8YcFuzw==
=xhBJ
-----END PGP SIGNATURE-----

--lT/HPWHa55bbCw1w--
