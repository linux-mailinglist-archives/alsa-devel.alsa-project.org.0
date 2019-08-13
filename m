Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DE68C236
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 22:39:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39521168F;
	Tue, 13 Aug 2019 22:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39521168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565728757;
	bh=s+x5NdPUlmVbRCnftXYTpr+IbuzvWhxhl8uX3A7O/7A=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mMrAhLVZpIuQeSiVsAxO6SfJME4Y4mD/62kgT6ehC42ncmQDKJvzIDsPU/wg/z3AK
	 r2QXGmDGRZopI4jd11+mJOFSGk+OplD5B8QiVFWu3wCJ9Cb0u1dOV50k36Jl6a6TWE
	 ydkNa01YT9THVz4s5Ir1ytTSMtws/dgIZSjiLuzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DDDFF80273;
	Tue, 13 Aug 2019 22:37:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB9C3F80273; Tue, 13 Aug 2019 22:37:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14020F8015B
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 22:37:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14020F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="AyImookG"
Received: by mail-pf1-x442.google.com with SMTP id p184so52258470pfp.7
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 13:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O4bA+lMwAF10bVhJ27CrBxrtXthZNVrprWrQXBG1DjA=;
 b=AyImookGIyRLr0aL4Rc+DP59fzn5/VINuYoCZPIMOJgE8+cmDF8oZORB3Y0jdKFLYI
 J1ea5L2mlHJa2B/4kRBtfn0WrYfjBCjgm8JsobtRrs3W/qNOwUVkLEAcnudGm6BzRwkt
 Y8llATcOyOIvyPT0/S18Uo/Tp+Vkdr7DrjVehgeYX2kdBMkY68x/o/Ne82TDF7XLzsVE
 jD9ZN1XAr91d/SdADSF6Rr7sBGWjQaGCHtrIn3sPx9TlIf8xjtW3bFFDE8tb+fg2TPwp
 DjOWPL+dNESs/mH8BE1uMMTll7MVA8AhFZjUr58IUFmjDt3cSoM0LP6BvsFauuVVVJSy
 uxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O4bA+lMwAF10bVhJ27CrBxrtXthZNVrprWrQXBG1DjA=;
 b=r6K2HHW4Ce0C3zxuiHfeEB9yCpRb+UmYHbbHjibODQaz/BQCgWhbD83C0P0mcwUWDB
 jUMMsxjXRGFzQXiHyTw4S0eG9d6JI74Lfaz8THpPcxr2K7w8PPbnV5lP2l4iz2bJUR9W
 ogn5KoDJhH6UMbIz/wq4y5VG5064v+CkPSKooJn2+9wq23jY8l+OBuTUJIRDlWxA3zMe
 UYFM7ZzI78rp10er8a/9N1Pyfd36lCBHpkUiLXhbSP46QeKxYYrcO9LAyCzbvI1qqQ1j
 qR4QgDmDxqujgSxsS+gMAjxGCEFNgeeaIp1zbjHnY1YwKnSbaz5EyG7XqJw6p7iI8OBv
 x6PQ==
X-Gm-Message-State: APjAAAVsJ3s4s9niMBr7UKqUdunfR6KFwQEevvWhYeRsxd2kTgYDzG2H
 VvJbxDIAhRl558EHPyIZZOMThqEP2unGME4bSHchUw==
X-Google-Smtp-Source: APXvYqxBngouGxFq+Aa0fDJhgw/KggllMg5GoLFok4i6jE8qEaXlx75btnsrRm8SCeUVPyTLvxGGjGwPD1cI0kZztUM=
X-Received: by 2002:a63:61cd:: with SMTP id
 v196mr36483266pgb.263.1565728644215; 
 Tue, 13 Aug 2019 13:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190813061014.45015-1-natechancellor@gmail.com>
 <20190813180929.22497-1-natechancellor@gmail.com>
In-Reply-To: <20190813180929.22497-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 13 Aug 2019 13:37:13 -0700
Message-ID: <CAKwvOdnOtR6s2KQVEZ2MRS1HE3W7L3B3ymsLmToJdzN_L2Nz-A@mail.gmail.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Vinod Koul <vkoul@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH v2] soundwire: Make slave.o depend on ACPI
	and rename to acpi_slave.o
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

On Tue, Aug 13, 2019 at 11:12 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> clang warns when CONFIG_ACPI is unset:
>
> ../drivers/soundwire/slave.c:16:12: warning: unused function
> 'sdw_slave_add' [-Wunused-function]
> static int sdw_slave_add(struct sdw_bus *bus,
>            ^
> 1 warning generated.
>
> Before commit 8676b3ca4673 ("soundwire: fix regmap dependencies and
> align with other serial links"), this code would only be compiled when
> ACPI was set because it was only selected by SOUNDWIRE_INTEL, which
> depends on ACPI.
>
> Now, this code can be compiled without CONFIG_ACPI, which causes the
> above warning. The IS_ENABLED(CONFIG_ACPI) guard could be moved to avoid
> compiling the function; however, slave.c only contains three functions,
> two of which are static. Since slave.c is completetely dependent on
> ACPI, rename it to acpi_slave.c and only compile it when CONFIG_ACPI
> is set so sdw_acpi_find_slaves will actually be used. bus.h contains
> a stub for sdw_acpi_find_slaves so there will be no issues with an
> undefined function.
>
> This has been build tested with CONFIG_ACPI set and unset in combination
> with CONFIG_SOUNDWIRE unset, built in, and a module.
>
> Fixes: 8676b3ca4673 ("soundwire: fix regmap dependencies and align with other serial links")
> Link: https://github.com/ClangBuiltLinux/linux/issues/637
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Looks good, thanks Nathan.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> v1 -> v2:
>
> * Rename slave.o to acpi_slave.o
> * Reword commit message to reflect this
>
>  drivers/soundwire/Makefile                  | 6 +++++-
>  drivers/soundwire/{slave.c => acpi_slave.c} | 3 ---
>  2 files changed, 5 insertions(+), 4 deletions(-)
>  rename drivers/soundwire/{slave.c => acpi_slave.c} (98%)
>
> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> index 45b7e5001653..718d8dd0ac79 100644
> --- a/drivers/soundwire/Makefile
> +++ b/drivers/soundwire/Makefile
> @@ -4,9 +4,13 @@
>  #
>
>  #Bus Objs
> -soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
> +soundwire-bus-objs := bus_type.o bus.o mipi_disco.o stream.o
>  obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
>
> +ifdef CONFIG_ACPI
> +soundwire-bus-objs += acpi_slave.o
> +endif
> +
>  #Cadence Objs
>  soundwire-cadence-objs := cadence_master.o
>  obj-$(CONFIG_SOUNDWIRE_CADENCE) += soundwire-cadence.o
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/acpi_slave.c
> similarity index 98%
> rename from drivers/soundwire/slave.c
> rename to drivers/soundwire/acpi_slave.c
> index f39a5815e25d..0dc188e6873b 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/acpi_slave.c
> @@ -60,7 +60,6 @@ static int sdw_slave_add(struct sdw_bus *bus,
>         return ret;
>  }
>
> -#if IS_ENABLED(CONFIG_ACPI)
>  /*
>   * sdw_acpi_find_slaves() - Find Slave devices in Master ACPI node
>   * @bus: SDW bus instance
> @@ -110,5 +109,3 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
>
>         return 0;
>  }
> -
> -#endif
> --
> 2.23.0.rc2
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20190813180929.22497-1-natechancellor%40gmail.com.



-- 
Thanks,
~Nick Desaulniers
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
