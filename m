Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E32C2847DD
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 09:53:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CED51766;
	Tue,  6 Oct 2020 09:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CED51766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601970782;
	bh=rbJOmbMb//YrCPGaoP0rtg8XDPUxCAEU3m7aXm+blhE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ei2cDvqyoFeaTr5Q2RL4EmTSYoTgUco+kzeFwuULG7pGKWYSa4MUNb6oksUjmU320
	 sK2eFSbIIRuoePcisWNr9VqCt06axazJ0xc7ysxsJa2D4WFYvNc+ZIVqv6qLYo+oFh
	 6B0klPNRuQQ7O9fBF2/jTd9tO2QbbweBaN6mQpO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33092F8012B;
	Tue,  6 Oct 2020 09:51:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A08F3F8012A; Tue,  6 Oct 2020 09:51:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8529CF80053
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 09:51:14 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7D917A0058;
 Tue,  6 Oct 2020 09:51:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7D917A0058
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1601970673; bh=Xczo9cg1NEbZtEGEIewk2rKJZntYp0xj08K0kuUFVT4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UoKWBNqV2IgRc8y34u/nrQ55HS0Z2k6We5NP4EZhbs2QJKMEEVDyvnQYG21Bz50RP
 RcxoYbN7h0nt03KEKA+xp7RjZmzDwrN65/sRt4TlGGpZXryzjVQTfi1RzZyTgYc2Ik
 NP1M0d6cByY7V9wuE/MRgpb0t1eOo0cKJ6A/6mY8=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  6 Oct 2020 09:51:06 +0200 (CEST)
Subject: Re: [PATCH 0/4] ASoC: SOF: cleanups for 5.10
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20200930152026.3902186-1-kai.vehmanen@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <2abc3bb0-ac6e-c06a-059f-fd5a03b21447@perex.cz>
Date: Tue, 6 Oct 2020 09:51:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200930152026.3902186-1-kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
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

Dne 30. 09. 20 v 17:20 Kai Vehmanen napsal(a):
> Series with multiple code cleanups, plus one fix to remove
> unnecessary kernel warnings related to firmware loading.
> 
> Bard Liao (1):
>   ASoC: SOF: loader: handle all SOF_IPC_EXT types
> 
> Pierre-Louis Bossart (3):
>   ASoC: SOF: control: remove const in sizeof()
>   ASoC: SOF: topology: remove const in sizeof()
>   ASoC: SOF: sof-audio: remove goto used for force-nocodec support
> 
>  sound/soc/sof/control.c   | 20 ++++++++++----------
>  sound/soc/sof/loader.c    |  5 +++++
>  sound/soc/sof/sof-audio.c | 10 +++-------
>  sound/soc/sof/topology.c  |  2 +-
>  4 files changed, 19 insertions(+), 18 deletions(-)
> 

Acked-by: Jaroslav Kysela <perex@perex.cz>
Tested-by: Jaroslav Kysela <perex@perex.cz>

Mark, apply, please.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
