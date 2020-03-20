Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3184F18F659
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 14:53:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADEDA86F;
	Mon, 23 Mar 2020 14:52:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADEDA86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584971603;
	bh=IefMeycWLuckFFnJTDP3ybVM70BQ+gDXbTtnuFCKLg8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bm1Sn4+GEKqPKf66aRGnLsJ71R5SyFbYZvuOjYGVGAi4v0ChSB4MYMNiBOJ5OjjAk
	 X0JQcbNJS5HZLZ2CnNCanJJ+4GyDt8OIuDnREJjmoM0wtWvJRF0KCqMU3vrCbUu9hi
	 ivseswGaXHOewJoEdjihkyOWvORJNNoXKUhJca3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45BDFF802C3;
	Mon, 23 Mar 2020 14:47:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 577EBF8015B; Fri, 20 Mar 2020 15:52:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F322FF800DD
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 15:52:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F322FF800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="P8SvnsEN"
Received: by mail-pl1-x642.google.com with SMTP id f8so2572573plt.10
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 07:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3oEaq4RbS2pIFT8sPysCqAhlN3jcufDI+zt2Oe41Lro=;
 b=P8SvnsENfuOknSqZmMvi/roCMBcb8J8TMXjDdMh9gupZ0HPRswGikQcRGP1Ut2pX2c
 SRlVwwuQEyEC+k6m8TOwOu/QOJ9IIZaHAGnNfgwLjH7OBv3l1VVqe6XIajERY99A3yVS
 XGsDjXtQNMF5XuHLlrQS08ZIK80W+3DDWYPzPdzGNqNcCPg1ZZ3biTOHv2WUZ2mtINQD
 IIE6zey5oLtflTLcGV6205Ul/YAk1jwFhbRoooGzkCmBBp92dClvObaTrxN8O83UEcIR
 DyPErqq5ZeiubnXtSZSd+Hfyf3Fvg6qjMFOtQbmVKf4716POi1pW733WxcKLonmeUW9G
 TIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3oEaq4RbS2pIFT8sPysCqAhlN3jcufDI+zt2Oe41Lro=;
 b=fXG6QNB1dkkTY8ieNdRFg/gJ2/5y/6N5TSTryAQ+0gCCzpK1cX4ArchRSRIuakLcBJ
 wknPiEiaNfdY7slIorPyDZtUacIH7E1r5Gn5+l/Jx1PPoMoy0kEwsNgHa5S5lpT9i1nP
 bDY2dCXcmR+V2MmHCMF1Mz+/4exleuX5CiyOj7SMNbC8fJHpgyuWX7lHyZr7FefDWUma
 mEgSYVQzojr4SnWEDefNNuHpTEUv8e6htvYRMZYZDEgo9QVjJFqezlrzGT7YysmYkpI5
 qO+NnHwjdNNP5DBwo5fVWl8LKi2bTR1AoAIaZY+2c2/Y+sCbe5eI2abwoI6pLCXtP0CY
 ucvA==
X-Gm-Message-State: ANhLgQ0+5TOZNNf2je8/QqfHUl7t783FsuJeCqrPhdHTUt8uNztMFzHA
 GVRJkCJikQUcOrmbWunvuEf8pTxcoXn5N3vwKzc=
X-Google-Smtp-Source: ADFU+vvGj6448MxKAOzD6zr1G0ngvNivZvk8WZGlcUExDmWxPozdHr1ocb6J3Vd+QOp/QajXMZTU6F7YR4TIY6QXI9g=
X-Received: by 2002:a17:902:8d92:: with SMTP id
 v18mr9173478plo.18.1584715967554; 
 Fri, 20 Mar 2020 07:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200320131345.635023594@linutronix.de>
 <20200320131509.766573641@linutronix.de>
In-Reply-To: <20200320131509.766573641@linutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 20 Mar 2020 16:52:40 +0200
Message-ID: <CAHp75Veb_9a7adSZ__j0viFvTi-eRzeJqMphwOL-yjvfqom3Hw@mail.gmail.com>
Subject: Re: [patch 11/22] platform/x86: Convert to new CPU match macros
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 23 Mar 2020 14:47:37 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Mark Gross <mgross@linux.intel.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>, linux-pci@vger.kernel.org,
 Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Len Brown <lenb@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Linux PM <linux-pm@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Takashi Iwai <tiwai@suse.com>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 linux-crypto <linux-crypto@vger.kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Andy Shevchenko <andy@infradead.org>
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

On Fri, Mar 20, 2020 at 3:18 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> The new macro set has a consistent namespace and uses C99 initializers
> instead of the grufty C89 ones.
>
> Get rid the of the local macro wrappers for consistency.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Andy Shevchenko <andy@infradead.org>
> Cc: platform-driver-x86@vger.kernel.org
> ---
>  drivers/platform/x86/intel-uncore-frequency.c                 |   14 ++---
>  drivers/platform/x86/intel_int0002_vgpio.c                    |    4 -
>  drivers/platform/x86/intel_mid_powerbtn.c                     |    4 -
>  drivers/platform/x86/intel_pmc_core.c                         |   24 +++++-----
>  drivers/platform/x86/intel_pmc_core_pltdrv.c                  |   16 +++---
>  drivers/platform/x86/intel_speed_select_if/isst_if_mbox_msr.c |    4 -
>  drivers/platform/x86/intel_telemetry_debugfs.c                |    5 --
>  drivers/platform/x86/intel_telemetry_pltdrv.c                 |    7 --
>  drivers/platform/x86/intel_turbo_max_3.c                      |    6 --
>  9 files changed, 37 insertions(+), 47 deletions(-)
>
> --- a/drivers/platform/x86/intel-uncore-frequency.c
> +++ b/drivers/platform/x86/intel-uncore-frequency.c
> @@ -358,15 +358,13 @@ static struct notifier_block uncore_pm_n
>         .notifier_call = uncore_pm_notify,
>  };
>
> -#define ICPU(model)     { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
> -
>  static const struct x86_cpu_id intel_uncore_cpu_ids[] = {
> -       ICPU(INTEL_FAM6_BROADWELL_G),
> -       ICPU(INTEL_FAM6_BROADWELL_X),
> -       ICPU(INTEL_FAM6_BROADWELL_D),
> -       ICPU(INTEL_FAM6_SKYLAKE_X),
> -       ICPU(INTEL_FAM6_ICELAKE_X),
> -       ICPU(INTEL_FAM6_ICELAKE_D),
> +       X86_MATCH_INTEL_FAM6_MODEL(BROADWELL_G, NULL),
> +       X86_MATCH_INTEL_FAM6_MODEL(BROADWELL_X, NULL),
> +       X86_MATCH_INTEL_FAM6_MODEL(BROADWELL_D, NULL),
> +       X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE_X,   NULL),
> +       X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_X,   NULL),
> +       X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_D,   NULL),
>         {}
>  };
>
> --- a/drivers/platform/x86/intel_int0002_vgpio.c
> +++ b/drivers/platform/x86/intel_int0002_vgpio.c
> @@ -148,8 +148,8 @@ static struct irq_chip int0002_cht_irqch
>  };
>
>  static const struct x86_cpu_id int0002_cpu_ids[] = {
> -       INTEL_CPU_FAM6(ATOM_SILVERMONT, int0002_byt_irqchip),   /* Valleyview, Bay Trail  */
> -       INTEL_CPU_FAM6(ATOM_AIRMONT, int0002_cht_irqchip),      /* Braswell, Cherry Trail */
> +       X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT,     &int0002_byt_irqchip),
> +       X86_MATCH_INTEL_FAM6_MODEL(ATOM_AIRMONT,        &int0002_cht_irqchip),
>         {}
>  };
>
> --- a/drivers/platform/x86/intel_mid_powerbtn.c
> +++ b/drivers/platform/x86/intel_mid_powerbtn.c
> @@ -113,8 +113,8 @@ static const struct mid_pb_ddata mrfld_d
>  };
>
>  static const struct x86_cpu_id mid_pb_cpu_ids[] = {
> -       INTEL_CPU_FAM6(ATOM_SALTWELL_MID,       mfld_ddata),
> -       INTEL_CPU_FAM6(ATOM_SILVERMONT_MID,     mrfld_ddata),
> +       X86_MATCH_INTEL_FAM6_MODEL(ATOM_SALTWELL_MID,   &mfld_ddata),
> +       X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT_MID, &mrfld_ddata),
>         {}
>  };
>
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -871,18 +871,18 @@ static inline void pmc_core_dbgfs_unregi
>  #endif /* CONFIG_DEBUG_FS */
>
>  static const struct x86_cpu_id intel_pmc_core_ids[] = {
> -       INTEL_CPU_FAM6(SKYLAKE_L, spt_reg_map),
> -       INTEL_CPU_FAM6(SKYLAKE, spt_reg_map),
> -       INTEL_CPU_FAM6(KABYLAKE_L, spt_reg_map),
> -       INTEL_CPU_FAM6(KABYLAKE, spt_reg_map),
> -       INTEL_CPU_FAM6(CANNONLAKE_L, cnp_reg_map),
> -       INTEL_CPU_FAM6(ICELAKE_L, icl_reg_map),
> -       INTEL_CPU_FAM6(ICELAKE_NNPI, icl_reg_map),
> -       INTEL_CPU_FAM6(COMETLAKE, cnp_reg_map),
> -       INTEL_CPU_FAM6(COMETLAKE_L, cnp_reg_map),
> -       INTEL_CPU_FAM6(TIGERLAKE_L, tgl_reg_map),
> -       INTEL_CPU_FAM6(TIGERLAKE, tgl_reg_map),
> -       INTEL_CPU_FAM6(ATOM_TREMONT, tgl_reg_map),
> +       X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE_L,           &spt_reg_map),
> +       X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE,             &spt_reg_map),
> +       X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE_L,          &spt_reg_map),
> +       X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE,            &spt_reg_map),
> +       X86_MATCH_INTEL_FAM6_MODEL(CANNONLAKE_L,        &cnp_reg_map),
> +       X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_L,           &icl_reg_map),
> +       X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_NNPI,        &icl_reg_map),
> +       X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE,           &cnp_reg_map),
> +       X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE_L,         &cnp_reg_map),
> +       X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE_L,         &tgl_reg_map),
> +       X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE,           &tgl_reg_map),
> +       X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT,        &tgl_reg_map),
>         {}
>  };
>
> --- a/drivers/platform/x86/intel_pmc_core_pltdrv.c
> +++ b/drivers/platform/x86/intel_pmc_core_pltdrv.c
> @@ -38,14 +38,14 @@ static struct platform_device pmc_core_d
>   * other list may grow, but this list should not.
>   */
>  static const struct x86_cpu_id intel_pmc_core_platform_ids[] = {
> -       INTEL_CPU_FAM6(SKYLAKE_L, pmc_core_device),
> -       INTEL_CPU_FAM6(SKYLAKE, pmc_core_device),
> -       INTEL_CPU_FAM6(KABYLAKE_L, pmc_core_device),
> -       INTEL_CPU_FAM6(KABYLAKE, pmc_core_device),
> -       INTEL_CPU_FAM6(CANNONLAKE_L, pmc_core_device),
> -       INTEL_CPU_FAM6(ICELAKE_L, pmc_core_device),
> -       INTEL_CPU_FAM6(COMETLAKE, pmc_core_device),
> -       INTEL_CPU_FAM6(COMETLAKE_L, pmc_core_device),
> +       X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE_L,           &pmc_core_device),
> +       X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE,             &pmc_core_device),
> +       X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE_L,          &pmc_core_device),
> +       X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE,            &pmc_core_device),
> +       X86_MATCH_INTEL_FAM6_MODEL(CANNONLAKE_L,        &pmc_core_device),
> +       X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_L,           &pmc_core_device),
> +       X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE,           &pmc_core_device),
> +       X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE_L,         &pmc_core_device),
>         {}
>  };
>  MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_platform_ids);
> --- a/drivers/platform/x86/intel_speed_select_if/isst_if_mbox_msr.c
> +++ b/drivers/platform/x86/intel_speed_select_if/isst_if_mbox_msr.c
> @@ -160,10 +160,8 @@ static struct notifier_block isst_pm_nb
>         .notifier_call = isst_pm_notify,
>  };
>
> -#define ICPU(model)     { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
> -
>  static const struct x86_cpu_id isst_if_cpu_ids[] = {
> -       ICPU(INTEL_FAM6_SKYLAKE_X),
> +       X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE_X, NULL),
>         {}
>  };
>  MODULE_DEVICE_TABLE(x86cpu, isst_if_cpu_ids);
> --- a/drivers/platform/x86/intel_telemetry_debugfs.c
> +++ b/drivers/platform/x86/intel_telemetry_debugfs.c
> @@ -308,11 +308,10 @@ static struct telemetry_debugfs_conf tel
>  };
>
>  static const struct x86_cpu_id telemetry_debugfs_cpu_ids[] = {
> -       INTEL_CPU_FAM6(ATOM_GOLDMONT, telem_apl_debugfs_conf),
> -       INTEL_CPU_FAM6(ATOM_GOLDMONT_PLUS, telem_apl_debugfs_conf),
> +       X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT,       &telem_apl_debugfs_conf),
> +       X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT_PLUS,  &telem_apl_debugfs_conf),
>         {}
>  };
> -
>  MODULE_DEVICE_TABLE(x86cpu, telemetry_debugfs_cpu_ids);
>
>  static int telemetry_debugfs_check_evts(void)
> --- a/drivers/platform/x86/intel_telemetry_pltdrv.c
> +++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
> @@ -67,9 +67,6 @@
>  #define TELEM_CLEAR_VERBOSITY_BITS(x)  ((x) &= ~(BIT(27) | BIT(28)))
>  #define TELEM_SET_VERBOSITY_BITS(x, y) ((x) |= ((y) << 27))
>
> -#define TELEM_CPU(model, data) \
> -       { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (unsigned long)&data }
> -
>  enum telemetry_action {
>         TELEM_UPDATE = 0,
>         TELEM_ADD,
> @@ -183,8 +180,8 @@ static struct telemetry_plt_config telem
>  };
>
>  static const struct x86_cpu_id telemetry_cpu_ids[] = {
> -       TELEM_CPU(INTEL_FAM6_ATOM_GOLDMONT, telem_apl_config),
> -       TELEM_CPU(INTEL_FAM6_ATOM_GOLDMONT_PLUS, telem_glk_config),
> +       X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT,       &telem_apl_config),
> +       X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT_PLUS,  &telem_glk_config),
>         {}
>  };
>
> --- a/drivers/platform/x86/intel_turbo_max_3.c
> +++ b/drivers/platform/x86/intel_turbo_max_3.c
> @@ -113,11 +113,9 @@ static int itmt_legacy_cpu_online(unsign
>         return 0;
>  }
>
> -#define ICPU(model)     { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
> -
>  static const struct x86_cpu_id itmt_legacy_cpu_ids[] = {
> -       ICPU(INTEL_FAM6_BROADWELL_X),
> -       ICPU(INTEL_FAM6_SKYLAKE_X),
> +       X86_MATCH_INTEL_FAM6_MODEL(BROADWELL_X, NULL),
> +       X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE_X,   NULL),
>         {}
>  };
>
>


-- 
With Best Regards,
Andy Shevchenko
