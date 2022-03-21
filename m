Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0624E1F6C
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 05:01:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A3C11687;
	Mon, 21 Mar 2022 05:00:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A3C11687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647835275;
	bh=rcfrMRNmcGIva2FzJ8WXEWjgFGNXQHRVjZF1XPtl/r0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GfIli4GDy1FWmXT9HDm2x0KiA449bCCrcyWDJaXdXiWgqbY5JSYkyG89fl4/f1aqL
	 910qzSfu655ON6LRuXqCIaJYH5K4wmZnBrDt6UaHR0tBhkJdWPtkD0s51w3M8rdEDM
	 A9fk9jtUtWyfnH9yjZjvLdK5UFSMKDsZLttVtYZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CEE8F80516;
	Mon, 21 Mar 2022 05:00:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57DBBF80515; Mon, 21 Mar 2022 05:00:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13285F80431
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 05:00:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13285F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jRcKMSnH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2842BB80976;
 Mon, 21 Mar 2022 04:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48308C340E8;
 Mon, 21 Mar 2022 03:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647835199;
 bh=rcfrMRNmcGIva2FzJ8WXEWjgFGNXQHRVjZF1XPtl/r0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jRcKMSnHJ9F9XnbMGSSUgxWHnYrGWbB6zbWYOuqt9C/JhMOPTNUf/PpxSrPqKGrX0
 Nzewz1gbzoDa6ZiRiJk5GEv9s0dfICawGiauzSgQ7+qvkaYfEdhKnwCk1zRkDg/cBh
 N9udM8kaZwU430q4Fsmxv8EinXUtViPTKJVvfoH5SO+2XW4zjfCyzpmfLlNqpOgt7p
 UICdAwfcN0HeUvXYVGmPhuzlqQXObqdZs4+MU0jwUzEXlGZCcQOda84d+uwsIoUIeA
 /FNE3mByRgKe+LKYfnwcaMCoQ+ix2aGv0aBNOmFwPXAVElb598UXzSx9YMrK86BND4
 se7eaUbgIc9xA==
Date: Mon, 21 Mar 2022 11:59:54 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v5 4/4] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Message-ID: <Yjf4Ogkr4MPzS0vr@google.com>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-5-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220319114111.11496-5-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
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

On Sat, Mar 19, 2022 at 07:41:11PM +0800, Jiaxin Yu wrote:
> To support machine that only choose one of the rt5682s and rt5682 as
> headset codec, adds new compatible string "mt8192_mt6359_rt1015p_rt5682s".
> Meanwhile, using macros to simplifies card name and compatible name.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
