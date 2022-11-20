Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFD463386A
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 10:28:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E74B01673;
	Tue, 22 Nov 2022 10:27:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E74B01673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669109323;
	bh=5ggy0qQWOQikRZXdP6PhBP9SY1KAh6GYvEPfkQOJ5x0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dZ587wT7sZdsB+8KmzhF2dDnHXTjhhmXqpvGhET6A//q9zhvuNoYXSYiFrZMPR1Xd
	 W4yHlg7Rw5FYIgFyHcSIFeFJLBsK2F1Xl9oIzRoqZQttpGeKWOPoqUKTDaOIaWLNAu
	 d+uYa92bnMC+d+bw2AtgyjuSDPGov8lqsir9LqQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAA7DF804FC;
	Tue, 22 Nov 2022 10:27:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1E36F8051E; Sun, 20 Nov 2022 12:57:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92549F80155
 for <alsa-devel@alsa-project.org>; Sun, 20 Nov 2022 12:57:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92549F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CoQOfYMy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 36D9A60C44;
 Sun, 20 Nov 2022 11:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A86C433C1;
 Sun, 20 Nov 2022 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668945451;
 bh=5ggy0qQWOQikRZXdP6PhBP9SY1KAh6GYvEPfkQOJ5x0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CoQOfYMy1c33U6h/6Si4Kkdk/nYqh1lkdFXZ7pJNL5n9vK4HQ3DUmgzTQOLTi3J/+
 4L3CB5IjyqYzX7X6zG+dkWGYwvA0hdGuc7N8jgmhdeJrVuTqN/xj+dhNjZlfZ7J+m8
 NQ3W2f0KvfT6p0noOZ/qXVAUIyJBbjFLwkXHWLqq4vnB57jfFy83AYkdplnSgmAaxg
 zCmdzQLQ0WFjr9mXKc4j8OxmQ84ISEza82CabM3W7gyfz8kIdxOd4eSw2xfIjVG+7w
 QNO+he23TglDYzyGgKk5ZjXVMQ7a3tWEdMTEYRmF8wOpAKAo7Hnk/oHDUutDwNLNGQ
 zJucDyu29NEnA==
Date: Sun, 20 Nov 2022 11:57:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing start and/or end of line regex
 anchors
Message-ID: <Y3oWJQRtgbHbqz0I@sirena.org.uk>
References: <20221118223728.1721589-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Q3GCr2oBFfh1LNvT"
Content-Disposition: inline
In-Reply-To: <20221118223728.1721589-1-robh@kernel.org>
X-Cookie: Ego sum ens omnipotens.
X-Mailman-Approved-At: Tue, 22 Nov 2022 10:27:19 +0100
Cc: Nishanth Menon <nm@ti.com>, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-spi@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Samuel Holland <samuel@sholland.org>,
 Ilia Lin <ilia.lin@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 linux-pci@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>,
 linux-sunxi@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-mediatek@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Mack <zonque@gmail.com>,
 linux-renesas-soc@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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


--Q3GCr2oBFfh1LNvT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 18, 2022 at 04:37:27PM -0600, Rob Herring wrote:
> json-schema patterns by default will match anywhere in a string, so
> typically we want at least the start or end anchored. Fix the obvious
> cases where the anchors were forgotten.

Acked-by: Mark Brown <broonie@kernel.org>

--Q3GCr2oBFfh1LNvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN6FiQACgkQJNaLcl1U
h9AA2wf/bx63PKQM05br3AtOVY9zdnicSS3gPjXP1RhIZFx5DzHwpwd0ubzHQeEN
Kk6JXxiJGRd6UUsifgfE3wHiKuDzN/eqx3PrQeCPxvUM70Uz2XifdEqmnhRhR/ow
HSxPCKrdL/VnVCE4OGskhnQnuNKdomuoEv5pKw5+0Ue8/O2O24vxh+Ckm/qdedgr
oN+ptQEN4r+FDCGwsc98OKacDLoBwXp0NKSqoflhG0+AzYS3Pv4CWoSJyW7PPzYR
Na7vdI9pcZxlPhOQilQUYKQWmFt0yl7+uUldCPsQXO/0XTBa1KTcI9H2bRK1MsOw
EN4xxqC1SJ9Q0J7wg7TTl77qIj7PPA==
=lgNY
-----END PGP SIGNATURE-----

--Q3GCr2oBFfh1LNvT--
