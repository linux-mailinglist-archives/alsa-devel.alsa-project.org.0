Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF284DBFC2
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 07:57:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE3A117E8;
	Thu, 17 Mar 2022 07:56:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE3A117E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647500261;
	bh=uLLNEo2KuqE/YxBYqDJGt2C9i0qNEgY7SPcUzgiznVk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NPyihhy0uzTTz2JXze4MXDntnoHTUmiBx+emV2ZWknOBZFtbW+fqG3GveQAMGLtTv
	 22TpPj/+xHHoL6S9IuXjGpJTaDSIxKnVWosXOo68Far1mYLir/6Z1UcPTw8YkahE5k
	 FOM31D1YQ99Ox2RqiqimJ/olmzWYs82kdG9U0e60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C9D9F80533;
	Thu, 17 Mar 2022 07:55:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFCAAF801EC; Mon, 14 Mar 2022 21:30:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3563DF8012C
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 21:30:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3563DF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KSdJV0Nr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7387D612C8;
 Mon, 14 Mar 2022 20:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C4DEC36AE9;
 Mon, 14 Mar 2022 20:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647289811;
 bh=uLLNEo2KuqE/YxBYqDJGt2C9i0qNEgY7SPcUzgiznVk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KSdJV0Nr6PH56dRvpyreK8Yv2TzppJmvm4v2HhSDZlhKT0LSad1hfJvJSpzZVcO9d
 zHJi6VvKrJAmS0T3joCqvHRXlFdKQlox2FOL5o22ch62xkW78NUj9CTUmjOfKaAzvY
 9wa3Li6Hhcj84nqdq5Zqw+FFIZAxg1ebLJNn+THcBi2aSLdI7JbUIrcFov90+OwV0Q
 zv85rGj50dgH9jUKb2sZlceYR38o+H9QNFXEhxQyuN0GgSQQXFG5YXFUz2YNqo6r/R
 WJCLtYJ2RD4vSP5TpCum1H/05+0bSavkIZaGcTXiNBVaTe+d3Tmg61eQY08Sc3iO2L
 gGS1F0tzOonqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2832EEAC095; Mon, 14 Mar 2022 20:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/6] use kzalloc
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164728981116.21494.4613160192240776648.git-patchwork-notify@kernel.org>
Date: Mon, 14 Mar 2022 20:30:11 +0000
References: <20220312102705.71413-1-Julia.Lawall@inria.fr>
In-Reply-To: <20220312102705.71413-1-Julia.Lawall@inria.fr>
To: Julia Lawall <julia.lawall@inria.fr>
X-Mailman-Approved-At: Thu, 17 Mar 2022 07:55:05 +0100
Cc: linux-cifs@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, samba-technical@lists.samba.org, andreyknvl@gmail.com
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

Hello:

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 12 Mar 2022 11:26:59 +0100 you wrote:
> Use kzalloc instead of kmalloc + memset.
> 
> ---
> 
>  drivers/net/ethernet/mellanox/mlx4/en_rx.c |    3 +--
>  drivers/net/wireless/zydas/zd1201.c        |    3 +--
>  drivers/scsi/lpfc/lpfc_debugfs.c           |    9 ++-------
>  drivers/usb/gadget/legacy/raw_gadget.c     |    3 +--
>  fs/cifs/transport.c                        |    3 +--
>  sound/core/seq/oss/seq_oss_init.c          |    3 +--
>  6 files changed, 7 insertions(+), 17 deletions(-)

Here is the summary with links:
  - [2/6] net/mlx4_en: use kzalloc
    https://git.kernel.org/netdev/net-next/c/3c2dfb735b4a
  - [5/6] zd1201: use kzalloc
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


