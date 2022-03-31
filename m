Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E09F54EDF3B
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 18:58:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70C52192E;
	Thu, 31 Mar 2022 18:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70C52192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648745911;
	bh=yA9+KO3O1jARWOMC2omd2MhcSPzFCNmSUyJCd+gNn5k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r7q+yXXtbMUtXlvCMfF5tHkZJPu6ys4Dl2RAHeSE0Q77fgOq5G6Hx8ilxgLKy0sAl
	 fkuFeE65t27eXlzur8TRGfntjwtuFYGE2CCOftNKcqsVi2n+RNhSQU0f68L+fnbbqO
	 T/spO0lo87vABklOXwyqacn1vccvyDhyJgNnZG1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5E87F80238;
	Thu, 31 Mar 2022 18:57:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2A22F80227; Thu, 31 Mar 2022 18:57:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AA4BF80100
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 18:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AA4BF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YyrGUdd2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89E81B82055;
 Thu, 31 Mar 2022 16:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFC5C340ED;
 Thu, 31 Mar 2022 16:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648745833;
 bh=yA9+KO3O1jARWOMC2omd2MhcSPzFCNmSUyJCd+gNn5k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YyrGUdd2nxSYfhkeKX3ilGPHF0K/NKNqDhtBxYKuTvilMs+v4PDJHBHdS70CpkWAA
 LkzOitfAYtjD0P6FyA+SRCf+cRx66nvFwcIsHTpU+lwfsuelaEx7x80Kz/aKD6q4Ed
 7PVFdJwnBgoMxzSOo0Tnz4h9VmyQXV91vankcSQHeOq03QdyKnU37NNgfO1srcFWzC
 90B31pN3MovVSXMEukmzMvSRnDAcS1UIarVp8+avBU701s45i93Me7EqA0+3G74v1o
 pHDdVKGi4iPGy50KExpkCgm2oUrcfUHvsw32vawjO1ROvlrIgzn7pWRyThe4jcCpOb
 M5afp23LU6VLw==
Date: Thu, 31 Mar 2022 12:57:12 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.17 64/66] ASoC: ak4642: Use
 of_device_get_match_data()
Message-ID: <YkXdaOOHd7w5OPG0@sashalap>
References: <20220330114646.1669334-1-sashal@kernel.org>
 <20220330114646.1669334-64-sashal@kernel.org>
 <YkRHhksDIqDpHoCz@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YkRHhksDIqDpHoCz@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com, lgirdwood@gmail.com,
 stable@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>
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

On Wed, Mar 30, 2022 at 01:05:26PM +0100, Mark Brown wrote:
>On Wed, Mar 30, 2022 at 07:46:43AM -0400, Sasha Levin wrote:
>> From: Minghao Chi <chi.minghao@zte.com.cn>
>>
>> [ Upstream commit 835ca59799f5c60b4b54bdc7aa785c99552f63e4 ]
>>
>> Use of_device_get_match_data() to simplify the code.
>
>This is just a random code style improvement, I can't see why we'd
>backport it to stable?

Yup, I'll drop it.

-- 
Thanks,
Sasha
