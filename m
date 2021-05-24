Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8AF38F26A
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 19:41:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42E2E1612;
	Mon, 24 May 2021 19:40:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42E2E1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621878107;
	bh=sTMdfl7490EUvFpi8+cM20l+2QkFa8OjDn3LY3LnB8g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kEEOOrgsE7POBq6Bn22Z8p3hN5HkKxW4T4qQpq+h3xINXBqiN15PsbQq/SJUqJP+u
	 jsE3m2qfgrOniHw2w5xcMP6AsPD807QxYyCKea++cyKT2OXmDguiasa7MT9PF9oeau
	 1D/hx55NNiokZ9MrEKcgUV068sq/X4sCKbSdv1Hg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9957BF8023A;
	Mon, 24 May 2021 19:40:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D73DF8022D; Mon, 24 May 2021 19:40:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C23EF80137
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 19:40:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C23EF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="n8fH/VMb"
Received: by mail-pj1-x1035.google.com with SMTP id
 h20-20020a17090aa894b029015db8f3969eso10939041pjq.3
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 10:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sTMdfl7490EUvFpi8+cM20l+2QkFa8OjDn3LY3LnB8g=;
 b=n8fH/VMbgfd6cRp/TQjx3U196IeCN0qxIEAi6w1Ejs/HL3HtQn8A4RC+PkbAaJ7YXx
 v2DYyU6k6hdak4BbLALW0lx0Tpf3yWbHUeoCnJhdtcnFVicNtqGCbErlV0W80aibgVLo
 qcq7Kx3+j8rl6PWfSyH9cYgLp4BLtao7OZ96GjGyG3Xwuh4IygxcgZk4TJHUOM3tMe72
 jrlBH5ugkQvAvRSHx4zN54AWLITw8/UCnoTZFv+pwuBnPrX5Q+/XgabEUZf6Mw+mibNE
 nOe3pHgoUHfkkH5OAClqOiO0MZpeQtS4tQ/Dy7ZuIpCZkZRp/KzZPuEOqtc+NVlQ6lbr
 p1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sTMdfl7490EUvFpi8+cM20l+2QkFa8OjDn3LY3LnB8g=;
 b=Sex1aOhDHJ1wQ1At7fHYmbG9+i2et3EWi6cy13JuURhxVOpdhvk9H0j3IRULtYRSnJ
 oec50loayXoFxKHr42/Lfa1fcDjPKgBZg7vVa34jX6UMA24oncARkVNu8jMj3mhTw5ol
 PFgeCx1gAdK/3965VZMJWA9kTt/G5798WQC4NqC6UmoDF5W2jN/ogR1sS1nurbTYJ6wV
 P2BhfsoK4nD5dEle2A+ZrMq7xTpN6AxS3hVLQEw6i0wuPVRRsqjekhqck2nzh+jAdguM
 WUb0/P26vkZCV/vWVXSbfXLu8l8ubBDzCeddenRU7zH7iDkbCke4OkBdCF78pzUjhNMG
 /BCw==
X-Gm-Message-State: AOAM530aw/fbsvl83NyrVOQRISdrIVqzekwosPRjJu9vm/CTblZcq71T
 jYAzMZJps1+hWphJWziirVA=
X-Google-Smtp-Source: ABdhPJxfF9PCeKa3cCzxFrqVmh9I5Uyn2fwwsnMG8kDEetRGWiF1peoAFvUuRdAj+8civkPVDk3VWw==
X-Received: by 2002:a17:90a:f518:: with SMTP id
 cs24mr292344pjb.182.1621878005779; 
 Mon, 24 May 2021 10:40:05 -0700 (PDT)
Received: from hyeyoo ([183.99.11.150])
 by smtp.gmail.com with ESMTPSA id n28sm5193454pfq.139.2021.05.24.10.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 10:40:05 -0700 (PDT)
Date: Tue, 25 May 2021 02:39:59 +0900
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>, Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH] ALSA: line6: Improve poor error handling in
 line6_init_cap_control
Message-ID: <20210524173959.GA116743@hyeyoo>
References: <20210524173644.GA116662@hyeyoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524173644.GA116662@hyeyoo>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

added an error handling code. It builds well,
but I don't have the device. So please review it (and test if you have one)

if you think I can improve something, please tell me.
I'll send v2.

Thanks,
Hyeonggon
