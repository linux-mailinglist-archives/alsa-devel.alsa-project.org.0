Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9CE7A93ED
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 13:47:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FEFB86F;
	Thu, 21 Sep 2023 13:46:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FEFB86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695296826;
	bh=B5xFlRjZSUa0fGEwETgAARr7jSAUY2bfCZxgYOjYkAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XDJPLPq1bSAtcHlrK7Ys6ojT98f+SZqs1jEs0AjCAYhUTFNbDWwkMMdLztH2X1ld7
	 Axua3cLzVmzE8Ozs/VGNnT0l1zpnjMqGEJhsLiY1lppzL5eqfEaYn/Orm6hGHojxpm
	 uL6q9oOfoZwvePYtamTsa0NYLe7bkyPhXdoqBacU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A7C1F80551; Thu, 21 Sep 2023 13:46:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52C0CF801F5;
	Thu, 21 Sep 2023 13:46:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB4F0F8025A; Thu, 21 Sep 2023 13:46:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05ACAF80125
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 13:46:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05ACAF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jdyOD5QZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 277ADB81FDE;
	Thu, 21 Sep 2023 11:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B98BC4AF7A;
	Thu, 21 Sep 2023 11:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695296759;
	bh=B5xFlRjZSUa0fGEwETgAARr7jSAUY2bfCZxgYOjYkAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdyOD5QZ6UTXYGX7KA1Tj9gVp/Qwr1N6OPc0v9/f7gTBIi/oJUq1uO1u9GnXQfasv
	 rSThNQBU9ikPIcgzLz5GRis/Gb8qmVipZ4QJV0mCKbpOp+KoAYQ6ye8IKvmm5L0mVN
	 Y5r4Zy2sdCI8+QWdLtl3D4sMxIM7ho7JtpVId9wgwlaWI90Bu59LBINbbdtvAA+uGE
	 w39DocBGiNpFtJeAXtezq5k4cXbvnG5iZfhGHf8dmad33eY2LonBfYexXHwxSzsbTc
	 ODcqFVJAsAqf542oSYL0n3rCmdonR++9lTxeu2ACrLyRFJIw7gB+0l75zdJKkqR730
	 JlNnhpWZjfmlA==
Date: Thu, 21 Sep 2023 12:45:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
	tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v4 09/11] media: uapi: Add
 V4L2_CID_USER_IMX_ASRC_RATIO_MOD control
Message-ID: <f5743550-89a1-48b4-a8a6-f66fd246a02c@sirena.org.uk>
References: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
 <1695202370-24678-10-git-send-email-shengjiu.wang@nxp.com>
 <fbedcbf1-d925-47d6-b9fb-c9e15263c117@xs4all.nl>
 <CAA+D8APyNGFSry1GUv6TOW0nKYHKSwQd5bTcRNuT7cu0Xf8eUA@mail.gmail.com>
 <5292ce53-643e-44f0-b2cc-cb66efee9712@xs4all.nl>
 <CAA+D8AMZN59uTRs2sOrSeVb5AGopTzurNVCTNwJOVPahfEXd+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VZPV3UQ+Ok/rD6bG"
Content-Disposition: inline
In-Reply-To: 
 <CAA+D8AMZN59uTRs2sOrSeVb5AGopTzurNVCTNwJOVPahfEXd+w@mail.gmail.com>
X-Cookie: Caution: Keep out of reach of children.
Message-ID-Hash: G5MFJGGWT3FAKZUB4BTZT4YDBPY422BG
X-Message-ID-Hash: G5MFJGGWT3FAKZUB4BTZT4YDBPY422BG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G5MFJGGWT3FAKZUB4BTZT4YDBPY422BG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--VZPV3UQ+Ok/rD6bG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 21, 2023 at 07:13:14PM +0800, Shengjiu Wang wrote:

> Ratio modification on i.MX is to modify the configured ratio.
> For example, the input rate is 44.1kHz,  output rate is 48kHz,
> configured ratio = 441/480,   the ratio modification is to modify
> the fractional part of (441/480) with small steps.  because the
> input clock or output clock has drift in the real hardware.
> The ratio modification is signed value, it is added to configured
> ratio.

It does sound like something other vendors are likely to have to provide
a mechanism to compensate for clock inaccuracies.

--VZPV3UQ+Ok/rD6bG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUMLO8ACgkQJNaLcl1U
h9BsbAf9FFU/jXmFMuDrv5AHXagBE2ZnPpLBCFyq5o9+5iHStRpg6JjatAWgBYz6
jSQEHHIrxzJXJERSR6ZRV0pZu6xHQJgWxH3wzCBgIv9xwxRVKaBgJ9/qAfHIhq3r
VlDRzT6xqXstBSc0AC8vZPVcimz2QNMQSf81b66DFlAS96pzIYtUvR6Hj7zXYSRg
YcJSBjoPYvhB9vnst4d/+sEB53MTq5+gqAkjsB2nYHkDAcRTBUf6BVTD/NFtGk0K
04YzjgyoI4OW05wj1RcNk5AnFI8C519Qyaf+mLrJTIjZx4Y/v3wvw5N9h1tLc+0r
AjoZOgf+eL5qYEbRF1M4VyBn2rgwOQ==
=3xkU
-----END PGP SIGNATURE-----

--VZPV3UQ+Ok/rD6bG--
