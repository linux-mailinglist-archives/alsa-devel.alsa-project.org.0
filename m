Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8464F4C2D4D
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 14:38:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D01E191E;
	Thu, 24 Feb 2022 14:37:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D01E191E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645709907;
	bh=5iJ6NjF03NsxuPxJ694YwbvcZcFiydVzfQ6L9KJvSgg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WAdMbWFeqrj1v1GFSdZh4e+HJy0qkm9bU6fSk/8k2FRtPWjfDduwy5vAoopXRmj5V
	 iBUN5wqGINEYNWNIQnCz9TnHDVJRT8csla3nYL6Ekt9HpyzNaNiCZYOzeUK2xVeFtA
	 zPjN/cSWWXSiWsv0TBKZUkiUWtaPpV8cT3nVtTbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B753F80310;
	Thu, 24 Feb 2022 14:37:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC380F8030F; Thu, 24 Feb 2022 14:37:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFCCEF800B6
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 14:37:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFCCEF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="APcQR+Qt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C3DC61AE0;
 Thu, 24 Feb 2022 13:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB42EC340E9;
 Thu, 24 Feb 2022 13:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645709828;
 bh=5iJ6NjF03NsxuPxJ694YwbvcZcFiydVzfQ6L9KJvSgg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=APcQR+QtL9yy5a2JKfAPmToK5AYKxu6YA2KzrtkqkPuH/8V5/depf51H83uAp1z7i
 DW3qxUtc7anDLPtJtCaTeQY1hHefWTBb+kTC1+gj4oq8+14qMrW4kH0YV4AXnnti93
 hKLUQkf5yBumsoWB7LseExEb25G7+yrJqFju2d8KorAHWv734FoYcD4zsAsw6OV0C8
 sEA4u3Y3ERZWWidrjsdAfLkshyAF7t+VxR29Hawq7VMes5KszhaglymdgRxaVHfUSR
 s0Kk4wCI9BKWlvDfEJSyQnOCmZmQbQS6m1pNQeM6sNEC9v/g3QZYZuPImjxLAHR2PL
 TKeDCjeaIfmNQ==
Date: Thu, 24 Feb 2022 19:07:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Raghu Bankapur <quic_rbankapu@quicinc.com>
Subject: Re: [PATCH V2 1/1] ASoC: compress: propagate the error code from the
 compress framework
Message-ID: <YheKAJtKe5BcFms9@matsya>
References: <cover.1645704570.git.quic_rbankapu@quicinc.com>
 <ca6d05bccf692c7e8ab9aa00f08878f163e524b1.1645704570.git.quic_rbankapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca6d05bccf692c7e8ab9aa00f08878f163e524b1.1645704570.git.quic_rbankapu@quicinc.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Krishna Jha <quic_kkishorj@quicinc.com>
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

On 24-02-22, 17:48, Raghu Bankapur wrote:
> Propagate the error code from the compress framework for the timestamp
> query. This error code will be used by the client to handle the
> error case scenarios gracefully.


Acked-By: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod
