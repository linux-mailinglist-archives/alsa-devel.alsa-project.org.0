Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BDA512A45
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 05:58:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2946201;
	Thu, 28 Apr 2022 05:57:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2946201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651118327;
	bh=F1HSvctySDf7r922ZguC2pLyYCUawoTkw2N55elkxvE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nx4/Zg6oKjO2vVg2YVMkC8Cd93oe1ISJV2kGWLfM62GYyDVsLfMbAtujom0GLDUO4
	 Sw3NIh546KaT4ra+WDQNvVUfVQHDj7G6YXO+SeKMlK80nTTXnu/e1U+pavLg3zsSB3
	 QR8GPRvqWC52zWLOri1e7EeAuKmKcOzUiLklk0ds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AB95F8012B;
	Thu, 28 Apr 2022 05:57:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E86DAF8016E; Thu, 28 Apr 2022 05:57:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAE71F800F2
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 05:57:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAE71F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="SyoWrkkW"
Received: by mail-pj1-x102e.google.com with SMTP id iq10so3206704pjb.0
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 20:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8coHYOWiccaudWmbNgC6jwlDi9Zzhu/g3SgCTbDh9XI=;
 b=SyoWrkkWCHCSo6zE1UFJm8TVELGip/a4tATQQxOYikTh8ln9GSY4/mvc8xS7uvf45N
 OZtV2gQKLtdJ7hPuzKh6bAKwVWqyYanunDWyopRmGekrWQ4y4Lkpan4zYdnJ6470EOwj
 BQCfX46NUEhz/iXxQ6D/KrpcPLquwVf6HNers=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8coHYOWiccaudWmbNgC6jwlDi9Zzhu/g3SgCTbDh9XI=;
 b=MzNyOuWiw2BA5XIWQuKS0nIq1+uBGbBA2rOaABqCRyxonH3s7RG22I2l62aw093uTy
 i0Fn4KEkn61HnN+LOKAE9tTWdk2WdXbaJLdSYR5UJP8hdZNF+oV1WicIsLBfwlecNiAc
 wjCoCIjp8mxfKd+a+On1J6TdJzS7+cG0uIbdVmd4dh3KJcBqN4QwrQwJDfwtgdMBeeTM
 g+/S0JaBkTiIeC5DAt25NjemevQLinp/L4STwqOov/14MuezAvWQRqg1+J1dT8HCdTie
 nWEQ2bEV6aG7oEyS+xgOH7Hgm9VY0tXKT8xlTtBvPoXsk5lauTqLxCNw/HZzTFJf7M/x
 DeHQ==
X-Gm-Message-State: AOAM532DOkKOOkZAZ8HdNbaim606D346Y5VacwTEXR8d+tfXc0w7EHeK
 AH7FJK+EiUnBfjqS58tt5bN7kA==
X-Google-Smtp-Source: ABdhPJzhyfYZqZJcVb3GnoIOnHQ5wc2Z8pue+lUCi2qw+Js3IN1e446+ZoyhNvRPj/NLXaVyTxzjDQ==
X-Received: by 2002:a17:902:6ac1:b0:158:a295:ba71 with SMTP id
 i1-20020a1709026ac100b00158a295ba71mr31864224plt.49.1651118253243; 
 Wed, 27 Apr 2022 20:57:33 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:587:8f58:525d:fe6])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a655886000000b003c14af5060bsm847206pgu.35.2022.04.27.20.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 20:57:32 -0700 (PDT)
Date: Thu, 28 Apr 2022 12:57:27 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v4] ASoC: SOF: ipc3-topology: Correct get_control_data
 for non bytes payload
Message-ID: <YmoQp8+GU62muMdg@google.com>
References: <20220427185221.28928-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427185221.28928-1-peter.ujfalusi@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, cujomalainey@google.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 senozhatsky@chromium.org, broonie@kernel.org
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

On (22/04/27 21:52), Peter Ujfalusi wrote:
> It is possible to craft a topology where sof_get_control_data() would do
> out of bounds access because it expects that it is only called when the
> payload is bytes type.
> Confusingly it also handles other types of controls, but the payload
> parsing implementation is only valid for bytes.
> 
> Fix the code to count the non bytes controls and instead of storing a
> pointer to sof_abi_hdr in sof_widget_data (which is only valid for bytes),
> store the pointer to the data itself and add a new member to save the size
> of the data.
> 
> In case of non bytes controls we store the pointer to the chanv itself,
> which is just an array of values at the end.
> 
> In case of bytes control, drop the wrong cdata->data (wdata[i].pdata) check
> against NULL since it is incorrect and invalid in this context.
> The data is pointing to the end of cdata struct, so it should never be
> null.
> 
> Reported-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

FWIW
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Tested-by: Sergey Senozhatsky <senozhatsky@chromium.org>
