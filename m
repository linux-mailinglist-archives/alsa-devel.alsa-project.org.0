Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5F4116ABF
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:18:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED7E41654;
	Mon,  9 Dec 2019 11:17:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED7E41654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575886704;
	bh=asKewJ9j3w3+bhWy90wxg/w9KO+wOyWuAgAKQYQXGE8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o6TBvrttLqRgHO0fo0FAFS2vIBGMM1NGKXP7cvgBL94vy6VgmZE7VIx4YjaJDxZNb
	 GnIjQ3FXUuHyzWWiTzT8A7h8elXKYAZLWvTFLLcUygo5nqDAtBB/D4vzMynWP9Zi7+
	 RJijwBu5EMXtTuhOQTE7e9lpQsnnB1h135JCNWIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C0ACF80459;
	Mon,  9 Dec 2019 10:52:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4ACA3F801EC; Fri,  6 Dec 2019 19:58:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99D64F80108
 for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2019 19:58:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99D64F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="qVvSJYj9"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 47V1xd4KSvz3c;
 Fri,  6 Dec 2019 19:55:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1575658536; bh=ezWxskmwxI8C/8lBttgiFOBWumB5XqgQX2Lyv35wtXs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qVvSJYj9YFwdhcAJDhCbE27sYYMUvgdTONxp+WWKd+z5M7iiAI5MehkQT3K2RazLO
 Fd9fJReH4fmO4JIbPH7vvAG5OF2f+k2n+Ld1c3N3PX5ld+hkdoJQ2IFzQMJIwLVZc3
 677oFRZnpUv7WC+skB2A72eXwr/NiceO2d59iHAuZSWyiZ9j4ZIfNR224I4LEuylT/
 OgQXR2R6mep2NizcYogzTvDzpSM7LavHwjNn8x1geUwhPTgKNZ4p0HkFQKk3rbFUkn
 D2t6f0Opeh7KPGs9oDBi617XDzVFR99l7Pg+gcwf5VVg4jPbwVWPMzXiXjjzcViHtW
 OGnWhmW29zmJQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date: Fri, 6 Dec 2019 19:58:00 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <20191206185800.GB20259@qmqm.qmqm.pl>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-2-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575600535-26877-2-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 09 Dec 2019 10:51:21 +0100
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, pgaikwad@nvidia.com,
 lgirdwood@gmail.com, robh-dt@kernel.org, spujar@nvidia.com,
 mperttunen@nvidia.com, thierry.reding@gmail.com, josephl@nvidia.com,
 digetx@gmail.com, linux-clk@vger.kernel.org, mmaddireddy@nvidia.com,
 daniel.lezcano@linaro.org, krzk@kernel.org, jonathanh@nvidia.com,
 mturquette@baylibre.com, devicetree@vger.kernel.org, arnd@arndb.de,
 markz@nvidia.com, horms-renesas@verge.net.au, alexios.zavras@intel.com,
 broonie@kernel.org, tiwai@suse.com, linux-tegra@vger.kernel.org,
 tglx@linutronix.de, allison@lohutok.net, sboyd@kernel.org,
 gregkh@linuxfoundation.org, pdeschrijver@nvidia.com,
 linux-kernel@vger.kernel.org, vidyas@nvidia.com, Jisheng.Zhang@synaptics.com
Subject: Re: [alsa-devel] [PATCH v3 01/15] dt-bindings: soc: tegra-pmc: Add
 Tegra PMC clock bindings
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Dec 05, 2019 at 06:48:41PM -0800, Sowjanya Komatineni wrote:
> Tegra PMC has clk_out_1, clk_out_2, clk_out_3 clocks and each of
> these clocks has mux and a gate as a part of PMC controller.
[...]
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
[...]
> +Clock consumer example:
> +	host1x@50000000 {
> +		...
> +		vi@54080000 {
> +			...
> +			assigned-clocks =3D <&pmc TEGRA_PMC_CLK_OUT_3_MUX>;
> +			assigned-clock-parents =3D <&tegra_car TEGRA210_CLK_EXTERN3>;
> +		};
> +		...
> +	};
> +	...
> +	i2c@7000c500 {
> +		cam_sensor {
> +			...
> +			clocks =3D <&pmc TEGRA_PMC_CLK_OUT_3>;
> +			clock-names =3D "mclk";
> +			...
> +		};
> +	};

The assigned-clocks should be in the cam_sensor node, unless vi device
also uses the clock.

Best Regards,
Micha=B3 Miros=B3aw
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
