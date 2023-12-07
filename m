Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE651808FC7
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 19:23:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9B97868;
	Thu,  7 Dec 2023 19:23:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9B97868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701973400;
	bh=71yycJKM75YE1bqFGWW8tRJ+zrRLK/bB6hrE1EEMaSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j7ozl09JQjmnn8dt/UZ1Ojbsl0hwG74iE/DfnHNQy1jDVJuyaNKTdmJzZJ3chw3z7
	 qpKqQdRAEj9JBFSBbm9c6igm2ayVotA0xjwomT9d0/pGgcquRTb3Y+gLhzyE5jTugU
	 6Wm+MHSBLuLb+WHIjIReNsoMCEHMf7f+WWvgrjp8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3533F8055C; Thu,  7 Dec 2023 19:23:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0332CF80578;
	Thu,  7 Dec 2023 19:23:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32380F8025F; Thu,  7 Dec 2023 19:22:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12607F800E4
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 19:22:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12607F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YfYVJ7Ht
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 86415B829D6;
	Thu,  7 Dec 2023 18:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24EDC433C7;
	Thu,  7 Dec 2023 18:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701973371;
	bh=71yycJKM75YE1bqFGWW8tRJ+zrRLK/bB6hrE1EEMaSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YfYVJ7HtKN3CT+yZ1ou5EejSsGyaxytgoFz9Uvy/w3bgWZhpeM1m6p3ST0iqcT05b
	 NVojFMwGAPymppmUXYtRLUJ4lUVtQbbSp+Ad2xvUckusKVMq8dR4e54iVSAm1GwcOe
	 jYcFFI1fCsWaGYRTD6CyYySXzm107k2q8eKRUCFqIe/FLdH48YDfCXZTLmlhQwmWsZ
	 Feb7w1i3O17ZlIe0eiNuQ9QaMX/9qqsp0X3kzAbtZ36dBpBEubM7pcMRFe0492ZN6b
	 YINf5aDzTV8l+7Jq2zFgOhBt9mGberdyulL31QEFz/dNenO9Il1lBC4j99VXNbAMcR
	 iS0KMKFcY9xGw==
Date: Thu, 7 Dec 2023 18:22:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 06/16] ASoC: tas2781: add ptrs to calibration functions
Message-ID: <132426d1-5fb3-429e-918a-d1ef4be8ed01@sirena.org.uk>
References: <cover.1701906455.git.soyer@irl.hu>
 <e069d578aebb8d5aa1c09abae2a0f240b3dedec2.1701906455.git.soyer@irl.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GMlZJ3xZGxdkGdNv"
Content-Disposition: inline
In-Reply-To: 
 <e069d578aebb8d5aa1c09abae2a0f240b3dedec2.1701906455.git.soyer@irl.hu>
X-Cookie: Two is company, three is an orgy.
Message-ID-Hash: NYOC2VD7457CMVCC32N5MKV7WG66T4EW
X-Message-ID-Hash: NYOC2VD7457CMVCC32N5MKV7WG66T4EW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NYOC2VD7457CMVCC32N5MKV7WG66T4EW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--GMlZJ3xZGxdkGdNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 12:59:47AM +0100, Gergo Koteles wrote:

> rename save_calibration to load_calibration

The subject line said we were adding pointers, the commit message says
something different and neither explains why we're making these changes.
This should probably be multiple patches, the pointer refactoring split
=66rom the renames and all explained somehow.

--GMlZJ3xZGxdkGdNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVyDXYACgkQJNaLcl1U
h9BZbAf+P8uiL3Rt6a5np0U1FE6lGtiCIZAy0rAvjenAI32eT0G0ratW7Rhw322N
4fDD/kPd02x0VSgUR+1PY9tP02Y1HBq+a+gczmeK9/C5B18Do4o/d2OjE3GLiwIp
6aaEkBSGq8danMg1DVto/L2+mcWose7r65aU5ydXB+JTOZruehwFQ6JpaXLGDf8j
26FhrRaV2yhn/ZgEuTaVNvBecbwTEVYyzZZ23yytgr0IB5IeR8dn+lSxjd1CD/kh
N4Nr/FKJk8UGl+4dO+2zbujF9UeywmeGNc3AGbT2a8MglESfX5Ucfvyu+Iq1MWyf
MjMd1RCcDTWM+aUsxKoqiJBivx8Yzg==
=3s/F
-----END PGP SIGNATURE-----

--GMlZJ3xZGxdkGdNv--
