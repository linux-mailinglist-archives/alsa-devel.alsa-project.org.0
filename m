Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF74E275350
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 10:36:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8092172D;
	Wed, 23 Sep 2020 10:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8092172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600850217;
	bh=VjBtrSHGHcT19Pvg8/6wdfdL+hxR0DQu8lIqrdm3NaY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DS6opK+uX/fjYkGQt7X8/iH/AsQIPEu1kFq80vNBE6+GEPXmKzm7zORsJOXmo7tdk
	 jsnxZKPJ7CM4cChDL0YNBhwjMkoAvgYna9/djYIAIAk4DBlr49KjsSwSTxcWuyex6z
	 /8rT3HSTGtDzi3gs5XQSbMrHeiVelCsXAYXxQU/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B278F8021C;
	Wed, 23 Sep 2020 10:35:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80C0EF8015F; Wed, 23 Sep 2020 10:35:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60CE2F8015F
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 10:35:02 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A43BDA0040;
 Wed, 23 Sep 2020 10:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A43BDA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1600850101; bh=JNl8ewmOiJon2kQ6+ph78p4AVqfPkHp4/2SQg4Iqq74=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mMHTLgjPVxxwG3A1jlauItxZSfPfvh4rMs9rnS9YaNzjaLbqsa98Lv1bm+qHpuBqJ
 1MUGcOD8Gnp6BKgYUFcz+jwvTeTPDzm+i3lCYtW9YnZJXeD4X8mQmL+f5ldoqnJwGc
 Lbqv2u1/P59YA/y/b3cdjhCZhTf+V2LxWiAWDDLg=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 23 Sep 2020 10:34:52 +0200 (CEST)
Subject: Re: [PATCH 5/6] ASoC: Intel: sof_sdw_rt700: add codec prefix
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20200923080514.3242858-1-kai.vehmanen@linux.intel.com>
 <20200923080514.3242858-6-kai.vehmanen@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <b9481c23-5a09-0518-b05b-c01b2d04e102@perex.cz>
Date: Wed, 23 Sep 2020 10:34:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200923080514.3242858-6-kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 daniel.baluta@nxp.com
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

Dne 23. 09. 20 v 10:05 Kai Vehmanen napsal(a):
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Somehow for this codec we never used any prefix for the controls,
> likely because the test platform has a single SoundWire device.
> 
> Follow the convention and use the codec prefix across the board to
> avoid possible conflicts.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>  sound/soc/intel/boards/sof_sdw_rt700.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
> index bff69cfe27f4..21e7e4a81779 100644
> --- a/sound/soc/intel/boards/sof_sdw_rt700.c
> +++ b/sound/soc/intel/boards/sof_sdw_rt700.c
> @@ -23,9 +23,9 @@ static const struct snd_soc_dapm_widget rt700_widgets[] = {
>  
>  static const struct snd_soc_dapm_route rt700_map[] = {
>  	/* Headphones */
> -	{ "Headphones", NULL, "HP" },
> -	{ "Speaker", NULL, "SPK" },
> -	{ "MIC2", NULL, "AMIC" },
> +	{ "Headphones", NULL, "rt700 HP" },
> +	{ "Speaker", NULL, "rt700 SPK" },

> +	{ "rt700 MIC2", NULL, "AMIC" },

This line looks suspicious. Perhaps, the prefix should be added before AMIC ?

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
