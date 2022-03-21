Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCE04E2B85
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 16:12:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FE101711;
	Mon, 21 Mar 2022 16:11:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FE101711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647875524;
	bh=U1Ggj4W2ZgC/aj170kV3Ah+sDyh9pe5OZQ5A2oCA+7Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o+QDFv7JpjSsSw/mee2b6+f5JB+Aw+wkNpSfyS/Z+8Z9/6uDKSjkrLRDr4TyQnBZL
	 lLnDCeDEh06/zogro3Rn2UAcWcRBkj+jR+G5XQScor/iYTX+i2jWmx/lnZ47rpJhZW
	 zNDzlX+KBubO4/wGfeeb8l/1Coa+TKK5O+1U7cWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9736DF80238;
	Mon, 21 Mar 2022 16:10:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E9C3F80227; Mon, 21 Mar 2022 16:10:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58504F80109
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 16:10:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58504F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qftt6/+J"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 27C39B81745;
 Mon, 21 Mar 2022 15:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6C2C340E8;
 Mon, 21 Mar 2022 15:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647875445;
 bh=U1Ggj4W2ZgC/aj170kV3Ah+sDyh9pe5OZQ5A2oCA+7Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qftt6/+J1yF8fk9IVjFbkzJrarwX8I6KyM5sE2Glq6kHuUECaEmp9FPsNQSZH983a
 n35JmkcRop65KCXBio9Q2WczHDEWY7zMsnH+8VF57nfQ5tHI/VXEnF82uY+V/ASaPX
 eH1ycMc1XTQ5+v8fKg5ubikGd6JfFl5EQPkKocNT9n2xqsff1zmPdYro2wrkAggL1M
 9xrLWUrf/jbe+9vSeASPpTymjiTK2Y1CMhBuoWRS7MlMriOluLDobj6etfavgazVm0
 +H7lWAxw0GZEURiBkpJbjPuUc0nEsBAPRsAZhECXtBd2+PWVcxVDY9HEwDHw/5aaou
 P103Qu8YSYsPw==
Date: Mon, 21 Mar 2022 23:10:41 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH v3 1/6] ASoC: mediatek: mt8195: revise
 mt8195-mt6359-rt1019-rt5682.c
Message-ID: <YjiVcUJ9Xm54ivcn@google.com>
References: <20220321072312.14972-1-trevor.wu@mediatek.com>
 <20220321072312.14972-2-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220321072312.14972-2-trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
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

On Mon, Mar 21, 2022 at 03:23:07PM +0800, Trevor Wu wrote:
> Revise driver for the coming driver combination.
> There are two major parts including in the patch.
> 1. Apply some suggested changes used in mt8195-mt6359-rt1011-rt5682.c.
> 2. Reorder the layout for centralizing the codec related code.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
