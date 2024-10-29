Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 765FF9B4A2A
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2024 13:51:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5099BC0;
	Tue, 29 Oct 2024 13:51:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5099BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730206310;
	bh=xH2CMMFqSLKMd0Tqh+sts1ypcYbz4BgYEKnYl4eRMaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mFEvQmEVybymkS9WfDj0fzjGeuOhQAUOMd7d6c+5VwLaOSKZgIVtlZF33+cAJBavF
	 oE7np1mvgcSf9vk46QxDlihTf24it6hCAvp3EHKcZDNPYLEu648xyEeEoFWnp0BL6N
	 sxgUqU3CZQxbXSqtwcx4ls9Ku+U/sUDF2JojpqnI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0482EF805AF; Tue, 29 Oct 2024 13:51:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51D03F805AA;
	Tue, 29 Oct 2024 13:51:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79418F80269; Tue, 29 Oct 2024 13:51:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0756DF80104
	for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2024 13:51:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0756DF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jN+aAOis
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2C62AA42A83;
	Tue, 29 Oct 2024 12:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3ECBC4CECD;
	Tue, 29 Oct 2024 12:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730206263;
	bh=xH2CMMFqSLKMd0Tqh+sts1ypcYbz4BgYEKnYl4eRMaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jN+aAOislgsiZkqy8L7fbHRyZz+NQOBV0qJGY4pzMJkzCJcjefelD9kwVP+8zWCnR
	 4KjNTSaizoBKtJVtw8XuCzkOV0BxYAQPJWMV4bepj/tARQ7Jhbb96BW2Rh37s3uFBU
	 y1ix+JSyP9enJMR0BHIpOHTlrT8LtGBwrxWMeYljZytRUFN5p+AFq8PxZkTApo4hoP
	 WtxAxBIFbvOxjm3Rg7wjhm5Or0nKLcODsK6GgatXr11mJFXBojsHRPNnluIB39G4MY
	 QS2yYfDWq/Azm4HEInOXntrCXH82kuOHd7Sn0NBMSyqBVR889/6kZI+MYoDrHj7AGc
	 H/vAn9ph/tF0A==
Date: Tue, 29 Oct 2024 12:50:59 +0000
From: Mark Brown <broonie@kernel.org>
To: "Shalini Manjunatha (Consultant) (QUIC)" <quic_c_shalma@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Raghu Ballappa Bankapur (QUIC)" <quic_rbankapu@quicinc.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"Krishna Kishor Jha (QUIC)" <quic_kkishorj@quicinc.com>
Subject: Re: ASoC Kernel 6.1: Query regarding dynamic dai link/dapm
 registration during bootup
Message-ID: <aa1a8eb7-685c-4aa7-b73c-640bbcebdcd5@sirena.org.uk>
References: 
 <MW4PR02MB7266556C7EA581EB90AE81EDD44B2@MW4PR02MB7266.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b1KLVv4xEzbzkh0+"
Content-Disposition: inline
In-Reply-To: 
 <MW4PR02MB7266556C7EA581EB90AE81EDD44B2@MW4PR02MB7266.namprd02.prod.outlook.com>
X-Cookie: May be too intense for some viewers.
Message-ID-Hash: JZTYHPJAIMFRJM44MBK6AFYQU6UMPQTQ
X-Message-ID-Hash: JZTYHPJAIMFRJM44MBK6AFYQU6UMPQTQ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZTYHPJAIMFRJM44MBK6AFYQU6UMPQTQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--b1KLVv4xEzbzkh0+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 29, 2024 at 10:35:08AM +0000, Shalini Manjunatha (Consultant) (QUIC) wrote:

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

> 1) can we register sound card twice during bootup, once with limited
> dai links and next with all required ones?

You can certainly register a card driver, then unregister it and
register a new one that binds to the same firmware?

> 2) can we register dai links/dapm dynamically based on use case requriement?
> 3) If it is possible, could you share any reference from any other vendor who is able to achieve the same?.

In theory you should be able to dynamically add controls, but it's not
something people really do at the minute.  You'd have to be careful with
locking and make sure that your userspace can cope with things appearing
dynamically.

--b1KLVv4xEzbzkh0+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcg2jIACgkQJNaLcl1U
h9Bk4Qf9ENT4rpQ4sGRuPWeviGEqMjgdAJRmCgmPktLIyvrE4O5n3RMEAKvu09Ds
pigNtDBEiFUHeAHhfWuDffWDf9G0Kb+uiriSxk09K6MGvnp/wFXzoTvgs1yIMOSO
UBye7FDFxQBZkJa/nkJmrEe0q+C1vZLPgKG++BWGKGdHtWTG4Vxv7/q/wm92xnj6
yRFgwSV9fBIfbUNe1/Ac7JMCYQfarSxuP0AtYvL6GSAG7efaV3MYQ+0N08N6xJBT
eqwpUSK7yx+HHPu8uNYf97UZRVlTH07behQcWfZ606RWUTk3PdvNj6fLeNsnHkA0
Loz2a05AxSnIG14Sl/m+XIPMonxXxg==
=YqSQ
-----END PGP SIGNATURE-----

--b1KLVv4xEzbzkh0+--
