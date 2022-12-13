Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF4964BBBC
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 19:14:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58EF6184E;
	Tue, 13 Dec 2022 19:13:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58EF6184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670955282;
	bh=bsAx81CS2oGtFlCOIKJ8N6Se9n8UswnoX6gUXWJhq9s=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=R/AoNrepJ/Yn3QV3rVhqDRECf6NE71hhLdS+OIpXjkDXESXjibiXD/1hascFNH6m9
	 ieqmHG4F/UN/k6uMJN9wBQnjGdtoWnWLDvIkGIWZcgxKwdeOjnchEpwnZtmy40YhTU
	 L5oAVpX2al6GWnRtHkBkGt1kMNY1URk1KLtA3LAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0126AF804FD;
	Tue, 13 Dec 2022 19:13:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21654F804E2; Tue, 13 Dec 2022 19:13:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
 USER_IN_DEF_SPF_WL shortcircuit=no autolearn=unavailable
 autolearn_force=no version=3.4.6
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02AAEF804D6
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 19:13:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02AAEF804D6
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=VuOVc9dM
Received: by mail-pj1-x102a.google.com with SMTP id u5so4240212pjy.5
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 10:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bsAx81CS2oGtFlCOIKJ8N6Se9n8UswnoX6gUXWJhq9s=;
 b=VuOVc9dMuIMJz0Dd34VYPlU6ugaxmknQDoMrG5R7uQ5/qpQpbyKwiY7mNU+QgDUtCK
 VkpAdxjZCrFA2AMI7fBHmIIkmi/kUbLQPoxtN0WcjCl9Wu9pcPv2N9pbGogcYhmmgu9x
 wuB1AkD9GkJYjpTrvyeJmuVJOnt7HPvElLbG7uivUVNghl8B8jEXZeTqTyTxUsFVtTS7
 U2qeQkM3IsBjwUJnG2ATPrYF+QYaYNX0X/Kt4O3HyDCyAcRLNQkML35HHbvsC19YHzyq
 Ue5043VbSlz6zLlvo1tcJHA0EmlHu3Ecg/ObI9fgQ6NOjD18pG5cCS68BdXHOs+DiSuR
 0Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bsAx81CS2oGtFlCOIKJ8N6Se9n8UswnoX6gUXWJhq9s=;
 b=pJ/dCensruIwBI/172vu0udZW/nL6V0TZOrqc6rG53lAyKU0NuecNNZJSU+l7SHyU/
 x/KtmPc+yrHnxFAiicMCUxvh4p6uJIw6SWJUWy8rOrAJswp0+063nj1jzMff58P7AXSq
 Lx05E2z5Kvv6HapCVuY0GfXGAqgyvylgadiMs89M0eVE8XlaVfH877U6DhLlFCvD45fn
 JbZSp6sJkA1ZV0pzNfhsV6+Khj+YXyKq580fITn6vrDKSXx4pt8mxkWTaJpshR89omRt
 YO9RhyI0b72SzROpLbs1NpWVzDNBJLl63ZanAbJvSfgo34AXCrKDEsMFHnbJ3iAeC20V
 HmrA==
X-Gm-Message-State: ANoB5pl9koOBJoaTMl97ZhbXjVPV0vbX4biZJ+CSVpjZe2JwNODIEENo
 IQjveLzkWfKQNQPSWOT3fx5UabdOvGTtiIUgWn5IKA==
X-Google-Smtp-Source: AA0mqf4/WHF+AYjmztxjz2jxNUncNhbMJ1aubsknOZGZah2GaEZhPlFE9bFEzQuI53SC2AwxWPH0+sI2DPdk1GSfNbM=
X-Received: by 2002:a17:90a:6708:b0:219:2b00:8d23 with SMTP id
 n8-20020a17090a670800b002192b008d23mr412904pjj.167.1670955217708; Tue, 13 Dec
 2022 10:13:37 -0800 (PST)
MIME-Version: 1.0
References: <20221213115617.25086-1-yc.hung@mediatek.com>
In-Reply-To: <20221213115617.25086-1-yc.hung@mediatek.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 13 Dec 2022 10:13:26 -0800
Message-ID: <CAOReqxihOWVh0rGqwqCJ3SEOnEpH3RDQv-U1PEQJ6Tj5e02Vag@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: initialize panic_info to zero
To: YC Hung <yc.hung@mediatek.com>
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 chunxu.li@mediatek.com, linux-kernel@vger.kernel.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Chao Song <chao.song@intel.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Dec 13, 2022 at 3:56 AM YC Hung <yc.hung@mediatek.com> wrote:
>
> Coverity spotted that panic_info is not initialized to zero in
> mtk_adsp_dump. Using uninitialized value panic_info.linenum when
> calling snd_sof_get_status. Fix this coverity by initializing
> panic_info struct as zero.
>
> Signed-off-by: YC Hung <yc.hung@mediatek.com>

Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
