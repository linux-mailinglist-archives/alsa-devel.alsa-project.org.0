Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B7152046C
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 20:20:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4B2C15F2;
	Mon,  9 May 2022 20:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4B2C15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652120442;
	bh=sEtyjmgOrjIs5NYv5HPC0xk/tdYrRW3tbsJDYBclXYk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iz08rCEPq2CaIQe2EMQxmjLgGVnbB7OEzL5qJQBRiR2/vL99UPRS7LpVsuwPpKGwj
	 qA6ekMCT0VDDTDXxoCiW+3J07BZ9LbE2elnVc/ioR4M6nc0At+Dsxh1ZW6MFl5dGEJ
	 j+yFbegiE/oT9kV1gPHgmRD30tojmkCZo3UmK97E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 085F7F800D3;
	Mon,  9 May 2022 20:19:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC506F800D3; Mon,  9 May 2022 20:19:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F74AF8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 20:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F74AF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QxjxEobB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 494A2B818CE;
 Mon,  9 May 2022 18:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3FBC385B2;
 Mon,  9 May 2022 18:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652120377;
 bh=sEtyjmgOrjIs5NYv5HPC0xk/tdYrRW3tbsJDYBclXYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QxjxEobBOscR/f/wqE5KqFFibxHBYEbMltpkRKBAnS7TIDyAfo31CyGMDkGQg/3J2
 CSgYm/b4Um//Ob7QXYzVoPwq7Z+JBR8dbsnNgYaeueJZy8t17DNMQygwvpK3Ztd4sp
 iqilsKMgPqHknWIpd4XUmv70r9KdcevXWafnn9Kxcc4NQn0UAwBjC7LxSYF0TC0gmK
 qL4VqlqrmaY02ut3JmWVbdGokASWh1yIDvabGmSm3M115Vb5a1oR0FMSqdD65VgbO7
 atMKHSrq1S2Ghayfh4VZYne1f6GlRhNOm8OTjChJMqHU6gc4Hf6nbzZyDnK2jaYSap
 Q7aUkUZatZjPA==
Date: Mon, 9 May 2022 19:19:30 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH 0/3] Add missing dt-binding properties for audio
 components on mt8192-asurada
Message-ID: <YnlbMjTEORFSbxXS@sirena.org.uk>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <165211666198.1065748.1151009730882312510.b4-ty@kernel.org>
 <20220509181629.ettskdxfvwvqaq76@notapiano>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4y1TD9hR4+zXz6BZ"
Content-Disposition: inline
In-Reply-To: <20220509181629.ettskdxfvwvqaq76@notapiano>
X-Cookie: Boycott meat -- suck your thumb.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tzungbi@google.com,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com, lgirdwood@gmail.com,
 shane.chien@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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


--4y1TD9hR4+zXz6BZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2022 at 02:16:29PM -0400, N=EDcolas F. R. A. Prado wrote:

> this series wasn't supposed to be merged yet, I'm in the process of prepa=
ring
> and sending a v2. Well, for patch 1 at least, which needs some improvemen=
ts
> still. Patches 2 and 3 weren't going to be changed, so those would be fin=
e to
> keep merged if you want.=20

Please send a revert for the first patch with appropriate changelog if
you want it dropping.

--4y1TD9hR4+zXz6BZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ5WzIACgkQJNaLcl1U
h9DR5Af/TprbNPs5eG3YL7V+LKRWqR7r5/vg4Mv3tT5GnibQHJMnJKNy2UouZxTo
rkacxPv3r1VyUUeK8zHUkyzJrNx2E3UkAlpZ1lwC/HERm66keB5ugaBQpSDEj9/p
ACsF6I1K/fAJq4cwI0vhDWWUXG5Ha0veDao+qfUaTVOyn4EsHCB21OBnsJFRTuLN
26cIS9fHHyxKc055J2rLi4LqpTdxVOuuuJXkD4ScZmflZkEfH1Nea8JMeCnPnXXy
AANm+RFzCi2lMMAO8BCv8PQCbuDxJHXCbx71WenqSS0Cd+r3VlGv5u19fZRGuv0z
k8nbklED1MQtWoNvx67Kz6aY9MpB1w==
=BxKV
-----END PGP SIGNATURE-----

--4y1TD9hR4+zXz6BZ--
