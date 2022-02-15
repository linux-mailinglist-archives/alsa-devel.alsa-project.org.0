Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6C74B8448
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 10:30:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 704201A6A;
	Wed, 16 Feb 2022 10:30:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 704201A6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645003856;
	bh=JaPx4p3SMwP6KH5zXyV+yZMH6uQmM6+MsvdhmaW4ctI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FHPViqQFRLJX6G/MOOB/rshEVCKRWsn+qx/amH22FaFoswYImg1Ai0t8Dj37OTdN2
	 R/ywork8yR0g6BNADoMhDHrKpEjS0C4H9evrGyOjWYWrxxryNi/tQ6hYTIXzBaN82G
	 p+OQEZsFypQcVHFICX1VjEd9a7RKm8+RqN+7waRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A423F80578;
	Wed, 16 Feb 2022 10:25:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4835F80132; Tue, 15 Feb 2022 19:17:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19069F80100
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 19:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19069F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="BbY3zUMb"
Received: by mail-pj1-x102c.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso2838648pjh.5
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 10:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rU/cr+2YS83r8ZzfG0ihHyfke5lY7dzNO33vRqwTRo0=;
 b=BbY3zUMbpsKVLuD6QiFaFpnxej58wpxQPVVGisDcf+K+2coTsFmZNXGoWqBeKoLb1x
 3ZptFg7el6LpqeSuHR1QjwuSCHfpkEX/T+XcjAHpaQzkvx2kHT7d0+kYGoaayuMfQhPV
 CAs5kcpK7DDzn/NDlTFukbq1xe316LjUYcWLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rU/cr+2YS83r8ZzfG0ihHyfke5lY7dzNO33vRqwTRo0=;
 b=wz2lFIFyBPeqZK2hnTeRzGzOOmrYHwU4o8HCQuIS68d/nyF4eYPmPzFuocif3MyQjC
 XbhtyE4SUktoUlmaiRHfqjgX42WUl/wtBofDoWUgBHOH2I+/qIe8xPJjWqKxFPNn5gSb
 ungOOsknOE1cGRRu0QplpIpeZgUjnaX6z/GcB9BXQaUlDMAtKQ+RRL0ha1pX+vAWsCM4
 LuWrVH076SWNyIwAanh5S0OVGCJc/1cJr91x52+xrQpW267Kkqr8dPPnufnEFr+5qOj6
 6TqIkmjXVYwsYyvOEkPlC1IB35HflTcKzCsxmQmTD6hWmoW23J0sWT3gmMnExR4NPM/I
 UDcQ==
X-Gm-Message-State: AOAM533n89iyrIIkZy55/N4PB+ujh6guPI3RptWlA41fSBagMR0yzh3n
 ug3IqrHiQuOi8GbexW4UV02UIQ==
X-Google-Smtp-Source: ABdhPJwjJJkj0fC2gO+FdGjnaisWCk9FKkCf0qazg7PUuY4rrjoW+egyeLOWB+yCEr/MI5qa+9+dbA==
X-Received: by 2002:a17:902:eb8f:: with SMTP id
 q15mr235036plg.67.1644949062021; 
 Tue, 15 Feb 2022 10:17:42 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a186sm3157627pgc.70.2022.02.15.10.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 10:17:41 -0800 (PST)
Date: Tue, 15 Feb 2022 10:17:40 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] treewide: Replace zero-length arrays with
 flexible-array members
Message-ID: <202202151016.C0471D6E@keescook>
References: <20220215174743.GA878920@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220215174743.GA878920@embeddedor>
X-Mailman-Approved-At: Wed, 16 Feb 2022 10:25:43 +0100
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 devicetree@vger.kernel.org, target-devel@vger.kernel.org,
 linux-hardening@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-acpi@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-ext4@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-xtensa@linux-xtensa.org,
 mpi3mr-linuxdrv.pdl@broadcom.com, coresight@lists.linaro.org,
 sparmaintainer@unisys.com, linux-um@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-rpi-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devel@acpica.org, linux-cifs@vger.kernel.org, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com,
 linux-crypto@vger.kernel.org, linux-alpha@vger.kernel.org
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

On Tue, Feb 15, 2022 at 11:47:43AM -0600, Gustavo A. R. Silva wrote:
> There is a regular need in the kernel to provide a way to declare
> having a dynamically sized set of trailing elements in a structure.
> Kernel code should always use “flexible array members”[1] for these
> cases. The older style of one-element or zero-length arrays should
> no longer be used[2].
> 
> This code was transformed with the help of Coccinelle:
> (next-20220214$ spatch --jobs $(getconf _NPROCESSORS_ONLN) --sp-file script.cocci --include-headers --dir . > output.patch)
> 
> @@
> identifier S, member, array;
> type T1, T2;
> @@
> 
> struct S {
>   ...
>   T1 member;
>   T2 array[
> - 0
>   ];
> };

These all look trivially correct to me. Only two didn't have the end of
the struct visible in the patch, and checking those showed them to be
trailing members as well, so:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
