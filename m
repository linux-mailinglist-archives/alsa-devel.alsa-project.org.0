Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C4A51337F
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 14:20:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2DA3112;
	Thu, 28 Apr 2022 14:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2DA3112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651148454;
	bh=0ZF7rbfOURu9fFQScLsiQBow2Dp0oWt4z38KgBEVbyw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IVY6bYpfCHiFJK0HU9plqoYzoq1dy5jLuSdEd/dJGh3jak/4MMAjFHxv8xqnlJORf
	 wMue1bJN6ZMnLTb2Qp9OtKqQreQcivVZSxlYLYA74NanU0VuCaCkyH1DuoeQQUHVtj
	 qP1Jj2ntEJgAcNTePQOllXvsm7DrBu5t5T9cvhP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DC2AF8012B;
	Thu, 28 Apr 2022 14:19:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2239F8016E; Thu, 28 Apr 2022 14:19:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AC10F8012B
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 14:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AC10F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RqPNCacM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 98CB6B82C96;
 Thu, 28 Apr 2022 12:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EA2C385A0;
 Thu, 28 Apr 2022 12:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651148387;
 bh=0ZF7rbfOURu9fFQScLsiQBow2Dp0oWt4z38KgBEVbyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RqPNCacM155R73rT1xOj26j/PjnWU1BXlCCR+fgYHwmP6pAMyuA+qIPZhfNq50dbF
 Hqi5elhl8jrh+4pjB1DaSTmiNMRnjVoz/zO6fLCu3R4HrPrtNNskRIltHnmVgCh71n
 mLB27rM9gvH9guv4nsUV35OSWd2QV0993k1yu8A8SgrpHjaMdb35bDh1/7zF8eb76j
 CopMvriSjfhzOzhzavCS63LS2g5Mh8uIL/X1yS8TctGAI5VnIBhVmuWwpl5WHmEwcS
 3RIxqZnWcz1fAD66e6vhNGq01RmJpcHvLKpqMEn7/GwmhFMX5v01TIVcbbnl9k/CaF
 mZYWEGTDD4+jQ==
Date: Thu, 28 Apr 2022 13:19:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v4 00/18] ASoC: mediatek: Add support for MT8186 SoC
Message-ID: <YmqGXCg97X6Vqvs+@sirena.org.uk>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="14HuojlumyrWt7WU"
Content-Disposition: inline
In-Reply-To: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
X-Cookie: Bedfellows make strange politicians.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
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


--14HuojlumyrWt7WU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 28, 2022 at 05:33:37PM +0800, Jiaxin Yu wrote:
> This series of patches adds support for Mediatek AFE of MT8186 Soc.
> Patches are based on broonie tree "for-next" branch.

This looks mostly good from a framework point of view - I did notice a
few minor issues which I commented on (some of the control things are
repeated in other patches) but the overwhelming bulk of the code looks
good.

--14HuojlumyrWt7WU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJqhlwACgkQJNaLcl1U
h9D9DggAg16/opdgBxLyrYeeiZua8OPPegaMglo/X8k1DiCR0BudGSgln13XMg5i
gmLRcCIr6/gI69T9tIdarki2mOqMhdyZAjZtLsL8crocPPM5/pkuGF9lFg+dEyWa
Hl3ipVQEKqxgtSSRelBtwZbT6N5tvVNjQkV1R0+376N/jbtS4gUa3wcs6weJhCGz
7Zo6/8FogQaAG0S/RkqiBRAOfStCbJl+33rN1nASR7mZJHCsu6kefxdHsrtYJKq9
VqQtzDPI8wfHaMhJ/cFidSWVssQD2Uoyea3/Fk3I5YmHvnM77gIB5taZPeAlKQxh
9Ofv/WaTnH7gZHg389wqh3jxMnUJmQ==
=bwgG
-----END PGP SIGNATURE-----

--14HuojlumyrWt7WU--
