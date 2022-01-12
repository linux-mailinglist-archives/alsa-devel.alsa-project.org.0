Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 430F248CBD9
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B68091E83;
	Wed, 12 Jan 2022 20:26:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B68091E83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642015628;
	bh=oqb3porLNx+xL8LPszd6cBs+HKnYfYssZ8m+DqN9VEA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IvAxgMaYUoFDaYNoYjo05d1XW1AhK1oOZM6ZT2uA5kQXTyrpgr46o1GCfoOR4eBYA
	 a0E7Kky99vkarD0yW3SUvRLYKN73ULYZ4F2j0kf6yM88E9FLWrI3VBtlUGE1a7Ujo9
	 ZLyvmHQABOqYR+Kej5GYWKz4ccSeE7irl5sqoO60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0867F80279;
	Wed, 12 Jan 2022 20:26:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37A2CF80279; Wed, 12 Jan 2022 20:26:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25031F80054
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 20:25:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25031F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="JblWP2i4"
Received: by mail-qt1-x82b.google.com with SMTP id y17so4201602qtx.9
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 11:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oqb3porLNx+xL8LPszd6cBs+HKnYfYssZ8m+DqN9VEA=;
 b=JblWP2i4DLSV2FyMNw36nU485keGSlI6pKsZ/cvydLVu6L3v0/mVIV+DFzlwPb5zqC
 6HLM7hm1YzH1Bm7u5uyEHrtXlt5U/fWRwORt7j5BvzgJCFinC4s6CWBXrE1tP2avSuYZ
 IWhxIPyAx8uAN+UB91LIGGdJXalmzTlHGbYdqqBhTeTLmfFuvbICHwUxpeIts2ilbLfw
 06/ABRLD/vLSsH1ewNN3zca9VKlBgkyEEWQz1M0vJ4W9qfu6+AKuqBKqej59yUksH5IT
 eMsYR86MqkHfuoX+UVtue+m28tXOamjsgWZJaWSF7Y7ke8I9FXDbih/bPJxLkDkdBZC0
 gK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oqb3porLNx+xL8LPszd6cBs+HKnYfYssZ8m+DqN9VEA=;
 b=Dxp+nYAVDbtOBoKL0nQmpEGh2oWDtw5VdMDxBHVfwU1jmT9AavGzEzzHwuyhPGh7D7
 E14O6VsySEmM/RfYPBzVNwn7QOXzMIhiJ+bWVZz0f7FtuvZUY8McVJHUt6Z4hIuv31q3
 fx8311n/DAkC4Doauf2/5q6+zWJ/s5I8spgxONoedxN5fCrvIL9Uy0qDz4HDh/vWvj2g
 aA0g7nd2hr3jSCWbqeo/afZ1Tbm+EJGzh4oaJWT+LhqL6lda+iWPDfLUqQ/oCxJATgWP
 OD8t2VhY2fMlYovZEG+K46naSS6ZZux9mn5up+4wEr07U6c/YniL/Dpq7U/qI/RsQlnD
 rkfQ==
X-Gm-Message-State: AOAM533xknQMoMgshxqY6gGl9JBC7S3EnX8AxaXCOcdHeYP9o2pWKpH3
 g2NfHIuz4I+IjkM7w6imxQYw4hDtyyXUwYMLSy89Qg==
X-Google-Smtp-Source: ABdhPJyY1HDRNDcRGH2Y8HwDgStmoOsQvc5QbGqYHkwVCXfhTw8Oky+Gr6lvVhzr2CXUzxeJWT5FMQtyKlZBVm29bSw=
X-Received: by 2002:ac8:584a:: with SMTP id h10mr866476qth.615.1642015554496; 
 Wed, 12 Jan 2022 11:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20220112113247.29135-1-allen-kh.cheng@mediatek.com>
 <20220112113247.29135-2-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220112113247.29135-2-allen-kh.cheng@mediatek.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 12 Jan 2022 11:25:42 -0800
Message-ID: <CAOReqxga6hLXs4P2hD1k_X01AWesQBae5AhJTLtiK_3Ndex_Sw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] firmware: mediatek: add adsp ipc protocol interface
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sound-open-firmware@alsa-project.org
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

On Wed, Jan 12, 2022 at 3:43 AM allen-kh.cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
>
> Some of mediatek processors contain
> the Tensilica HiFix DSP for audio processing.
>
> The communication between Host CPU and DSP firmware is
> taking place using a shared memory area for message passing.
>
> ADSP IPC protocol offers (send/recv) interfaces using
> mediatek-mailbox APIs.
>
> We use two mbox channels to implement a request-reply protocol.
>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
