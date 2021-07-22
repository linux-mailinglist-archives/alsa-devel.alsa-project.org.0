Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 838053D2564
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 16:15:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FB8416D9;
	Thu, 22 Jul 2021 16:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FB8416D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626963357;
	bh=h9bt+2ABEwbCJSPYIOdamsWRy7Ya4biD/RS9Mrg+ThA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cmXWBYv2EyM+Mb+sGOQXWipab9c7xUzLrPbqGgZH+GY/86RGH1wehw8U2AZCHM/pF
	 TNyPXds5zMsF/qQi4mhdz15rRCmEbo3J7DgolNpk3Ipj6MCHJP/g4fPzDUoF+xewYj
	 NKuPa6Wv6EKpUQxdNZCNVQ72Hxxb6ET8Iwg+8rXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99C3AF80218;
	Thu, 22 Jul 2021 16:14:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2A02F80227; Thu, 22 Jul 2021 16:14:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B58FAF800DA
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 16:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B58FAF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c+k9lvOj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02759613AE;
 Thu, 22 Jul 2021 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626963260;
 bh=h9bt+2ABEwbCJSPYIOdamsWRy7Ya4biD/RS9Mrg+ThA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c+k9lvOj8/tIhhVZxZjWNi85TGPheT0wf4+cGKHGDQAb34O1JCu3o8oamx+y4HL6o
 XaVstbjEumdqXmg2wfldglQibzJG337VQ3qpRfFEKIOf1RnCuAA0+4oK/bGW4mH906
 oefHSWy18njvPGRK7YjDgJlH8mYMouk8nfvvX2BDP5yr6MZCFTGZCtG4YMhW2e1/uR
 Dt4WfHs8l0XpC3fr6K/fcIByUdVp67EXnfUUtKRB4fL+HDCxer8xOu/JYYebGEiwAy
 1u4FQ/OfVh9JF+kmP0FWn2PYkxYornAZ6lkritSHYanbBHKJ6e0rASuQpQOG9j9n9S
 T1I3/IIS207yA==
Date: Thu, 22 Jul 2021 19:44:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: dmi-quirks: add ull suffix for SoundWire _ADR
 values
Message-ID: <YPl9ONsFv+3NeSfd@matsya>
References: <20210714013027.17022-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714013027.17022-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

On 14-07-21, 09:30, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Sparse throws the following type of warnings:
> 
> drivers/soundwire/dmi-quirks.c:25:17: error: constant
> 0x000010025D070100 is so big it is long
> 
> Let's add the 'ull' suffix to make this go away and find real issues.

Applied, thanks

-- 
~Vinod
