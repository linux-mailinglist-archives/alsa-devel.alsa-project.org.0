Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB10B132308
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 10:54:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 586041816;
	Tue,  7 Jan 2020 10:54:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 586041816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578390898;
	bh=qJshlNF0qRalC3jzIzTZ7TKm/a7/PLbt5eC+kJYjPvA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W3XSoVYPQmumfvfUfToqJK4A93mxsIvsVN6daQwUoGndcA2+XWH8kCc9sSSWCOBqG
	 4lSC2KU1Itv5+D0+gwVP8OKsrg4NX6/kmI+Pgt9yWe/dM6y383bh/DOY/WmxDgiNzn
	 YTkFwmqU5BSRzXRl1a4H1bj1PsjkJ3pojld3PFXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7098FF801EB;
	Tue,  7 Jan 2020 10:53:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD443F8014A; Tue,  7 Jan 2020 10:53:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1148F8010D
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 10:53:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1148F8010D
Received: by mail-ot1-f66.google.com with SMTP id r9so2367579otp.13
 for <alsa-devel@alsa-project.org>; Tue, 07 Jan 2020 01:53:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rcKJiBOHF/a0+MDVGltwkYmA7kAiSShXv3OfBucNo/w=;
 b=aFwnX94iQiAGtIOFt9OjaXHtWnk+UTgusgelCI+1bOBPWwckPZGqJCeXbHxRf02nHD
 tWnpE7Hijd6uKTvjfV5VHYZcMqxEtTGFS3CqEg93mcUG8Q+HspUJqv2R8fYnoT3SR1ZK
 /cqMIFIQrd8lsC5eJkzJIZ2HuHNuaZ7bz44Lt0j80aGrGirDL0c6UGDPuiZg+Isil8yC
 Sv19geh3aIvs1u8l2hb+2tc0Er5rCRqppT+bWezisIIiwGGrRcdRxNub6NCcbyfZDUQf
 LLNl3Ccg8pNWuOaNt0G3pgyrGHCA08uWRWndSMnH8gwk95a+pssKhoEPgbO+9Pc7dgX5
 x0eQ==
X-Gm-Message-State: APjAAAWsYFNeWCmkl921wb/ft+zoJZ5FNvPsgfYHE2dzWfK01mWE9IC2
 rRfN4rNleQeROwD9d05Cgt5t5vQ7JxR8nlbdK4c=
X-Google-Smtp-Source: APXvYqyijdjeyq4HJ5FCDcI015uTWnvTRQoFeaQRgxTWy1DfLN1zgBL6llgNmNnOtPrGgkpTZXmDGjkn5Is6S8EHkt8=
X-Received: by 2002:a9d:62c7:: with SMTP id z7mr111166052otk.189.1578390788841; 
 Tue, 07 Jan 2020 01:53:08 -0800 (PST)
MIME-Version: 1.0
References: <20200106045833.1725-1-masahiroy@kernel.org>
In-Reply-To: <20200106045833.1725-1-masahiroy@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 7 Jan 2020 10:52:57 +0100
Message-ID: <CAJZ5v0jBEq+GiTP8V4ZzQvR9qbSBdEz_P8EZNX7yNZMzTjB86Q@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, linux-gpio@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@lip6.fr>, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] treewide: remove redundent IS_ERR() before
	error code check
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

On Mon, Jan 6, 2020 at 6:11 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> 'PTR_ERR(p) == -E*' is a stronger condition than IS_ERR(p).
> Hence, IS_ERR(p) is unneeded.
>
> The semantic patch that generates this commit is as follows:
>
> // <smpl>
> @@
> expression ptr;
> constant error_code;
> @@
> -IS_ERR(ptr) && (PTR_ERR(ptr) == - error_code)
> +PTR_ERR(ptr) == - error_code
> // </smpl>
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

for the acpi/scan.c change, but there seems to be a typo in the subject:

s/redundent/redundant/
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
