Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8323A6377D9
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 12:44:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1134F16FA;
	Thu, 24 Nov 2022 12:43:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1134F16FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669290288;
	bh=uZvH+DdqTE2Bc0Wy6SH07bNBryd8JhMGfSbP4el3SKU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H7BBNF7RglFFpsURPm4zXRcOGPbTW6j4tSRaxfjOPvN+J3sBzR269si2g/zbcNa1q
	 rHklOmtxTtbyeX+j/QPS9uOKdCJpoTGEzdoPt5n3yML0qWp7tbqJHgjxi23jSgeGBA
	 JFX5QojEdiQjYxHS7m+xwiSgklzkVEzMAPHjyN2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24C59F804E5;
	Thu, 24 Nov 2022 12:43:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30464F8049E; Thu, 24 Nov 2022 12:43:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F19F7F8014E
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 12:43:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F19F7F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SL7vIkLE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2AC95B82778;
 Thu, 24 Nov 2022 11:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CD2C433C1;
 Thu, 24 Nov 2022 11:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669290227;
 bh=uZvH+DdqTE2Bc0Wy6SH07bNBryd8JhMGfSbP4el3SKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SL7vIkLEhTBZDWX7jkaQTVkAOLocXtHMgdGJSDWL0oobN5K8C8QzTWbWDtMxBiHK5
 GCBvqJz6dq1fG9YagsFUuUguuDi/atFghUHGSjSWwrHWsr93Y/TLxw8SviwL9i0N82
 YL/u3E1GdiLyLQ1qsgDYC/UqL/WWV2J/bjH8u+e++nsJMiMmt8+DJj4kFKk4BWiAeR
 lD5o6WiC+/x0mrjFIidfm9HEf1uKAhWRNff0Sd4iOvaXqdwSOo4yP/pe+XfyZ/ZFpI
 0mdeA0UVR7VefYeIXNdClm5ILF/GpjT+FkYE9PswupyjEIw8YJsOGLVQM5z8w0B+Dj
 DRx+p+YDpl9JA==
Date: Thu, 24 Nov 2022 11:43:43 +0000
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: add compatible string for NAU8318
Message-ID: <Y39Y7yqhgtGa1Rt2@sirena.org.uk>
References: <20221124055658.53828-1-CTLIN0@nuvoton.com>
 <20221124055658.53828-2-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3u68ubFIzVPBNqP3"
Content-Disposition: inline
In-Reply-To: <20221124055658.53828-2-CTLIN0@nuvoton.com>
X-Cookie: Apply only to affected area.
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com
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


--3u68ubFIzVPBNqP3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 24, 2022 at 01:56:58PM +0800, David Lin wrote:
> The audio amplifier NAU8318 is almost functionally identical to NAU8315.
> Adds compatible string "nuvoton,nau8318" for driver reuse.

Ah, sorry - the update is here.  Normally binding document changes go
before the correspond to.

--3u68ubFIzVPBNqP3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN/WO4ACgkQJNaLcl1U
h9AcnAf/YOJygcyIsAtfphIYSaHP7OydnUwVjk1q7bVT3FjreMskr3cjR+kYYPeS
npT+sYa5iyp1OxK9vTJiz7dNWdn3j83z8gVPSBeDVZKGpUBG4aRzXrphwR5uYHcm
BBTgxeBjiqEYnZRTRKVis3FGfh/lHdTfFGVUZNt04JCm9r05SZdYu+MiFlAOypV0
pM0K3+7sz9xqfxfUEDl32CPi4HRTnX4Ifd0pD9o8CJfxMOfYFF88IIBhHAGpGVN/
baIht6wscHh18fpvaFGXRujnnLo+qvdJHj8f50CSXi8Azx1hpSYu8crlF0ZN+J2A
qVXKn/BuBH8/ZHdh4PLmQPCYXXVmtA==
=dXjf
-----END PGP SIGNATURE-----

--3u68ubFIzVPBNqP3--
