Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B3A47337C
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 19:02:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 187241891;
	Mon, 13 Dec 2021 19:01:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 187241891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639418522;
	bh=YFqukNs+Og9qk/2yG+rJxGiiz5BS2yPPUMTffwav1QQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rguwmFJmRBXYcN2lLmgen9an21F+T3PRMWJlK05T7XygLUELeqCCC8zPBqckDkJ+g
	 WmJ0/32tQDast5Py6Xil0O8jEpCvcDcLlHFrmewlSH9e8JnPVQeDZb7cdW42twoQom
	 Iwj9Y23p12YBF2MGg+z2uIyt18yl43Pq8Oe+RTjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 754B9F8025F;
	Mon, 13 Dec 2021 19:00:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A8A1F8025D; Mon, 13 Dec 2021 19:00:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85CC9F8016A
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 19:00:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85CC9F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WS8oyyYJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E47861188;
 Mon, 13 Dec 2021 18:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 417A8C34605;
 Mon, 13 Dec 2021 18:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639418440;
 bh=YFqukNs+Og9qk/2yG+rJxGiiz5BS2yPPUMTffwav1QQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WS8oyyYJycmr/sHk2TzEhrQCrgB4i8oxjN1gHssg56OEA4uFh0e1Qcb3zeO/9zQzk
 9TJ6u045thOyEFuoROv4LUx6AUE/4OLunHZsnL36PLNrvdHJx8RzOozEkVUVP9wXXQ
 hJK9iWG58HESVEptEBCgqVRP4F0v2nu5biOt13n9WV7wJEpYr5Su4xjNpbzeX9xQmz
 f5c40IoCYaJ97q7HIY8WTPJAa3Zv976LaBlCs2/pBHfXjs8TZOExMrI2P99raOnnio
 ZtqlgWfRn3hnFLGsAon6sFtCuBh3gOjdMf7e586/ic/IMJTrIE7Yan3bnbeUbkv4yH
 hXPnZVJUye5Dg==
Date: Mon, 13 Dec 2021 18:00:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] SoC: qcom: Distinguish headset codec by codec_dai->name
Message-ID: <YbeKQ3mLqe1RoUWJ@sirena.org.uk>
References: <20211210051907.3870109-1-judyhsiao@chromium.org>
 <CAE-0n52z=wRS3rXM=zQzcy1yryvzwW6iGA75UYBiYSkR_5edTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WyxKWAijYORUCs4s"
Content-Disposition: inline
In-Reply-To: <CAE-0n52z=wRS3rXM=zQzcy1yryvzwW6iGA75UYBiYSkR_5edTA@mail.gmail.com>
X-Cookie: No solicitors.
Cc: dianders@chromium.org, judyhsiao@google.com,
 Banajit Goswami <bgoswami@codeaurora.org>, cychiang@google.com,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Judy Hsiao <judyhsiao@chromium.org>
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


--WyxKWAijYORUCs4s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 10, 2021 at 03:15:49PM -0800, Stephen Boyd wrote:
> Quoting Judy Hsiao (2021-12-09 21:19:07)

> > Fixes: 425c5fce8a03 ("ASoC: qcom: Add support for ALC5682I-VS codec")

> It fixes something so what is it fixing? Can you add the call stack of
> the failure and explain how this patch fixes it? We have that patch
> backported to our chromeos 5.4 kernel tree but I assume this reproduces
> upstream.

Please don't encourage people to just paste entire panics into things,
what you've included here is vastly larger than the entire original
patch which overwhelms the content in the message.

>  Unable to handle kernel paging request at virtual address ffffffbfe7bba9ce
>  Mem abort info:
>    ESR = 0x96000005
>    EC = 0x25: DABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
>  Data abort info:
>    ISV = 0, ISS = 0x00000005
>    CM = 0, WnR = 0

Information like the above or the register contents is not adding any
value here, it just makes it harder to find the actual content in the
message.  Sometimes a relevant portion of the stack can be useful but
that's not what's happening here.

--WyxKWAijYORUCs4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG3ikIACgkQJNaLcl1U
h9DEvgf/SGigxmX4RClSIJHxCB78eNZyY+qRHmxY3ooT5MmdyLd4mqYAHxGvUnfC
EU8ca4McwbTvDom1GS0+Dwt2ICBJ1zW090xrQuP3QhfIoCG9x+G5uAfWVBBUBi1o
Rt0nYzMzvUSn0qbcaDt2UMjQBObE45kr+GUdvi8D/JwI/IjSNbe+swI3uMqi9YMx
71+yCi0ujwvds+EN8243AqAbKlSa84TTrA+EaQItnu/6q5/rZ4wGw0C03Uz4i4Mr
WjC6UHT3ReggqRqDsrJEzMdopnv5CF5LuByjWz/yBXKbNzpvMta2RyJ1hY7itOBZ
p73/f3DFGRpsB21CdaJvPV6FevqduA==
=zoNv
-----END PGP SIGNATURE-----

--WyxKWAijYORUCs4s--
