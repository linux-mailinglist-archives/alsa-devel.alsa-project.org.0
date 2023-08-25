Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B61B7884F0
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 12:29:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36FF783E;
	Fri, 25 Aug 2023 12:29:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36FF783E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692959390;
	bh=WR5rJnMPFIZbEiu4b92VXv4anq8fAF3KLyv5xA8v0MY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lte8KQGr7Wo1InF3gte7RvQfncQ+iW0uXCADIqWXlkydOA6u7aSRgDWwjEGaJ4Fyl
	 +qyCRbSfQFZmfFWGVWnL0GpKSMl9SboUO+WdDaR7m0aNsf9WhuI1cgIrLB1rzThGOf
	 wrI1Wfg5q+kueQn0IiuhkcIo4JUBqpstRLbVHXqs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65BBDF80074; Fri, 25 Aug 2023 12:28:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA439F800AE;
	Fri, 25 Aug 2023 12:28:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A440AF800F5; Fri, 25 Aug 2023 12:28:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42106F80074
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 12:28:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42106F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lw9HMWnR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26CE562FB9;
	Fri, 25 Aug 2023 10:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1794C433C8;
	Fri, 25 Aug 2023 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692959320;
	bh=WR5rJnMPFIZbEiu4b92VXv4anq8fAF3KLyv5xA8v0MY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lw9HMWnReyvbebZjrH+X9I3k21rtlkBbHd6UEGDrlEHZvQDizzeEYySgTxpa4CcEf
	 SlHl/iGJw9lMPXeBNRSL/CKUPO3rKxYCwYghx9JbxpToYYdciemjH1k3GyyUARfYLV
	 4Dr31J46FVIoi891flKwEG3sC36pPt8JV9dtEFlsgoUcOadPMKuk/AILxASCO7ipyq
	 4nBP8VjTrUCt1h5KWYxOMfY/9RIfusu74+PaHgCzlfomG57cCExdNtYgRKun2fYm8I
	 x0n6wT6qwxWdiEw3Cmk63PkyX1CZI/aUwPXaTEY62PryuK0rsEr91GMKfGV1cOAux/
	 GwrXKrt1PeRzg==
Date: Fri, 25 Aug 2023 11:28:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND,v3 2/3] ASoC: mediatek: common: revise SOF common code
Message-ID: <ZOiCVCJMaNX9Xhgy@finisterre.sirena.org.uk>
References: <20230825024935.10878-1-trevor.wu@mediatek.com>
 <20230825024935.10878-3-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qZGV3Md4Y3CzMmE6"
Content-Disposition: inline
In-Reply-To: <20230825024935.10878-3-trevor.wu@mediatek.com>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: K25AI2DRJQZLWHWNOBVYYDKJYFKQC7WD
X-Message-ID-Hash: K25AI2DRJQZLWHWNOBVYYDKJYFKQC7WD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K25AI2DRJQZLWHWNOBVYYDKJYFKQC7WD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qZGV3Md4Y3CzMmE6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 25, 2023 at 10:49:34AM +0800, Trevor Wu wrote:
> Originally, normal dai link fixup callback is overwritten by sof fixup
> callback on mtk_sof_card_late_probe and it relies on the mapping defined
> on struct sof_conn_stream.

Angelo?

--qZGV3Md4Y3CzMmE6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmToglMACgkQJNaLcl1U
h9Dv3Qf+POxM9sVWwvYGhP7SaK28bRrbWzMUGisxBE2aZby/aauTn/kZqgsiks2R
Etc8yDkOPbuDz/xyjvRda6ABgbQ7HYduuhcHxOmkfJMaAkRUtFG9kUJ0ILE2+lMV
CBP+y2Qtn1Zqfp4Fr6Iqq055uAWv70LtGNCeMeWuDBh9Insy2HVGQ04sN0voOKzl
x5rQNFFrriXLVejqXNaQiqON/h4XqKuSBX+4ev+rGORpy5fzSPamX/+ZnPqYtbeK
zs0dBIRZF4EcqHWvq5nhJr7VxUg9ROUeTnoXvMYWEtJMK1JsTtM0b8pYmz/3JFxr
bToxhRrTPnbUzLetGKrgYTRtpJEHaA==
=bFHg
-----END PGP SIGNATURE-----

--qZGV3Md4Y3CzMmE6--
