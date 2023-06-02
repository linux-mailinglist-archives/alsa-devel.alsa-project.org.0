Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B2D72063E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 17:33:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA7DC201;
	Fri,  2 Jun 2023 17:32:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA7DC201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685720000;
	bh=5QXIHa2W0ELGorikCysfBGEGd/J7lBLGTLPblBeY30Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m7D7eMKhF4Uu98TiRxc2pGTqBGc43ZhH3A44NLacbzrun/IzfI2aV3+ogKQUAaMGO
	 +HjyBSGpeu2NqDk7W2jrnpE9TcfRc4jeKCUPOG5JsL3OUw8hkgLLgcS579aB6wy3LW
	 iUcET1xQTfLNa7zwIhgCiI4It6LLxUko0AOtVR+k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33B6EF804DA; Fri,  2 Jun 2023 17:32:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 919B1F80132;
	Fri,  2 Jun 2023 17:32:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45988F80149; Fri,  2 Jun 2023 17:31:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DB7EF800BD
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 17:31:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DB7EF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Vb2XAcBW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4131561538;
	Fri,  2 Jun 2023 15:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B75C433D2;
	Fri,  2 Jun 2023 15:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685719908;
	bh=5QXIHa2W0ELGorikCysfBGEGd/J7lBLGTLPblBeY30Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vb2XAcBW6R8rsoLSgPysLHzSyG2/r9HJktponYdAS4KVzAZL0ww8czuWolrFaBxLX
	 kdWLV9B5WgnaHsEJAcxjMxDm/nfX52zzbuikEgQr6fzyzlIZO9dgF0mz8UZQaRTlOK
	 ncqcW+e9v7sbfaqDPpZmIFwJp2YEJcrgOXwMuK/DnGxuMBOVekuYiQv0SfBk6FTgj3
	 tDCCieysXNlawy6I11I/iyqq4j6fdIjrV0YL99QU+jlSqfbiDGBpx2GsJFCcgaJmBg
	 +YTjtg8T2FmjkvNuz1UwlZJVFsLudrKYmg+XmrZQg059dPtn60Ziq1lmiDWCNbKrC5
	 2LgcGmC8/qRJg==
Date: Fri, 2 Jun 2023 16:31:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 00/21] ASoC: replace dpcm_playback/capture to
 playback/capture_only
Message-ID: <5fa212c1-26a4-4449-9f90-631b91fa8ccc@sirena.org.uk>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
 <ff4586eb-4363-2592-97f7-d2fa8bbdee8a@linux.intel.com>
 <875y8fx5fy.wl-kuninori.morimoto.gx@renesas.com>
 <87mt1ihhm3.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HxIgFDngicBbunuL"
Content-Disposition: inline
In-Reply-To: <87mt1ihhm3.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: War is an equal opportunity destroyer.
Message-ID-Hash: YNF2KGA4POAB3MJ5NQNKVYOGS4AM7BFK
X-Message-ID-Hash: YNF2KGA4POAB3MJ5NQNKVYOGS4AM7BFK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YNF2KGA4POAB3MJ5NQNKVYOGS4AM7BFK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HxIgFDngicBbunuL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2023 at 11:45:31PM +0000, Kuninori Morimoto wrote:

> In case of CPU:Codec =3D 1:N, and if its validation were

> 	CPU   : OK
>=20
> 	Codec : OK
> 	Codec : NG
> 	...

> Current soc_get_playback_capture() will have has_playback/capture =3D 1
> evan though one of Codec was NG.
> I think it should be error, but am I right ?

I guess the question here is if anything is relying on being able to
play/capture to the other CODECs when one of them is bad for some
reason.  I'd need to spend some time digging into it to refresh my
memory, I do recall some systems where the TDM has a mix of things on it
(eg, HDMI and analog outputs).

--HxIgFDngicBbunuL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR6C18ACgkQJNaLcl1U
h9AfRAf+K8zdiuwf61DLyIr/+4cCKWDqF6EVnOn/laMIndd9quQEH0D+ngeHrwYj
4sLNxiA2UmzYhoxsBPRVJpwEEWV/+rTrhFKhFbhAWFK7Z2n/QvkSZIZRqNQoyNhA
UVaCUiyB96QRZaoebQ7rSlRnSEcxJRh0ai5YGnu2zqUr3wp0uUefz1adciGu1S/q
k9rqBcOMiUzZz6M6DE+8oZpLaLEHxWezMVWlBJYGXqnPAaGPZk2iAnXL66LDB8Di
KgjtiHNCZd9ZSqVKgaC7r8eknhz4buNoMX+eaZPufRABsOEVk0WeyjfagSEBaBc+
EkJ5LNC1pnyi4TTzmtg1Rrb4As5Tmw==
=Wo5O
-----END PGP SIGNATURE-----

--HxIgFDngicBbunuL--
