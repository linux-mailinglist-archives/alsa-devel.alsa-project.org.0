Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 557884396E5
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 14:59:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C877C16CB;
	Mon, 25 Oct 2021 14:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C877C16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635166795;
	bh=kggSCSu6rdv94kVQ1AAvUlB38PLMb9JZujLErCGKwDk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QC6pwb+zkNDPQPAESTce97/cEWETEkFkVND6DbI1SuszxtpmeFCyraJk+j5yFU9QZ
	 sNu8QaKMwM6I8b4F85WAZmrS6Y2G50DC16apDozf/NrBjVvdLVjXreUx+AyvpTvV40
	 iHwnYDfEFrAtrWenGJp2eobORdxEAMyeaRx88bsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AECFF8025E;
	Mon, 25 Oct 2021 14:58:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92FF1F8025A; Mon, 25 Oct 2021 14:58:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EC2AF80086
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 14:58:27 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5B1D5A003F;
 Mon, 25 Oct 2021 14:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5B1D5A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1635166702; bh=2eZ26/VaEzftwu3ZmYsfOCPTwZ9yZoE3hgkj1VEFB+I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BHt3MaR/tnH1YLlX0CxYPQLb0TApnFbI0kfh54oCDK9UYHer4A5PCYcG7fNDlI9Wl
 l/rAVmzVS+aGmJ4bJnEpVBj4S8+Ub5Xqkq1fW4Tar5TF0/zuRCsbSOMsJdgCWNlEhi
 hZMMBpuIDsoRSFlTW5nddFWLYAwb1aOChP6N3TgM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 25 Oct 2021 14:58:13 +0200 (CEST)
Message-ID: <79541c76-2c2b-fd4b-60c8-67ee6b8ea3fa@perex.cz>
Date: Mon, 25 Oct 2021 14:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] ASoC: tegra: Add master volume/mute control support
Content-Language: en-US
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com
References: <1635159976-17355-1-git-send-email-spujar@nvidia.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <1635159976-17355-1-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 thierry.reding@gmail.com, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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

On 25. 10. 21 13:06, Sameer Pujar wrote:

> @@ -150,11 +186,22 @@ static int tegra210_mvc_put_mute(struct snd_kcontrol *kcontrol,

...
>   
>   	return 1;

It's a bit unrelated comment to this change, but it may be worth to verify all 
kcontrol put callbacks in the tegra code. Ensure that value 1 is returned only 
when something was really changed in hardware.

The tegra210_i2s_put_control() has opposite problem for example - returns 
always 0 which means that the change notifications are not send to subscribed 
applications.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
