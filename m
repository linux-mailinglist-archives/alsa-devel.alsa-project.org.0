Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A498358D8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 01:04:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 480E61FF;
	Mon, 22 Jan 2024 01:04:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 480E61FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705881887;
	bh=7oDI1XO154l1iaa0RraSQw5ES7TxoMVaLBOvKr6NGIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NQeamfKX8fz04cTEoELctM7zP19iCurocF+/tdE57p0MBeOCcfub8akjHkC+Lixk8
	 Fq4o/8pujlTcfX2T1SHM0PW11pIVr0xjziZdABONO67O8pWJCpziT/zVmMisrdAr5f
	 PUE5mu2UVpBrwrw9nLHgbefgkLtrPN3cEszkvxmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53A64F8022B; Mon, 22 Jan 2024 01:04:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3F04F804F1;
	Mon, 22 Jan 2024 01:04:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22242F8025F; Mon, 22 Jan 2024 01:04:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FC76F80149
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 01:04:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FC76F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=V8kyjonA
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C38960F02;
	Mon, 22 Jan 2024 00:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181DDC433C7;
	Mon, 22 Jan 2024 00:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705881840;
	bh=7oDI1XO154l1iaa0RraSQw5ES7TxoMVaLBOvKr6NGIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V8kyjonAFPfiubxozhOruWdoQ+UXUjbDUSLOYRIMizyMt/Y/BCZz5sbuvgDDM1qX9
	 CvMVvcUha21MNi25rvqb5XINYtoNHVzyNTi8rkYfd/bTLwbgJcnZDM5+9lKeYrAe8g
	 xgs7Pfv5KvD+eWAfBZ74aGZbLgUmkBXiD/0+WL9Zgq5TQQm07M18YfBSZbBgriDJK4
	 Ad3aH+qNe53hChAvwcQVkyF9ZCdLwInlX3wXe6lbUCLbrvhA4Axl0fn3ST/S10diAo
	 jlpAHKsB8UIF9EbZs6hPLOQ8LutAmlEvoGlivfAyn4JMreVapHTDWSlt0Z7CxmknB2
	 3Bir742GDmMrQ==
Date: Mon, 22 Jan 2024 00:03:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 2/4] ASoC: qcom: sc8280xp: limit speaker volumes
Message-ID: <d54d3640-49bf-4a2f-903b-4beeb0ebd56c@sirena.org.uk>
References: <20240119112420.7446-1-johan+linaro@kernel.org>
 <20240119112420.7446-3-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ddqYfjTpQJcp+t1u"
Content-Disposition: inline
In-Reply-To: <20240119112420.7446-3-johan+linaro@kernel.org>
X-Cookie: 1: No code table for op: ++post
Message-ID-Hash: YDJROI5GO3KOQD5FM6BG7AWEZDSDEN6J
X-Message-ID-Hash: YDJROI5GO3KOQD5FM6BG7AWEZDSDEN6J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YDJROI5GO3KOQD5FM6BG7AWEZDSDEN6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ddqYfjTpQJcp+t1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 19, 2024 at 12:24:18PM +0100, Johan Hovold wrote:
> The UCM configuration for the Lenovo ThinkPad X13s has up until now
> been setting the speaker PA volume to the minimum -3 dB when enabling
> the speakers, but this does not prevent the user from increasing the
> volume further.

This doesn't apply against current code, please check and resend.

--ddqYfjTpQJcp+t1u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWtsOoACgkQJNaLcl1U
h9A6sAf+MNxmG+32Oty1qqRKXBZ5RVX6g9r56r3iFPMAmhMHoSZSvmXUvPk2aG29
7Oy3y1c5yFMKmSVNq5Oi8XzLAua0Prpx1ziOSwRCgQSdZ+DRjcgxnh3lfFjH4gJI
8GbfQuWO6XYIU0Poi972LR/dofiuSOkcU6SriIdmoUIdWaplFT/hK0b9LwFMejzD
7p8XuQw/G0JQgztd/KGtTr1S/UyqTKbcg5hK7ON4woYsSQKWCdKq+hqXx67tyTAv
4fiRWsQoRqtTeAw2PCt0xi3yT6aMfeciOiScaz1uZwmym3Hs8gQ1H4TSV/ee6ieu
nUHFZS8Xq3xiYmO7DN+Fnx/eYSi46Q==
=0JpU
-----END PGP SIGNATURE-----

--ddqYfjTpQJcp+t1u--
