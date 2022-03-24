Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFD34E5C7D
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 01:55:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BF2E1660;
	Thu, 24 Mar 2022 01:54:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BF2E1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648083324;
	bh=YY3u466kTq8l7wermBlxhgdP++tiwPwanwuGyPYg6s8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=drPX5FutyVT8lcyzhrm5zl/beizJ/aRBhKgY7B149LYax0UiIR+PeNHjKcxpHDbpw
	 k2KiwhEXO1nlfPQ4XJD3EpOOuHBhFe2s0tXRyt7RjiG/IorbPvAhTuksZjP0NIpIbu
	 oMLzeOG9x4hZnSymXtvi3PdsF7lMLsJvpSYU1ReY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF6D7F80310;
	Thu, 24 Mar 2022 01:54:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 023CAF802DB; Thu, 24 Mar 2022 01:54:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CB46F800C1
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 01:54:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CB46F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VxnCxduQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C168B821DA;
 Thu, 24 Mar 2022 00:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4455C340E8;
 Thu, 24 Mar 2022 00:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648083250;
 bh=YY3u466kTq8l7wermBlxhgdP++tiwPwanwuGyPYg6s8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VxnCxduQPUEtFRtz4pfTOwPtQANiGZ65a2nzfWJGOR2BuGXbi4CH/nLRc4IVFyJdZ
 pHQtkvn9oUDLzSlxdwpOLzpmQRcX5E0GB9D7TgD3q5u4Gm7Ekv1pHgAMEdjNpI+Cob
 ybgoGdRXXL9xonOMGn9DdzGykpync49zxln9j1HN5A25pmep2rmcjPzShaJvYQxnMj
 YCJz+7HbpdtBNtiJRyK63VGSWbllaC7WFF0JeXudbdfzmuMyrSWTLoxMES3vCZw07b
 vfWIdHGuwxKEgGJBnuF/aQjS4QNloXm37m5cEdJLs40XnY3W99A9Gwjm4PlgSYrWi5
 8/KhjEKM0+N+Q==
Date: Thu, 24 Mar 2022 08:54:05 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v6 1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible
 and new properties
Message-ID: <YjvBLf/8M1WUS/L+@google.com>
References: <20220323164442.921-1-jiaxin.yu@mediatek.com>
 <20220323164442.921-2-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323164442.921-2-jiaxin.yu@mediatek.com>
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

On Thu, Mar 24, 2022 at 12:44:39AM +0800, Jiaxin Yu wrote:
> +  speaker-codec:

If it is possible to have 1 or more items, would "speaker-codecs" be a better
name?

> +    type: object
> +    properties:
> +      sound-dai:
> +        minItems: 2

It should be 1.  Consider of rt1015p case.
