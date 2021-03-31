Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A77D350093
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 14:43:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCFF41684;
	Wed, 31 Mar 2021 14:42:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCFF41684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617194598;
	bh=zm1U2asdNanF5cpISHi4RXdhMiKXWLQuzRX4ihBNozA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QEo7721V0BFA5h/XdU1nk3lSETFW3QHgas1N7kZVzaeZesGyEJwNF+BFxx1BOBv80
	 5cjZz0L76TwbnwyWuoVGVbyVkpxGMm0vQ765+9/cvMJaBctdspmHZaBQ69KQShLKLk
	 xkuYoqgVoGn4iZxLSusE70honWmoB1JiZjfLBx/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21EE4F8013C;
	Wed, 31 Mar 2021 14:41:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 118AFF80166; Wed, 31 Mar 2021 14:41:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E22A2F8013C
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 14:41:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E22A2F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bIx7on3V"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC97F61994;
 Wed, 31 Mar 2021 12:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617194502;
 bh=zm1U2asdNanF5cpISHi4RXdhMiKXWLQuzRX4ihBNozA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bIx7on3VSej6fZif3gPY4S0BCciwmdqBi8evHbPC6eFjv7eNNEIXKj57a0wQC7vmS
 W1pEUMMEI9csOts1YH8DRwZ54hSS0A0Qe1Yka8uLQcTyJs36PfnQx/pgrQBcof/jil
 xfOLo+IbUE6WEL/hxYFNxbktjwYA0Vnr55rFu/11pj9o0aBWoTmMWIS0vtJW1ixzAh
 +mIF6tlZgPrbwRqFY88z1HKBkKz3WRmK3WXp8/zZhdfwH5NKDDnyMeJpddRy9n1s9+
 ggHTGdBuOCw5PwcBnxRhjTMGvchd4S+qKAzbNzZ8ljFkEZmiTNFG3aAmtH5GJ62eFK
 /HeDVj2SKWqVQ==
Date: Wed, 31 Mar 2021 13:41:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: Move port/ports properties out of
 audio-graph-port.yaml
Message-ID: <20210331124129.GA12190@sirena.org.uk>
References: <20210323163634.877511-1-robh@kernel.org>
 <20210323163634.877511-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline
In-Reply-To: <20210323163634.877511-2-robh@kernel.org>
X-Cookie: Slow day.  Practice crawling.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Sameer Pujar <spujar@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
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


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 23, 2021 at 10:36:32AM -0600, Rob Herring wrote:
> Users of the audio-graph-port schema need to define how many ports
> and what each port is, so they need to define 'ports' and/or 'port'
> anyways. Let's drop 'ports' and 'port' from the schema and adjust users
> to reference audio-graph-port.yaml from a port property.

This doesn't apply against current code, please check and resend:

Applying: ASoC: dt-bindings: Move port/ports properties out of audio-graph-port.yaml
Using index info to reconstruct a base tree...
M	Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
Falling back to patching base and 3-way merge...
Auto-merging Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
error: Failed to merge in the changes.

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBkbfgACgkQJNaLcl1U
h9DCTQf/VXrFjEDBwqi/S16woGqbw7uTfUGNiWntINuFSTdoWm5MZlK+x4xsuzsn
twkOz7U17Di3KsZeCBBp2gc9V5st50Xstb4CwseS12fVuxi/Y32IsvTEWt6/1kDT
6g8nkF9vQjlnxTrChB0XxoUgJxRp/tmE1PMmC9gUdRvfRZ6Qz5OVD2JWhSbDNVY7
AZAcSqYWJGExtd7thkF5yn8bqlffzSspOLc2AyNQKbzoiht+EkungbwoXUDItn+i
iM01+wByIhZq0xgWtdGPzq64jmni6MVb77dTOdX08eopkRsoc70YF8UX2VXpzhy2
pecOljG+BTXB/OkkhdzH2ARE+jfF6Q==
=5C9M
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
