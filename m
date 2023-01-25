Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEFC67C139
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 00:58:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0A94207;
	Thu, 26 Jan 2023 00:58:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0A94207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674691138;
	bh=+UI2oidHudLC8hLsWw48+PbEwA+zaKTOclsc/bgiP2g=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NoWnMgcEUOZCaPFqlafz76eZx6ldJJTUrLoreU1XsTXmdZP6bcjRx2OLy033uhDpK
	 WGNc1EH27FPehhLTtlYDQ33I5qU4ykXmnuHcAZtSJcwVF9xTrIlzAIqMp5qSwF2y5d
	 EACaLoXXlCnru8Z/eOhodLMSPDhX6nC41rphZq+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62D7FF804A9;
	Thu, 26 Jan 2023 00:58:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD1CAF80424; Thu, 26 Jan 2023 00:57:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D411F800AE
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 00:57:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D411F800AE
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f0M+ewff
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BF4AAB81C56;
 Wed, 25 Jan 2023 23:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37102C433D2;
 Wed, 25 Jan 2023 23:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674691070;
 bh=+UI2oidHudLC8hLsWw48+PbEwA+zaKTOclsc/bgiP2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f0M+ewff1L0mwM5sB1Lk951LFeK3DK3UD+ahyG/jj+csL3jNj0+9ALs3F0eFNRFmx
 J++1zMiCNTeDnI86joApw4p0KW5ZWc5Fyb5Y99Gt0N33aahxD+Ni5n+WX9aI6HIqiJ
 9lcXUfsvBxL629oru+7PSQeNgV91h/T+w0/65pgLvmCrDg1nPcnW/hh2jwHQAfkQgV
 PP0c/wvYZa8QNXUBF7sYwMzrjAApyYOPEXqKOCSWu4ZY3I+TZkc3OzCgb5NFs8c6Nx
 neqTv052UaRh3mqA5NGC0j2OmW+1NoJI0S6GKxs/3YBpP+JVzqaK1D7duzjXASBLaL
 nVkdejQs89jEg==
Date: Thu, 26 Jan 2023 07:57:38 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/2] ARM: dts: vfxxx: Swap SAI DMA order
Message-ID: <20230125235733.GG20713@T480>
References: <20230105144145.165010-1-marex@denx.de>
 <20230105144145.165010-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105144145.165010-2-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, alsa-devel@alsa-project.org,
 Stefan Agner <stefan@agner.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Paul Elder <paul.elder@ideasonboard.com>, NXP Linux Team <linux-imx@nxp.com>,
 Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org,
 Richard Zhu <hongxing.zhu@nxp.com>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Mark Brown <broonie@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jan 05, 2023 at 03:41:45PM +0100, Marek Vasut wrote:
> Swap the SAI dmas and dma-names to match the order documented in
> Documentation/devicetree/bindings/sound/fsl,sai.yaml
> No functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thanks!
