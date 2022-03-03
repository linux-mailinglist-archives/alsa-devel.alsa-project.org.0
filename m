Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8FB4CB9A8
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 09:56:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 506721916;
	Thu,  3 Mar 2022 09:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 506721916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646297788;
	bh=kU5Q06pAx6Ke2pgUtQgshelxBuHKHAWI3QpSa9wC5UY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KUD24FL5/IkGqQRsjETt83I1txXbOVVdUkRittF3jgElxjCTop8vfK5+V1Z28cq8S
	 U0bXvX1bxFZ1Mx/8WujvPVXyIRWSA+QleG+RVMy7egjEbsu17yb7COFNpw1o5IrYO1
	 OEqMj08EfhQPYW/vIKoku9LtyPdF1vyD896aXxOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B47F7F800F0;
	Thu,  3 Mar 2022 09:55:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47850F80152; Thu,  3 Mar 2022 09:55:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24028F80109
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 09:55:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24028F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OvuGsYkK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2401E61BD4;
 Thu,  3 Mar 2022 08:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C85C004E1;
 Thu,  3 Mar 2022 08:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646297706;
 bh=kU5Q06pAx6Ke2pgUtQgshelxBuHKHAWI3QpSa9wC5UY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OvuGsYkKqyLhu4HoxbCPmS8D8ZmQHLQY5D4+dOgwVoidcT5Zg+gPqjBJNrykjeE/5
 ZRroooUFFL1sK8UqRkSWlcH2WjnsUKpS6gNbaHTRew7U+hC/WtmD8t4getcCZvyeTG
 B/JTk5f+9WRrYk9OceV7uvBE1/ocsiIYRt5JtklC0Un+YwMRvLsRuVmBM/nCqZChYH
 pMpKXJIZYtUcRE8fIOOb0T9GTEkT0daYKeufiBdHpqEK3Ymj+yIN5oY28UgQsUdtxz
 wemjxoJEdPHUD3bnbFzvhYrwxU1oTozoHSSGYequ5W10JV5+Y/lmcIKFp78b/QijPJ
 6Fbk7R1nmxaig==
Date: Thu, 3 Mar 2022 16:55:02 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8183: support wb bt audio
Message-ID: <YiCCZoryo9LVQEGl@google.com>
References: <20220303061147.5037-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303061147.5037-1-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Mar 03, 2022 at 02:11:47PM +0800, Jiaxin Yu wrote:
> This patch use "bt-sco-pcm-wb" codec dai driver for wb bt audio.

If it could get chance for a respin, describe it in imperative mood.  See [1].

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
With some minor comments,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

> ---
> 
> This patch depends on:
> https://patchwork.kernel.org/project/alsa-devel/patch/20220302013533.29068-1-jiaxin.yu@mediatek.com/

Actually, it doesn't depend on the patch.  They are independent.
