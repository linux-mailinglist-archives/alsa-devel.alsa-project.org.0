Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA48B644B6F
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 19:21:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E0EA1832;
	Tue,  6 Dec 2022 19:20:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E0EA1832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670350903;
	bh=MLAgFv05RvApij99zbYZ6d1xiJ6FG0fQ0Z8D8PgMU4k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t2t7eLyLJOaB1joTgOqo/+B9VjnTIXXFVhqudkkdXI9vB/nNoxfxxm1V1s0B6H3aC
	 xCQGBD7I396kAPAdnRAfdMu10cWVD1zh+z17orIuqt9ZyRX5iVWye7Xcir1jmqDafy
	 vodkHaFuo+vXoCkFfesyLFIjIYIXbzJrrsJiPb3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38E91F804DA;
	Tue,  6 Dec 2022 19:20:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20AD1F804B0; Tue,  6 Dec 2022 19:20:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AD48F8014E
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 19:20:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AD48F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VcnvUzLw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 62C1961865;
 Tue,  6 Dec 2022 18:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB811C43149;
 Tue,  6 Dec 2022 18:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670350821;
 bh=MLAgFv05RvApij99zbYZ6d1xiJ6FG0fQ0Z8D8PgMU4k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VcnvUzLwFU8ZcNCMDZSVPH87zbC6eFcdPIMfcVdlEHmPg72fLcao/FFLBQ0B4RV4t
 FD+l+Ni/jEhMMgSqhP6rjrVuoXGvuAoFEtIdKPiQ/lJttXLmMUg5zhAJWRcfEa6sWt
 6APyL+1aD0SXxdzxm95KDNHzU5YRbEIk1lO9owiMrHC+D3B9nRONAb7hFfinGn2cCJ
 BBcL1TdVseB2C2QkylRX0qohWkykgnWWNAdGWRafyxVmevlsu/OCR705mA6Iw88MET
 rubfJEh7jDvqYV32W6LpBJpSeGP90WnJ3O3rwLCWz04m9+vCtVEQdxcT5NLPqDTMWU
 V1PH9o7oDTSVg==
From: Bjorn Andersson <andersson@kernel.org>
To: broonie@kernel.org,
	nfraprado@collabora.com
Subject: Re: (subset) [PATCH v2 0/8] Adjust usage of rt5682(s) power supply
 properties
Date: Tue,  6 Dec 2022 12:19:26 -0600
Message-Id: <167035076324.3155086.11660793655282109085.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221102182002.255282-1-nfraprado@collabora.com>
References: <20221102182002.255282-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 konrad.dybcio@somainline.org, lgirdwood@gmail.com, tiwai@suse.com,
 robh+dt@kernel.org, derek.fang@realtek.com, Andy Gross <agross@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, angelogioacchino.delregno@collabora.com
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

On Wed, 2 Nov 2022 14:19:54 -0400, Nícolas F. R. A. Prado wrote:
> This series sets straight the usage of power supply properties for the
> rt5682 and rt5682s audio codecs.
> 
> These properties were already being used by sc7180-trogdor.dtsi (and
> derived DTs like sc7180-trogdor-kingoftown.dtsi).
> 
> We start by documenting the power supplies that are already in use and
> then add few others that were missing to the bindings.
> 
> [...]

Applied, thanks!

[7/8] arm64: dts: qcom: sc7180-trogdor: Add missing supplies for rt5682
      commit: 172cb25fd25786a3290cffd38dea677edb0b7cca
[8/8] arm64: dts: qcom: sc7180-trogdor: Remove VBAT supply from rt5682s
      commit: 147e8b2080f1a0496a1f51739cf591324f133619

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
