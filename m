Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CAAF6F25
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 08:39:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0D411677;
	Mon, 11 Nov 2019 08:38:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0D411677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573457985;
	bh=neePEt6y6Axgrp+RM9roPgMbmVXi+PaJtGil+8cAdzs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vbsgLczhuFeTLOMPx69Qz9Yj2rB7qYJ9/U3kGePnZpaxlq02MVjRkF3uXlb2DrVIk
	 QWrOw2HO3fI795FJsla205yPPW/T/JkIWt8gYaOsgEc24Wc4CFvgQiLL8yxbWp8Q93
	 HykqYUrCVoRyodzopH9gcqNkorYCoy7jL0BqfN1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E6EF80275;
	Mon, 11 Nov 2019 08:38:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6087F804FF; Mon, 11 Nov 2019 08:37:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC25EF80275
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 08:37:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC25EF80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Gvu+8N/l"
Received: by mail-qv1-xf43.google.com with SMTP id x14so4508616qvu.0
 for <alsa-devel@alsa-project.org>; Sun, 10 Nov 2019 23:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t4Zb47p2XPwOCswEiVCxFP3pBYMa8dixjcKcMTAk1Xk=;
 b=Gvu+8N/lhR7xyJ0lGg6oiJJrH5spP3uTiLTY1hjI1MQw7T2ABX41o5lsHenviAHG9e
 Lfax9OZnTplip+abpfLRUNX3sr8mCLZyv01XVtD+uuObGt5p/ShA4nfi5nrooxc2l0xR
 q8p+MbexiTGoAT5xg4F1AFUwJ3lZiI3PwB0lJeTFffms9sRF8cm3hlKgDIFvpj0MW9CU
 s5d6s/uQ7G/7saHs+tYTUrm/1UXYhR+Oeui90reYAfFE0Z41w18BqZxZNlBcUNiWozBq
 K2SjQ6OOgFyJTqyGsJqx/9dNCr60a6pmjVGB/+s4bonMwDVTYCZy+ar2pJYDVR8qS4yC
 xXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t4Zb47p2XPwOCswEiVCxFP3pBYMa8dixjcKcMTAk1Xk=;
 b=nm9nkBae27kikKFw3n278o3i9APjjAwfdWyB3CiYDKkuTYTByx8prA388K7w6u62y2
 DUcHf5KHZMWBNrBsLJcpOumZCYmLx2ZpUkWmKM9xuAi0an6nHVPeiyshN2o0Jv0/tBlc
 CuH82+El4RIHfTV9us/6hgqYMubrp539ZEC60ajqNFF3FXnFLP9s0vTZ92GutJTaCike
 erP/yZQ6haiFumqxtp70KvT8plDfs8BRoXG1TYj4FOmT5gXJLsLyMuFbIsU6UncqDShv
 Aywoo8tdXQXnXjEeR8SHkfyZigOeL+6wu8M48S2NG0XZuVRpzpHQu3JsTdo4d9Rpn75x
 CoVA==
X-Gm-Message-State: APjAAAWfj5cq/3RDRf7da/1JsLg/0y/fp/4jRVai+kHotUyaxc1GOPFx
 2IBuvMAfhy7rAeB/3XCrXz5ZbQbFZKbM+cTMOEI=
X-Google-Smtp-Source: APXvYqxpJG9+Wp9uWvq5SOdQ0ClpNoEw5Bq9RYcUBHDxKCS9kLWbq+/2zfW9+9hTfC22q3nUJO9pss3ALBiVuNJqFsg=
X-Received: by 2002:ad4:538b:: with SMTP id i11mr18033921qvv.211.1573457871628; 
 Sun, 10 Nov 2019 23:37:51 -0800 (PST)
MIME-Version: 1.0
References: <1573025265-31852-1-git-send-email-shengjiu.wang@nxp.com>
 <20191109024502.GA9187@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20191109024502.GA9187@Asurada-Nvidia.nvidia.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 11 Nov 2019 15:37:40 +0800
Message-ID: <CAA+D8APXbQYTUBpaPSBtK7J3LfKL0LA8sXrOomEaHTBjqpOV6A@mail.gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_audmix: Add spin lock to protect
	tdms
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi

On Sat, Nov 9, 2019 at 10:48 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Wed, Nov 06, 2019 at 03:27:45PM +0800, Shengjiu Wang wrote:
> > Audmix support two substream, When two substream start
> > to run, the trigger function may be called by two substream
> > in same time, that the priv->tdms may be updated wrongly.
> >
> > The expected priv->tdms is 0x3, but sometimes the
> > result is 0x2, or 0x1.
>
> Feels like a bug fix to me, so  might be better to have a "Fixes"
> line and CC stable tree?
>
> Anyway, change looks good to me:
>
> Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
>

Ok, will send v2.

best regards
wang shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
