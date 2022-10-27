Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D632B60FA58
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 16:25:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55B462F28;
	Thu, 27 Oct 2022 16:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55B462F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666880709;
	bh=u7zIRu/8QWohIQBCOgJ696m1CJ5uogOYxUrppj/SchU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OteiM0uDmAOS00Yj19KPB6jTfD04NeLy4QDugRhP/O7+LLsOh//vA+Ooeqjbgo+iN
	 92J5iUcmbeQIG0bJ+F4xsjRfEqQnemyEdnReoNR4wDqYWtZZeTAwg38BaCvueEA1Rk
	 wFCueofrSfvKrdvTJtx6sgIu5yF42uFOMP+KUmmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF942F80496;
	Thu, 27 Oct 2022 16:24:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 180A3F8025E; Thu, 27 Oct 2022 16:24:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4E71F80095
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 16:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4E71F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="l+EOaol1"
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 059F366028EA;
 Thu, 27 Oct 2022 15:24:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666880644;
 bh=u7zIRu/8QWohIQBCOgJ696m1CJ5uogOYxUrppj/SchU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l+EOaol1JPNqrtg4feZPQfX8BiKhX1f4VFn/rJ97bUuxFzXRYlt39rsyN6UwwpTT0
 1uV/xQqO73f+O0I9e/yGqB5rIwhhs8dXXqC+4l4YIXkdy6QvS8bpMIE7cOO2AQooQB
 Ei0LJe0d/Bj3js0z1QEXP819dxRZtGt3/plVqFYusHksepXbUnBj0i2XdBpWxrpOfm
 VewvOZXVP3l84zq+M2HGCHT3FP48QnpDBwScyFUd6GvHUcGBy+rGHFG66kNKz1NGh9
 Bdq/9mvkgqQI6JnogXphGntXp+cGo5psFJUxMl3HJXdkvrDkyFS4k673N5MXWY3ksA
 yuJwgu/mSHR4A==
Date: Thu, 27 Oct 2022 10:23:57 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: realtek,rt5682s: Add AVDD and
 MICVDD supplies
Message-ID: <20221027142357.fefxa2cjthdza4yw@notapiano>
References: <20221024220015.1759428-1-nfraprado@collabora.com>
 <20221024220015.1759428-3-nfraprado@collabora.com>
 <dcf284c6-dee5-d726-7f8f-c4ff1be99ddb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcf284c6-dee5-d726-7f8f-c4ff1be99ddb@collabora.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com
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

On Tue, Oct 25, 2022 at 12:06:23PM +0200, AngeloGioacchino Del Regno wrote:
> Il 25/10/22 00:00, Nícolas F. R. A. Prado ha scritto:
> > The rt5682s codec can have two supplies: AVDD and MICVDD. They are
> > already used by sc7180-trogdor-kingoftown.dtsi, so document them in the
> > binding.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> 
> I also don't like these uppercase supply names... I wonder if it's worth changing
> the driver to get "avdd" *or* "AVDD" (so, if "avdd" fails -> backwards compat)...
> 
> ...this way, we can change the devicetree to use the lowercase names without
> breaking abi.
> 
> Of course, this commit would need to be changed to document only the lowercase
> supply names.
> 
> Driver-wise, we have a rt5682s_supply_names array... we could do something like:
> 
> static const char *rt5682s_supply_names_legacy[RT5682S_NUM_SUPPLIES] = {
> 	[RT5682S_SUPPLY_AVDD] = "AVDD",
> 	[RT5682S_SUPPLY_MICVDD] = "MICVDD",
> };
> 
> static const char *rt5682s_supply_names[RT5682S_NUM_SUPPLIES] = {
> 	[RT5682S_SUPPLY_AVDD] = "avdd",
> 	[RT5682S_SUPPLY_MICVDD] = "micvdd",
> };
> 
> for (...) assign_supply_names;
> ret = devm_regulator_bulk_get(...);
> 
> if (ret) {
> 	for (...) assign_legacy_supply_names;
> 	ret = devm_regulator_bulk_get(...)
> 	if (ret)
> 		return ret;
> }
> 
> What do you think?

No one seems opposed to it, so I'll add that to the next version.

Thanks,
Nícolas
