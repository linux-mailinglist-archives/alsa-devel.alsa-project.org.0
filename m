Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2124EDF41
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 18:59:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62A351A23;
	Thu, 31 Mar 2022 18:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62A351A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648745944;
	bh=E04uSCB1BXE8v4n1dsEjGmXWunGzTs+OdMoZdRot078=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jzQEr+i+v6PpwhVURg9DkNNujWPTo5Qe5lDTFH+OuOX/qkO2rTREci5rfbn0rflLt
	 V7Jno5S4xqi3kjYvT2RM/urOZJy7VtDza2KXTvAgWkUarEw1AmjIH3WPj5n7CJoSWL
	 N48wWOys3UAhXmmJTppoJeFvB+5QkSAfkKoBA4Ak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74AD1F804AE;
	Thu, 31 Mar 2022 18:58:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE885F802D2; Thu, 31 Mar 2022 18:57:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E20AF80100
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 18:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E20AF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A77Y0rrJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8228F6142F;
 Thu, 31 Mar 2022 16:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57387C3410F;
 Thu, 31 Mar 2022 16:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648745869;
 bh=E04uSCB1BXE8v4n1dsEjGmXWunGzTs+OdMoZdRot078=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A77Y0rrJBysWC3OLfZNdY5ss9jc4izJGVFgK+SFGKosuhyv7Tluf3M1CGMummHUgC
 iTF/pIpOgJOuvivZd8KV7TOVoIb7aAb5nqSayiV2rpswzrKzq6o1qszGPXUkMHaZHv
 64NvC2SqHoQNoHDYi4D6WskhexywWME4iYZKs55NbFsU++4BjgjxCoexkziA84IpBL
 89Nzb0Qq4AcFEdPlAodDXTeZ/UwGddA516SlRICfisyszCTQu7betoNVsCVTZvhlqQ
 hP/Q6E2kw1CTW84HBWmy7AGosAt0esiDQXyYt7GYqcBlJizLd2g4k99xSY4HqANoCI
 Pi2uIHJi75IUg==
Date: Thu, 31 Mar 2022 12:57:48 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.17 58/66] ASoC: Intel: Revert "ASoC: Intel:
 sof_es8336: add quirk for Huawei D15 2021"
Message-ID: <YkXdjJcvCTkI/yzA@sashalap>
References: <20220330114646.1669334-1-sashal@kernel.org>
 <20220330114646.1669334-58-sashal@kernel.org>
 <YkRGb9uDhWV9GQfn@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YkRGb9uDhWV9GQfn@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
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

On Wed, Mar 30, 2022 at 01:00:47PM +0100, Mark Brown wrote:
>On Wed, Mar 30, 2022 at 07:46:37AM -0400, Sasha Levin wrote:
>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>
>> [ Upstream commit 1b5283483a782f6560999d8d5965b1874d104812 ]
>>
>> This reverts commit ce6a70bfce21bb4edb7c0f29ecfb0522fa34ab71.
>>
>> The next patch will add run-time detection of the required SSP and
>> this hard-coded quirk is not needed.
>
>This is reverting a commit which was bacported earlier in this series?

Yeah, it makes it easier for us to track and make sure we won't pick up
the quirk commit again.

-- 
Thanks,
Sasha
