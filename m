Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 619206FEB71
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 07:59:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C6ECF70;
	Thu, 11 May 2023 07:58:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C6ECF70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683784776;
	bh=soCK8gejMescmZNHCMV4x4NxncM75Lx5avaqXwFOf4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gTMXgi7WESwo7F2bSkpX+OErtCoh3qdoBYmiNjpzyqxpbw8TCw59Vaw99TH9tLKAN
	 Ihb/QqbDzsFsMc7wwxZSKfq9EDu/lC6A9Wew76+Efdb5RNxtH5iL4tVCACz8EAVB4C
	 tLJyiELuutYhoo9FZnMKsNqNr8kOaf9xr/865w3M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CA9BF80310;
	Thu, 11 May 2023 07:58:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7132F8032D; Thu, 11 May 2023 07:58:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 771CAF8014C;
	Thu, 11 May 2023 07:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 771CAF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rMyVPDX7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 38DD363557;
	Thu, 11 May 2023 05:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95B8C433D2;
	Thu, 11 May 2023 05:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683784714;
	bh=soCK8gejMescmZNHCMV4x4NxncM75Lx5avaqXwFOf4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rMyVPDX7XDDeVQXajCEn51g2rqGzIKutVmxMHheTK0pXcrJF2ecQo5mL2bnBMHRSO
	 RdEHy9nG12s4OjUI2WKEs5sAwqz0xhmNF9L7Hog6qpMo2ZY9qv7q6qo6Rev/dAlh5C
	 g+3yhX+H5ppUL4N3ommYp0fBXO16HF9aLLfL+PeAsTawjTtCbpqH6Jo+0g5sfTmHME
	 T6x111KJC2Ycra32uv+5ljZDhkKxhwUdARfTFd+R2PYG5dAdSR/4niiplHa6rZeVp2
	 FyTSVYiuRUb3NyxHiBTmUTHewrTDVX3QF+IaM0kI5WkbSnPdB6q8kd4RHZsIb90tm1
	 ZzYIqaLxJnApQ==
Date: Thu, 11 May 2023 14:58:19 +0900
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	sound-open-firmware@alsa-project.org
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
Message-ID: <ZFyD+1wTbohB98GV@finisterre.sirena.org.uk>
References: <87wn1jdzuq.wl-tiwai@suse.de>
 <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
 <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
 <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
 <20230509-mug-private-mess-6a36d2@meerkat>
 <31969101-c1cf-4956-6446-2243ccda0c65@perex.cz>
 <20230510-robert-diane-joe-846d41@meerkat>
 <41443193-1c4a-bfea-f81c-e6658b7addee@perex.cz>
 <20230510-raked-loft-bureau-1c87fb@meerkat>
 <ed0c96e3-386c-838b-2a21-b4a826222dad@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lC7UCjZQ5GrLleFP"
Content-Disposition: inline
In-Reply-To: <ed0c96e3-386c-838b-2a21-b4a826222dad@perex.cz>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: CBN4DWXDCXZXZI6AP37DIIUVEB3GIVI7
X-Message-ID-Hash: CBN4DWXDCXZXZI6AP37DIIUVEB3GIVI7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CBN4DWXDCXZXZI6AP37DIIUVEB3GIVI7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--lC7UCjZQ5GrLleFP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 10, 2023 at 08:38:03PM +0200, Jaroslav Kysela wrote:
> On 10. 05. 23 18:43, Konstantin Ryabitsev wrote:

> > Thank you for this example -- it plainly illustrates the problem, which is
> > that Mailman 3 mangles messages.

> Whoops. It seems that mm3 guys knows about it:

> https://gitlab.com/mailman/mailman/-/merge_requests/1039

> I tried to apply the noted workaround. Crossing fingers.

> Thank you for your help.

That's great - hopefully that resolves everything!

--lC7UCjZQ5GrLleFP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRcg/oACgkQJNaLcl1U
h9CL6wf/cbpJSDuhurIPrj1a8PXK3sUiRabvCb0WiY7o89XJ/PVgv5Vo2gPEo9mQ
yyifA259t4h4QN+GDV5wUZh3hPz0q7T8oBrM7hrq537oihy9nmuWanPabBil/ve5
L7yzWDGLQCGo3SECjLlhvl/a9k9EWE7XIFXty/pD7Llx0Qe2ZjOnavy4mixNUNhg
lUfTFmJMyQQHwCi6CH3M7xbUCyAeiOnNu19t4wtQqtDlpiwMYs7NNX5G6pXnYyk8
UFVja0QuJwNAerpC/NGsohQBdTd/ozB3mHJiHVPQ/HConnCErRW94oycXOip+d5W
5kB57hCxlHVDpTTeb4vGrLk3b6Vv/w==
=DGiL
-----END PGP SIGNATURE-----

--lC7UCjZQ5GrLleFP--
