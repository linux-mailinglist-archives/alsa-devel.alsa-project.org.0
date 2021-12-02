Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77737466937
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 18:33:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 068CE29CC;
	Thu,  2 Dec 2021 18:32:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 068CE29CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638466418;
	bh=kWQMCuWUXVszkY9dXTwfu5CSXHnj51KNDTl8brWcg1U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q6evCHQQxhy+slwcmGK7GhLNhWGMOI4arv1CgbnFnoNYReIat2ajlL4Qjs62S+GSL
	 OJtzBGlBUxX9/D95sjDR0z1X15D0+GzThS30ppwDdqHiFSHatLSQvzWrDb2tUmbDSI
	 KDLql1NxjGuLchbgL7Bu4V8dITIB/JFzQ+32YzJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69C9EF802E0;
	Thu,  2 Dec 2021 18:32:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3F46F802A0; Thu,  2 Dec 2021 18:32:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 128ABF800CE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 18:32:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 128ABF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GkAmtrEy"
Received: by mail-qv1-xf31.google.com with SMTP id m17so145342qvx.8
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 09:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pQjlJooPFh4hhU5J/VSLvg7Mhz5iUaZzFjjeNTcn02w=;
 b=GkAmtrEyHYZ4bWAmJ5ksAJdPZrQ9pnVPhieHQMSd/lHMLOSpXV9cgFtGP2gWEVEcbF
 FFcPIf6DPlnCpxNw2QIFzTC41MUsMul95xQd419ezHvJPBKtTlGxHsGOzRHYfU7wtu3H
 55a30B2PkUq4ZLwqpRzqigxwPZlKalSmLaqdnkMsdE4hekp9zS/7/Eem3UXI/jWR0/i7
 Jf/WG02JfRZfPLL4IrTRkNTeKucQt5PVSJ14O8AuUIckWQQ29df51VRfmSRec5uKIBer
 a4jQ6+qslxEgX2fW0QNr1IfG7liJ7uA8zYpaHWHr8RCQnuKoTxnDaBuJuzCMSD1WJl8b
 BriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pQjlJooPFh4hhU5J/VSLvg7Mhz5iUaZzFjjeNTcn02w=;
 b=xPP4zuTWKi3vPl/H+0fbg1ysURwtf7a2S9jtb3Hx7Fyv1nysg592vV1NIVTcv2I4k9
 l+2rAGITDUlpV2in404jndq+PQmDcywIkxzSErRZKlRDHwQqnQwQGMJL6KQVvGMg4c0i
 v5FYGjbRTHQLfu7AJiEULxTQ7dXKu7xlX5GuHfsyTdUsncMieb8YtirLjEVsmxVT3/m8
 xJKJtQz7mRYQT15GGNUcdzZkQknluygNTQWP7+eXKovLgzN5YzBIAEIl542NPEqpmTxN
 JgIwbLqWBmKm2xBma4yO+cX+SPXGun/g4cLDDaCC5FOrAvIernotVI0hMqGXfzEKTgyy
 AM0Q==
X-Gm-Message-State: AOAM530fddwBGe/bzBo4qNhPlmpN1Mgh3RZfMbFRij4LL8uI8TjVlgqj
 CZH/Q4HAv3m3i/V9kmyorVU=
X-Google-Smtp-Source: ABdhPJxT622dFmYLlgTYE0zHTqZIRN8xOtN6jAN3U1mRlcau6SGX8ODIFG8XVhDsIRqULZLOCPwZMw==
X-Received: by 2002:a05:6214:401e:: with SMTP id
 kd30mr14867408qvb.80.1638466328027; 
 Thu, 02 Dec 2021 09:32:08 -0800 (PST)
Received: from geday ([2804:7f2:8006:8534:6560:3340:335a:b4eb])
 by smtp.gmail.com with ESMTPSA id q185sm278047qke.64.2021.12.02.09.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 09:32:07 -0800 (PST)
Date: Thu, 2 Dec 2021 14:32:22 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Olivia Mackintosh <livvy@base.nu>
Subject: Re: [PATCH] Sound: Add support for the Pioneer DJM 750MK2
 Mixer/Soundcard
Message-ID: <YakDJlT7Q/zRHLjy@geday>
References: <20211010145841.11907-1-willovertonuk@gmail.com>
 <542FEC66-D75D-4F5D-97DC-01835777295C@base.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <542FEC66-D75D-4F5D-97DC-01835777295C@base.nu>
Cc: alsa-devel@alsa-project.org
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

On Sun, Nov 28, 2021 at 10:50:02PM +0100, Olivia Mackintosh wrote:
> This patch has potentially introduced a bug in mixer controls for other devices. The device index should match the position in the array. Should add "SND_DJM_DEVICE(750mk2)," if the IDX is 0x4.
> 
> Will make a patch and add comment if I have the time.
> 
> Olivia

Thanks for the report, Olivia.
