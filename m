Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EC225CB76
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:46:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 860EB1ADB;
	Thu,  3 Sep 2020 22:45:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 860EB1ADB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599166005;
	bh=3ShBjho57CyBCDaFiR0VcVrnZD03FaczjRtG1DNCDLI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=abpTgnLYzcPp+UWc8K6mIrfDsZHTNSOUuQ6pn7RaRlzIv8ZHId5Ps+33sm0VOAfSY
	 FAkgcjjq2NQu/YpYqyTtKomceP/phAOEj5G7II8oq1i+2imVoYhb0ivxsfnmLcJuAb
	 QdbWR3E/QgwDtzuaQJoWIwyxWX01Bog1Yjp06k40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9863AF802BC;
	Thu,  3 Sep 2020 22:42:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C7EEF80278; Thu,  3 Sep 2020 22:42:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF1B6F802A1
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:42:34 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3A3A2A0040;
 Thu,  3 Sep 2020 22:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3A3A2A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1599165754; bh=6Lq8gDffFAHde2eBuFGDiBaW+gW4wRjspkIWhTbOU2M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=b7HKGFwUNccL8rWMTMU2xiZf3jL852uaJMH4UPMRmkFoIPtetiVwnAe3kkUUjmc9d
 8GByfamDUpTQr045p4uQEP2DRC50XmAvAOiIK4Y/JdpquKMLg39O2rFFCMVhmmMOZF
 xISD4NmVQmnHADY4KXQbnKbX2JeLw1241m8co0cM=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu,  3 Sep 2020 22:42:30 +0200 (CEST)
Subject: Re: [RFC PATCH 0/3] alsa-lib/ASoC: use inclusive language for
 bclk/fsync/topology
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200903201024.1109914-1-pierre-louis.bossart@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <cac824a4-3882-85dd-dc0b-8366090dce94@perex.cz>
Date: Thu, 3 Sep 2020 22:42:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903201024.1109914-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org
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

Dne 03. 09. 20 v 22:10 Pierre-Louis Bossart napsal(a):
> The SOF (Sound Open Firmware) tree contains a lot of references in
> topology files to 'codec_slave'/'codec_master' terms, which in turn
> come from alsa-lib and ALSA/ASoC topology support at the kernel
> level. These terms are no longer compatible with the guidelines
> adopted by the kernel community [1] and need to change in
> backwards-compatible ways.
> 
> The main/secondary terms typically suggested in guidelines don't mean
> anything for clocks, this patchset suggests instead the use of
> 'provider' and 'follower' terms, with the 'codec' prefix kept to make
> it clear that the codec is the reference. The CM/CF suffixes are also
> replaced by CP/CF.

Only my 2 cents: It's just another word combo. See bellow for sources for others.

I would prefer probably provider/consumer . It sounds more technic.

[1] https://en.wikipedia.org/wiki/Master/slave_(technology)
[2]
https://www.zdnet.com/article/linux-team-approves-new-terminology-bans-terms-like-blacklist-and-slave/

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
