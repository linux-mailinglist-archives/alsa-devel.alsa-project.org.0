Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ADF30BE74
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 13:43:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 114271753;
	Tue,  2 Feb 2021 13:42:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 114271753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612269804;
	bh=yEITI8MM0RkA0X9GXlIwV5mOBrna2ca3A7oJ4+++sRk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O1Rc0PCK+m0NwHzxX3b+a7kSppKgHaS38txDkekt9LVDsi3PNYm/VHAWJRheFYE46
	 wOQrI1SfI4eaNMzpuDHYQQoT+w+4Q5m9aSxPw+4yIPGC08WV9bVFETeZn6L0wQhEfi
	 fJPkd5/XPg0xbhj1Ez8tXLYydLrMCuLj6+mAJmRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59625F801F7;
	Tue,  2 Feb 2021 13:41:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDA27F80171; Tue,  2 Feb 2021 13:41:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25640F8013C
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 13:41:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25640F8013C
Received: from mail-lj1-f197.google.com ([209.85.208.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1l6uzz-0005HA-5I
 for alsa-devel@alsa-project.org; Tue, 02 Feb 2021 12:41:39 +0000
Received: by mail-lj1-f197.google.com with SMTP id m25so11294803ljj.9
 for <alsa-devel@alsa-project.org>; Tue, 02 Feb 2021 04:41:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yEITI8MM0RkA0X9GXlIwV5mOBrna2ca3A7oJ4+++sRk=;
 b=Z2EJ3iJTEv7qjhHkso8Lw+CHn7f1FlFNVFCfJ5wIhHpP2wQudfjxYL//J6LLV79jOB
 RPaxNyd3e9qlmt20etlVv5KnmZzFKsxq2xI7KTSjTQDr1SHjgow6kd5PxG5XLBbA632k
 njlq3sXqrkvyADDULwnJhRJkdkUSjx4TEnmsvDfHic7jFUV+bFDwvOeTurmyi1b4YWGy
 oYSNZLD6qcDFx/2JvdLOK6LRUKbxPL+7jB8pSNrHaDSA5TqrlX9TDIycZzNtznJDJIdB
 eUteOH2GJ5jNXd6foLjIr88M7YYEly7mQPxnkXYBSh6AhnLEm6bDrKQssALGHqavqM7b
 n/1w==
X-Gm-Message-State: AOAM533ewUGVkUg+0xLbEA9PF/F2qjNowaldda8PL1e1EoSXcpXAUex2
 fW3MCe2vHNzFEz372TesHhk1BbAuW93foA1eGe4Hb5XBCz/vHbGwbxBDlI5q0eM0O2W+i8HfTQq
 D5l86KqqBOX5jjpZPEvC9Zct5t2xajr94gF+l26Y1qFsj3gkqC6PHoV+p
X-Received: by 2002:a05:6512:b1b:: with SMTP id
 w27mr11133358lfu.10.1612269698586; 
 Tue, 02 Feb 2021 04:41:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6RYM6qBCHYefeaiJqQ/fdjoDN3PTCJaJYw/ZFg4MyJzVyVJeRqHq1Q9m2cNDurpZ7DUbAApgVkL9SINl4bQ0=
X-Received: by 2002:a05:6512:b1b:: with SMTP id
 w27mr11133333lfu.10.1612269698188; 
 Tue, 02 Feb 2021 04:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20210125115441.10383-1-cezary.rojewski@intel.com>
 <CAAd53p4fycxLn6y0WpaMWvWkN8EwmT216b40DavttfshN_GMRg@mail.gmail.com>
 <324dc8a5-c4d3-6ebf-c8e9-6321d6c93dab@intel.com>
 <CAAd53p4gqyuFPWX55fnPGHORXXf58++ZRMH9WFYp+QwS1=xDJQ@mail.gmail.com>
 <181c989f-7a4d-3cdd-11be-7378dbc9502c@intel.com>
 <5e970d19-9544-50fe-f140-b66245418c6e@intel.com>
In-Reply-To: <5e970d19-9544-50fe-f140-b66245418c6e@intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 2 Feb 2021 20:41:26 +0800
Message-ID: <CAAd53p4srH6NFwcyUCBnLj=MS8-YBvA9CPjMbcryGgi5CmUUHw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: Compile when any configuration is
 selected
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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

On Tue, Feb 2, 2021 at 6:56 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2021-02-02 11:12 AM, Cezary Rojewski wrote:
> >
> > On 2021-02-02 6:52 AM, Kai-Heng Feng wrote:
> >>
> >> Config file here:
> >> https://pastebin.ubuntu.com/p/kGBv6XgHms/
> >
> > Thank you for the config, Yang.
> >
>
> Sorry for the typo, meant to say: Kai-Heng. Was writing several emails
> in short succession.

It's okay :)

Commit cc2d025a81a9 ("ASoC: Intel: Skylake: Update description for
HDaudio kconfig") removed "DEPRECATED" from the
SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC, does that mean the option is safe
and should be enabled in downstream distros?

Kai-Heng

>
> Regards,
> Czarek
