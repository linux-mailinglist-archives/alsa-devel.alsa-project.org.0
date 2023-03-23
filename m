Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C176C6AC4
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 15:21:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3BD3ECA;
	Thu, 23 Mar 2023 15:20:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3BD3ECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679581289;
	bh=APEr/cl++fNE36UfS6xPTNgz2hzS1cXNDRWKehUN1pA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YfVOyurcUzzeCUHV2gUl56aDVpqzGun5LQ91FBt5/MkOMWnQu4lJ07exYfEADJ38O
	 5vpActbzl6GIUZWRoAoW6KRqCCIddxirIn0IYBSc/PZKUKzpaazR9Dkrb0DGOlCag6
	 0VwGdJ6mgvUdyyRyAQyO2cAtA7P+E8MKgWvY1NNc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67E26F800C9;
	Thu, 23 Mar 2023 15:20:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E015F804FE; Thu, 23 Mar 2023 15:20:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4C77F800C9
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 15:20:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4C77F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=J9pkcHIl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2FC5AB820D0;
	Thu, 23 Mar 2023 14:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0189EC4339B;
	Thu, 23 Mar 2023 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679581228;
	bh=APEr/cl++fNE36UfS6xPTNgz2hzS1cXNDRWKehUN1pA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J9pkcHIl1LFeSm9+5zK9o7nqSsasvOgEqlA4K5GYuJXHuRefJicoNADl5WEMnMX4N
	 sx+AGdseTKrWBTHGuAlJZFJTPg5MQK3ijtI11abIzBQcobm5DNlZDakiYhwYp/6C8Y
	 XywHlsSSDTS7wdxWMBST5XDptogyCgnu84cHj6rkLj5jI5vio/lSV7I/V9qato15rb
	 8AT3envn4AGYZVUpwpozsRGxh8/Q6CbG1XCDJVYkyqDLDky6hdml13sfPIO9GgcNlT
	 CxhEmN0gfiy3S2Cne7AXDMkVeQrgEhWN+CKvGPCx8VKCtQPvZIgdrrSM79KYag+soE
	 oHA+MA3gqqmKg==
Date: Thu, 23 Mar 2023 14:20:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 08/20] ASoC: SOF: Intel: hda: retrieve SoundWire eml_lock
 and pass pointer
Message-ID: <d35022ce-3922-4198-a040-003fbbbd0135@sirena.org.uk>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
 <20230323054452.1543233-9-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IN+JnGwO/FMaIQao"
Content-Disposition: inline
In-Reply-To: <20230323054452.1543233-9-yung-chuan.liao@linux.intel.com>
X-Cookie: A lie in time saves nine.
Message-ID-Hash: WJAA366K53Y75GHGFPDVLK3VGOKXKHXO
X-Message-ID-Hash: WJAA366K53Y75GHGFPDVLK3VGOKXKHXO
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, vkoul@kernel.org, vinod.koul@linaro.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com, tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WJAA366K53Y75GHGFPDVLK3VGOKXKHXO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--IN+JnGwO/FMaIQao
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 01:44:40PM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> Use new helper and interface to make sure the HDaudio and SoundWire
> parts use the same mutex when accessing shared registers.

Acked-by: Mark Brown <broonie@kernel.org>

--IN+JnGwO/FMaIQao
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQcYCYACgkQJNaLcl1U
h9Aa+gf9GXa/tSkShN5hlAgVFMfPL1BuU+z9gPd1Ui3M7xeU1mOw5RPq04XsM5qL
D0TQL3b7Y3d6snNNyhRB8PiS8HqT4NTh1kEaFZWEkkAqE6RNvYrB7z9YtnflDy8S
wcJd8fkOGBs/X4uJYYodQ0C/qlcB1CCamWlB7CsnteV4pmuP1ZdHIXqg3hz5/hBi
pIeU+k3DOuRTnLRJeZds/6rJDyUJNpZlur4QtNghckU98vKap80z+K31ena+P+dE
pmVhaD9s33Nfc2ZfMCBAw6cWKFAqUzWiA1Nh2a6jodEBSSfNSBb0YpIlNpcgYAtd
wnti8BNQDbimn3gVfyDb1PGVqtT5dw==
=ySuG
-----END PGP SIGNATURE-----

--IN+JnGwO/FMaIQao--
