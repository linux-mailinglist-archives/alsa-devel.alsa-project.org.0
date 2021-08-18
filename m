Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7989C3F0247
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 13:10:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C5871677;
	Wed, 18 Aug 2021 13:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C5871677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629285031;
	bh=pNqX3fm1TcWDxV0nY399ZsxIBrDBXH976DNPR35fYqY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NRY91wfAr14q0aRB0oZtakdvOKxngT4Uo1XqCVMZitduZJvmW99LWXRVNZpcjdzYx
	 oqH9KM797PqwoFL23e8zvBdQ1NeM4jmQ3pyS/ztw/w82NCZJZeBADQl3m6UHv1pLtV
	 Ypci5z2sHsXaXV4ugrTcEiheoKYYORX5ecttNbQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D5A7F80169;
	Wed, 18 Aug 2021 13:09:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03521F80249; Wed, 18 Aug 2021 13:09:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC3D3F800EC
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 13:09:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC3D3F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="MFpC4vjg"
Received: by mail-pj1-x102b.google.com with SMTP id
 gz13-20020a17090b0ecdb0290178c0e0ce8bso5002247pjb.1
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 04:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ItiWsiVPpaooIsQTr6YArP7gnhXSrSl5YCfuMVB10ic=;
 b=MFpC4vjgrKS1RYmAO3byjkVXlHckX12WoV+oYNlRvlPa6kPSL0t2wAemfA9BCsD4GU
 0MUkx36Zwsmn2GoqCI7qSi+03nCISlpFOWOpPZRvhfg+hWcCM9CBRFdi2NdXVkW0mX3g
 SbB/hgGN7Hwvq0jrw8e40U93oKScsojmwl1QNNnq6wYpaKHrscEq8CkyE+tPgUTm67zU
 XgDYIWXuS0BGh9yfO8VXuXufX4z8CNYM80qOcGv0CDfMnWZ7HunENcriR8IelnaVDtPf
 uuGhJXCLcId0RkX9adLI5+S7YLjrNUGMMuKWFM1LjxrI/KOS7Lnuekz9/mJ0J0vzQtKM
 gKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ItiWsiVPpaooIsQTr6YArP7gnhXSrSl5YCfuMVB10ic=;
 b=J9oidghhYLqtUBYj41iaOL4TNXavChS4LXvncc401ihy+7vZdfdS3yPUDpWEGp4bid
 h8lpuIc/N9JGHgsoow/5f+5fTBvqNC54EumRvaNmpL8wsQOfBWozEMRqYSGxXho9yu2y
 sF1QMngb8vcqFU/BT+zOeEL372piayqh6jVSyMzPufVf3q09hLJYuX6h5sSGz7YrbcNL
 xphlWqZD5064rCmLQrwQoLHfWBkJTzF5Rv7R26L/SPfwXm2gKKnbVCG7NMlTxsyPvoKd
 SWXsCkJyWv849ufU9UDE9wNIoequtbKORWAtxi1VMqYne3xE0jhoNyLiTX9mSaGUywOq
 73Aw==
X-Gm-Message-State: AOAM531g4YWr/UhDjwEeZpemT25dMLvLr7N2cakcEi7SenzyPsCMfL9N
 EyXeBcUNHFSSepXPjgTfOhqZjw9Erk7piN5rds10yQ==
X-Google-Smtp-Source: ABdhPJyn3Fggo+U+dgSQngTBAiJqGm/4j7x6CPazphUXpzvDtHIKmRnGm2+gdG84/PpdEItChawUgDXzO68XnBSIQCo=
X-Received: by 2002:a17:90a:7283:: with SMTP id
 e3mr8941192pjg.65.1629284939608; 
 Wed, 18 Aug 2021 04:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210818075742.1515155-1-cezary.rojewski@intel.com>
In-Reply-To: <20210818075742.1515155-1-cezary.rojewski@intel.com>
From: Lukasz Majczak <lma@semihalf.com>
Date: Wed, 18 Aug 2021 13:08:47 +0200
Message-ID: <CAFJ_xbo85Krq3DxmQBE+pZ4vtTWFDMdgjNM4xd=un=vzE38sRQ@mail.gmail.com>
Subject: Re: [PATCH 00/11] ASoC: Intel: Skylake: Fix and support complex
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, jairaj.arava@intel.com, upstream@semihalf.com,
 Harsha Priya <harshapriya.n@intel.com>, cujomalainey@google.com,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 hdegoede@redhat.com, Mark Brown <broonie@kernel.org>, jenny.tc@intel.com,
 Gopal Vamshi Krishna <vamshi.krishna.gopal@intel.com>
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

=C5=9Br., 18 sie 2021 o 09:54 Cezary Rojewski <cezary.rojewski@intel.com> n=
apisa=C5=82(a):
>
> Existing skylake-driver supports very basic scenarios with limited range
> of modules and their control. Attached changes first fix code as several
> advanced configurations are 'mentioned' throughout the files but are not
> actually functional. Follow up are changes adding missing support for
> said configurations.
>
> Cezary Rojewski (5):
>   ASoC: Intel: kbl_da7219_max98927: Fix format selection for max98373
>   ASoC: Intel: Skylake: Leave data as is when invoking TLV IPCs
>   ASoC: Intel: Skylake: Fix module resource and format selection
>   ASoC: Intel: Skylake: Fix module configuration for KPB and MIXER
>   ASoC: Intel: Skylake: Select first entry for singular pipe config
>     arrays
>
> Gustaw Lewandowski (2):
>   ASoC: Intel: Skylake: Fix passing loadable flag for module
>   ASoC: Intel: Skylake: Simplify m_state for loadable modules
>
> Kareem Shaik (1):
>   ASoC: Intel: Skylake: Support multiple format configs
>
> Pawel Harlozinski (1):
>   ASoC: Intel: Skylake: Properly configure modules with generic
>     extension
>
> Piotr Maziarz (1):
>   ASoC: Intel: Skylake: Select proper format for NHLT blob
>
> Szymon Mielczarek (1):
>   ASoC: Intel: Skylake: Support modules with generic extension
>
>  include/uapi/sound/snd_sst_tokens.h          |   6 +-
>  sound/soc/intel/boards/kbl_da7219_max98927.c |  55 +------
>  sound/soc/intel/skylake/skl-messages.c       | 155 ++++++++++++-------
>  sound/soc/intel/skylake/skl-pcm.c            |  25 ++-
>  sound/soc/intel/skylake/skl-topology.c       | 155 +++++++++++--------
>  sound/soc/intel/skylake/skl-topology.h       |  26 +++-
>  6 files changed, 231 insertions(+), 191 deletions(-)
>
> --
> 2.25.1
>
I have checked playback/record with speakers/dmic/headset on the Atlas
chromebook - everything seems to work fine, so:

Tested-by: Lukasz Majczak <lma@semihalf.com>

Best regards,
Lukasz
