Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BB4516781
	for <lists+alsa-devel@lfdr.de>; Sun,  1 May 2022 21:33:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 631D815C3;
	Sun,  1 May 2022 21:32:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 631D815C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651433590;
	bh=g7jlHPWeLM6Q7NEChcAELzEahFuYps1ugv49wmKn2zY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cbkSGObCSqQ93ZsweaYAuAbZzL1tamWu6hTdtIrOcE4mXQvsrZnHU5TH3Dzs/fXJS
	 IYv0f6dWFXLmBmozVdyhlZYAXu4yndlbJ6zYEK/AuskFrtQWT+v7nLzc1KEiex3ZQ2
	 XiDOrx3gj4VIxB9IEB9YPh/McPPWXpzkvfLR624c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA3DEF8015B;
	Sun,  1 May 2022 21:32:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BF52F80137; Sun,  1 May 2022 21:32:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C47FF800EF
 for <alsa-devel@alsa-project.org>; Sun,  1 May 2022 21:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C47FF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GMO6QTlM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB6CA61003;
 Sun,  1 May 2022 19:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808AFC385A9;
 Sun,  1 May 2022 19:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651433522;
 bh=g7jlHPWeLM6Q7NEChcAELzEahFuYps1ugv49wmKn2zY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GMO6QTlMZHkU+L8stOdjIjyb2hFSs8H19LXHq1Vmq+xBvlxLNbie8cJcokuUjE3Ya
 8F7jZw8y4DQDHSEClk7wMMt8FK4lJqVd7Idd9M4go+j/xLN0GV5AXC8d2Xe4PqmE/7
 lDi4s0XVg1IXpiVdaC3abQGvFJlLItv5SpPnNGdcCrOBLQRDfvhZooUDetuH0pBrF4
 /fhxz2w+8r0sM3A7Gje+Ff09GFGdF8gb7ieiDHPfL1vV1DuV1mnq4ISUrLZnU1R2a4
 4sqmInBkTD6gRIkaXOodmYpQkOQ1uVyGjGi5ic4bdaw+8J9bunF8FxBUTET2YxRxRD
 /3GQByoMk+oIA==
Date: Sun, 1 May 2022 15:32:01 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.17 06/22] ASoC: Intel: sof_es8336: Add a quirk
 for Huawei Matebook D15
Message-ID: <Ym7gMZRI7ad6u0fL@sashalap>
References: <20220426190145.2351135-1-sashal@kernel.org>
 <20220426190145.2351135-6-sashal@kernel.org>
 <Ymko4F24MvbGJUXp@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Ymko4F24MvbGJUXp@sirena.org.uk>
Cc: cezary.rojewski@intel.com, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, tiwai@suse.com, yang.jie@linux.intel.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 peter.ujfalusi@linux.intel.com
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

On Wed, Apr 27, 2022 at 12:28:32PM +0100, Mark Brown wrote:
>On Tue, Apr 26, 2022 at 03:01:29PM -0400, Sasha Levin wrote:
>> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>>
>> [ Upstream commit c7cb4717f641db68e8117635bfcf62a9c27dc8d3 ]
>>
>> Based on experimental tests, Huawei Matebook D15 actually uses
>> both gpio0 and gpio1: the first one controls the speaker, while
>> the other one controls the headphone.
>
>Are you sure this doesn't need the rest of the series it came along
>with?

I'm not :) Should we queue it too?

-- 
Thanks,
Sasha
