Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC42652200
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 15:07:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C80D4167A;
	Tue, 20 Dec 2022 15:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C80D4167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671545244;
	bh=yVRXp9HWSut0MqMLMIW4lN1+1yLdsL4S9FACC69XIO4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=N4j1yUAls54weZz9dt9RwGiC66A/977Nm1kR1GO38Bu2Iz4igj/5fX8sokVQMZ1eH
	 cEIQj6cWASMWubcwYfvNvejpS6H0IR3aIcF7YMiOtn67IwsXFyFlek/m1LWfjN4MRR
	 XaPzKNRC1e+sTEJTct+JSYL7NR7sMht6449V8L3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 552B8F80022;
	Tue, 20 Dec 2022 15:06:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DE0BF8025E; Tue, 20 Dec 2022 15:06:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 722BCF8018A
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 15:06:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 722BCF8018A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=CCoYhv92
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-381662c78a9so170040387b3.7
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 06:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yVRXp9HWSut0MqMLMIW4lN1+1yLdsL4S9FACC69XIO4=;
 b=CCoYhv92Vl2muPxLcXtYX6rodjS1ytyNvv9t0mMUu2eVCrcwH9JHGxIApstv50fHtj
 itYJR/PyIPe9jsLox4jXqbZrBJV6alw1JZ1o9TJudDuhht/VGIy4rAMyDAc2zh8kFlPB
 XVIBflim1ou1oDUvdHHUU8LplKKkbCjb/0nqwMgD+QFmR0j0syeu2bSjzvjz+3MilYKn
 8emu8yi5+u1yxMY9qS4tSHyoTFbTrhG9dojyUV4EpAJ0xzCxVfnY6B0pOPoWzsHkxE9d
 r+EKM/Ji1RT0u7npJpYPQ7KbZU6U6gBg/1ShiMcwwbKEzwFWx3XdrlpmQTkG5BB99xmk
 CwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yVRXp9HWSut0MqMLMIW4lN1+1yLdsL4S9FACC69XIO4=;
 b=oEgPiLITF0ATZzitHEeU7i34kttTqUg6t23neYN+GLJndIycoPfEgcUKkhAVo4WJlC
 U5XiyVh/mivcQvTQOJnFQJvYP9t4Z+K4csv5uXL3zJKOKqra4yieTreuU7biz5DqFJP7
 njKo5oWXTFpVjvsDn/AO7oCtl5PvK4hfjdFwvPW2eWKohSDI10erFeMNHmB2WP8lTCco
 rxNKT8f4TCGoDNOgC+rl3VLi9Nt2LrWtXOWItQ6ru6SKjxIQpiRz2xiXqZkMQnxLN3KJ
 baAzsfegPOUiJ4QY4E5Gy6G5xOnBXMmin/GouYAvk2YolYRRLgzjQ/il80vaz/i0UiV1
 uWwQ==
X-Gm-Message-State: ANoB5pnyZTlo8/51j441CjEFj3Lnb+8q4QRtjaQxTyKOYRTcPtFAxKD8
 mA56QwqtBf7KmLtbQ6xR21AdVHzoTZamUJdVn+IOTw==
X-Google-Smtp-Source: AA0mqf4oJ8+ioIHfs77wMEDfrixzL/lH7cThEPZQcNaJKW4kU+NH4sDF4PekNHZfJ13KSEeOcZJpiG+thGcnlc5sKpg=
X-Received: by 2002:a81:d543:0:b0:3ba:29f1:1ddc with SMTP id
 l3-20020a81d543000000b003ba29f11ddcmr4496842ywj.311.1671545180928; Tue, 20
 Dec 2022 06:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20221216154938.9426-1-ajye_huang@compal.corp-partner.google.com>
 <b0612bbd-2eba-36cf-9c29-7542cf32adfd@linux.intel.com>
 <CALprXBYy9_ax8-xfh0paB59Pn=TB7yVLwtY8vnT_-y5vWd867w@mail.gmail.com>
 <9aa4bffd-bc7e-0e40-3063-5ce80b5fbe9a@linux.intel.com>
In-Reply-To: <9aa4bffd-bc7e-0e40-3063-5ce80b5fbe9a@linux.intel.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Tue, 20 Dec 2022 22:06:10 +0800
Message-ID: <CALprXBaw7biz6V5j0YGtbR7CJF6ZWZf3ZO_t4hZBOHx_5zLS8g@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: Intel: sof_nau8825: add variant with nau8318
 amplifier.
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Libin Yang <libin.yang@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, "balamurugan . c" <balamurugan.c@intel.com>,
 Mark Brown <broonie@kernel.org>, Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, David Lin <CTLIN0@nuvoton.com>,
 alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dear Mark,

On Sat, Dec 17, 2022 at 1:37 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

First of all, I apologize for this letter of inquiry.
I got "Acked-by" from Pierre .
Please kindly check this when you are free, thank you so much.
