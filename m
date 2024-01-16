Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B3782F116
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 16:11:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE0CB1FF;
	Tue, 16 Jan 2024 16:10:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE0CB1FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705417859;
	bh=B1FJIuGceQwGGUr1VdWXxI5e+Mbkrvt6mGSLavFdtRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tn6rNcE5QnLihOkqHJO3bcVrx+DkjVRVoSCNkP7L2SnItENbwb+94EeZn0OaLbyUA
	 zvBqn2QP9Ow5sFUYnCLMg028Mr7p/9Y3mao2mHRcscNvup0bU/w4oioqrrTHlBPXwu
	 Nm/iPd+VdAcMKW1rMxLnIf0zQcE2g4HzQws6yyIo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64F6DF804F1; Tue, 16 Jan 2024 16:10:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A18CCF8057C;
	Tue, 16 Jan 2024 16:10:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A92AF801F5; Tue, 16 Jan 2024 16:10:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52938F80074
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 16:10:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52938F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sQBmJlPe
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 087CA61190;
	Tue, 16 Jan 2024 15:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC60C433F1;
	Tue, 16 Jan 2024 15:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705417813;
	bh=B1FJIuGceQwGGUr1VdWXxI5e+Mbkrvt6mGSLavFdtRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQBmJlPeo0s/7USxGte5IlqP3pBJU3TX0Ms0p3AN/ACkQN1ZvtUv+Hfb8hGkjSsdw
	 nZCx54vGUXhQXZqC5yaybqyjfbRayZ+FeyjVopDy62wGeb346r/imKBgGbHg10Htmk
	 R5KdV7BAuHpDIwAb3zGjoSkB5eLnIZPFAL6COuYYWSYInKGnyfhLJGpPR/FeJa0ps5
	 qYfRtTz1Sm9YQK97x6hztp8OqZjG8l8MxmsfVjG1N7XI8ayXGR+IbE2JTUah7GyYm7
	 Zd7eavOKvMQr6+ltIHe8IhhtyfoEvwB+AoyTHx45YQSUbICdpRDoiFOFsbo3XAf8uX
	 klsxHD33fhclQ==
Date: Tue, 16 Jan 2024 15:10:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/7] ASoC: qcom: sc8280xp: limit speaker volumes
Message-ID: <029c8d1b-a621-41cb-a577-dd5829fe8427@sirena.org.uk>
References: <20240116093903.19403-1-johan+linaro@kernel.org>
 <20240116093903.19403-2-johan+linaro@kernel.org>
 <1cc50979-741b-4341-9e9e-2fdee1dd2e65@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ShzZHTDGEX/OI1T3"
Content-Disposition: inline
In-Reply-To: <1cc50979-741b-4341-9e9e-2fdee1dd2e65@linaro.org>
X-Cookie: Programmers do it bit by bit.
Message-ID-Hash: 554DZNG6GT77M3UKIKKFZOGUSTLVHCCC
X-Message-ID-Hash: 554DZNG6GT77M3UKIKKFZOGUSTLVHCCC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/554DZNG6GT77M3UKIKKFZOGUSTLVHCCC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ShzZHTDGEX/OI1T3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 11:11:47AM +0000, Srinivas Kandagatla wrote:
> On 16/01/2024 09:38, Johan Hovold wrote:
> > The current UCM configuration sets the speaker PA volume to 15 dB when
> > enabling the speakers but this does not prevent the user from increasing
> > the volume further.
> >=20
> > Limit the PA volume to 15 dB in the machine driver to reduce the risk of
> > speaker damage until we have active speaker protection in place.

> LGTM, We can get rid of this limit once we have Speaker protection inplac=
e.

There should be a userspace component for speaker protection so you'll
need to limit things when that's not running.

--ShzZHTDGEX/OI1T3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWmnE8ACgkQJNaLcl1U
h9Dbmgf+IblLPaBg7D2oSrtByTikbx592QEXrkcWHGjqquxgdEdDaTQXUNfUE9oR
N7Dllk3rRDTEPEc78Gb5hFvjE7zut/xjfOoaGqSiwtv9/pA8TkEI8qBB65eQxSNt
5Zpcy5Y2bZ3AkzcggF3JFZsUBx1pdE6CVi7BrR3SCOsvnZGowBpVRaMP+MWvZPO1
I+mntld1hnmH2g/1fnMmPIpvXlGSKPQ3bbcqd7d7IVnxBagNzPdKyQVnpMlHTQM0
5w2XCZc8Nikf/8UzUrM6DBL8AeNww6V9etfyjkquZ5COHeaW16quGxMksHtpO7bL
2MAtAP7YlZTbCeQv/VmF4TshVtrPqw==
=ukiF
-----END PGP SIGNATURE-----

--ShzZHTDGEX/OI1T3--
